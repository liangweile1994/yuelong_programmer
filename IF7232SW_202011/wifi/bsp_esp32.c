#include "bsp_esp32.h"
#include "iot.h"
#include "embedded_flash.h"
#include <stdio.h>
#include <string.h>  
#include <stdbool.h>

#include "malloc.h"

/* 软件主版本[0,255]宏定义 */
#define MAJOR_SW_VERSION	1

/* 软件次版本[A,Z]宏定义 */
#define MINOR_SW_VERSION	"A"

/* 软件测试版本[0,255]宏定义 */
#define TEST_SW_VERSION		0

#define MACSTR "%02x:%02x:%02x:%02x:%02x:%02x"
#define MACSTOL(a)  (a)[0], (a)[1], (a)[2], (a)[3], (a)[4], (a)[5]

#define MACLTOS(a)  &(a)[0],&(a)[1], &(a)[2],&(a)[3],&(a)[4], &(a)[5]

/* IOT网络有效时间（unit:s）宏定义，超过这个时间识别为断网 */
#define IOT_EFFECTIVE_TIME	180

unsigned int POLYNOMIAL = 0x6363;
unsigned int PRESET_VALUE = 0xFFFF;

struct  STRUCT_USARTx_Fram strEsp32_Fram_Record = { 0 };

/* 配网状态 */
ENUM_ESP32_ConfigState      ESP32_ConfigState   = 3;//NONE_PAIRING;
/* 网络连接状态 */
ENUM_IOT_ConnectState       iotConnectState     = IOT_DISCONNECT;

/* IOT网络连接计时器 */
uint8_t iotConnectCnt       = 0;
bool    g_ESP32_ReadyFlag   = false;
uint8_t g_ESP32CmdRevState  = RECEIVE_RESET;
uint8_t g_ESP32CmdSendState = SET_NONE;
uint8_t g_Esp32MAC[6]       ={0};

char    g_STA_SSID[128] = {0};
char    g_STA_PW[64]    = {0};

ErrorStatus httpWriteCommandExecute(void);

extern uint8_t powerOnInitFinish;
	
/*
 * 函数名：ESP32_En_PinOut
 * 描述  ：EN管脚设置为输出
 * 输入  ：无
 * 返回  : 无
 */
static void ESP32_En_PinOut(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = WIFI_EN_Pin; 
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD; 
	GPIO_InitStruct.Pull = GPIO_NOPULL; 
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(WIFI_EN_GPIO_Port, &GPIO_InitStruct);
}

/*
 * 函数名：ESP32_En_PinIn
 * 描述  ：EN管脚设置为输入
 * 输入  ：无
 * 返回  : 无
 */
static void ESP32_En_PinIn(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = WIFI_EN_Pin; 
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT; 
	GPIO_InitStruct.Pull = GPIO_PULLUP; 
	HAL_GPIO_Init(WIFI_EN_GPIO_Port, &GPIO_InitStruct);
}

/*
 * 函数名：ESP32_Rst
 * 描述  ：重启WF-ESP32模块
 * 输入  ：无
 * 返回  : 无
 */
void ESP32_Rst ( void )
{
		ESP32_En_PinOut();
		macESP32_RST_HIGH_LEVEL();
		HAL_Delay ( 50 );
		macESP32_RST_LOW_LEVEL();
		HAL_Delay ( 50 ); 
		macESP32_RST_HIGH_LEVEL();
		ESP32_En_PinIn();
}

/*
 * 函数名：ESP32_Disable
 * 描述  ：ESP32模块禁能函数
 * 输入  ：无
 * 返回  : 无
 */
void ESP32_Disable ( void )
{
		ESP32_En_PinOut();
		macESP32_RST_LOW_LEVEL();
}

/*
 * 函数名：ESP32_Restore
 * 描述  ：ESP32模块恢复出厂设置
 * 输入  ：无
 * 返回  : 无
 * 调用  ：被 Wifi_key_deal 调用
 */
void ESP32_Restore(void)
{
		macESP32_Usart ( "AT+RESTORE\r\n");
}

/*
 * 函数名：Init_ESP32_UartRx_Setting
 * 描述  ：ESP32串口接收接收标志初始化
 * 输入  ：无
 * 返回  : 无
 */
static void Init_ESP32_UartRx_Setting(void)
{
		strEsp32_Fram_Record .InfBit .FramFinishFlag = 0;
		strEsp32_Fram_Record .InfBit .FramLength = 0;
		__HAL_UART_ENABLE_IT(&huart2,UART_IT_IDLE);
		__HAL_UART_ENABLE_IT(&huart2,UART_IT_RXNE);
}

/*
 * 函数名：rx_StringHandle_And
 * 描述  ：字符串接收处理函数
 * 输入  ：无
 * 返回  : 无
 */
static bool rx_StringHandle_And(char * reply1, char * reply2)
{
		if ( ( reply1 != 0 ) && ( reply2 != 0 ) )
			return ( ( bool ) strstr ( strEsp32_Fram_Record .Data_RX_BUF, reply1 ) && 
							 ( bool ) strstr ( strEsp32_Fram_Record .Data_RX_BUF, reply2 ) ); 
		
		else if ( ( reply1 != 0 ) && ( reply2 == 0 ) )
			return ( ( bool ) strstr ( strEsp32_Fram_Record .Data_RX_BUF, reply1 ) );
		
		else if ( ( reply1 == 0 ) && ( reply2 != 0 ) )
			return ( ( bool ) strstr ( strEsp32_Fram_Record .Data_RX_BUF, reply2 ) );
}

