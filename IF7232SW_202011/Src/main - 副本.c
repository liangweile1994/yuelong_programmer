/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <string.h>
#include "sm1616_drv.h"
#include "sm1616_dev.h"
#include "apt8l16_12_dev.h"
#include "apt8l16_3_dev.h"


/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define 	MIN(a,b)					((a) =< (b) ? (a) : (b)) 
#define		SETTING_NONE					0
#define		SETTING_GEAR					1
#define		SETTING_TIMER					2
#define		SETTING_LEFT_ZONE			3
#define		SETTING_RIGHT_ZONE		4

#define		GEAR_INACTIVE					0
#define		GEAR_ACTIVE						2

uint8_t g_Disp_Buf[16] = {0};
CtrlMsg_def Board1_CtrlMsg, Board2_CtrlMsg;
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
__IO FlagStatus  secFlag;

__IO FlagStatus		Ms10_bz1 = RESET;
__IO FlagStatus		Ms10_bz2 = RESET;
__IO FlagStatus		Ms10_bz3 = RESET;
__IO FlagStatus		Ms10_bz4 = RESET;
__IO FlagStatus		Ms10_bz5 = RESET;
__IO FlagStatus		Ms10_bz6 = RESET;
__IO FlagStatus		Ms10_bz7 = RESET;
__IO FlagStatus		Ms10_bz8 = RESET;
__IO FlagStatus		Ms10_bz9 = RESET;
__IO FlagStatus		Ms10_bz10 = RESET;
__IO uint8_t	  	g_GeneralFlashFlag;
FlagStatus 				longPressFlag = RESET;

FunctionalState buzzer_CtrlState = DISABLE;
FunctionalState zoneLeftState = DISABLE;
FunctionalState zoneRightState = DISABLE;

__IO uint8_t g_Sec_Cnt;
__IO uint8_t g_TimeOutCnt;
__IO uint8_t g_Beep_Cnt;
__IO uint8_t g_ShortFlash_Cnt;
__IO uint8_t g_GeneralFlash_Cnt;
uint8_t g_ButtonTime_Cnt;

uint16_t g_APT8L16_1_Val;
uint16_t g_APT8L16_2_Val;
uint16_t g_APT8L16_3_Val;

//uint8_t g_CurrentZone;
uint8_t g_Button_Val;
uint8_t g_SettingState;

FlagStatus g_Button_UpdateFlag = RESET;

Gear_Time_def g_Zone1_GT, g_Zone2_GT, g_Zone3_GT, g_Zone4_GT;
Gear_Time_def g_ZoneLeft_GT, g_ZoneRight_GT;

pGear_Time_def g_CurrentZone = NULL;

//__IO uint8_t MainBoard_TX_Data_Out[12] = {0};
//__IO uint8_t MainBoard_RX_Data_In[26] = {0};
//__IO uint8_t MainBoard_RX_Data_Length= 0;
//__IO FlagStatus  MainBoard_RX_FinishFlag = RESET;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

void user_pwm_setvalue(uint16_t value)
{
    TIM_OC_InitTypeDef sConfigOC;
 
    sConfigOC.OCMode = TIM_OCMODE_PWM1;
    sConfigOC.Pulse = value;
    sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
    sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
    HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4);   
}

/*
 * 函数名：get_Min_Timer
 * 描述  ：取最小定时器
 * 输入  ：6个炉头区域的 档位&时间 pGear_Time_def结构体指针
 * 返回  : 最小 档位&时间 pGear_Time_def结构体指针
 */
pGear_Time_def get_Min_Timer(pGear_Time_def t1, pGear_Time_def t2, pGear_Time_def t3, 
														pGear_Time_def t4, pGear_Time_def t5, pGear_Time_def t6)
{
		pGear_Time_def buf[] = {t1,t2,t3,t4,t5,t6};
		pGear_Time_def min_Val =NULL;
		uint8_t i;
		uint8_t k = 0;

		for(i=0;i<6;i++)
		{
				if(buf[i]->Timer.Minute == 0)
				{
						continue;
				}
				else
				{
						k++;
						if(k == 1)
						{
								min_Val = buf[i];
						}
						else
						{
								if(min_Val->Timer.Minute == buf[i]->Timer.Minute)
								{
										if(min_Val->Timer.Second >= buf[i]->Timer.Second)
										{
												min_Val = buf[i];
										}
								}
								else if(min_Val->Timer.Minute > buf[i]->Timer.Minute)
								{
										min_Val = buf[i];
								}
						}
				}
		}
		
		if(min_Val == NULL)
		{
				return NULL;
		}
		return min_Val;
}

/*
 * 函数名：Beep_On
 * 描述  ：开启蜂鸣器
 * 输入  ：cnt (一个单位是10ms）
 * 返回  : 无
 */
void Beep_On(uint8_t cnt)//cnt*10 ms
{
	g_Beep_Cnt = cnt;
	__HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_4, 100);
}

/*
 * 函数名：Beep_Off
 * 描述  ：关闭蜂鸣器
 * 输入  ：无
 * 返回  : 无
 */
void Beep_Off(void)
{
	__HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_4, 0);
}

/*
 * 函数名：disp_Init
 * 描述  ：开机显示初始化
 * 输入  ：无
 * 返回  : 无
 */
void disp_Init(void)
{
	uint8_t i;
	Beep_On(30);
	for(i=0;i<16;i++)
	{
		g_Disp_Buf[i] = 0xFF;
	}
	sm1616_Display(g_Disp_Buf);
	HAL_Delay(500);
	for(i=0;i<16;i++)
	{
		g_Disp_Buf[i] = 0;
	}
	sm1616_Display(g_Disp_Buf);
	
}

