#ifndef  __BSP_ESP32_H
#define	 __BSP_ESP32_H



#include "main.h"
#include <stdio.h>
#include <stdbool.h>
#include "usart.h"


#if defined ( __CC_ARM   )
#pragma anon_unions
#endif

/******************************* ESP32 数据类型定义 ***************************/

/* 配网状态枚举类型定义 */
typedef enum{
	NONE_PAIRING,
	BLE_PAIRING,
	WIFI_PAIRING,
	PAIRING_FINISH
}ENUM_ESP32_ConfigState;

/* 网络连接状态枚举类型定义 */
typedef enum{
	IOT_CONNECTED,
	IOT_DISCONNECT
}ENUM_IOT_ConnectState;

/* AT指令发送操作枚举定义 */
typedef enum{
	
	SET_NONE,
	
	SET_ATE0,
	SET_EECODE,
	SET_SW_VERSION,
	SET_RF_POWER,
	SET_DISABLE_WIFI,     //AT+CWMODE=0
	SET_RESET_MODULE,
	SET_DISABLE_BLE_AP_PROCESS, //AT+BLEINIT=0
	SET_DISABLE_BLE_STA_PROCESS, //AT+BLEINIT=0
	GET_MAC_ADDRESS,
	SET_WIFI_AP_MODE,
	SET_WIFI_STA_MODE,
	SET_AP_SSID,
	SET_STA_SSID,
	SET_IP_ADDR_AND_MASK,
	REQUEST_IP_AND_MAC,
	SET_START_DHCP,
	SET_ENABLE_MUX_AP_PROCESS,
	SET_ENABLE_MUX_STA_PROCESS,
	SET_ENABLE_SERVER_PORT_AP_PROCESS,
	SET_ENABLE_SERVER_PORT_STA_PROCESS,
	SET_BLE_SERVER_FUNCTION,//AT+BLEINIT=2
	SET_CREATE_BLE_SERVER,  //AT+BLEGATTSSRVCRE
	START_BLE_SERVICE,      //AT+BLEGATTSSRVSTART
	SET_CHARAC1_WRAP,       //send AT+BLEGATTSSETATTR=1,1,,6  wait '>'
	SET_CHARAC1,            //receive '>'  send mac
	SET_CHARAC2_WRAP,       //send AT+BLEGATTSSETATTR=1,2,,1  wait '>'
	SET_CHARAC2,            //receive '>'  send 0
	SET_LOAD_BLE_ADVERTSING,//AT+BLEADVDATA
	SET_START_BLE_ADVERTSING,//AT+BLEADVSTART
	SET_CONFIG_CIPSEND_LEN,
	SET_CONFIG_CIPSEND_DATA,
	SET_HTTP_READ_CIPSEND_LEN,
	SET_HTTP_WRITE_CIPSEND_LEN,
	SET_HTTP_READ_CIPSEND_DATA,
	SET_HTTP_WRITE_CIPSEND_DATA,
	SET_BLEGATTSNTFY_WRAP,//'>'
	SET_BLEGATTSNTFY,
	
}ENUM_AT_CmdSendDef;


/* AT指令接收完成枚举定义 */
typedef enum{
	
	RECEIVE_RESET,
	ESP32_READY,
	
	ESP32_CONFIG_OK,
	
	SET_ATE0_OK,
	SET_DISABLE_UART_ECHO_OK,
	SET_EECODE_OK,
	SET_SW_VERSION_OK,
	SET_RF_POWER_OK,
	SET_DISABLE_WIFI_OK,
	SET_RESET_MODULE_OK,
	SET_DISABLE_BLE_AP_PROCESS_OK,
	SET_DISABLE_BLE_STA_PROCESS_OK,
	GET_MAC_ADDRESS_OK,
	SET_WIFI_AP_MODE_OK,
	SET_WIFI_STA_MODE_OK,
	SET_AP_SSID_OK,
	SET_STA_SSID_OK,             //ok, wait to connect to the network
	SET_IP_ADDR_AND_MASK_OK,
	REQUEST_IP_AND_MAC_OK,
	SET_START_DHCP_OK,
	SET_ENABLE_MUX_AP_PROCESS_OK,
	SET_ENABLE_MUX_STA_PROCESS_OK,
	SET_ENABLE_SERVER_PORT_AP_PROCESS_OK, //ignore
	SET_ENABLE_SERVER_PORT_STA_PROCESS_OK, //ignore
	SET_BLE_SERVER_FUNCTION_OK,
	SET_CREATE_BLE_SERVER_OK,
	START_BLE_SERVICE_OK,
	SET_CHARAC1_WRAP_OK,       //send AT+BLEGATTSSETATTR=1,1,,6  wait '>'
	SET_CHARAC1_OK,            //receive '>'  send mac
	SET_CHARAC2_WRAP_OK,       //send AT+BLEGATTSSETATTR=1,2,,1  wait '>'
	SET_CHARAC2_OK,            //receive '>'  send 0
	SET_LOAD_BLE_ADVERTSING_OK,//AT+BLEADVDATA
	SET_START_BLE_ADVERTSING_OK,//ignore
	SET_CONFIG_CIPSEND_LEN_OK,
	SET_CONFIG_CIPSEND_DATA_OK,
	SET_HTTP_READ_CIPSEND_LEN_OK,
	SET_HTTP_WRITE_CIPSEND_LEN_OK,
	SET_HTTP_READ_CIPSEND_DATA_OK,   //ignore
	SET_HTTP_WRITE_CIPSEND_DATA_OK,   //ignore
	
	SET_BLEGATTSNTFY_WRAP_OK,// send AT+BLEGATTSNTFY=0,1,2,1  wait '>'
	
	
	BLE_CONFIG_CONNECTED,
	WIFI_CONFIG_CONNECTED,
	ROUTER_CONNECTED,
	NETWORK_CONNECTED_HTTP_READ,
	NETWORK_CONNECTED_HTTP_WRITE,
	DISCONNECTED,
	
	SET_AP_FINISH,
	SET_BLE_SERVER_FINISH,
	BLE_CONFIG_FINISH,
	WIFI_CONFIG_FINISH,
	
	IOT_DATA_UPLOAD_OK,
	IOT_DATA_DOWNLOAD_OK,
	WAIT_APP
	
}ENUM_AT_CmdCompleteDef;

