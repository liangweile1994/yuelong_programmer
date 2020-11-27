#include "key.h"
#include "power_level_manage.h"
#include "tim.h"
#include "usart.h"
#include "apt8l16_12_dev.h"
#include "apt8l16_3_dev.h"
#include <string.h>
#include "display.h"



/* 功率方案设置状态 */
uint8_t           g_powerSchemeState = SETTING_POWER_SCHEME_FINISH;

/* zone超时计数器 */
uint8_t           timeZoneCnt;
/* 按键长按标志 */
uint8_t           g_LongPressFlag = RESET;

/* 蜂鸣器控制状态（使能控制） */
FunctionalState 	g_Buzzer_CtrlState = DISABLE;
/* 左无区状态 */
FunctionalState 	zoneLeft_State = DISABLE;
/* 右无区状态 */
FunctionalState 	zoneRight_State = DISABLE;
/* 童锁状态 */
FunctionalState 	lock_State = DISABLE;
/* 暂停状态 */
FunctionalState 	g_Pause_State = DISABLE;
/* 按键长按复用功能状态 */
FunctionalState   longPressMultiplexing = DISABLE;
/* 档位错误标志 */
FlagStatus			g_GearError_Flag = RESET;
/* 开机标志 */
uint8_t	g_TurnOnFlag = POWER_OFF;
/* 按键长按时间计数器 */
uint8_t g_ButtonTime_Cnt;

uint16_t g_APT8L16_1_Val;
uint16_t g_APT8L16_2_Val;
uint16_t g_APT8L16_3_Val;

uint8_t g_Button_Val;
uint8_t g_SettingState;

FlagStatus g_Button_UpdateFlag = RESET;

Gear_Time_CON g_Zone1_GT, g_Zone2_GT, g_Zone3_GT, g_Zone4_GT;
Gear_Time_CON g_ZoneLeft_GT, g_ZoneRight_GT;

pGear_Time_CON g_CurrentZone = NULL;

/************************************  0,  1,   2,   3,   4,   5,   6,   7,   8,   9, *********/
uint16_t const g_Default_Timer[10]  = {0, 480, 480, 480, 240, 240, 240, 120, 120, 120};  //minitue

MB_CON_PARM g_Board1_Con_Parm, g_Board2_Con_Parm;

/* 外部变量 */
extern uint8_t g_Err_BeepTimes;

/*
 * 函数名：Beep_On
 * 描述  ：开启蜂鸣器
 * 输入  ：cnt (一个单位为10ms）
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
 * 函数名：copyGear
 * 描述  ：拷贝档位
 * 输入  ：无
 * 输出  ：无

 * 返回  ：无
 */
static void copyGear(void)
{
		g_Zone1_GT.RealGear = g_Zone1_GT.Gear;
		g_Zone2_GT.RealGear = g_Zone2_GT.Gear;
		g_Zone3_GT.RealGear = g_Zone3_GT.Gear;
		g_Zone4_GT.RealGear = g_Zone4_GT.Gear;
		g_ZoneLeft_GT.RealGear = g_ZoneLeft_GT.Gear;
		g_ZoneRight_GT.RealGear = g_ZoneRight_GT.Gear;
}

/* 定义按键软件滤波等级（每增加1级按键反应延时10ms） */
#define KEY_FILTER_LEVEL 1

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
				g_Buzzer_CtrlState = ENABLE;
				g_ButtonTime_Cnt = 0;
				g_Button_UpdateFlag = SET;
		}
		
}

/*
 * 函数名：beep_Button
 * 描述  ：按键音时长控制
 * 输入  ：时长，最大255ms
 * 返回  : 无
 */
void beep_Button(uint8_t ms)
{
	if(g_Buzzer_CtrlState == ENABLE)
	{
		Beep_On(ms);
		g_Buzzer_CtrlState = DISABLE;
	}
}

/*
 * 函数名：set_gear_active
 * 描述  ：设置要激活的档位
 * 输入  ：档位&时间控制器的结构体指针
 * 返回  : 无
 */