/*
 * 函数名：key_Scan
 * 描述  ：按键扫描
 * 输入  ：无
 * 返回  : 无
 */
void key_Scan(void)
{
		static uint16_t s_apt8l16_1_val_pre;
		static uint16_t s_apt8l16_2_val_pre;
		static uint16_t s_apt8l16_3_val_pre;
		FlagStatus key_update_flag = RESET;
		
		g_APT8L16_1_Val = APT8L16_1_key_Scan();
		if(s_apt8l16_1_val_pre != g_APT8L16_1_Val)
		{
				s_apt8l16_1_val_pre = g_APT8L16_1_Val;
				key_update_flag = SET;

		}
		
		g_APT8L16_2_Val = APT8L16_2_key_Scan();
		if(s_apt8l16_2_val_pre != g_APT8L16_2_Val)
		{
				s_apt8l16_2_val_pre = g_APT8L16_2_Val;
				key_update_flag = SET;

		}
		
		g_APT8L16_3_Val = APT8L16_3_key_Scan();
		if(s_apt8l16_3_val_pre != g_APT8L16_3_Val)
		{
				s_apt8l16_3_val_pre = g_APT8L16_3_Val;
				key_update_flag = SET;

		}
		
		if( (g_APT8L16_1_Val|g_APT8L16_2_Val|g_APT8L16_3_Val) && (key_update_flag == SET) )//键值更新判断
		{
				buzzer_CtrlState = ENABLE;
				g_ButtonTime_Cnt = 0;
				g_Button_UpdateFlag = SET;
		}
		
}

/*
 * 函数名：beep_Button
 * 描述  ：按键音时长控制
 * 输入  ：ms
 * 返回  : 无
 */
void beep_Button(uint8_t ms)
{
	if(buzzer_CtrlState == ENABLE)
	{
		Beep_On(ms);
		buzzer_CtrlState = DISABLE;
	}
}

/*
 * 函数名：set_gear_active
 * 描述  ：设置要激活的档位
 * 输入  ：档位&时间的结构体指针
 * 返回  : 无
 */
void set_gear_active(pGear_Time_def pt)
{
		pGear_Time_def pbuf[4] = {&g_Zone1_GT,&g_Zone2_GT,&g_Zone3_GT,&g_Zone4_GT};
		uint8_t i;
		
		++(pt->GrearActive);
		if((pt->GrearActive) >= 2)
		{
				pt->GrearActive = 2;
		}
		for(i=0;i<4;i++)
		{
				if(pt == pbuf[i])
				{
						continue;
				}
				pbuf[i]->GrearActive = 0;
		}
}

void zone1_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone1_GT);
		beep_Button(BUTTON_GEAR_BZ_TIME);
		if(zoneLeftState == ENABLE)
		{
//				g_CurrentZone = &g_ZoneLeft_GT;
				g_CurrentZone = &g_ZoneLeft_GT;
		}
		else
		{
//				g_CurrentZone = &g_Zone1_GT;
				g_CurrentZone = &g_Zone1_GT;
		}
}

void zone2_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone2_GT);
		beep_Button(BUTTON_GEAR_BZ_TIME);
		if(zoneLeftState == ENABLE)
		{
//				g_CurrentZone = &g_ZoneLeft_GT;
				g_CurrentZone = &g_ZoneLeft_GT;
		}
		else
		{
//				g_CurrentZone = &g_Zone2_GT;
				g_CurrentZone = &g_Zone2_GT;
		}
}

void zone3_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone3_GT);
		beep_Button(BUTTON_GEAR_BZ_TIME);
		if(zoneRightState == ENABLE)
		{
//				g_CurrentZone = &g_ZoneRight_GT;
				g_CurrentZone = &g_ZoneRight_GT;
		}
		else
		{
//				g_CurrentZone = &g_Zone3_GT;
				g_CurrentZone = &g_Zone3_GT;
		}
}

void zone4_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone4_GT);
		beep_Button(BUTTON_GEAR_BZ_TIME);
		if(zoneRightState == ENABLE)
		{
//				g_CurrentZone = &g_ZoneRight_GT;
				g_CurrentZone = &g_ZoneRight_GT;
		}
		else
		{
//				g_CurrentZone = &g_Zone4_GT;
				g_CurrentZone = &g_Zone4_GT;
		}
}


/*
 * 函数名：Zone1_Vir_butt_Decode
 * 描述  ：1#虚拟按键解码
 * 输入  ：无
 * 返回  : 1#档位值
 */
/********** 1#虚拟按键解码 ************/
uint8_t Zone1_Vir_butt_Decode(void)
{
	static uint8_t s_ret = 0;
	switch(g_APT8L16_1_Val)
	{
		case 0x0004:
			s_ret = 0; 
			zone1_msg_init();
			break;
		case 0x000C:
			s_ret = 1; 
			zone1_msg_init();
			break;
		case 0x0008:
			s_ret = 2; 
			zone1_msg_init();
			break;
		case 0x0018:
			s_ret = 3; 
			zone1_msg_init();
			break;
		case 0x0010:
			s_ret = 4; 
			zone1_msg_init();
		break;
		case 0x0050:
			s_ret = 5; 
			zone1_msg_init();
			break;
		case 0x0040:
			s_ret = 6; 
			zone1_msg_init();
			break;
		case 0x00C0:
			s_ret = 7; 
			zone1_msg_init();
			break;
		case 0x0080:
			s_ret = 8; 
			zone1_msg_init();
			break;
		case 0x0280:
			s_ret = 9; 
			zone1_msg_init();
			break;
		case 0x0200:
			s_ret = 10; 
			zone1_msg_init();
			break;
		case 0x1200:
			s_ret = 11; 
			zone1_msg_init();
			break;
		case 0x1000:
			s_ret = 12;
			zone1_msg_init();
			break;		
		case 0x1800:
			s_ret = 13;
			zone1_msg_init();
			break;
		case 0x0800:
			s_ret = 14; 
			zone1_msg_init();
			break;
		case 0x0900:
		case 0x0100:
			s_ret = 15; 
			zone1_msg_init();
			break;
		
	}
		return s_ret;

}