/*
 * 函数名：ESP32_AT_CmdSend
 * 描述  ：AT指令发送函数
 * 输入  ：cmd AT指令，cmd_type 指令枚举类型
 * 返回  : 无
 */
static void ESP32_AT_CmdSend(char * cmd, ENUM_AT_CmdSendDef cmd_type)
{
		if( (g_ESP32_ReadyFlag == true)&&(cmd_type != SET_NONE) )
		{
				Init_ESP32_UartRx_Setting();
				strEsp32_Fram_Record .InfBit .FramLength = 0;
				macESP32_Usart ( "%s\r\n", cmd );
			
				g_ESP32CmdSendState = cmd_type;
		}
}

/* 定义ssid + pwd的缓冲区大小 */
#define	FLASH_SPACE_LEN	230

/**
* @brief 配网成功后，把SSID,PASSWORD和MAC存入stm32嵌入式flash内
* decimal value.
*
* @param 无
*
* @return 无
*/
void netWorkMsgFlashStore(void)
{
		char     msg[FLASH_SPACE_LEN] = {0};
		char     *p;
		uint64_t *p64;
		uint16_t flash_addr = 0;
		
		sprintf(msg, "Info:&SSID=%s&PASSWORD=%s&MAC=%X:%X:%X:%X:%X:%X&", g_STA_SSID,g_STA_PW,g_Esp32MAC[0],g_Esp32MAC[1],g_Esp32MAC[2],g_Esp32MAC[3],g_Esp32MAC[4],g_Esp32MAC[5]);

		p = msg;
		eraseEmbeddedFlash(FLASH_PAGE63);
		while(*p != '\0')
		{
				p64 = (uint64_t *)p;
				writeDoubleWordEmbeddedFlash(FLASH_PAGE63, FLASH_PAGE63_START_ADDR, flash_addr, *p64);
				p += 8;
				flash_addr += 8;
		}
}

/**
* @brief 读取stm32嵌入式flash内的信息，以便判断是否成功配网
* decimal value.
*
* @param *network_msg 读到的flash字符串信息
*
* @return 无
*/
void netWorkMsgFlashRead(uint8_t *network_msg)
{
		uint8_t   i;
		uint16_t  flash_addr = 0;
		uint16_t  cnt = 0;
		bool      chr_null_flag = 0;
		bool      flash_empty = 0;
		
		for(; ;)
		{
				readDoubleWordEmbeddedFlash(FLASH_PAGE63_START_ADDR, flash_addr, (uint32_t *)&network_msg[flash_addr], (uint32_t *)&network_msg[flash_addr + 4]);
				for(i=0;i<8;i++)
				{
						
						/* 结束字符判断 */
						if(network_msg[flash_addr] == '\0')
						{
								chr_null_flag = 1;
								break;
						}
						/* 0xFF数据判断 */
						if(network_msg[flash_addr] == 0xFF)
						{
								if(++cnt >= FLASH_SPACE_LEN)
								{
										flash_empty = 1;
										break;
								}
						}
						flash_addr++;
				}
				/* 遇到结束字符标志退出 */
				if ( (chr_null_flag == 1)||(flash_empty == 1) )
					break;
		}
}


/**
* @brief This function permits to convert an ASCII HEX value to its
* decimal value.
*
* @param u8_ascii ASCII HEX value
*
* @return decimal value
*/
static uint8_t MathTools__ConvertASCIIToNumber(uint8_t u8_ascii)
{
		 uint8_t u8_ret_val = 0;
		 // check if value is between '0' and '9'
		 if((u8_ascii >= '0') && (u8_ascii <= '9'))
		 {
				u8_ret_val = (u8_ascii - '0');
		 }
		 else if((u8_ascii >= 'A') && (u8_ascii <= 'F'))
		 {
				u8_ret_val = ((u8_ascii - 'A') + 10);
		 }
		 else if((u8_ascii >= 'a') && (u8_ascii <= 'f'))
		 {
				u8_ret_val = ((u8_ascii - 'a') + 10);
		 }
		 return (u8_ret_val);
}

/**
*
* @brief This method decodes a percent-encoded string.
* The same input buffer is used for its conversion.
**
**/
static void Utilities__StrPercentDecoding(char* pc_data)
{
		uint32_t length = strlen(pc_data);
		uint32_t p_read;
		uint32_t p_write = 0;
		char c;
		char decoded_c;
		uint8_t buff[2];
		for (p_read = 0; p_read < length; ++p_read)
		{
				c = pc_data[p_read];
				if ('%' == c)
				{
						// convert the sequent digits
						buff[0] = MathTools__ConvertASCIIToNumber(pc_data[p_read + 1]);
						buff[1] = MathTools__ConvertASCIIToNumber(pc_data[p_read + 2]);
						// clear the digits with \0 values
						pc_data[p_read + 1] = '\0';
						pc_data[p_read + 2] = '\0';
						// decode the char using digits converted as ASCII value
						decoded_c = (buff[0] * 16) + buff[1];
						// write the char in position of %
						pc_data[p_write] = decoded_c;
						// jump to next char after %xy
						p_read += 2;
						// set write to next char after %
						p_write++;
				}
				else
				{
						pc_data[p_write] = c;
						p_write++;
				}
		}
		// if needed, fill remaining bytes with \0
		while(p_write < length)
		{
				pc_data[p_write] = '\0';
				++p_write;
		} 
}