void set_gear_active(pGear_Time_CON pt)
{
		pGear_Time_CON pbuf[4] = {&g_Zone1_GT,&g_Zone2_GT,&g_Zone3_GT,&g_Zone4_GT};
		uint8_t i;
		
		if(++(pt->GrearActive) == 1)
		{
				beep_Button(BUTTON_GEAR_BZ_TIME);;
		}
		else if((pt->GrearActive) >= 2)
		{
				pt->GrearActive = 2;
		}
		
		for(i=0;i<4;i++)//只需激活1#，2#，3#，4#，无区的档位依据zoneLeft_State,zoneRight_State的状态传入
		{
				if(pt == pbuf[i])
				{
						continue;
				}
				pbuf[i]->GrearActive = 0;
		}
}

/*
 * 函数名：zone1_msg_init
 * 描述  ：1#档位信息设置
 * 输入  ：无
 * 返回  : 无
 */
void zone1_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone1_GT);
		if(zoneLeft_State == ENABLE)
		{
//				set_gear_active(&g_ZoneLeft_GT);
				g_CurrentZone = &g_ZoneLeft_GT;
		}
		else
		{
//				set_gear_active(&g_Zone1_GT);
				g_CurrentZone = &g_Zone1_GT;
		}
}

/*
 * 函数名：zone2_msg_init
 * 描述  ：2#档位信息设置
 * 输入  ：无
 * 返回  : 无
 */
void zone2_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone2_GT);
		if(zoneLeft_State == ENABLE)
		{
//				set_gear_active(&g_ZoneLeft_GT);
				g_CurrentZone = &g_ZoneLeft_GT;
		}
		else
		{
//				set_gear_active(&g_Zone2_GT);
				g_CurrentZone = &g_Zone2_GT;
		}
}

/*
 * 函数名：zone3_msg_init
 * 描述  ：3#档位信息设置
 * 输入  ：无
 * 返回  : 无
 */
void zone3_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone3_GT);
		if(zoneRight_State == ENABLE)
		{
//				set_gear_active(&g_ZoneRight_GT);
				g_CurrentZone = &g_ZoneRight_GT;
		}
		else
		{
//				set_gear_active(&g_Zone3_GT);
				g_CurrentZone = &g_Zone3_GT;
		}
}

/*
 * 函数名：zone4_msg_init
 * 描述  ：4#档位信息设置
 * 输入  ：无
 * 返回  : 无
 */