/*
 * 函数名：Zone2_Vir_butt_Decode
 * 描述  ：2#虚拟按键解码
 * 输入  ：无
 * 返回  : 2#档位值
 */
uint8_t Zone2_Vir_butt_Decode(void)
{
	static uint8_t s_ret = 0;

	if(g_APT8L16_1_Val == 0x2000)
	{
		s_ret = 0;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == 0x6000)
	{
		s_ret = 1;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == 0x4000)
	{
		s_ret = 2;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == 0xC000)
	{
		s_ret = 3;
		zone2_msg_init();
		return s_ret;
	}
	else if( (g_APT8L16_1_Val == 0x8000) && (g_APT8L16_2_Val == 0x0040) )
	{
		s_ret = 5;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == 0x8000)
	{
		s_ret = 4;
		zone2_msg_init();
		return s_ret;
	}
	
	switch(g_APT8L16_2_Val)
	{
		case 0x0040:			//s4
			s_ret = 6; 
			zone2_msg_init();
			break;
		case 0x0050:
			s_ret = 7; 
			zone2_msg_init();
			break;
		case 0x0010:			//s5
			s_ret = 8; 
			zone2_msg_init();
			break;
		case 0x0011:
			s_ret = 9; 
			zone2_msg_init();
			break;
		case 0x0001:			//s6
			s_ret = 10; 
			zone2_msg_init();
			break;
		case 0x0009:
			s_ret = 11; 
			zone2_msg_init(); 
			break;
		case 0x0008:			//s7
			s_ret = 12; 
			zone2_msg_init(); 
			break;
		case 0x0088:			
			s_ret = 13; 
			zone2_msg_init(); 
			break;
		case 0x0080:			//s8
			s_ret = 14; 
			zone2_msg_init();
			break;
		case 0x00A0:
		case 0x0020:			//s9
			s_ret = 15; 
			zone2_msg_init(); 
			break;
		
	}
	return s_ret;
}

/*
 * 函数名：Zone3_Vir_butt_Decode
 * 描述  ：3#虚拟按键解码
 * 输入  ：无
 * 返回  : 3#档位值
 */
uint8_t Zone3_Vir_butt_Decode(void)
{
	static uint8_t s_ret = 0;

	if(g_APT8L16_2_Val == 0x2000)
	{
		s_ret = 0;
		zone3_msg_init(); 
		return s_ret;
	}
	else if(g_APT8L16_2_Val == 0x2200)
	{
		s_ret = 1;
		zone3_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_2_Val == 0x0200)
	{
		s_ret = 2;
		zone3_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_2_Val == 0x0300)
	{
		s_ret = 3;
		zone3_msg_init();
		return s_ret;
	}
	else if( (g_APT8L16_2_Val == 0x0100) && (g_APT8L16_3_Val == 0x0040) )
	{
		s_ret = 5;
		zone3_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_2_Val == 0x0100)
	{
		s_ret = 4;
		zone3_msg_init();
		return s_ret;
	}
	
	switch(g_APT8L16_3_Val)
	{
		case 0x0040:			//s4
			s_ret = 6; 
			zone3_msg_init();
			break;
		case 0x0060:
			s_ret = 7; 
			zone3_msg_init();
			break;
		case 0x0020:			//s5
			s_ret = 8; 
			zone3_msg_init(); 
			break;
		case 0x0030:
			s_ret = 9; 
			zone3_msg_init();
			break;
		case 0x0010:			//s6
			s_ret = 10; 
			zone3_msg_init();
			break;
		case 0x0018:
			s_ret = 11; 
			zone3_msg_init();
			break;
		case 0x0008:			//s7
			s_ret = 12; 
			zone3_msg_init();
			break;
		case 0x000A:			
			s_ret = 13; 
			zone3_msg_init();
			break;
		case 0x0002:			//s8
			s_ret = 14; 
			zone3_msg_init();
			break;
		case 0x0006:
		case 0x0004:			//s9
			s_ret = 15; 
			zone3_msg_init();
			break;
		
	}
	return s_ret;
}

/*
 * 函数名：Zone4_Vir_butt_Decode
 * 描述  ：4#虚拟按键解码
 * 输入  ：无
 * 返回  : 4#档位值
 */