/**
*
* @brief  CRC calculate
**
**/
static unsigned int crc16(const uint8_t *Data, uint8_t Length)
{
		unsigned char i;
		unsigned char j;
		int current_crc_value = PRESET_VALUE;

		for ( i = 0; i < Length; i++ )
		{
				current_crc_value ^= *Data & 0xFF;
				Data++;

				for ( j = 0; j < 8; j++)
				{
						if ((current_crc_value & 1) != 0)
						{
								current_crc_value = (current_crc_value >> 1) & 0x7FFF;
								current_crc_value = (current_crc_value ^ POLYNOMIAL);
						}
						else
						{
								current_crc_value = (current_crc_value >> 1) & 0x7FFF;
						}
				}
		}
		current_crc_value = ~current_crc_value;

		return (current_crc_value & 0xFFFF);
}

/**
*
* @brief  Convert MAC to  ASCII hex values.
**
**/
//static void mac2Ascii_hex(char  *macHexStr)
//{
//		uint8_t i, tem;
//		uint8_t ascii_data[12] = {0};
//	
//		for(i=0;i<6;i++)
//		{
//				tem = g_Esp32MAC[i]/16;
//				(tem < 10)?(ascii_data[i*2] = tem + '0'):(ascii_data[i*2] = tem - 10 + 'A');
//				tem = g_Esp32MAC[i]%16;
//				(tem < 10)?(ascii_data[i*2+1] = tem + '0'):(ascii_data[i*2+1] = tem - 10 + 'A');
//		}
//		/* 转换成59字节的字符串 */
//		sprintf ( macHexStr, "0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
//		ascii_data[0],ascii_data[1],ascii_data[2],ascii_data[3],ascii_data[4],ascii_data[5],
//		ascii_data[6],ascii_data[7],ascii_data[8],ascii_data[9],ascii_data[10],ascii_data[11] );
//}

/**
*
* @brief  Convert MAC to  ASCII hex values.
**
**/
static void mac2hex(char  *macHexStr)
{
//		uint8_t i, tem;
//		uint8_t ascii_data[6] = {0};
//	
//		for(i=0;i<6;i++)
//		{
//				tem = g_Esp32MAC[i]/16;
//				(tem < 10)?(ascii_data[i*2] = tem + '0'):(ascii_data[i*2] = tem - 10 + 'A');
//				tem = g_Esp32MAC[i]%16;
//				(tem < 10)?(ascii_data[i*2+1] = tem + '0'):(ascii_data[i*2+1] = tem - 10 + 'A');
//		}
		/* 转换成59字节的字符串 */
		sprintf ( macHexStr, "0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
		g_Esp32MAC[0],g_Esp32MAC[1],g_Esp32MAC[2],g_Esp32MAC[3],g_Esp32MAC[4],g_Esp32MAC[5]);
}

/**
*
* @brief  把 MAC 转换成uint8_t类型
**
**/
static void mac_to_net(uint32_t* scr, uint8_t* tar)
{
    uint32_t i = 0;
    for(i = 0; i < 6; i++)
    {
        tar[i] = (uint8_t)scr[i];
    }
    return;
}

/**
* @brief mac地址处理函数
* decimal value.
*
* @param 无
*
* @return 无
*/
static void mac_Processed(void)
{
		char mac_add[20] = {0};
    uint32_t mac_add_tmp[6] = {0};
		/* 从Data_RX_BUF缓冲区解析mac地址字符串 */
		sscanf(strEsp32_Fram_Record .Data_RX_BUF, "%*[^\"]\"%[^\"]", mac_add);
   /*先转为u32*/
    sscanf(mac_add, MACSTR, MACLTOS(mac_add_tmp)); 
    mac_to_net(mac_add_tmp, g_Esp32MAC);
		
}

/**
* @brief 蓝牙广播字符串处理函数
* decimal value.
*
* @param char  *adver_str
*
* @return 无
*/
static void BLE_AdvertisingStringHandle(char  *adver_str)
{
		uint8_t tem;
		uint8_t last2MAC_ascii[4] = {0};
		
		tem = g_Esp32MAC[4]/16;
		last2MAC_ascii[0] = (tem < 10)?(tem + '0'):(tem - 10 + 'A');
		tem = g_Esp32MAC[4]%16;
		last2MAC_ascii[1] = (tem < 10)?(tem + '0'):(tem - 10 + 'A');
		
		tem = g_Esp32MAC[5]/16;
		last2MAC_ascii[2] = (tem < 10)?(tem + '0'):(tem - 10 + 'A');
		tem = g_Esp32MAC[5]%16;
		last2MAC_ascii[3] = (tem < 10)?(tem + '0'):(tem - 10 + 'A');
		
		sprintf ( adver_str, "AT+BLEADVDATA=\"02010607094948%x%x%x%x03FF4505030306CA\"",
		last2MAC_ascii[0], last2MAC_ascii[1], last2MAC_ascii[2], last2MAC_ascii[3]);
}
 