void zone4_msg_init(void)
{
		g_SettingState = SETTING_GEAR;
		g_TimeOutCnt = BUTTON_TIMEOUT;
		g_ShortFlash_Cnt = SHORT_FLASH_TIME;
		set_gear_active(&g_Zone4_GT);
		if(zoneRight_State == ENABLE)
		{
//				set_gear_active(&g_ZoneRight_GT);
				g_CurrentZone = &g_ZoneRight_GT;
		}
		else
		{
//				set_gear_active(&g_Zone4_GT);
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
		case Z1_S0:
			s_ret = 0; 
			longPressMultiplexing = ENABLE;
			zone1_msg_init();
			break;
		case Z1_S1:
			s_ret = 1; 
			zone1_msg_init();
			break;
		case Z1_S2:
			s_ret = 2; 
			zone1_msg_init();
			break;
		case Z1_S3:
			s_ret = 3; 
			zone1_msg_init();
			break;
		case Z1_S4:
			s_ret = 4; 
			zone1_msg_init();
		break;
		case Z1_S5:
			s_ret = 5; 
			zone1_msg_init();
			break;
		case Z1_S6:
			s_ret = 6; 
			zone1_msg_init();
			break;
		case Z1_S7:
			s_ret = 7; 
			zone1_msg_init();
			break;
		case Z1_S8:
			s_ret = 8; 
			zone1_msg_init();
			break;
		case Z1_S9:
			s_ret = 9; 
			zone1_msg_init();
			break;
		case Z1_S10:
			s_ret = 10; 
			zone1_msg_init();
			break;
		case Z1_S11:
			s_ret = 11; 
			zone1_msg_init();
			break;
		case Z1_S12:
			s_ret = 12;
			zone1_msg_init();
			break;		
		case Z1_S13:
			s_ret = 13;
			zone1_msg_init();
			break;
		case Z1_S14:
			s_ret = 14; 
			zone1_msg_init();
			break;
		case Z1_S15:
			s_ret = 15; 
			zone1_msg_init();
			break;	
		case Z1_BOOST:
			s_ret = 16; 
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

	if(g_APT8L16_1_Val == Z2_S0)
	{
		s_ret = 0;
		longPressMultiplexing = ENABLE;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == Z2_S1)
	{
		s_ret = 1;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == Z2_S2)
	{
		s_ret = 2;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == Z2_S3)
	{
		s_ret = 3;
		zone2_msg_init();
		return s_ret;
	}
	else if( (g_APT8L16_1_Val == VALUE_2S3) && (g_APT8L16_2_Val == VALUE_2S4) )
	{
		s_ret = 5;
		zone2_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_1_Val == Z2_S4)
	{
		s_ret = 4;
		zone2_msg_init();
		return s_ret;
	}
	
	switch(g_APT8L16_2_Val)
	{
		case Z2_S6:			//s4
			s_ret = 6; 
			zone2_msg_init();
			break;
		case Z2_S7:
			s_ret = 7; 
			zone2_msg_init();
			break;
		case Z2_S8:			//s5
			s_ret = 8; 
			zone2_msg_init();
			break;
		case Z2_S9:
			s_ret = 9; 
			zone2_msg_init();
			break;
		case Z2_S10:			//s6
			s_ret = 10; 
			zone2_msg_init();
			break;
		case Z2_S11:
			s_ret = 11; 
			zone2_msg_init(); 
			break;
		case Z2_S12:			//s7
			s_ret = 12; 
			zone2_msg_init(); 
			break;
		case Z2_S13:			
			s_ret = 13; 
			zone2_msg_init(); 
			break;
		case Z2_S14:			//s8
			s_ret = 14; 
			zone2_msg_init();
			break;
		case Z2_S15:
			s_ret = 15; 
			zone2_msg_init();
			break;
		case Z2_BOOST:			//s9
			s_ret = 16; 
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

	if(g_APT8L16_2_Val == Z3_S0)
	{
		s_ret = 0;
		longPressMultiplexing = ENABLE;
		zone3_msg_init(); 
		return s_ret;
	}
	else if(g_APT8L16_2_Val == Z3_S1)
	{
		s_ret = 1;
		zone3_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_2_Val == Z3_S2)
	{
		s_ret = 2;
		zone3_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_2_Val == Z3_S3)
	{
		s_ret = 3;
		zone3_msg_init();
		return s_ret;
	}
	else if( (g_APT8L16_2_Val == VALUE_3S3) && (g_APT8L16_3_Val == VALUE_3S4) )
	{
		s_ret = 5;
		zone3_msg_init();
		return s_ret;
	}
	else if(g_APT8L16_2_Val == Z3_S4)
	{
		s_ret = 4;
		zone3_msg_init();
		return s_ret;
	}
	
	switch(g_APT8L16_3_Val)
	{
		case Z3_S6:			//s4
			s_ret = 6; 
			zone3_msg_init();
			break;
		case Z3_S7:
			s_ret = 7; 
			zone3_msg_init();
			break;
		case Z3_S8:			//s5
			s_ret = 8; 
			zone3_msg_init(); 
			break;
		case Z3_S9:
			s_ret = 9; 
			zone3_msg_init();
			break;
		case Z3_S10:			//s6
			s_ret = 10; 
			zone3_msg_init();
			break;
		case Z3_S11:
			s_ret = 11; 
			zone3_msg_init();
			break;
		case Z3_S12:			//s7
			s_ret = 12; 
			zone3_msg_init();
			break;
		case Z3_S13:			
			s_ret = 13; 
			zone3_msg_init();
			break;
		case Z3_S14:			//s8
			s_ret = 14; 
			zone3_msg_init();
			break;
		case Z3_S15:
			s_ret = 15; 
			zone3_msg_init();
			break;
		case Z3_BOOST:			//s9
			s_ret = 16; 
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
		case Z4_S0:
			s_ret = 0; 
			longPressMultiplexing = ENABLE;
			zone4_msg_init();
			break;
		case Z4_S1:
			s_ret = 1; 
			zone4_msg_init();
			break;
		case Z4_S2:
			s_ret = 2; 
			zone4_msg_init();
			break;
		case Z4_S3:
			s_ret = 3; 
			zone4_msg_init();
			break;
		case Z4_S4:
			s_ret = 4; 
			zone4_msg_init();
			break;
		case Z4_S5:
			s_ret = 5; 
			zone4_msg_init();
			break;
		case Z4_S6:
			s_ret = 6; 
			zone4_msg_init();
			break;
		case Z4_S7:
			s_ret = 7; 
			zone4_msg_init();
			break;
		case Z4_S8:
			s_ret = 8; 
			zone4_msg_init();
			break;
		case Z4_S9:
			s_ret = 9; 
			zone4_msg_init();
			break;
		case Z4_S10:
			s_ret = 10; 
			zone4_msg_init();
			break;
		case Z4_S11:
			s_ret = 11; 
			zone4_msg_init();
			break;
		case Z4_S12:
			s_ret = 12; 
			zone4_msg_init();
			break;
		case Z4_S13:
			s_ret = 13; 
			zone4_msg_init();
			break;
		case Z4_S14:
			s_ret = 14;	
			zone4_msg_init();
			break;
		case Z4_S15:
			s_ret = 15; 
			zone4_msg_init();
			break;
		case Z4_BOOST:
			s_ret = 16; 
			zone4_msg_init();
			break;
		
	}
	return s_ret;
}

static void gearErrorDeal(void)
{
		g_Err_BeepTimes = 3;
		g_GearError_Flag = SET;
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
				if(zoneLeft_State == DISABLE)
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat1))
						{
							if(TRUE == realTotalPowerCalculate(dat1))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone1_GT.Gear = dat1;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
				else
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat1))
						{
							if(TRUE == realTotalPowerCalculate(dat1))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_ZoneLeft_GT.Gear = dat1;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
		}
		else if(g_Zone2_GT.GrearActive == GEAR_ACTIVE)//档位按键被激活
		{
				if(zoneLeft_State == DISABLE)
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat2))
						{
							if(TRUE == realTotalPowerCalculate(dat2))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone2_GT.Gear = dat2;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
				else
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat2))
						{
							if(TRUE == realTotalPowerCalculate(dat2))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_ZoneLeft_GT.Gear = dat2;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
		}
		else if(g_Zone3_GT.GrearActive == GEAR_ACTIVE)//档位按键被激活
		{
				if(zoneRight_State == DISABLE)
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat3))
						{
							if(TRUE == realTotalPowerCalculate(dat3))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone3_GT.Gear = dat3;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
				else
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat3))
						{
							if(TRUE == realTotalPowerCalculate(dat3))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_ZoneRight_GT.Gear = dat3;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
		}
		else if(g_Zone4_GT.GrearActive == GEAR_ACTIVE)//档位按键被激活
		{
				if(zoneRight_State == DISABLE)
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat4))
						{
							if(TRUE == realTotalPowerCalculate(dat4))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone4_GT.Gear = dat4;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
				else
				{
						if(TRUE == singleBoardPowerLimitAlgorithm(dat4))
						{
							if(TRUE == realTotalPowerCalculate(dat4))
							{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_ZoneRight_GT.Gear = dat4;								//更新档位信息
							}
							else
							{
								gearErrorDeal();
							}
						}
						else
						{
							gearErrorDeal();
						}
				}
		}
		
		copyGear();
}