uint8_t Zone4_Vir_butt_Decode(void)
{
	static uint8_t s_ret = 0;
	switch(g_APT8L16_3_Val)
	{
		case 0x0080:
			s_ret = 0; 
			zone4_msg_init();
			break;
		case 0x0180:
			s_ret = 1; 
			zone4_msg_init();
			break;
		case 0x0100:
			s_ret = 2; 
			zone4_msg_init();
			break;
		case 0x0300:
			s_ret = 3; 
			zone4_msg_init();
			break;
		case 0x0200:
			s_ret = 4; 
			zone4_msg_init();
			break;
		case 0x0600:
			s_ret = 5; 
			zone4_msg_init();
			break;
		case 0x0400:
			s_ret = 6; 
			zone4_msg_init();
			break;
		case 0x0C00:
			s_ret = 7; 
			zone4_msg_init();
			break;
		case 0x0800:
			s_ret = 8; 
			zone4_msg_init();
			break;
		case 0x1800:
			s_ret = 9; 
			zone4_msg_init();
			break;
		case 0x1000:
			s_ret = 10; 
			zone4_msg_init();
			break;
		case 0x3000:
			s_ret = 11; 
			zone4_msg_init();
			break;
		case 0x2000:
			s_ret = 12; 
			zone4_msg_init();
			break;
		case 0x6000:
			s_ret = 13; 
			zone4_msg_init();
			break;
		case 0x4000:
			s_ret = 14;	
			zone4_msg_init();
			break;
		case 0xC000:
		case 0x8000:
			s_ret = 15; 
			zone4_msg_init();
			break;
		
	}
	return s_ret;
}

/*
 * 函数名：gearButton_Decode
 * 描述  ：按键解码
 * 输入  ：无
 * 返回  : 按键值
 */
void gearButton_Decode(void)
{
		uint8_t dat1, dat2, dat3, dat4;
	
		dat1 = Zone1_Vir_butt_Decode();
		dat2 = Zone2_Vir_butt_Decode();
		dat3 = Zone3_Vir_butt_Decode();
		dat4 = Zone4_Vir_butt_Decode();
	
		if(g_Zone1_GT.GrearActive == GEAR_ACTIVE)			//档位按键被激活
		{
				if(zoneLeftState == DISABLE)
				{
						g_Zone1_GT.Gear = dat1;								//更新档位信息
				}
				else
				{
						g_ZoneLeft_GT.Gear = dat1;						//更新档位信息
				}
		}
		else if(g_Zone2_GT.GrearActive == GEAR_ACTIVE)//档位按键被激活
		{
				if(zoneLeftState == DISABLE)
				{
						g_Zone2_GT.Gear = dat2;								//更新档位信息
				}
				else
				{
						g_ZoneLeft_GT.Gear = dat2;						//更新档位信息
				}
		}
		else if(g_Zone3_GT.GrearActive == GEAR_ACTIVE)//档位按键被激活
		{
				if(zoneRightState == DISABLE)
				{
						g_Zone3_GT.Gear = dat3;								//更新档位信息
				}
				else
				{
						g_ZoneRight_GT.Gear = dat3;						//更新档位信息
				}
		}
		else if(g_Zone4_GT.GrearActive == GEAR_ACTIVE)//档位按键被激活
		{
				if(zoneRightState == DISABLE)
				{
						g_Zone3_GT.Gear = dat4;								//更新档位信息
				}
				else
				{
						g_ZoneRight_GT.Gear = dat4;						//更新档位信息
				}
		}
		
}

uint8_t othersButton_Decode(void)
{
		if(g_APT8L16_1_Val == WIFI_VALUE)
		{
			return key_WIFI;
		}
		else if(g_APT8L16_1_Val == CHFE_VALUE)
		{
			return key_CHFE;
		}
		else if(g_APT8L16_1_Val == FL_VALUE)
		{
			return key_FL;
		}
		else if(g_APT8L16_2_Val == DEC_VALUE)
		{
			return key_DEC;
		}
		else if(g_APT8L16_2_Val == INC_VALUE)
		{
			return key_INC;
		}
		else if(g_APT8L16_2_Val == BOOST_VALUE)
		{
			return key_BOOST;
		}
		else if(g_APT8L16_2_Val == ON_OFF_VALUE)
		{
			return key_ON_OFF;
		}
		else if(g_APT8L16_3_Val == LOCK_VALUE)
		{
			return key_LOCK;
		}
		else if(g_APT8L16_3_Val == FR_VALUE)
		{
			return key_FR;
		}
		else
			return 0;
}

/*
 * 函数名：send_Msg2MainBoard
 * 描述  ：给主板发送控制数据
 * 输入  ：主板的地址 addr
 * 返回  : 无
 */
void send_Msg2MainBoard(uint8_t addr)
{
	uint8_t i;
	uint8_t *ps = (uint8_t *)&(Board1_CtrlMsg);
	uint8_t *ptr = ps;
	
	Board1_CtrlMsg.Addr = addr;
	
//	Board1_CtrlMsg.set_state1 = FOpenMcu;
//	Board1_CtrlMsg.set_powerLever1 = 2100;
//	Board1_CtrlMsg.set_state2 = FOpenMcu;
//	Board1_CtrlMsg.set_powerLever2 = 1000;
	Board1_CtrlMsg.ChkSum = 0;
	for(i=0;i<7;i++)
	{
		Board1_CtrlMsg.ChkSum += *ptr++;
	}
	
	HAL_UART_Transmit(&huart4,  (uint8_t *)ps,8, 0xFFFF);
}