/**
* @brief This function process the information returned by AT protocol
* decimal value.
*
* @param None
*
* @return None
*/
void ESP32_RevHandle(void)
{
		char *pointer = 0;
		uint8_t len = 0;
		uint8_t action_code = 0;
		uint32_t crc_count_value = 0;
		uint32_t crc_rev_value = 0;
		
		/* Esp32 ready */
		if ( rx_StringHandle_And("ready", NULL)&&(powerOnInitFinish == 1) )
		{
				g_ESP32_ReadyFlag = true;
				g_ESP32CmdRevState = ESP32_READY;
		}
		/* Set ATE0 ok */
		else if ( (g_ESP32CmdSendState == SET_ATE0)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_ATE0_OK;			
		}
		/* Read mac address ok */
		else if ( (g_ESP32CmdSendState == GET_MAC_ADDRESS)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = GET_MAC_ADDRESS_OK;
			mac_Processed();
		}
		/* set eeprom ok */
		else if ( (g_ESP32CmdSendState == SET_EECODE)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_EECODE_OK;
		}
		/* set sw ver ok */
		else if ( (g_ESP32CmdSendState == SET_SW_VERSION)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_SW_VERSION_OK;
		}
		/* set RF power ok */
		else if ( (g_ESP32CmdSendState == SET_RF_POWER)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_RF_POWER_OK;
		}
		/* Set WIFI Module OFF ok */
		else if ( (g_ESP32CmdSendState == SET_DISABLE_WIFI)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_DISABLE_WIFI_OK;
		}
		/* Reset WIFI Module ok */
		else if ( (g_ESP32CmdSendState == SET_RESET_MODULE)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_RESET_MODULE_OK;
		}
		/* Set BLE Module OFF (AP process) ok */
		else if ( (g_ESP32CmdSendState == SET_DISABLE_BLE_AP_PROCESS)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_DISABLE_BLE_AP_PROCESS_OK;
		}
		/* Set BLE Module OFF (STA process) ok */
		else if ( (g_ESP32CmdSendState == SET_DISABLE_BLE_STA_PROCESS)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_DISABLE_BLE_STA_PROCESS_OK;
		}		
		/* Set WIFI AP Mode ok */
		else if ( (g_ESP32CmdSendState == SET_WIFI_AP_MODE)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_WIFI_AP_MODE_OK;
		}
		/* Set AP SSID ok */
		else if ( (g_ESP32CmdSendState == SET_AP_SSID)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_AP_SSID_OK;
		}
		/* Set IP address and subnet mask ok */
		else if ( (g_ESP32CmdSendState == SET_IP_ADDR_AND_MASK)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_IP_ADDR_AND_MASK_OK;
		}
		/* Enable Multiplexing (AP process) ok */
		else if ( (g_ESP32CmdSendState == SET_ENABLE_MUX_AP_PROCESS)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_ENABLE_MUX_AP_PROCESS_OK;
		}
		/* Enable Multiplexing (STA process) ok */
		else if ( (g_ESP32CmdSendState == SET_ENABLE_MUX_STA_PROCESS)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_ENABLE_MUX_STA_PROCESS_OK;
		}
		/* Enable Server on port ok */
		else if ( (g_ESP32CmdSendState == SET_ENABLE_SERVER_PORT_AP_PROCESS)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_ENABLE_SERVER_PORT_AP_PROCESS_OK;
//			g_ESP32CmdRevState = SET_AP_FINISH;
		}
		/* Enable Server on port (STA process) ok */
		else if ( (g_ESP32CmdSendState == SET_ENABLE_SERVER_PORT_STA_PROCESS)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_ENABLE_SERVER_PORT_STA_PROCESS_OK;
//			g_ESP32CmdRevState = SET_AP_FINISH;
		}
		/* Set BLE server function ok */
		else if ( (g_ESP32CmdSendState == SET_BLE_SERVER_FUNCTION)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_BLE_SERVER_FUNCTION_OK;
		}
		/* Create BLE service(s) ok */
		else if ( (g_ESP32CmdSendState == SET_CREATE_BLE_SERVER)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_CREATE_BLE_SERVER_OK;
		}
		/* Start BLE service(s) ok */
		else if ( (g_ESP32CmdSendState == START_BLE_SERVICE)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = START_BLE_SERVICE_OK;
		}
		/* Set characteristic 1 of service 1 value (MAC address) ok*/
		else if ( (g_ESP32CmdSendState == SET_CHARAC1_WRAP)&&(rx_StringHandle_And(">", NULL)) )
		{
			g_ESP32CmdRevState = SET_CHARAC1_WRAP_OK;
		}		
		/* Set characteristic 1 of service 1 value (MAC address) ok*/
		else if ( (g_ESP32CmdSendState == SET_CHARAC1)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_CHARAC1_OK;
		}
		/* Set characteristic 2 of service 1 value (0=default/success) ok */
		else if ( (g_ESP32CmdSendState == SET_CHARAC2_WRAP)&&(rx_StringHandle_And(">", NULL)) )
		{
			g_ESP32CmdRevState = SET_CHARAC2_WRAP_OK;
		}
		/* Set characteristic 2 of service 1 value (0=default/success) ok */
		else if ( (g_ESP32CmdSendState == SET_CHARAC2)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_CHARAC2_OK;
		}
		/* Load BLE advertising ok */
		else if ( (g_ESP32CmdSendState == SET_LOAD_BLE_ADVERTSING)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_LOAD_BLE_ADVERTSING_OK;
		}
		/* Start BLE advertising ok */
		else if ( (g_ESP32CmdSendState == SET_START_BLE_ADVERTSING)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_START_BLE_ADVERTSING_OK;
		}
		/* Send BLEGATTSNTFY wrap ('>') ok */
		else if ( (g_ESP32CmdSendState == SET_BLEGATTSNTFY_WRAP)&&(rx_StringHandle_And(">", NULL)) )
		{
			g_ESP32CmdRevState = SET_BLEGATTSNTFY_WRAP_OK;
		}
		/* Send BLEGATTSNTFY(BLE ACK) ok */
		else if ( (g_ESP32CmdSendState == SET_BLEGATTSNTFY)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = BLE_CONFIG_FINISH;
		}
		/* Set WIFI STA Mode ok */
		else if ( (g_ESP32CmdSendState == SET_WIFI_STA_MODE)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_WIFI_STA_MODE_OK;
		}	
		/* Set WIFI STA SSID ok */
		else if ( (g_ESP32CmdSendState == SET_STA_SSID)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_STA_SSID_OK;
		}	
		/* Request IP and MAC */
		else if ( (g_ESP32CmdSendState == REQUEST_IP_AND_MAC)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = REQUEST_IP_AND_MAC_OK;
		}	
		/* Set DHCP */
		else if ( (g_ESP32CmdSendState == SET_START_DHCP)&&(rx_StringHandle_And("OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_START_DHCP_OK;
		}	
		/* Set config CIPSEND ok */
		else if ( (g_ESP32CmdSendState == SET_CONFIG_CIPSEND_LEN)&&(rx_StringHandle_And(">", NULL)) )
		{
			g_ESP32CmdRevState = SET_CONFIG_CIPSEND_LEN_OK;
		}
		/* Set config CIPSEND ack ok */
		else if ( (g_ESP32CmdSendState == SET_CONFIG_CIPSEND_DATA)&&(rx_StringHandle_And("SEND OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_CONFIG_CIPSEND_DATA_OK;
			ESP32_ConfigState = PAIRING_FINISH;
			g_ESP32CmdRevState = WIFI_CONFIG_FINISH;
		}
		/* Set http read CIPSEND ok */
		else if ( (g_ESP32CmdSendState == SET_HTTP_READ_CIPSEND_LEN)&&(rx_StringHandle_And(">", NULL)) )
		{
			g_ESP32CmdRevState = SET_HTTP_READ_CIPSEND_LEN_OK;
		}
		/* Set http write CIPSEND ok */
		else if ( (g_ESP32CmdSendState == SET_HTTP_WRITE_CIPSEND_LEN)&&(rx_StringHandle_And(">", NULL)) )
		{
			g_ESP32CmdRevState = SET_HTTP_WRITE_CIPSEND_LEN_OK;
		}
		/* Http read CIPSEND ack ok */
		else if ( (g_ESP32CmdSendState == SET_HTTP_READ_CIPSEND_DATA)&&(rx_StringHandle_And("SEND OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_HTTP_READ_CIPSEND_DATA_OK;//g_ESP32CmdRevState will be reset to zero
		}
		/* Http write CIPSEND ack ok */
		else if ( (g_ESP32CmdSendState == SET_HTTP_WRITE_CIPSEND_DATA)&&(rx_StringHandle_And("SEND OK", NULL)) )
		{
			g_ESP32CmdRevState = SET_HTTP_WRITE_CIPSEND_DATA_OK;//g_ESP32CmdRevState will be reset to zero
		}
		
		/* Http CIPSEND ack ok */
		if (rx_StringHandle_And("0,CLOSED", NULL) && (g_ESP32CmdSendState == SET_HTTP_READ_CIPSEND_DATA))
		{
				g_ESP32CmdSendState = SET_HTTP_READ_CIPSEND_DATA_OK;//g_ESP32CmdSendState won't be reset to zero
		}
		
		/* BLE connected */
		if (rx_StringHandle_And("NTW_MODE", NULL) && (g_ESP32CmdSendState == SET_START_BLE_ADVERTSING))
		{
			pointer = strstr(strEsp32_Fram_Record .Data_RX_BUF, "+WRITE:");
			/*  Search the header byte, constant 0xA5 */
			while(*(uint8_t *)pointer != '\0')
			{
					if(*(uint8_t *)pointer != 0xA5)
					{
							break;
					}
					pointer++;
			}
			len = *(uint8_t *)(pointer + 1);
			action_code =  *(uint8_t *)(pointer + 2);
			crc_count_value = crc16((uint8_t *)pointer,len - 2);
			crc_rev_value = (*(uint8_t *)(pointer + len - 1 - 1) << 8) + (*(uint8_t *)(pointer + len - 1));
//			if(crc_count_value == crc_rev_value)
			{
					sscanf((char *)pointer, "%*[^&]&SSID=%[^&]&PASSWORD=%[^&]",g_STA_SSID, g_STA_PW);
					Utilities__StrPercentDecoding(g_STA_SSID);
					Utilities__StrPercentDecoding(g_STA_PW);
					g_ESP32CmdRevState = BLE_CONFIG_CONNECTED;
					netWorkMsgFlashStore();
					/* 退出配置模式 */
//					ESP32_ConfigMode = false;
				ESP32_Rst();
			}
		}
		
		
		/* AP created */
		if ( (rx_StringHandle_And("http-config.json", NULL))&&(g_ESP32CmdSendState == SET_ENABLE_SERVER_PORT_AP_PROCESS) )
		{
			sscanf(strEsp32_Fram_Record .Data_RX_BUF, "%*[^&]&NTW_MODE=3&SSID=%[^&]&PASSWORD=%[^ ]&",g_STA_SSID, g_STA_PW);
			Utilities__StrPercentDecoding(g_STA_SSID);
			Utilities__StrPercentDecoding(g_STA_PW);
			netWorkMsgFlashStore();
			g_ESP32CmdRevState = WIFI_CONFIG_CONNECTED;
		}
		
		/* STA connected http-read */
		if (rx_StringHandle_And("http-read.json", NULL)) 
		{
			g_ESP32CmdRevState = NETWORK_CONNECTED_HTTP_READ;
			iotConnectState = IOT_CONNECTED;
			iotConnectCnt = IOT_EFFECTIVE_TIME;
			
		}
		
		/* STA connected http-write */
		if (rx_StringHandle_And("http-write.json", NULL)) 
		{
			g_ESP32CmdRevState = NETWORK_CONNECTED_HTTP_WRITE;
			iotConnectState = IOT_CONNECTED;
			iotConnectCnt = IOT_EFFECTIVE_TIME;
			
		}
		
		/* Wifi pairing ok */
		if ( rx_StringHandle_And("0,CLOSED", NULL)&&(g_ESP32CmdSendState == SET_CONFIG_CIPSEND_DATA) )
		{
			ESP32_ConfigState = PAIRING_FINISH;
			g_ESP32CmdRevState = WIFI_CONFIG_FINISH;
		}
		
		/* IOT date upload ok */
		if ( rx_StringHandle_And("0,CLOSED", NULL)&&(g_ESP32CmdRevState == SET_HTTP_READ_CIPSEND_DATA_OK) )
		{
			g_ESP32CmdRevState = IOT_DATA_UPLOAD_OK;
		}
		
		/* connected the router */
		if ( rx_StringHandle_And("WIFI GOT IP", NULL) )
		{
			g_ESP32CmdRevState = ROUTER_CONNECTED;
		}	
		
}

/**
* @brief This function process the AT command
* decimal value.
*
* @param None
*
* @return None
*/
void ESP32_AT_Cmd_Handle(void)
{
		char cStr[128] = {0};
		__IO int ret;
		uint16_t len = 0;
		char *p_largebuf;
		static ErrorStatus httpWriteResult;
		
		switch(g_ESP32CmdRevState)
		{
				/* 上电就绪 */
				case ESP32_READY:
					/* 申请内存，首先查询flash区域的数据，确定是否需要配网 */
					p_largebuf = mymalloc(FLASH_SPACE_LEN);
					/* 格式化内存 */
					memset(p_largebuf,0xFF,FLASH_SPACE_LEN);
					/* 把flash数据读到内存 */
					netWorkMsgFlashRead((uint8_t *)p_largebuf);
#if 0
					/* 找不到 "Info:"特征字直接进入配网模式,默认先尝试 BLE */
					if(strstr(p_largebuf, "Info:") == NULL)
					{
							/* 如果没有按键设置配网模式，默认使用蓝牙配网，如果需要改WIFI配网按WIFI按键 */
							if ( (ESP32_ConfigState != BLE_PAIRING)&&(ESP32_ConfigState != WIFI_PAIRING) )
							{
								ESP32_ConfigState = BLE_PAIRING;
							}
//							
					}
					else
					{
							/* 得到空字符串，进入配网模式,默认先尝试 BLE */
							ret = sscanf(p_largebuf, "%*[^=]=%[^&]",cStr);
							if ( ( ret == EOF )||(ret == 0) )
							{
									/* 如果没有按键设置配网模式，默认使用蓝牙配网，如果需要改WIFI配网按WIFI按键 */
									if ( (ESP32_ConfigState != BLE_PAIRING)&&(ESP32_ConfigState != WIFI_PAIRING) )
									{
										ESP32_ConfigState = BLE_PAIRING;
									}
							}
							/* 不需要配网 */
							else
							{
									/* 解析配网字符串 */
									sscanf((char *)p_largebuf, "%*[^=]=%[^&]&PASSWORD=%[^&]",g_STA_SSID, g_STA_PW);
									ESP32_ConfigState = PAIRING_FINISH;
							}
					}
#endif					
					/* 找到 "Info:"特征字直接进入配网模式,默认先尝试 BLE */
					if(strstr(p_largebuf, "Info:") != NULL)
					{
							/* 解析配网字符串 */
							sscanf((char *)p_largebuf, "%*[^=]=%[^&]&PASSWORD=%[^&]",g_STA_SSID, g_STA_PW);
							ESP32_ConfigState = PAIRING_FINISH;
					}
					myfree(p_largebuf);
					/* 只要ESP32_ConfigState不为NONE就开始发送指令 */
					if(ESP32_ConfigState != NONE_PAIRING)
					{
							ESP32_AT_CmdSend("ATE0", SET_ATE0);
					}
					break;
				case SET_ATE0_OK:
					ESP32_AT_CmdSend("AT+CIPSTAMAC?", GET_MAC_ADDRESS);
					break;
				case GET_MAC_ADDRESS_OK:
					ESP32_AT_CmdSend("AT+EECODE=40015403", SET_EECODE);
					break;
				case SET_EECODE_OK:
					sprintf ( cStr, "AT+ACUVER=%d,%s,%d", MAJOR_SW_VERSION, MINOR_SW_VERSION, TEST_SW_VERSION );
					ESP32_AT_CmdSend("AT+ACUVER=1,A,5", SET_SW_VERSION);
					break;
				case SET_SW_VERSION_OK:
					ESP32_AT_CmdSend("AT+RFPOWER=0", SET_RF_POWER);
					break;
				case SET_RF_POWER_OK:
					if(ESP32_ConfigState == BLE_PAIRING)
					{
							/* 进入BLE配网模式，首先关闭WIFI */
							ESP32_AT_CmdSend("AT+CWMODE=0", SET_DISABLE_WIFI);
					}
					else if(ESP32_ConfigState == WIFI_PAIRING)
					{
							/* 进入WIFI配网模式，建立AP服务器 */
							ESP32_AT_CmdSend("AT+CWMODE=2", SET_WIFI_AP_MODE);
					}
					else if(ESP32_ConfigState == PAIRING_FINISH)
					{
							/* 配网完成，开启WIFI STA模式 */
							ESP32_AT_CmdSend("AT+CWMODE=1", SET_WIFI_STA_MODE);
					}
					break;
				
				/*****************/
				
				/* WIFI STA 模式 */

				case SET_WIFI_STA_MODE_OK:
					ESP32_AT_CmdSend("AT+BLEINIT=0", SET_DISABLE_BLE_STA_PROCESS);
				case SET_DISABLE_BLE_STA_PROCESS_OK:
					sprintf ( cStr, "AT+CWJAP=\"%s\",\"%s\"", g_STA_SSID, g_STA_PW );
					ESP32_AT_CmdSend(cStr, SET_STA_SSID);
					break;
				/* 等待连接网络 */
				case ROUTER_CONNECTED:
					ESP32_AT_CmdSend("AT+CIFSR", REQUEST_IP_AND_MAC);
					break;
				case REQUEST_IP_AND_MAC_OK:
					ESP32_AT_CmdSend("AT+CWDHCP=1,1", SET_START_DHCP);
					break;
				case SET_START_DHCP_OK:
					ESP32_AT_CmdSend("AT+CIPMUX=1", SET_ENABLE_MUX_STA_PROCESS);
					break;
				case SET_ENABLE_MUX_STA_PROCESS_OK:
					ESP32_AT_CmdSend("AT+CIPSERVER=1,80", SET_ENABLE_SERVER_PORT_STA_PROCESS);
					break;
				case NETWORK_CONNECTED_HTTP_READ:
					p_largebuf = mymalloc(1300);
					memset(p_largebuf,0,1300);
					httpUpload_JsonFormat(p_largebuf);
					len = strlen(p_largebuf);
					myfree(p_largebuf);
					sprintf ( cStr, "AT+CIPSEND=0,%d", len + 2 );
					ESP32_AT_CmdSend(cStr, SET_HTTP_READ_CIPSEND_LEN);
					break;
				case NETWORK_CONNECTED_HTTP_WRITE:
					httpDownloadDataSave( (char *)&strEsp32_Fram_Record.Data_RX_BUF);
					/* http 远程控制 */
					httpWriteResult = httpWriteCommandExecute();
					if( SUCCESS == httpWriteResult )
					{
//						memcpy(cStr, "{\"response\":\"SUCCESS\"}", strlen("{\"response\":\"SUCCESS\"}"));
						len = strlen("{\"response\":\"SUCCESS\"}");
					}
					else
					{
						len = strlen("{\"response\":\"BAD REQUEST\"}");
					}
			
					sprintf ( cStr, "AT+CIPSEND=0,%d", len + 2 );
					ESP32_AT_CmdSend(cStr, SET_HTTP_WRITE_CIPSEND_LEN);
					break;
				case SET_HTTP_READ_CIPSEND_LEN_OK:
//					httpUpload_JsonFormat(strEsp32_Fram_Record .Data_RX_BUF);
//					ESP32_AT_CmdSend(strEsp32_Fram_Record .Data_RX_BUF, SET_HTTP_READ_CIPSEND_DATA);
					p_largebuf = mymalloc(1300);
					memset(p_largebuf,0,1300);
					httpUpload_JsonFormat(p_largebuf);
					ESP32_AT_CmdSend(p_largebuf, SET_HTTP_READ_CIPSEND_DATA);
					myfree(p_largebuf);
					break;
				case SET_HTTP_WRITE_CIPSEND_LEN_OK:
					if( SUCCESS == httpWriteResult )
					{
						memcpy(cStr, "{\"response\":\"SUCCESS\"}", strlen("{\"response\":\"SUCCESS\"}"));
					}
					else
					{
						memcpy(cStr, "{\"response\":\"BAD REQUEST\"}", strlen("{\"response\":\"BAD REQUEST\"}"));
					}
					ESP32_AT_CmdSend(cStr, SET_HTTP_WRITE_CIPSEND_DATA);
					break;
				/**********************/		
				
				
				
				/* WIFI AP 模式 */
				case SET_WIFI_AP_MODE_OK:
					ESP32_AT_CmdSend("AT+BLEINIT=0", SET_DISABLE_BLE_AP_PROCESS);
					break;
				case SET_DISABLE_BLE_AP_PROCESS_OK:
					sprintf ( cStr, "AT+CWSAP=\"WIFIHOB-%02X%02X\",\"\",11,0", g_Esp32MAC[4], g_Esp32MAC[5] );
					ESP32_AT_CmdSend(cStr, SET_AP_SSID);
					break;
				case SET_AP_SSID_OK:
					ESP32_AT_CmdSend("AT+CIPAP=\"192.168.0.1\",\"192.168.0.1\",\"255.255.255.0\"", SET_IP_ADDR_AND_MASK);
					break;
				case SET_IP_ADDR_AND_MASK_OK:
					ESP32_AT_CmdSend("AT+CIPMUX=1", SET_ENABLE_MUX_AP_PROCESS);
					break;
				case SET_ENABLE_MUX_AP_PROCESS_OK:
					ESP32_AT_CmdSend("AT+CIPSERVER=1,80", SET_ENABLE_SERVER_PORT_AP_PROCESS);
					break;
				/**********************/
				
				
				/* 设置 BLE SERVER 模式 */
//				case SET_AP_FINISH:
				case SET_DISABLE_WIFI_OK:
//					HAL_Delay(1000);
					ESP32_AT_CmdSend("AT+BLEINIT=2", SET_BLE_SERVER_FUNCTION);
				break;
				case SET_BLE_SERVER_FUNCTION_OK:
//					HAL_Delay(1000);
					ESP32_AT_CmdSend("AT+BLEGATTSSRVCRE", SET_CREATE_BLE_SERVER);
				break;
				case SET_CREATE_BLE_SERVER_OK:
//					HAL_Delay(1000);
					ESP32_AT_CmdSend("AT+BLEGATTSSRVSTART", START_BLE_SERVICE);
				break;
				case START_BLE_SERVICE_OK:
//					HAL_Delay(1000);
					ESP32_AT_CmdSend("AT+BLEGATTSSETATTR=1,1,,6", SET_CHARAC1_WRAP);
				break;
				case SET_CHARAC1_WRAP_OK:
//					HAL_Delay(1000);;
					mac2hex(cStr);
					ESP32_AT_CmdSend(cStr, SET_CHARAC1);
				break;
				case SET_CHARAC1_OK:
//					HAL_Delay(1000);
					ESP32_AT_CmdSend("AT+BLEGATTSSETATTR=1,2,,1", SET_CHARAC2_WRAP);
				break;
				case SET_CHARAC2_WRAP_OK:
					ESP32_AT_CmdSend("0", SET_CHARAC2);
				break;
				case SET_CHARAC2_OK:
					BLE_AdvertisingStringHandle(cStr);
//					HAL_Delay(1000);
					ESP32_AT_CmdSend(cStr, SET_LOAD_BLE_ADVERTSING);
				break;
				case SET_LOAD_BLE_ADVERTSING_OK:
					ESP32_AT_CmdSend("AT+BLEADVSTART", SET_START_BLE_ADVERTSING);
				break;
				/***************************/
				
				
				/********接收蓝牙配置包********/
				case BLE_CONFIG_CONNECTED:
					ESP32_AT_CmdSend("AT+BLEGATTSNTFY=0,1,2,1", SET_BLEGATTSNTFY_WRAP);
				break;
				case SET_BLEGATTSNTFY_WRAP_OK:
					ESP32_AT_CmdSend("0", SET_BLEGATTSNTFY);
				break;
				case BLE_CONFIG_FINISH:
					ESP32_Rst();
				break;
				/*******************************/
				
				
				/********接收WIFI配置包********/
				case WIFI_CONFIG_CONNECTED:
					ESP32_AT_CmdSend("AT+CIPSEND=0,22", SET_CONFIG_CIPSEND_LEN);
				break;
				case SET_CONFIG_CIPSEND_LEN_OK:
					ESP32_AT_CmdSend("{\"response\":\"SUCCESS\"}", SET_CONFIG_CIPSEND_DATA);
				break;
				case WIFI_CONFIG_FINISH:
					ESP32_Rst();
				break;
				/*******************************/
		}
		
		g_ESP32CmdRevState = RECEIVE_RESET;
}