/*
 * 函数名：othersButton_Decode
 * 描述  ：档位以外的其他按键解码
 * 输入  ：无
 * 返回  : 按键值
 */
uint8_t othersButton_Decode(void)
{
		if(g_APT8L16_1_Val == VALUE_WIFI)
		{
			return key_WIFI;
		}
		else if(g_APT8L16_1_Val == VALUE_CHEF)
		{
			return key_CHFE;
		}
		else if(g_APT8L16_1_Val == VALUE_FL)
		{
			return key_FL;
		}
		else if(g_APT8L16_1_Val == VALUE_1S1)
		{
			return key_KW_1;
		}
		else if(g_APT8L16_1_Val == VALUE_2S1)
		{
			return key_KW_2;
		}
		else if(g_APT8L16_2_Val == VALUE_DEC)
		{
			return key_DEC;
		}
		else if(g_APT8L16_2_Val == VALUE_INC)
		{
			return key_INC;
		}
		else if(g_APT8L16_2_Val == VALUE_BOOST)
		{
			return key_BOOST;
		}
		else if(g_APT8L16_2_Val == VALUE_ON_OFF)
		{
			return key_ON_OFF;
		}
		else if(g_APT8L16_2_Val == VALUE_LOOK)
		{
			return key_LOCK;
		}
		else if(g_APT8L16_2_Val == VALUE_3S1)
		{
			return key_KW_3;
		}
		else if(g_APT8L16_2_Val == VAL_INC_PLUS_DEC)
		{
			return key_POWER_SET;
		}
		else if(g_APT8L16_3_Val == VALUE_FR)
		{
			return key_FR;
		}
		else if(g_APT8L16_3_Val == VALUE_4S1)
		{
			return key_KW_4;
		}
		
		
		else
			return 0;
}