void timer_INC_Deal(pGear_Time_def pt)
{

		if( (g_SettingState == SETTING_GEAR)&&(pt->Timer.Minute == 0)&&(pt->Gear) )//设置定时器缺省值
		{
				beep_Button(BUTTON_GEAR_BZ_TIME);
				g_SettingState = SETTING_TIMER;
				pt->Timer.Minute = DEFAULT_TIMER;
				pt->Timer.Second = 60;
				return;
		}
	
		pt->Timer.Second = 60;
		
		if(pt->Gear)							//有档位才能设置定时
		{
				beep_Button(BUTTON_GEAR_BZ_TIME);
				if(longPressFlag == RESET)
				{
						if(++(pt->Timer.Minute) > 99)
						{
								pt->Timer.Minute = 0;
						}
				}
				else
				{
						pt->Timer.Minute += 10;
						if(pt->Timer.Minute >99)
						{
								pt->Timer.Minute = 0;
						}
				}
		}
		else
		{
				pt->Timer.Minute = 0;//没有档位不能定时
		}
}

void timer_DEC_Deal(pGear_Time_def pt)
{
		if( (g_SettingState == SETTING_GEAR)&&(pt->Timer.Minute == 0)&&(pt->Gear) )		//设置定时器缺省值
		{
				g_SettingState = SETTING_TIMER;
				pt->Timer.Minute = DEFAULT_TIMER;
				pt->Timer.Second = 60;
				return;
		}
	
		pt->Timer.Second = 60;
		
		if(pt->Gear)							//有档位才能设置定时
		{
				beep_Button(BUTTON_GEAR_BZ_TIME);
				if(longPressFlag == RESET)
				{
						if(--(pt->Timer.Minute) < 0)
						{
								pt->Timer.Minute = 99;
						}
				}
				else
				{
						pt->Timer.Minute -= 10;
						if(pt->Timer.Minute < 0)
						{
								pt->Timer.Minute = 99;
						}
				}
		}
		else
		{
				pt->Timer.Minute = 60;//没有档位不能定时
		}
}

void key_Process(void)
{
		static uint8_t FL_Button_Cnt = 0;
/*************** 按键扫描 ******************/
		key_Scan();
	
/*************** 按键解码 ******************/
		if(g_Button_UpdateFlag == SET)
		{
				gearButton_Decode();
//				g_Button_UpdateFlag = RESET;
		}
		g_Button_Val = othersButton_Decode();
	
/*********************** 加按键处理 **************************/	
		if((g_Button_Val == key_INC)&&(g_TimeOutCnt))
		{
				g_ButtonTime_Cnt++;        //100ms per once
				if(g_ButtonTime_Cnt >= LONG_PRESS_TIME)		//长按时间到
				{
						longPressFlag = SET;
						g_ButtonTime_Cnt = LONG_PRESS_TIME - LONG_PRESS_INTERVAL;  //间隔 LONG_PRESS_INTTERVAL * 100ms 产生一次长按键信号
				}
				
				if( (g_ButtonTime_Cnt == 1)||(longPressFlag == SET) )
				{
						g_TimeOutCnt = BUTTON_TIMEOUT;
						g_ShortFlash_Cnt = SHORT_FLASH_TIME;
						if(g_CurrentZone == &g_Zone1_GT)
						{
								timer_INC_Deal(&g_Zone1_GT);
						}
						else if(g_CurrentZone == &g_Zone2_GT)
						{
							timer_INC_Deal(&g_Zone2_GT);
						}
						else if(g_CurrentZone == &g_Zone3_GT)
						{
								timer_INC_Deal(&g_Zone3_GT);
						}
						else if(g_CurrentZone == &g_Zone4_GT)
						{
								timer_INC_Deal(&g_Zone4_GT);
						}
						else if(g_CurrentZone == &g_ZoneLeft_GT)
						{
								timer_INC_Deal(&g_ZoneLeft_GT);
						}
						else if(g_CurrentZone == &g_ZoneRight_GT)
						{
								timer_INC_Deal(&g_ZoneRight_GT);
						}
						longPressFlag = RESET;
			}
		}
		
/*************** 减按键处理 **********************/
		if((g_Button_Val == key_DEC)&&(g_TimeOutCnt))
		{
				g_ButtonTime_Cnt++;        //100ms per once
				if(g_ButtonTime_Cnt >= LONG_PRESS_TIME)		//长按时间到
				{
						longPressFlag = SET;
						g_ButtonTime_Cnt = LONG_PRESS_TIME - LONG_PRESS_INTERVAL;  //间隔 LONG_PRESS_INTTERVAL * 100ms 产生一次长按键信号
				}
				
				if( (g_ButtonTime_Cnt == 1)||(longPressFlag == SET) )
				{
						beep_Button(BUTTON_GEAR_BZ_TIME);
						g_TimeOutCnt = BUTTON_TIMEOUT;
						g_ShortFlash_Cnt = 10;
						if(g_CurrentZone == &g_Zone1_GT)
						{
								timer_DEC_Deal(&g_Zone1_GT);
						}
						else if(g_CurrentZone == &g_Zone2_GT)
						{
								timer_DEC_Deal(&g_Zone2_GT);
						}
						else if(g_CurrentZone == &g_Zone3_GT)
						{
								timer_DEC_Deal(&g_Zone3_GT);
						}
						else if(g_CurrentZone == &g_Zone4_GT)
						{
								timer_DEC_Deal(&g_Zone1_GT);
						}
						else if(g_CurrentZone == &g_ZoneLeft_GT)
						{
								timer_DEC_Deal(&g_ZoneLeft_GT);
						}
						else if(g_CurrentZone == &g_ZoneRight_GT)
						{
								timer_DEC_Deal(&g_ZoneRight_GT);
						}
						longPressFlag = RESET;
				}
		}
		
/*************** 左无区按键处理 **********************/
		if((g_Button_Val == key_FL)&&(g_TimeOutCnt)&&(g_Button_UpdateFlag == SET))
		{
				beep_Button(BUTTON_GEAR_BZ_TIME);
				FL_Button_Cnt++;
				if(FL_Button_Cnt % 2)
				{
						zoneLeftState = ENABLE;
						memset(&g_Zone1_GT,0,sizeof(g_Zone1_GT));
						memset(&g_Zone2_GT,0,sizeof(g_Zone2_GT));
				}
				else
				{
						zoneLeftState = DISABLE;
						memset(&g_ZoneLeft_GT,0,sizeof(g_ZoneLeft_GT));
				}
			
		}

/*************** 右无区按键处理 **********************/
		if((g_Button_Val == key_FR)&&(g_TimeOutCnt))
		{
				beep_Button(BUTTON_GEAR_BZ_TIME);
				FL_Button_Cnt++;
				
				g_SettingState = SETTING_RIGHT_ZONE;
		}
		
		g_Button_Val = 0;
		g_Button_UpdateFlag = RESET;
}