/* ESP32工作模式枚举定义 */
typedef enum{
	STA,
  AP,
  STA_AP  
} ENUM_Net_ModeTypeDef;

/* ESP32传输模式枚举定义 */
typedef enum{
	 enumTCP,
	 enumUDP,
} ENUM_NetPro_TypeDef;
	
/* ESP32传输通道枚举定义 */
typedef enum{
	Multiple_ID_0 = 0,
	Multiple_ID_1 = 1,
	Multiple_ID_2 = 2,
	Multiple_ID_3 = 3,
	Multiple_ID_4 = 4,
	Single_ID_0 = 5,
} ENUM_ID_NO_TypeDef;
	
/* 加密方式枚举定义 */
typedef enum{
	OPEN = 0,
	WEP = 1,
	WPA_PSK = 2,
	WPA2_PSK = 3,
	WPA_WPA2_PSK = 4,
} ENUM_AP_PsdMode_TypeDef;



/******************************* ESP32 外部全局变量声明 ***************************/
#define RX_BUF_MAX_LEN     1200                                     //最大接收缓存字节数

extern struct  STRUCT_USARTx_Fram                                  //串口数据帧的处理结构体
{
	char  Data_RX_BUF [ RX_BUF_MAX_LEN ];
	
  union {
    __IO uint16_t InfAll;
    struct {
		  __IO uint16_t FramLength       :15;                               // 14:0 
		  __IO uint16_t FramFinishFlag   :1;                                // 15 
	  } InfBit;
  }; 
	
} strEsp32_Fram_Record;

extern bool    g_ESP32_ReadyFlag;
extern uint8_t iotConnectCnt;
extern ENUM_ESP32_ConfigState ESP32_ConfigState;
extern ENUM_IOT_ConnectState iotConnectState;

/******************************** ESP32 连接引脚定义 ***********************************/
#define              macESP32_CH_PD_APBxClock_FUN                   RCC_APB2PeriphClockCmd
#define              macESP32_CH_PD_CLK                             RCC_APB2Periph_GPIOG  
#define              macESP32_CH_PD_PORT                            GPIOG
#define              macESP32_CH_PD_PIN                             GPIO_Pin_13
                                                  
#define              macESP32_RST_APBxClock_FUN                     RCC_APB2PeriphClockCmd
#define              macESP32_RST_CLK                               RCC_APB2Periph_GPIOG
#define              macESP32_RST_PORT                              GPIOG
#define              macESP32_RST_PIN                               GPIO_Pin_14
                                                  
#define              macESP32_USART_BAUD_RATE     115200
                     
#define              macESP32_USARTx                                USART3
#define              macESP32_USART_APBxClock_FUN                   RCC_APB1PeriphClockCmd
#define              macESP32_USART_CLK                             RCC_APB1Periph_USART3
#define              macESP32_USART_GPIO_APBxClock_FUN              RCC_APB2PeriphClockCmd
#define              macESP32_USART_GPIO_CLK                        RCC_APB2Periph_GPIOB     
#define              macESP32_USART_TX_PORT                         GPIOB   
#define              macESP32_USART_TX_PIN                          GPIO_Pin_10
#define              macESP32_USART_RX_PORT                         GPIOB
#define              macESP32_USART_RX_PIN                          GPIO_Pin_11
#define              macESP32_USART_IRQ                             USART3_IRQn
#define              macESP32_USART_INT_FUN                         USART3_IRQHandler

/*********************************************** ESP32 函数宏定义 *******************************************/
#define              macESP32_Usart( fmt, ... )                    USART2_printf ( &huart2, fmt, ##__VA_ARGS__ ) 
#define              macPC_Usart( fmt, ... )                       printf ( fmt, ##__VA_ARGS__ )               
                     
#define              ESP32_RST_HIGH_LEVEL()                        HAL_GPIO_WritePin( WIFI_EN_GPIO_Port, WIFI_EN_Pin, GPIO_PIN_SET )
#define              ESP32_RST_LOW_LEVEL()                         HAL_GPIO_WritePin( WIFI_EN_GPIO_Port, WIFI_EN_Pin, GPIO_PIN_RESET )
                     
#define              macESP32_RST_HIGH_LEVEL()                     ESP32_RST_HIGH_LEVEL()
#define              macESP32_RST_LOW_LEVEL()                      ESP32_RST_LOW_LEVEL()

/****************************************** ESP32 函数声明 ***********************************************/
void                 ESP32_Restore(void);
void                 netWorkMsgFlashStore(void);
void                 netWorkMsgFlashRead(uint8_t *network_msg);
void                 ESP32_RevHandle(void);
void                 ESP32_AT_Cmd_Handle(void);
void                 ESP32_Rst(void);
void                 ESP32_Disable( void );
#endif