/*
 * 函数名：timer_INC_Deal
 * 描述  ：增加定时器值处理
 * 输入  ：时间&档位控制器结构体指针
 * 返回  : 无
 */
void timer_INC_Deal(pGear_Time_CON pt)
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
				if(g_LongPressFlag == RESET)
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

		if(pt->Timer.Minute == 0)
		{
				pt->Timer.off_time = g_Default_Timer[pt->Gear];//设置关机时间为缺省值
		}
		else
		{
				pt->Timer.off_time = pt->Timer.Minute;
		}
		
}

/*
 * 函数名：timer_DEC_Deal
 * 描述  ：减小定时器值处理
 * 输入  ：时间&档位控制器结构体指针
 * 返回  : 无
 */
void timer_DEC_Deal(pGear_Time_CON pt)
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
				if(g_LongPressFlag == RESET)
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
		
		if(pt->Timer.Minute == 0)
		{
				pt->Timer.off_time = g_Default_Timer[pt->Gear];//设置关机时间为缺省值
		}
		else
		{
				pt->Timer.off_time = pt->Timer.Minute;				
		}
}

/*
 * 函数名：key_Process
 * 描述  ：按键的处理过程
 * 输入  ：时间&档位控制器结构体指针
 * 返回  : 无
 */
void key_Process(void)
{
		static uint8_t s_ButtonTime_Cnt = 0;
		static uint8_t s_FL_Button_Cnt = 0;
		static uint8_t s_FR_Button_Cnt = 0;
		static uint8_t s_Lock_Button_Cnt = 0;
	

	
/*************** 按键扫描 ******************/
		key_Scan();
	
		g_Button_Val = othersButton_Decode();

		if( (g_Button_Val == key_ON_OFF)&&(g_Button_UpdateFlag == SET) )
		{
				g_TurnOnFlag = !g_TurnOnFlag;
				beep_Button(BUTTON_GEAR_BZ_TIME);
				if(g_TurnOnFlag == POWER_OFF)
				{
							powerOffDeal();
							/* 立即更新数据发送到主板 */
//							update_MB_Ctrl_Parm(&g_Zone1_GT, &g_Zone2_GT, MAIN_BOARD1_ADDR);
//							HAL_Delay(20);
//							update_MB_Ctrl_Parm(&g_Zone3_GT, &g_Zone4_GT, MAIN_BOARD2_ADDR);
//							HAL_Delay(20);
//							update_MB_Ctrl_Parm(&g_Zone1_GT, &g_Zone2_GT, MAIN_BOARD1_ADDR);
//							HAL_Delay(20);
//							update_MB_Ctrl_Parm(&g_Zone3_GT, &g_Zone4_GT, MAIN_BOARD2_ADDR);	
				}
		}
		
		
		
		/* 开机状态 */
		if(g_TurnOnFlag == ENABLE)
		{
				/*************** 按键解码 ******************/
				if((g_Button_UpdateFlag == SET)&&(lock_State == DISABLE))
				{
						gearButton_Decode();
		//				g_Button_UpdateFlag = RESET;
				}

				/*********************** 加按键处理 **************************/	
				if((g_Button_Val == key_INC)&&(g_TimeOutCnt)&&(lock_State == DISABLE))
				{
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_3S)		//长按时间到
						{
								g_LongPressFlag = SET;
								g_ButtonTime_Cnt = LONG_PRESS_3S - LONG_PRESS_INTERVAL;  //间隔 LONG_PRESS_INTTERVAL * 100ms 产生一次长按键信号
						}
						
						if( (g_ButtonTime_Cnt == 1)||(g_LongPressFlag == SET) )
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
								g_LongPressFlag = RESET;
					}
				}
				
				/*************** 减按键处理 **********************/
				if((g_Button_Val == key_DEC)&&(g_TimeOutCnt)&&(lock_State == DISABLE))
				{
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_3S)		//长按时间到
						{
								g_LongPressFlag = SET;
								g_ButtonTime_Cnt = LONG_PRESS_3S - LONG_PRESS_INTERVAL;  //间隔 LONG_PRESS_INTTERVAL * 100ms 产生一次长按键信号
						}
						
						if( (g_ButtonTime_Cnt == 1)||(g_LongPressFlag == SET) )
						{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_TimeOutCnt = BUTTON_TIMEOUT;
								g_ShortFlash_Cnt = SHORT_FLASH_TIME;
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
										timer_DEC_Deal(&g_Zone4_GT);
								}
								else if(g_CurrentZone == &g_ZoneLeft_GT)
								{
										timer_DEC_Deal(&g_ZoneLeft_GT);
								}
								else if(g_CurrentZone == &g_ZoneRight_GT)
								{
										timer_DEC_Deal(&g_ZoneRight_GT);
								}
								g_LongPressFlag = RESET;
						}
				}
				
				/*************** 左无区按键处理 **********************/
				if((g_Button_Val == key_FL)&&(g_TimeOutCnt)&&(g_Button_UpdateFlag == SET)&&(lock_State == DISABLE))
				{
						g_TimeOutCnt = BUTTON_TIMEOUT;
						g_ShortFlash_Cnt = SHORT_FLASH_TIME;
						beep_Button(BUTTON_GEAR_BZ_TIME);
						/* 立即更新 g_CurrentZone 到当前无区状态 */
						g_CurrentZone = &g_ZoneLeft_GT;
						s_FL_Button_Cnt++;
						
						if(s_FL_Button_Cnt % 2)
						{
								zoneLeft_State = ENABLE;
								longPressMultiplexing = ENABLE;
								memset(&g_Zone1_GT,0,sizeof(g_Zone1_GT));
								memset(&g_Zone2_GT,0,sizeof(g_Zone2_GT));
						}
						else
						{
								zoneLeft_State = DISABLE;
								bbqEnable_Left = DISABLE;
								g_BBQ_WorkTime_Left = 0;
								memset(&g_ZoneLeft_GT,0,sizeof(g_ZoneLeft_GT));
						}
					
				}
				/*************** BBQ功能（需要先设置成左无区） **********************/
				if((g_Button_Val == key_FL)&&(g_TimeOutCnt)&&(lock_State == DISABLE)&&(zoneLeft_State == ENABLE)&&(longPressMultiplexing == ENABLE))
				{
						g_TimeOutCnt = BUTTON_TIMEOUT;
						g_ShortFlash_Cnt = SHORT_FLASH_TIME;
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_3S)		//长按时间到
						{
								bbqEnable_Left = ENABLE;
								g_ZoneLeft_GT.Gear = 10;
								g_TimeOutCnt = BUTTON_TIMEOUT;
								g_Buzzer_CtrlState = ENABLE;
								beep_Button(BUTTON_GEAR_BZ_TIME);
								s_ButtonTime_Cnt = 0;
								longPressMultiplexing =DISABLE;
						}
				}
				
				/*************** 右无区按键处理 **********************/
				if((g_Button_Val == key_FR)&&(g_TimeOutCnt)&&(g_Button_UpdateFlag == SET)&&(lock_State == DISABLE))
				{
						g_TimeOutCnt = BUTTON_TIMEOUT;
						g_ShortFlash_Cnt = SHORT_FLASH_TIME;
						beep_Button(BUTTON_GEAR_BZ_TIME);
						s_FR_Button_Cnt++;
						
						if(s_FR_Button_Cnt % 2)
						{
								zoneRight_State = ENABLE;
								memset(&g_Zone3_GT,0,sizeof(g_Zone3_GT));
								memset(&g_Zone4_GT,0,sizeof(g_Zone4_GT));
						}
						else
						{
								zoneRight_State = DISABLE;
								bbqEnable_Right = DISABLE;
								g_BBQ_WorkTime_Right = 0;
								memset(&g_ZoneRight_GT,0,sizeof(g_ZoneRight_GT));
						}
				}
					/*************** BBQ功能（需要先设置成右无区） **********************/
				if((g_Button_Val == key_FR)&&(g_TimeOutCnt)&&(lock_State == DISABLE)&&(zoneRight_State == ENABLE))
				{
						beep_Button(BUTTON_GEAR_BZ_TIME);
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_3S)		//长按时间到
						{
								bbqEnable_Right = ENABLE;
								g_ZoneRight_GT.Gear = 10;
								g_TimeOutCnt = BUTTON_TIMEOUT;
								g_Buzzer_CtrlState = ENABLE;
								beep_Button(BUTTON_GEAR_BZ_TIME);
								s_ButtonTime_Cnt = 0;
								longPressMultiplexing =DISABLE;
						}
				}
				
				/*************** 童锁按键处理 **********************/
				if( (g_Button_Val == key_LOCK)&&(g_TimeOutCnt==0) )
				{
						if(g_Button_UpdateFlag == SET)
						{
								s_ButtonTime_Cnt = 0;
						}
						s_ButtonTime_Cnt++;        //100ms per once
						if(s_ButtonTime_Cnt >= LONG_PRESS_3S)		//长按时间到
						{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								if(++s_Lock_Button_Cnt % 2)
								{
										lock_State = ENABLE;
								}
								else
								{
										lock_State = DISABLE;
								}
								s_ButtonTime_Cnt = 0;
						}
				}
				
				/*************** 暂停按键 **********************/
				if( (g_Button_Val == key_BOOST)&&(lock_State == DISABLE)&&(g_Button_UpdateFlag == SET) )
				{
						if( (g_Zone1_GT.Gear+g_Zone2_GT.Gear+g_Zone3_GT.Gear+g_Zone4_GT.Gear+g_ZoneLeft_GT.Gear+g_ZoneRight_GT.Gear) > 0)//档位不为0才能按暂停
						{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Pause_State = (FunctionalState)!g_Pause_State;
						}
						if(++timeZoneCnt >=9)
						{
							timeZoneCnt = 1;
						}
				}
				
				/*************** 1#滑条S0复用为保温按键 **********************/
				if((g_Button_Val == key_KW_1)&&(g_TimeOutCnt)&&(lock_State == DISABLE)&&(longPressMultiplexing == ENABLE))
				{
			
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_2S)		//长按时间到
						{
								g_TimeOutCnt = BUTTON_TIMEOUT;
								longPressMultiplexing = DISABLE;
								g_Buzzer_CtrlState = ENABLE;
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone1_GT.KeepWarmFlag = !g_Zone1_GT.KeepWarmFlag;
								s_ButtonTime_Cnt = 0;
						}
				}
				/*************** 2#滑条S0复用为保温按键 **********************/
				if((g_Button_Val == key_KW_2)&&(g_TimeOutCnt)&&(lock_State == DISABLE)&&(longPressMultiplexing == ENABLE))
				{
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_2S)		//长按时间到
						{
								g_TimeOutCnt = BUTTON_TIMEOUT;
								longPressMultiplexing = DISABLE;
								g_Buzzer_CtrlState = ENABLE;
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone2_GT.KeepWarmFlag = !g_Zone2_GT.KeepWarmFlag;
								s_ButtonTime_Cnt = 0;
						}
				}
				/*************** 3#滑条S0复用为保温按键 **********************/
				if((g_Button_Val == key_KW_3)&&(g_TimeOutCnt)&&(lock_State == DISABLE)&&(longPressMultiplexing == ENABLE))
				{
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_2S)		//长按时间到
						{
								g_TimeOutCnt = BUTTON_TIMEOUT;
								longPressMultiplexing = DISABLE;
								g_Buzzer_CtrlState = ENABLE;
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone3_GT.KeepWarmFlag = !g_Zone3_GT.KeepWarmFlag;
								s_ButtonTime_Cnt = 0;
						}
				}
				/*************** 4#滑条S0复用为保温按键 **********************/
				if((g_Button_Val == key_KW_4)&&(g_TimeOutCnt)&&(lock_State == DISABLE)&&(longPressMultiplexing == ENABLE))
				{
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_1S)		//长按时间到
						{
								g_TimeOutCnt = BUTTON_TIMEOUT;
								longPressMultiplexing = DISABLE;
								g_Buzzer_CtrlState = ENABLE;
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_Zone4_GT.KeepWarmFlag = !g_Zone4_GT.KeepWarmFlag;
								s_ButtonTime_Cnt = 0;
						}
				}
				
		}
		/* 待机状态 */
		else
		{
				/*********************** stop&go按键处理,进入功率方案设置模式 **************************/	
				if(g_Button_Val == key_BOOST)
				{
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_5S)		//长按时间到
						{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								if(g_powerSchemeState == SETTING_POWER_SCHEME_FINISH)
								{
									g_powerSchemeState = SETTING_POWER_SCHEME_READY;
								}
								else if(g_powerSchemeState == SETTING_POWER_SCHEME_CONFIRM)
								{
									savePowerSchemeToFlash(g_TotalPower);
									g_powerSchemeState = SETTING_POWER_SCHEME_FINISH;
								}
						}
				}
				else if(g_Button_Val == key_POWER_SET)
				{
						g_ButtonTime_Cnt++;        //100ms per once
						if(g_ButtonTime_Cnt >= LONG_PRESS_3S)		//长按
						{
								beep_Button(BUTTON_GEAR_BZ_TIME);savePowerSchemeToFlash(g_TotalPower);
								g_powerSchemeState = SETTING_POWER_SCHEME_CONFIRM;
								g_TotalPower = g_PowerScheme[g_PowerSchemeIdx];
						}
						else if( (g_ButtonTime_Cnt == 1)&&(g_powerSchemeState == SETTING_POWER_SCHEME_CONFIRM) )//短按
						{
								beep_Button(BUTTON_GEAR_BZ_TIME);
								g_TimeOutCnt = BUTTON_TIMEOUT;
								if(++g_PowerSchemeIdx >= POWER_SCHEME_NUM)
								{
										g_PowerSchemeIdx = 0;
								}
								g_TotalPower = g_PowerScheme[g_PowerSchemeIdx];
						}
						
					
				}
		}
		
		g_Button_Val = 0;
		g_Button_UpdateFlag = RESET;
}