/************** 定时器标志显示 *******************/
void isTimerAvailableDisplay(pGear_Time_def t, uint8_t dis_Idx)
{
		if(t->Timer.Minute)											//有定时
		{
				g_Disp_Buf[dis_Idx] |= SEG_DOT;			//档位右下方显示 dot
		}
		else
		{
				g_Disp_Buf[dis_Idx] &= ~SEG_DOT;		//档位右下方不显示 dot
		}	
}

void zone_GearDisplayDeal(pGear_Time_def cur_zone, uint8_t tube_ten, uint8_t tube_single)
{
		if( (g_CurrentZone == cur_zone)&&(g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_GEAR) )
		{
				g_Disp_Buf[tube_ten] = BLK_;
				g_Disp_Buf[tube_single] = BLK_;
		}
		else
		{
				g_Disp_Buf[tube_ten] = disp_table[cur_zone->Gear/10];
				g_Disp_Buf[tube_single] = disp_table[cur_zone->Gear%10];
				isTimerAvailableDisplay(cur_zone,tube_single);
		}
}

/******************** 档位显示 **********************/
void gearDisplay(void)
{
	
		zone_GearDisplayDeal(&g_Zone1_GT,TUBE1,TUBE2);
		zone_GearDisplayDeal(&g_Zone2_GT,TUBE5,TUBE6);
		zone_GearDisplayDeal(&g_Zone3_GT,TUBE9,TUBE10);
		zone_GearDisplayDeal(&g_Zone4_GT,TUBE13,TUBE14);
//		zone_GearDisplayDeal(&g_ZoneLeft_GT,TUBE3,TUBE4);
//		zone_GearDisplayDeal(&g_ZoneRight_GT,TUBE11,TUBE12);
	
	/*
		if( (g_CurrentZone == &g_Zone1_GT)&&(g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_GEAR) )
		{
				g_Disp_Buf[TUBE1] = BLK_;
				g_Disp_Buf[TUBE2] = BLK_;
		}
		else
		{
				g_Disp_Buf[TUBE1] = disp_table[g_Zone1_GT.Gear/10];
				g_Disp_Buf[TUBE2] = disp_table[g_Zone1_GT.Gear%10];
				isTimerAvailableDisplay(&g_Zone1_GT,TUBE2);
		}
	
		if( (g_CurrentZone == &g_Zone2_GT)&&(g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_GEAR) )
		{
				g_Disp_Buf[TUBE5] = BLK_;
				g_Disp_Buf[TUBE6] = BLK_;
		}
		else
		{
				g_Disp_Buf[TUBE5] = disp_table[g_Zone2_GT.Gear/10];
				g_Disp_Buf[TUBE6] = disp_table[g_Zone2_GT.Gear%10];
				isTimerAvailableDisplay(&g_Zone2_GT,TUBE6);
		}

		if( (g_CurrentZone == &g_Zone3_GT)&&(g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_GEAR) )
		{
				g_Disp_Buf[TUBE9] = BLK_;
				g_Disp_Buf[TUBE10] = BLK_;
		}
		else
		{
				g_Disp_Buf[TUBE9] = disp_table[g_Zone3_GT.Gear/10];
				g_Disp_Buf[TUBE10] = disp_table[g_Zone3_GT.Gear%10];
				isTimerAvailableDisplay(&g_Zone3_GT,TUBE10);
		}
		
		if( (g_CurrentZone == &g_Zone4_GT)&&(g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_GEAR) )
		{
				g_Disp_Buf[TUBE13] = BLK_;
				g_Disp_Buf[TUBE14] = BLK_;
		}
		else
		{
				g_Disp_Buf[TUBE13] = disp_table[g_Zone4_GT.Gear/10];
				g_Disp_Buf[TUBE14] = disp_table[g_Zone4_GT.Gear%10];
				isTimerAvailableDisplay(&g_Zone4_GT,TUBE14);
		}
		
		if( (g_CurrentZone == &g_ZoneLeft_GT)&&(g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_GEAR) )
		{
				g_Disp_Buf[TUBE3] = BLK_;
				g_Disp_Buf[TUBE4] = BLK_;
		}
		else
		{
				g_Disp_Buf[TUBE3] = disp_table[g_ZoneLeft_GT.Gear/10];
				g_Disp_Buf[TUBE4] = disp_table[g_ZoneLeft_GT.Gear%10];
				isTimerAvailableDisplay(&g_ZoneLeft_GT,TUBE4);
		}
		*/
}

/**************** 最小定时器标志显示 ***********************/
void min_TimerDisplay(void)
{
		pGear_Time_def min_ZoneTimer = NULL;
		min_ZoneTimer = get_Min_Timer(&g_Zone1_GT,&g_Zone2_GT,&g_Zone3_GT,&g_Zone4_GT,&g_ZoneLeft_GT,&g_ZoneRight_GT);
		if(min_ZoneTimer != NULL)
		{
				if(min_ZoneTimer == &g_Zone1_GT)
				{
							g_CurrentZone = &g_Zone1_GT;
							if(g_GeneralFlashFlag == SET)
							{
									g_Disp_Buf[TUBE2] &= ~SEG_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE2] |= SEG_DOT;
							}
				}
				else if(min_ZoneTimer == &g_Zone2_GT)
				{
							g_CurrentZone = &g_Zone2_GT;
							if(g_GeneralFlashFlag == SET)
							{
									g_Disp_Buf[TUBE6] &= ~SEG_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE6] |= SEG_DOT;
							}
				}
				else if(min_ZoneTimer == &g_Zone3_GT)
				{
							g_CurrentZone = &g_Zone3_GT;
							if(g_GeneralFlashFlag == SET)
							{
									g_Disp_Buf[TUBE10] &= ~SEG_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE10] |= SEG_DOT;
							}
				}
				else if(min_ZoneTimer == &g_Zone4_GT)
				{
							g_CurrentZone = &g_Zone4_GT;
							if(g_GeneralFlashFlag == SET)
							{
									g_Disp_Buf[TUBE14] &= ~SEG_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE14] |= SEG_DOT;
							}
				}
				else if(min_ZoneTimer == &g_ZoneLeft_GT)
				{
							g_CurrentZone = &g_ZoneLeft_GT;
							if(g_GeneralFlashFlag == SET)
							{
									g_Disp_Buf[TUBE4] &= ~SEG_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE4] |= SEG_DOT;
							}
				}
				else if(min_ZoneTimer == &g_ZoneRight_GT)
				{
							g_CurrentZone = &g_ZoneRight_GT;
							if(g_GeneralFlashFlag == SET)
							{
									g_Disp_Buf[TUBE12] &= ~SEG_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE12] |= SEG_DOT;
							}
				}
		}
}
void display(void)
{
		if(Ms10_bz5 == SET)
		{

				gearDisplay();
				
		if(g_ShortFlash_Cnt == 0)									//闪烁结束
		{		
				min_TimerDisplay();
				if(g_Zone1_GT.Gear == 0)
				{
						g_Disp_Buf[TUBE1] = SEG_G;
						g_Disp_Buf[TUBE2] = SEG_G;
				}
				if(g_Zone2_GT.Gear == 0)
				{
						g_Disp_Buf[TUBE5] = SEG_G;
						g_Disp_Buf[TUBE6] = SEG_G;
				}
				if(g_Zone3_GT.Gear == 0)
				{
						g_Disp_Buf[TUBE9] = SEG_G;
						g_Disp_Buf[TUBE10] = SEG_G;
				}
				if(g_Zone4_GT.Gear == 0)
				{
						g_Disp_Buf[TUBE13] = SEG_G;
						g_Disp_Buf[TUBE14] = SEG_G;
				}				
		}
		
/****************** 定时器显示控制 ***********************/
		if( (g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_TIMER) )
		{
				g_Disp_Buf[TUBE7] = BLK_;
				g_Disp_Buf[TUBE8] = BLK_;
		}
		else
		{
				if(g_CurrentZone == &g_Zone1_GT)
				{
						g_Disp_Buf[TUBE7] = disp_table[g_Zone1_GT.Timer.Minute/10];
						g_Disp_Buf[TUBE8] = disp_table[g_Zone1_GT.Timer.Minute%10];
						if( (g_Zone1_GT.Timer.Minute==0)&&(g_ShortFlash_Cnt==0) )
						{
								g_Disp_Buf[TUBE7] = SEG_G;
								g_Disp_Buf[TUBE8] = SEG_G;
						}
				}	
				else if(g_CurrentZone == &g_Zone2_GT)
				{
						g_Disp_Buf[TUBE7] = disp_table[g_Zone2_GT.Timer.Minute/10];
						g_Disp_Buf[TUBE8] = disp_table[g_Zone2_GT.Timer.Minute%10];
						if( (g_Zone2_GT.Timer.Minute==0)&&(g_ShortFlash_Cnt==0) )
						{
								g_Disp_Buf[TUBE7] = SEG_G;
								g_Disp_Buf[TUBE8] = SEG_G;
						}
				}
				else if(g_CurrentZone == &g_Zone3_GT)
				{
						g_Disp_Buf[TUBE7] = disp_table[g_Zone3_GT.Timer.Minute/10];
						g_Disp_Buf[TUBE8] = disp_table[g_Zone3_GT.Timer.Minute%10];
						if( (g_Zone3_GT.Timer.Minute==0)&&(g_ShortFlash_Cnt==0) )
						{
								g_Disp_Buf[TUBE7] = SEG_G;
								g_Disp_Buf[TUBE8] = SEG_G;
						}
				}
				else if(g_CurrentZone == &g_Zone4_GT)
				{
						g_Disp_Buf[TUBE7] = disp_table[g_Zone4_GT.Timer.Minute/10];
						g_Disp_Buf[TUBE8] = disp_table[g_Zone4_GT.Timer.Minute%10];
						if( (g_Zone4_GT.Timer.Minute==0)&&(g_ShortFlash_Cnt==0) )
						{
								g_Disp_Buf[TUBE7] = SEG_G;
								g_Disp_Buf[TUBE8] = SEG_G;
						}
				}
		}
		
		sm1616_Display(g_Disp_Buf);
		Ms10_bz5 = RESET;
	}
	
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */
  

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM3_Init();
  MX_TIM6_Init();
  MX_USART1_UART_Init();
  MX_USART2_UART_Init();
  MX_USART3_UART_Init();
  MX_USART4_UART_Init();
  /* USER CODE BEGIN 2 */

	sm1616_Brightness_Ctrl();
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4);
	HAL_TIM_Base_Start_IT(&htim6);
//	HAL_TIM_Base_Start_IT(&htim3);
	__HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_4, 0);
	
	
	APT8L16_1_Init(KEY_ALL_ENABLE, (uint8_t)(~K12), APT8L16_1_KOR_CONFIG);
	
	APT8L16_2_Init((KEY_ALL_ENABLE & (uint8_t)(~(K01 & K02))), KEY_ALL_ENABLE, APT8L16_2_KOR_CONFIG);
	
	APT8L16_3_Init(KEY_ALL_ENABLE, KEY_ALL_ENABLE, APT8L16_3_KOR_CONFIG);
	
	SM1616_I2c_Init();
	sm1616_Brightness_Ctrl();

	disp_Init();
	
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
//		user_pwm_setvalue(2000);
		if(Ms10_bz1 == SET)
		{
				
				key_Process();
				Ms10_bz1 = RESET;
		}
		display();
//		if(g_CurrentZone)
//		{
//			g_TimeOutCnt = 3;
//		}
		
		if(Ms10_bz8 == SET)
		{
			send_Msg2MainBoard(0xA0);
			Ms10_bz8 = RESET;
		}
		
		if(secFlag == SET)
		{
			if(--g_Zone1_GT.Timer.Second <= 0)
			{
				if(--g_Zone1_GT.Timer.Minute < 0)
				{
					g_Zone1_GT.Timer.Minute =0;
				}
				g_Zone1_GT.Timer.Second = 60;
			}
			if(--g_Zone2_GT.Timer.Second <= 0)
			{
				if(--g_Zone2_GT.Timer.Minute < 0)
				{
					g_Zone2_GT.Timer.Minute =0;
				}
				g_Zone2_GT.Timer.Second = 60;
			}
			if(--g_Zone3_GT.Timer.Second <= 0)
			{
				if(--g_Zone3_GT.Timer.Minute < 0)
				{
					g_Zone3_GT.Timer.Minute =0;
				}
				g_Zone3_GT.Timer.Second = 60;
			}
			if(--g_Zone4_GT.Timer.Second <= 0)
			{
				if(--g_Zone4_GT.Timer.Minute < 0)
				{
					g_Zone4_GT.Timer.Minute =0;
				}
				g_Zone4_GT.Timer.Second = 60;
			}
			
			secFlag	= RESET;
		}
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage 
  */
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSIDiv = RCC_HSI_DIV1;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = RCC_PLLM_DIV1;
  RCC_OscInitStruct.PLL.PLLN = 8;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the peripherals clocks 
  */
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_USART2;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK1;
  PeriphClkInit.Usart2ClockSelection = RCC_USART2CLKSOURCE_PCLK1;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/**

  * @brief  Period elapsed callback in non blocking mode

  * @param  htim: TIM handle

  * @retval None

  */

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	static uint8_t s_Timer6_Cnt = 0;
	static uint8_t s_Ms100_Cnt = 0;
	static uint8_t s_FlashMS_Cnt = 0;
//	static uint8_t s_Min_Cnt = 0;
	
	if (htim->Instance == htim6.Instance)
	{
		s_Timer6_Cnt++;									//10ms计数
		switch (s_Timer6_Cnt)
		{
			case 1 :  Ms10_bz1 = SET; break;
			case 2 :  Ms10_bz2 = SET; break;
			case 3 :  Ms10_bz3 = SET; break;
			case 4 :  Ms10_bz4 = SET; break;
			case 5 :  Ms10_bz5 = SET; break;
			case 6 :  Ms10_bz6 = SET; break;
			case 7 :  Ms10_bz7 = SET; break;
			case 8 :  Ms10_bz8 = SET; break;
			case 9 :  Ms10_bz9 = SET; break;
			case 10: 															//100ms
				Ms10_bz10 = SET;

				if(++g_GeneralFlash_Cnt == 5)				//500ms
				{
						g_GeneralFlash_Cnt = 0;
						g_GeneralFlashFlag = !g_GeneralFlashFlag;
				}
			
				if(++s_FlashMS_Cnt == 5)							//500ms
				{
						if(g_ShortFlash_Cnt-- == 0)
						{
								g_ShortFlash_Cnt = 0;
								g_Zone1_GT.GrearActive = 0;
								g_Zone2_GT.GrearActive = 0;
								g_Zone3_GT.GrearActive = 0;
								g_Zone4_GT.GrearActive = 0;
						}
						s_FlashMS_Cnt = 0;
				}
				
				if(++s_Ms100_Cnt == 10)									//1s
				{
						secFlag = SET;
						if(g_TimeOutCnt-- == 0)
						{
								g_TimeOutCnt = 0;
						}

						s_Ms100_Cnt = 0;
				}
				s_Timer6_Cnt =0;
			break;
		}
		
		if(g_Beep_Cnt-- == 0)
		{
			Beep_Off();
			g_Beep_Cnt = 0;
		}
	}
	

}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
