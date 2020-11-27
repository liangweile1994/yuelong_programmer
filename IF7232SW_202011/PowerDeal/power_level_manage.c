#include "power_level_manage.h"
#include "embedded_flash.h"
#include "usart.h"
#include "key.h"
#include "ntc.h"
#include "display.h"
#include <string.h>

#define RELAY_ON()     HAL_GPIO_WritePin(RELAY_GPIO_Port, RELAY_Pin, GPIO_PIN_SET)
#define RELAY_OFF()    HAL_GPIO_WritePin(RELAY_GPIO_Port, RELAY_Pin, GPIO_PIN_RESET)

#define FAN_ON()     HAL_GPIO_WritePin(FAN_GPIO_Port, FAN_Pin, GPIO_PIN_SET)
#define FAN_OFF()    HAL_GPIO_WritePin(FAN_GPIO_Port, FAN_Pin, GPIO_PIN_RESET)

/* 油温上限（防止着火） */
#define OIL_HIGH_LIMIT_TEMP   240
/* 油温下限 保证煮油的火力 */
#define OIL_LOW_LIMIT_TEMP   (OIL_HIGH_LIMIT_TEMP - 30)
/* IGBT温度上限 */
#define IGBT_HIGH_LIMIT_TEMP  100
/* IGBT温度下限 */
#define IGBT_LOW_LIMIT_TEMP  (IGBT_HIGH_LIMIT_TEMP - 10)

/* 定义4个ZONE的温度&错误代码结构体 */
Z_TempErrDef  g_Zone1_TE, g_Zone2_TE, g_Zone3_TE, g_Zone4_TE;

ErrorStatus   mainBoardConnect = ERROR;

static FlagStatus    g_CommunicationFlag = RESET;

/* 设备空闲时间计时器 */
uint8_t g_DevIdleTimer = 0;
/* 设备空闲标志 */
FlagStatus idleFlag = SET;
/* 左BBQ工作时间 */
uint16_t g_BBQ_WorkTime_Left = 0;
/* 右BBQ工作时间 */
uint16_t g_BBQ_WorkTime_Right = 0;
/* 左BBQ使能 */
FunctionalState bbqEnable_Left = DISABLE;
/* 右BBQ使能 */
FunctionalState bbqEnable_Right = DISABLE;

/********** 8套功率方案 *****************/
uint16_t const g_PowerScheme[POWER_SCHEME_NUM] = {7400, 2000, 2500, 3000, 3500, 4500, 5500, 6800};
	
/********** 无区状态功率 ****************  0, 1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,  P  ****/
uint16_t const g_PowerLevel_BigZone[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1300,1400,1500,1800};
	
/**************** 1#功率 ****************  0, 1,  2,  3, 4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,   P  ****/
//uint16_t const g_PowerLevel_Stove_1[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,3000};
uint16_t const g_PowerLevel_Stove_1[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,2900};
/**************** 2#功率 ****************  0, 1,  2,  3, 4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,   P  ****/
uint16_t const g_PowerLevel_Stove_2[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,3350};
//uint16_t const g_PowerLevel_Stove_2[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,2600};
/**************** 3#功率 ****************  0, 1, 2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,   P  ****/
//uint16_t const g_PowerLevel_Stove_3[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1500,1600,2000,2600};
uint16_t const g_PowerLevel_Stove_3[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1500,1600,2000,1900};
/**************** 4#功率 ****************  0, 1, 2,  3,  4,  5,  6,  7,  8,  9,  10,   11, 12,  13,  14,  15,  P  ****/
uint16_t const g_PowerLevel_Stove_4[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1300,1400,1500,2350};
	
/* 整机功率 */
uint16_t g_TotalPower;
/* 功率方案选择计数器，对应g_PowerScheme数组的功率 */
uint8_t g_PowerSchemeIdx = DEFAULT_TOTAL_POWER;
	
uint8_t g_SysErrorCode = 0;
	
extern TIM_HandleTypeDef htim3;

/*
 * 函数名：fan_PWM_Conctrol
 * 描述  ：风扇PWM控制
 * 输入  ：power_percent (范围：0-100）
 * 返回  : 无
 */
//static void fan_PWM_Conctrol(uint8_t power_percent)//cnt*10 ms
//{
//		if(power_percent > 100)
//		{
//				__HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_2, 100);
//		}
//		else
//		{
//				__HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_2, power_percent * 2);
//		}
//}	
	
/*
 * 函数名：getPowerSchemeFromFlash
 * 描述  ：从flash的指定地址读出功率方案
 * 输入  ：无
 * 返回  : 设备的总功率数值
 */
static uint32_t getPowerSchemeFromFlash(void)
{
		uint32_t val32_L, val32_H;
		readDoubleWordEmbeddedFlash(FLASH_PAGE62_START_ADDR, 0, &val32_L, &val32_H);
		return val32_L;
}

/*
 * 函数名：savePowerSchemeToFlash
 * 描述  ：保存功率方案到flashd的指定地址
 * 输入  ：dat 设备的总功率数值
 * 返回  : 无
 */
void savePowerSchemeToFlash(uint32_t dat)
{
		writeDoubleWordEmbeddedFlash(FLASH_PAGE62, FLASH_PAGE62_START_ADDR, 0, dat);
}

/*
 * 函数名：defaultPowerSchemeSetting
 * 描述  ：缺省功率方案设置
 * 输入  ：无
 * 返回  : 无
 */
void defaultPowerSchemeSetting(void)
{
		g_TotalPower = getPowerSchemeFromFlash();
		switch(g_TotalPower)
		{
			case 7400: g_PowerSchemeIdx = 0; break;
			case 2000: g_PowerSchemeIdx = 1; break;
			case 2500: g_PowerSchemeIdx = 2; break;
			case 3000: g_PowerSchemeIdx = 3; break;
			case 3500: g_PowerSchemeIdx = 4; break;
			case 4500: g_PowerSchemeIdx = 5; break;
			case 5500: g_PowerSchemeIdx = 6; break;
			case 6800: g_PowerSchemeIdx = 7; break;
			default  : g_PowerSchemeIdx = 0;
                 g_TotalPower = 7400 ; 
                 savePowerSchemeToFlash(g_TotalPower);
			           break;
				
		}
}

/*
 * 函数名：powerOffDeal
 * 描述  ：关机清零处理
 * 输入  ：无
 * 返回  : 无
 */
void powerOffDeal(void)
{	
		idleFlag = SET;
		clearDispBuf();
		zone_Init();
		clearAllLongFlashFlag();
		g_RunningTime = 0;
		g_DevIdleTimer = 0;
		g_200ms_cnt = 0;
		g_ShortFlash_Cnt = 0;
		g_TimeOutCnt = 0;
		g_General_FlashFlag_1s = 0;	
		g_BBQ_WorkTime_Right = 0;
		g_BBQ_WorkTime_Right = 0;

		zoneLeft_State = DISABLE;
		bbqEnable_Left = DISABLE;
		zoneRight_State = DISABLE;
		bbqEnable_Right = DISABLE;
}

/*
 * 函数名：reducePower_Single
 * 描述  ：单开降低功率
 * 输入  ：无
 * 返回  : 无
 */
static void reducePower_Single(pGear_Time_CON  pGR)
{
		/* boost档位处理 */
		if(pGR->Gear == BOOST_GEAR)
		{
				if(pGR->Timer.boost_timer++ >= BOOST_TIME)
				{
						pGR->Gear = 15;
						pGR->RealGear = 15;
						pGR->Timer.boost_timer = 0;
				}
		}
		else if(pGR->PowerTabel[pGR->RealGear] > 1000)
		{
				if( (pGR->RealGear == 15)&&(g_RunningTime > (60*9)) )
				{
						pGR->RealGear = 14;
				}
				else if( (pGR->RealGear >= 14)&&(g_RunningTime > (60*12)) )
				{
						pGR->RealGear = 13;
				}
				else if( (pGR->RealGear >= 13)&&(g_RunningTime > (60*14)) )
				{
						pGR->RealGear = 12;
				}
				else if( (pGR->RealGear >= 12)&&(g_RunningTime > (60*30)) )
				{
						pGR->RealGear = 11;
				}
				else if( (pGR->RealGear >= 11)&&(g_RunningTime > (60*30)) )
				{
						pGR->RealGear = 10;
				}
				else if( (pGR->RealGear >= 10)&&(g_RunningTime > (60*23)) )
				{
						pGR->RealGear = 9;
				}
				else if( (pGR->RealGear >= 9)&&(g_RunningTime > (60*26)) )
				{
						pGR->RealGear = 8;
				}
				else if( (pGR->RealGear >= 8)&&(g_RunningTime > (60*30)) )
				{
						pGR->RealGear = 6;
				}
		}
}

/*
 * 函数名：reducePower_Double
 * 描述  ：双开降低功率
 * 输入  ：无
 * 返回  : 无
 */
static void reducePower_Double(pGear_Time_CON  pGR)
{
		/* boost档位处理 */
		if(pGR->Gear == BOOST_GEAR)
		{
				if(pGR->Timer.boost_timer++ >= BOOST_TIME)
				{
						pGR->Gear = 15;
						pGR->RealGear = 15;
						pGR->Timer.boost_timer = 0;
				}
		}
		else if(pGR->PowerTabel[pGR->RealGear] > 1000)
		{
				if( (pGR->RealGear >= 15)&&(g_RunningTime > (60*9)) )
				{
						pGR->RealGear = 14;
				}
				else if( (pGR->RealGear >= 14)&&(g_RunningTime > (60*11)) )
				{
						pGR->RealGear = 13;
				}
				else if( (pGR->RealGear >= 13)&&(g_RunningTime > (60*13)) )
				{
						pGR->RealGear = 12;
				}
				else if( (pGR->RealGear >= 12)&&(g_RunningTime > (60*15)) )
				{
						pGR->RealGear = 11;
				}
				else if( (pGR->RealGear >= 11)&&(g_RunningTime > (60*17)) )
				{
						pGR->RealGear = 10;
				}
				else if( (pGR->RealGear >= 10)&&(g_RunningTime > (60*20)) )
				{
						pGR->RealGear = 9;
				}
				else if( (pGR->RealGear >= 9)&&(g_RunningTime > (60*24)) )
				{
						pGR->RealGear = 8;
				}
				else if( (pGR->RealGear >= 8)&&(g_RunningTime > (60*30)) )
				{
						pGR->RealGear = 6;
				}
		}
}

/*
 * 函数名：reducePower_Three
 * 描述  ：三开降低功率
 * 输入  ：无
 * 返回  : 无
 */
static void reducePower_Three(pGear_Time_CON  pGR)
{
		/* boost档位处理 */
		if(pGR->Gear == BOOST_GEAR)
		{
				if(pGR->Timer.boost_timer++ >= BOOST_TIME)
				{
						pGR->Gear = 15;
						pGR->RealGear = 15;
						pGR->Timer.boost_timer = 0;
				}
		}
		else if(pGR->PowerTabel[pGR->RealGear] > 1000)
		{
				if( (pGR->RealGear >= 15)&&(g_RunningTime > (60*8)) )
				{
						pGR->RealGear = 14;
				}
				else if( (pGR->RealGear >= 14)&&(g_RunningTime > (60*10)) )
				{
						pGR->RealGear = 13;
				}
				else if( (pGR->RealGear >= 13)&&(g_RunningTime > (60*12)) )
				{
						pGR->RealGear = 12;
				}
				else if( (pGR->RealGear >= 12)&&(g_RunningTime > (60*14)) )
				{
						pGR->RealGear = 11;
				}
				else if( (pGR->RealGear >= 11)&&(g_RunningTime > (60*16)) )
				{
						pGR->RealGear = 10;
				}
				else if( (pGR->RealGear >= 10)&&(g_RunningTime > (60*19)) )
				{
						pGR->RealGear = 9;
				}
				else if( (pGR->RealGear >= 9)&&(g_RunningTime > (60*23)) )
				{
						pGR->RealGear = 8;
				}
				else if( (pGR->RealGear >= 8)&&(g_RunningTime > (60*28)) )
				{
						pGR->RealGear = 6;
				}
		}
}

/*
 * 函数名：reducePower_Four
 * 描述  ：四开降低功率
 * 输入  ：无
 * 返回  : 无
 */
static void reducePower_Four(pGear_Time_CON  pGR)
{
		/* boost档位处理 */
		if(pGR->Gear == BOOST_GEAR)
		{
				if(pGR->Timer.boost_timer++ >= BOOST_TIME)
				{
						pGR->Gear = 15;
						pGR->RealGear = 15;
						pGR->Timer.boost_timer = 0;
				}
		}
		else if(pGR->PowerTabel[pGR->RealGear] > 1000)
		{
				if( (pGR->RealGear >= 15)&&(g_RunningTime > (60*10)) )
				{
						pGR->RealGear = 14;
				}
				else if( (pGR->RealGear >= 14)&&(g_RunningTime > (60*15)) )
				{
						pGR->RealGear = 13;
				}
				else if( (pGR->RealGear >= 13)&&(g_RunningTime > (60*22)) )
				{
						pGR->RealGear = 12;
				}
				else if( (pGR->RealGear >= 12)&&(g_RunningTime > (60*30)) )
				{
						pGR->RealGear = 11;
				}
				else if( (pGR->RealGear >= 11)&&(g_RunningTime > (60*40)) )
				{
						pGR->RealGear = 10;
				}
		}
}



/*
 * 函数名：generalPowerReduction
 * 描述  ：降低功率
 * 输入  ：无
 * 返回  : 无
 */
void generalPowerReduction(void)
{
		uint8_t zoneState = 0;
	
		if(g_Zone1_GT.Gear)
		{
				zoneState |= ZONE1_WORKING;
		}
		if(g_Zone2_GT.Gear)
		{
				zoneState |= ZONE2_WORKING;
		}
		if(g_Zone3_GT.Gear)
		{
				zoneState |= ZONE3_WORKING;
		}
		if(g_Zone4_GT.Gear)
		{
				zoneState |= ZONE4_WORKING;
		}
		if(g_ZoneLeft_GT.Gear)
		{
				zoneState |= (ZONE1_WORKING|ZONE2_WORKING);
		}
		if(g_ZoneRight_GT.Gear)
		{
				zoneState |= (ZONE3_WORKING|ZONE4_WORKING);
		}	
		
		switch(zoneState)
		{
				case ZONE1_WORKING:
				case ZONE2_WORKING:
				case ZONE3_WORKING:
				case ZONE4_WORKING:
						reducePower_Single(&g_Zone1_GT);
						reducePower_Single(&g_Zone2_GT);
						reducePower_Single(&g_Zone3_GT);
						reducePower_Single(&g_Zone4_GT);
						break;
				case ZONE12_WORKING:
				case ZONE13_WORKING:
				case ZONE14_WORKING:
				case ZONE23_WORKING:
				case ZONE24_WORKING:
				case ZONE34_WORKING:
						reducePower_Double(&g_Zone1_GT);
						reducePower_Double(&g_Zone2_GT);
						reducePower_Double(&g_Zone3_GT);
						reducePower_Double(&g_Zone4_GT);
						reducePower_Double(&g_ZoneLeft_GT);
						reducePower_Double(&g_ZoneRight_GT);
						break;
				case ZONE123_WORKING:
				case ZONE124_WORKING:
				case ZONE134_WORKING:
				case ZONE234_WORKING:
						reducePower_Three(&g_Zone1_GT);
						reducePower_Three(&g_Zone2_GT);
						reducePower_Three(&g_Zone3_GT);
						reducePower_Three(&g_Zone4_GT);
						reducePower_Three(&g_ZoneLeft_GT);
						reducePower_Three(&g_ZoneRight_GT);
						break;
				case ZONE1234_WORKING:
						reducePower_Four(&g_Zone1_GT);
						reducePower_Four(&g_Zone2_GT);
						reducePower_Four(&g_Zone3_GT);
						reducePower_Four(&g_Zone4_GT);
						reducePower_Four(&g_ZoneLeft_GT);
						reducePower_Four(&g_ZoneRight_GT);
						break;
		}

}

/*
 * 函数名：powerTabelAllot
 * 描述  ：功率列表指派，指派有区/无区状态对应的功率列表
 * 输入  ：无
 * 返回  ：无
 */
void powerTabelAllot(void)
{
		g_Zone1_GT.PowerTabel = g_PowerLevel_Stove_1;
		g_Zone2_GT.PowerTabel = g_PowerLevel_Stove_2;
		g_Zone3_GT.PowerTabel = g_PowerLevel_Stove_3;
		g_Zone4_GT.PowerTabel = g_PowerLevel_Stove_4;	
		g_ZoneLeft_GT.PowerTabel = g_PowerLevel_BigZone;
		g_ZoneRight_GT.PowerTabel = g_PowerLevel_BigZone;
}

/*
 * 函数名：powerLimitAlgorithm
 * 描述  ：单块主板的功率限制算法
 * 输入  ：gear_input 档位
 * 返回  ：TRUE 输入功率正常，FALSE 输入功率超限
 */
eResult singleBoardPowerLimitAlgorithm(uint8_t gear_input)
{
	
		uint16_t sum = 0;

		if(g_Zone1_GT.GrearActive == GEAR_ACTIVE)
		{
				if(zoneLeft_State == DISABLE)
				{
						sum = g_Zone1_GT.PowerTabel[gear_input] + g_Zone2_GT.PowerTabel[g_Zone2_GT.Gear];
				}
				else
				{
						sum = (g_ZoneLeft_GT.PowerTabel[gear_input]) * 2;
				}
		}
		else if(g_Zone2_GT.GrearActive == GEAR_ACTIVE)
		{
				if(zoneLeft_State == DISABLE)
				{
						sum = g_Zone1_GT.PowerTabel[g_Zone1_GT.Gear] + g_Zone2_GT.PowerTabel[gear_input];
				}
				else
				{
						sum = (g_ZoneLeft_GT.PowerTabel[gear_input]) * 2;
				}
		}
		else if(g_Zone3_GT.GrearActive == GEAR_ACTIVE)
		{
				if(zoneRight_State == DISABLE)
				{
						sum = g_Zone3_GT.PowerTabel[gear_input] + g_Zone4_GT.PowerTabel[g_Zone4_GT.Gear];
				}
				else
				{
						sum = (g_ZoneRight_GT.PowerTabel[gear_input]) * 2;
				}
		}
		else if(g_Zone4_GT.GrearActive == GEAR_ACTIVE)
		{
				if(zoneRight_State == DISABLE)
				{
						sum = g_Zone3_GT.PowerTabel[g_Zone3_GT.Gear] + g_Zone4_GT.PowerTabel[gear_input];
				}
				else
				{
						sum = (g_ZoneRight_GT.PowerTabel[gear_input]) * 2;
				}
		}
		
		if(sum <= MAX_MAINBOARD_POWER)
		{
				return TRUE;
		}
		return FALSE;
}

/*
 * 函数名：realTotalPowerCalculate
 * 描述  ：整机实际功率计算
 * 输入  ：无
 * 返回  ：无
 */
eResult realTotalPowerCalculate(uint8_t gear_input)
{
		uint16_t sum = 0;

		if(g_Zone1_GT.GrearActive == GEAR_ACTIVE)
		{
				if((zoneLeft_State == DISABLE)&&(zoneRight_State == DISABLE))
				{
						sum = g_Zone1_GT.PowerTabel[gear_input] + g_Zone2_GT.PowerTabel[g_Zone2_GT.Gear] +
						g_Zone3_GT.PowerTabel[g_Zone3_GT.Gear] + g_Zone4_GT.PowerTabel[g_Zone4_GT.Gear];
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == DISABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[gear_input]) * 2 +
						g_Zone3_GT.PowerTabel[g_Zone3_GT.Gear] + g_Zone4_GT.PowerTabel[g_Zone4_GT.Gear];
				}
				else if((zoneLeft_State == DISABLE)&&(zoneRight_State == ENABLE))
				{
						sum = g_Zone1_GT.PowerTabel[gear_input] + g_Zone2_GT.PowerTabel[g_Zone2_GT.Gear] +
						g_ZoneRight_GT.PowerTabel[g_ZoneRight_GT.Gear] *2 ;
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == ENABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[gear_input]) * 2 + g_ZoneRight_GT.PowerTabel[g_ZoneRight_GT.Gear] *2 ;
				}
		}
		else if(g_Zone2_GT.GrearActive == GEAR_ACTIVE)
		{
				if((zoneLeft_State == DISABLE)&&(zoneRight_State == DISABLE))
				{
						sum = g_Zone1_GT.PowerTabel[g_Zone1_GT.Gear] + g_Zone2_GT.PowerTabel[gear_input] +
						g_Zone3_GT.PowerTabel[g_Zone3_GT.Gear] + g_Zone4_GT.PowerTabel[g_Zone4_GT.Gear];
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == DISABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[gear_input]) * 2 +
						g_Zone3_GT.PowerTabel[g_Zone3_GT.Gear] + g_Zone4_GT.PowerTabel[g_Zone4_GT.Gear];
				}
				else if((zoneLeft_State == DISABLE)&&(zoneRight_State == ENABLE))
				{
						sum = g_Zone1_GT.PowerTabel[g_Zone1_GT.Gear] + g_Zone2_GT.PowerTabel[gear_input] +
						g_ZoneRight_GT.PowerTabel[g_ZoneRight_GT.Gear] *2 ;
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == ENABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[gear_input]) * 2 + g_ZoneRight_GT.PowerTabel[g_ZoneRight_GT.Gear] *2 ;
				}
		}
		else if(g_Zone3_GT.GrearActive == GEAR_ACTIVE)
		{
				if((zoneLeft_State == DISABLE)&&(zoneRight_State == DISABLE))
				{
						sum = g_Zone1_GT.PowerTabel[g_Zone1_GT.Gear] + g_Zone2_GT.PowerTabel[g_Zone2_GT.Gear] +
						g_Zone3_GT.PowerTabel[gear_input] + g_Zone4_GT.PowerTabel[g_Zone4_GT.Gear];
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == DISABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[g_ZoneLeft_GT.Gear]) * 2 +
						g_Zone3_GT.PowerTabel[gear_input] + g_Zone4_GT.PowerTabel[g_Zone4_GT.Gear];
				}
				else if((zoneLeft_State == DISABLE)&&(zoneRight_State == ENABLE))
				{
						sum = g_Zone1_GT.PowerTabel[g_Zone1_GT.Gear] + g_Zone2_GT.PowerTabel[g_Zone2_GT.Gear] +
						g_ZoneRight_GT.PowerTabel[gear_input] *2 ;
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == ENABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[g_ZoneLeft_GT.Gear]) * 2 + g_ZoneRight_GT.PowerTabel[gear_input] *2 ;
				}
		}
		else if(g_Zone4_GT.GrearActive == GEAR_ACTIVE)
		{
				if((zoneLeft_State == DISABLE)&&(zoneRight_State == DISABLE))
				{
						sum = g_Zone1_GT.PowerTabel[g_Zone1_GT.Gear] + g_Zone2_GT.PowerTabel[g_Zone2_GT.Gear] +
						g_Zone3_GT.PowerTabel[g_Zone3_GT.Gear] + g_Zone4_GT.PowerTabel[gear_input];
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == DISABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[g_ZoneLeft_GT.Gear]) * 2 +
						g_Zone3_GT.PowerTabel[g_Zone4_GT.Gear] + g_Zone4_GT.PowerTabel[gear_input];
				}
				else if((zoneLeft_State == DISABLE)&&(zoneRight_State == ENABLE))
				{
						sum = g_Zone1_GT.PowerTabel[g_Zone1_GT.Gear] + g_Zone2_GT.PowerTabel[g_Zone2_GT.Gear] +
						g_ZoneRight_GT.PowerTabel[gear_input] *2 ;
				}
				else if((zoneLeft_State == ENABLE)&&(zoneRight_State == ENABLE))
				{
						sum = (g_ZoneLeft_GT.PowerTabel[g_ZoneLeft_GT.Gear]) * 2 + g_ZoneRight_GT.PowerTabel[gear_input] *2 ;
				}
		}
		
		if(sum <= g_TotalPower)
		{
				return TRUE;
		}
		
		return FALSE;
}

/*
 * 函数名：get_ZoneTemp
 * 描述  ：获取Zone温度
 * 输入  ：void
 * 返回  : void
 * 调用  ：get_MainBoard_Message
 */
static void get_ZoneTemp(void)
{
		g_Zone1_TE.CoilTemp = getTemperature(g_1st_MainBoard_Data.Stove_1st_Coil_Temp & 0x0FFF, COIL_NTC);
		g_Zone1_TE.IgbtTemp = getTemperature(g_1st_MainBoard_Data.Stove_1st_Igbt_Temp & 0x0FFF, COIL_NTC);
		g_Zone2_TE.CoilTemp = getTemperature(g_1st_MainBoard_Data.Stove_2nd_Coil_Temp & 0x0FFF, COIL_NTC);
		g_Zone2_TE.IgbtTemp = getTemperature(g_1st_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x0FFF, COIL_NTC);
		g_Zone3_TE.CoilTemp = getTemperature(g_2nd_MainBoard_Data.Stove_1st_Coil_Temp & 0x0FFF, COIL_NTC);
		g_Zone3_TE.IgbtTemp = getTemperature(g_2nd_MainBoard_Data.Stove_1st_Igbt_Temp & 0x0FFF, COIL_NTC);
		g_Zone4_TE.CoilTemp = getTemperature(g_2nd_MainBoard_Data.Stove_2nd_Coil_Temp & 0x0FFF, COIL_NTC);
		g_Zone4_TE.IgbtTemp = getTemperature(g_2nd_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x0FFF, COIL_NTC);
}

/*
 * 函数名：generateErrorCode
 * 描述  ：生成错误代码
 * 输入  ：state  状态码，
 *         t_coil 线盘温度
 *         t_igbt IGBT温度
 * 返回  : 故障代码
 */
static uint8_t generateErrorCode(uint16_t state, uint16_t t_coil, uint16_t t_igbt)
{
		uint8_t err_buf;
		if(g_CommunicationFlag != SET)  err_buf = DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID;  //通信失败
		else if(g_1st_MainBoard_Data.Stove_1st_State & PVHighErr)  g_SysErrorCode = HighVoltageInput, err_buf = HIGH_VOLTAGE_INPUT_PROTECT;//电压过高
		else if(g_1st_MainBoard_Data.Stove_1st_State & PVLowErr)  g_SysErrorCode = LowVoltageInput, err_buf = LOW_VOLTAGE_INPUT_PROTECT;//电压过低
		else if(t_coil == NTC_ERROR_OPEN)  err_buf = OPEN_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//蘑菇头开路
		else if(t_coil == NTC_ERROR_SHORT_CIRCUIT)  err_buf = SHORT_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//蘑菇头短路
		else if(t_igbt == NTC_ERROR_SHORT_CIRCUIT)  err_buf = SHORT_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//IGBT短路	
		else if(t_igbt == NTC_ERROR_OPEN)  err_buf = OPEN_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//IGBT开路
		else if(t_coil > CRYSTAL_PLATE_LIMIT_TEMPERATURE) err_buf = HEAT_PROTECTION_ON_ZONE;//晶板过热
		else if(t_igbt > CRYSTAL_PLATE_LIMIT_TEMPERATURE) err_buf = HEAT_PROTECTION_OF_IGBT;//IGBT过热
		else   err_buf = TROUBLE_FREE;  //无故障
		return err_buf;
}

/*
 * 函数名：get_ErrCode
 * 描述  ：获取错误代码
 * 输入  ：void
 * 返回  : void
 * 调用  ：get_MainBoard_Message
 */
static void get_ErrCode(void)
{
		g_Zone1_TE.ErrCode = generateErrorCode(g_1st_MainBoard_Data.Stove_1st_State, g_Zone1_TE.CoilTemp, g_Zone1_TE.IgbtTemp);
		g_Zone2_TE.ErrCode = generateErrorCode(g_1st_MainBoard_Data.Stove_2nd_State, g_Zone2_TE.CoilTemp, g_Zone2_TE.IgbtTemp);
		g_Zone3_TE.ErrCode = generateErrorCode(g_2nd_MainBoard_Data.Stove_1st_State, g_Zone3_TE.CoilTemp, g_Zone3_TE.IgbtTemp);
		g_Zone4_TE.ErrCode = generateErrorCode(g_2nd_MainBoard_Data.Stove_2nd_State, g_Zone4_TE.CoilTemp, g_Zone4_TE.IgbtTemp);
}

/*
 * 函数名：get_MainBoard_Message
 * 描述  ：接收主板的串口消息
 * 输入  ：无
 * 返回  : 无
 */
void get_MainBoard_Message(void)
{
		uint8_t i;
		uint8_t addr;
		uint8_t chk_sum = 0;
		uint8_t *p = (uint8_t *)&MainBoard_Fram_Record .Data_RX_BUF;
		if( (MainBoard_Fram_Record .InfBit .FramFinishFlag == 1)&&( MainBoard_Fram_Record .InfBit .FramLength == MB_RX_BUF_MAX_LEN - 1) )
		{
				addr = MainBoard_Fram_Record .Data_RX_BUF[24];
			
				for(i=0;i<25;i++)
				{
						chk_sum = chk_sum + *p++;
				}
				
				if(chk_sum == *p)
				{
						/* 置位通信标志 */
						g_CommunicationFlag = SET;
						mainBoardConnect = SUCCESS;
						if(addr == 0xA0)//第一块主板的地址
						{
								memcpy(&g_1st_MainBoard_Data, &MainBoard_Fram_Record .Data_RX_BUF, 26);//拷贝串口接收缓冲器的数据到主板1接收缓冲器对应的内存块
						}
						else if(addr == 0xA1)//第二块主板的地址
						{
								memcpy(&g_2nd_MainBoard_Data, &MainBoard_Fram_Record .Data_RX_BUF, 26);//拷贝串口接收缓冲器的数据到主板2接收缓冲器对应的内存块
						}
				}
//				MainBoard_Fram_Record .InfBit .FramFinishFlag = 0;
//				MainBoard_Fram_Record .InfBit .FramLength = 0;
		}
		
		if(MainBoard_Fram_Record .InfBit .FramFinishFlag == 1)
		{
				MainBoard_Fram_Record .InfBit .FramFinishFlag = 0;
				MainBoard_Fram_Record .InfBit .FramLength = 0;
				__HAL_UART_ENABLE_IT(&huart3,UART_IT_IDLE);
				__HAL_UART_ENABLE_IT(&huart3,UART_IT_RXNE);
		}
		get_ZoneTemp();
		get_ErrCode();
}	



/*
 * 函数名：update_MB_Ctrl_Parm
 * 描述  ：发送控制参数给主板，更新主板控制参数
 * 输入  ：pt1, 主板上第一个炉头档位&时间控制器的结构体指针
 *         pt2, 主板上第二个炉头档位&时间控制器的结构体指针
 *         target，主板参数结构体指针
 * 返回  : 无
 */
void update_MB_Ctrl_Parm(pGear_Time_CON pt1, pGear_Time_CON pt2, uint8_t addr)
{
		uint8_t i;
		MB_CON_PARM  target = {0};
		uint8_t *ptr = (uint8_t *)&target;
		/* 复位通信标志 */
		g_CommunicationFlag = RESET;
		
		target.Addr = addr;
	
		/* 有档位就打开炉头,否则关闭炉头 */
		if(pt1->RealGear)
		{		
				target.SetState1 |= STOVE_ENABLE;
		}
		else
		{
				target.SetState1 &= ~STOVE_ENABLE;
		}
		/* 有档位就打开炉头,否则关闭炉头 */
		if(pt2->RealGear)
		{		
				target.SetState2 |= STOVE_ENABLE;
		}
		else
		{
				target.SetState2 &= ~STOVE_ENABLE;
		}
		/* 有档位，非空闲状态 */
		if( idleFlag == RESET )
		{		/* 只要有档位就打开风扇 */
				target.SetState1 |= (FAN_ENABLE | POWER1_ENABLE);
				target.SetState2 |= (FAN_ENABLE | POWER1_ENABLE);
				RELAY_ON();
				FAN_ON();
//				fan_PWM_Conctrol(100);
		}
		/* 空闲状态 */
		else
		{
				target.SetState1 = 0;
				target.SetState2 = 0;
				RELAY_OFF();
				FAN_OFF();
//				fan_PWM_Conctrol(0);
		}
		
		/* 把炉头档位对应的功率值传给主板参数结构体指向的功率值 */
		target.SetPower1 = pt1->PowerTabel[pt1->RealGear];
		target.SetPower2 = pt2->PowerTabel[pt2->RealGear];

		/* 校验和计数清零 */
		target.ChkSum = 0;
		for(i=0;i<7;i++)
		{		/* 计算校验和 */
				target.ChkSum += *ptr++;
		}
		
		HAL_UART_Transmit(&huart3,  (uint8_t *)&target,8, 0xFFFF);
}

/*
 * 函数名：send_ControlMsgToMainBoard
 * 描述  ：发送所有主板的控制参数，更新主板控制参数
 * 输入  : 无
 * 返回  : 无
 */
void send_ControlMsgToMainBoard(void)
{
		if(g_200ms_cnt % 2 == 0)
		{
			(zoneLeft_State == DISABLE)?(update_MB_Ctrl_Parm(&g_Zone1_GT, &g_Zone2_GT, MAIN_BOARD1_ADDR)):(update_MB_Ctrl_Parm(&g_ZoneLeft_GT, &g_ZoneLeft_GT, MAIN_BOARD1_ADDR));
		}
		else
		{
			(zoneRight_State == DISABLE)?(update_MB_Ctrl_Parm(&g_Zone3_GT, &g_Zone4_GT, MAIN_BOARD2_ADDR)):(update_MB_Ctrl_Parm(&g_ZoneRight_GT, &g_ZoneRight_GT, MAIN_BOARD2_ADDR));
		}
}

/*
 * 函数名：send_ControlMsgToMainBoard
 * 描述  ：发送空白控制参数到主板
 * 输入  : 无
 * 返回  : 无
 */
void send_BlankMsgToMainBoard(void)
{
		Gear_Time_CON virtual_zone_GT = {0};
		virtual_zone_GT.PowerTabel = g_PowerLevel_Stove_1;
		if(g_200ms_cnt % 2 == 0)
		{
			update_MB_Ctrl_Parm(&virtual_zone_GT, &virtual_zone_GT, MAIN_BOARD1_ADDR);
		}
		else
		{
			update_MB_Ctrl_Parm(&virtual_zone_GT, &virtual_zone_GT, MAIN_BOARD2_ADDR);
		}
}
#if 0
/*
 * 函数名：oilTemperatureCtrl
 * 描述  ：油温控制函数
 * 输入  : te Zone的温度&错误代码结构体指针
 * 返回  : TRUE 油温没有超标，FALSE 油温超标
 */
static eResult oilTemperatureCtrl(pZ_TempErrDef te)
{
		uint16_t tmp;
		eResult ret;
		pGear_Time_CON  gt;//定义一个时间&档位控制器结构体指针
	
		/* 开路或者短路，AD值错误，直接返回FALSE */
		if ( (te->CoilTemp == NTC_ERROR_OPEN)||(te->CoilTemp == NTC_ERROR_SHORT_CIRCUIT) ) return FALSE;
		
		if(te == &g_Zone1_TE)
		{
			gt = (zoneLeft_State == ENABLE)?(&g_ZoneLeft_GT):(&g_Zone1_GT);
		}
		else if(te == &g_Zone2_TE)
		{
			gt = (zoneLeft_State == ENABLE)?(&g_ZoneLeft_GT):(&g_Zone2_GT);
		}
		else if(te == &g_Zone3_TE)
		{
			gt = (zoneRight_State == ENABLE)?(&g_ZoneRight_GT):(&g_Zone3_GT);
		}
		else if(te == &g_Zone4_TE)
		{
			gt = (zoneRight_State == ENABLE)?(&g_ZoneRight_GT):(&g_Zone4_GT);
		}

		/* 大于260度时，前10秒调功降一档 */
		if ( (te->CoilTemp >= OIL_HIGH_LIMIT_TEMP)&&(gt->Timer.oil_error_time <255) )
		{
				/* 首先把RealGear保存起来 */
				gt->TempGear = gt->RealGear;
				/* 超温计时开始 */
				gt->Timer.oil_error_time++;
				/* 设置临时降档标志 */
				gt->TempDownFlag = SET;
				/* 实际档位不为零才能降档 */
				if( (gt->RealGear)&&(gt->Gear)&&(gt->TempDownFlag == SET) )
				{
						/* 前10秒降1档 */
						if(gt->Timer.oil_error_time == 1)
						{
								gt->RealGear--;
						}
						/* 过10秒降再1档 */
						else if(gt->Timer.oil_error_time == 10)
						{
								gt->RealGear--;
						}
						/* 过10秒再降1档 */
						else if(gt->Timer.oil_error_time == 20)
						{
								gt->RealGear--;
						}
						/* 从第45秒开始降再1档,最多降4次，后面根据测试的情况需要可以再加 */
						else if(gt->Timer.oil_error_time == 30)
						{
								gt->RealGear--;
						}
						ret = FALSE;
				}
		}
		/* 油温下降，恢复到原来的档位 */
		else if( (gt->TempDownFlag == SET)&&(te->CoilTemp <= OIL_LOW_LIMIT_TEMP) )
		{
				gt->Timer.oil_error_time =0;
				if(gt->TempDownFlag == SET)
				{
						/* 从TempGear恢复RealGear */
						gt->RealGear = gt->TempGear;
						gt->TempDownFlag = RESET;
				}
				ret = TRUE;
		}
		return ret;
}
#endif
/*
 * 函数名：zoneTemperatureProtection
 * 描述  ：zone温度控制保护函数
 * 输入  : te               Zone的温度&错误代码结构体指针
 *         type_T           Zone的温度类型选择
 *         high_temp_limit  高温限制
 *         low_temp_limit   低温限制
 *         
 * 返回  : TRUE 油温没有超标，FALSE 油温超标
 */
static eResult zoneTemperatureProtection(pZ_TempErrDef te, Zone_TempTypeSelect type_T, uint16_t high_temp_limit, uint16_t low_temp_limit)
{
		uint16_t tmp;
		uint8_t  *tim;
		eResult ret;
		pGear_Time_CON  gt;//定义一个时间&档位控制器结构体指针
	
		/* 获取温度值 */
		tmp = (type_T == T_COIL)?(te->CoilTemp):(te->IgbtTemp);
		/* 根据所选coil或者igbt温度类型获取相应的超温时间指针 */
		tim = (type_T == T_COIL)?(&te->OverTempTime_Coil):(&te->OverTempTime_Igbt);
	
		/* 开路或者短路，AD值错误，直接清除GT信息，关闭GT控制器,返回FALSE */
		if ( (tmp == NTC_ERROR_OPEN)||(tmp == NTC_ERROR_SHORT_CIRCUIT) )
		{
				memset(gt,0,sizeof(&gt));
				return FALSE;
		}
	 
		/* IGBT温度超过105度时，直接清除GT信息，关闭GT控制器 */
		if((type_T == T_IGBT)&&(tmp > 105))  
		{
				memset(gt,0,sizeof(&gt));
				return FALSE;
		}
			
		if(te == &g_Zone1_TE)
		{
			gt = (zoneLeft_State == ENABLE)?(&g_ZoneLeft_GT):(&g_Zone1_GT);
		}
		else if(te == &g_Zone2_TE)
		{
			gt = (zoneLeft_State == ENABLE)?(&g_ZoneLeft_GT):(&g_Zone2_GT);
		}
		else if(te == &g_Zone3_TE)
		{
			gt = (zoneRight_State == ENABLE)?(&g_ZoneRight_GT):(&g_Zone3_GT);
		}
		else if(te == &g_Zone4_TE)
		{
			gt = (zoneRight_State == ENABLE)?(&g_ZoneRight_GT):(&g_Zone4_GT);
		}

		/* 大于高温限温温度时，前10秒调功降一档 */
		if ( (tmp >= OIL_HIGH_LIMIT_TEMP)&&(*tim <255) )
		{
				/* 首先把RealGear保存起来 */
				gt->TempGear = gt->RealGear;
				/* 超温计时开始 */
				(*tim)++;
				/* 设置临时降档标志 */
				gt->TempDownFlag = SET;
				ret = FALSE;
		}
		else
		{	
				ret = TRUE;
		}
		/* 实际档位不为零才能降档 */
		if( (gt->RealGear)&&(gt->Gear)&&(gt->TempDownFlag == SET) )
		{
				/* 前10秒降1档 */
				if((*tim)++ == 1)
				{
						gt->RealGear--;
				}
				/* 过10秒降再1档 */
				else if(*tim == 10)
				{
						gt->RealGear--;
				}
				/* 过10秒再降1档 */
				else if(*tim == 20)
				{
						gt->RealGear--;
				}
				/* 从第45秒开始降再1档,最多降4次，后面根据测试的情况需要可以再加 */
				else if(*tim == 30)
				{
						gt->RealGear--;
				}
				ret = FALSE;
		}
		
		/* 温度下降，恢复到原来的档位 */
		else if( (gt->TempDownFlag == SET)&&(tmp <= OIL_LOW_LIMIT_TEMP) )
		{
				*tim = 0;
				if(gt->TempDownFlag == SET)
				{
						/* 从TempGear恢复RealGear */
						gt->RealGear = gt->TempGear;
						gt->TempDownFlag = RESET;
				}
				ret = TRUE;
		}
		return ret;
}

/*
 * 函数名：oilTemperatureCheck
 * 描述  ：油温检查函数,一秒监测一次
 * 输入  : 无
 * 返回  : 无
 */
static void oilTemperatureCheck(void)
{
//		oilTemperatureCtrl(&g_Zone1_TE);
//		oilTemperatureCtrl(&g_Zone2_TE);
//		oilTemperatureCtrl(&g_Zone3_TE);
//		oilTemperatureCtrl(&g_Zone4_TE);
		zoneTemperatureProtection(&g_Zone1_TE, T_COIL, OIL_HIGH_LIMIT_TEMP, OIL_LOW_LIMIT_TEMP);
		zoneTemperatureProtection(&g_Zone2_TE, T_COIL, OIL_HIGH_LIMIT_TEMP, OIL_LOW_LIMIT_TEMP);
		zoneTemperatureProtection(&g_Zone3_TE, T_COIL, OIL_HIGH_LIMIT_TEMP, OIL_LOW_LIMIT_TEMP);
		zoneTemperatureProtection(&g_Zone4_TE, T_COIL, OIL_HIGH_LIMIT_TEMP, OIL_LOW_LIMIT_TEMP);
}
#if 0
/*
 * 函数名：igbtTemperatureProtect
 * 描述  ：IGBT温度保护函数,一秒监测一次
 * 输入  : 无
 * 返回  : 无
 */
static eResult igbtTemperatureProtect (pZ_TempErrDef te)
{
		uint16_t tmp = 0;
		eResult ret;
		pGear_Time_CON  gt;//定义一个时间&档位控制器结构体指针
		
		/* 开路或者短路，AD值错误，直接返回FALSE */
		if ( (te->IgbtTemp == NTC_ERROR_OPEN)||(te->IgbtTemp == NTC_ERROR_SHORT_CIRCUIT) ) return FALSE;
	
		if(te == &g_Zone1_TE)
		{
			gt = (zoneLeft_State == ENABLE)?(&g_ZoneLeft_GT):(&g_Zone1_GT);
		}
		else if(te == &g_Zone2_TE)
		{
			gt = (zoneLeft_State == ENABLE)?(&g_ZoneLeft_GT):(&g_Zone2_GT);
		}
		else if(te == &g_Zone3_TE)
		{
			gt = (zoneRight_State == ENABLE)?(&g_ZoneRight_GT):(&g_Zone3_GT);
		}
		else if(te == &g_Zone4_TE)
		{
			gt = (zoneRight_State == ENABLE)?(&g_ZoneRight_GT):(&g_Zone4_GT);
		}
			
		/* 大于105度时，直接清除控制器信息 */
		if (te->IgbtTemp >= 105)
		{
				memset(gt,0,sizeof(&gt));
		}
		/* 大于100度时，前10秒调功降一档 */
		else if ( (te->IgbtTemp >= 100)&&(gt->Timer.igbt_error_time <255) )
		{
				/* 首先把RealGear保存起来 */
				gt->TempGear = gt->RealGear;
				/* 超温计时开始 */
				gt->Timer.igbt_error_time++;
				/* 设置临时降档标志 */
				gt->TempDownFlag = SET;
				/* 实际档位不为零才能降档 */
				if(gt->RealGear)
				{
						/* 从第1秒开始降1档 */
						if(gt->Timer.igbt_error_time == 1)
						{
								/* 首先把RealGear保存起来 */
								gt->TempGear = gt->RealGear;
								gt->TempDownFlag = SET;
								gt->RealGear--;
						}
						/* 从第10秒开始降再1档 */
						else if(gt->Timer.igbt_error_time == 10)
						{
								gt->RealGear--;
						}
						/* 从第20秒开始降再1档 */
						else if(gt->Timer.igbt_error_time == 20)
						{
								gt->RealGear--;
						}
						/* 从第30秒开始降再1档,最多降4次，后面根据测试的情况需要可以再加 */
						else if(gt->Timer.igbt_error_time == 30)
						{
								gt->RealGear--;
						}
						ret = FALSE;
				}
		}
		else
		{
				gt->Timer.igbt_error_time =0;
				if(gt->TempDownFlag == SET)
				{
						/* 从TempGear恢复RealGear */
						gt->RealGear = gt->TempGear;
						gt->TempDownFlag = RESET;
				}
				ret = TRUE;
		}
		return ret;
}
#endif
/*
 * 函数名：igbtTemperatureCheck
 * 描述  ：igbt超温检查函数,一秒监测一次
 * 输入  : 无
 * 返回  : 无
 */
static void igbtTemperatureCheck(void)
{
//		igbtTemperatureProtect(&g_Zone1_GT);
//		igbtTemperatureProtect(&g_Zone2_GT);
//		igbtTemperatureProtect(&g_Zone3_GT);
//		igbtTemperatureProtect(&g_Zone4_GT);
		zoneTemperatureProtection(&g_Zone1_TE, T_IGBT, IGBT_HIGH_LIMIT_TEMP, IGBT_LOW_LIMIT_TEMP);
		zoneTemperatureProtection(&g_Zone2_TE, T_IGBT, IGBT_HIGH_LIMIT_TEMP, IGBT_LOW_LIMIT_TEMP);
		zoneTemperatureProtection(&g_Zone3_TE, T_IGBT, IGBT_HIGH_LIMIT_TEMP, IGBT_LOW_LIMIT_TEMP);
		zoneTemperatureProtection(&g_Zone4_TE, T_IGBT, IGBT_HIGH_LIMIT_TEMP, IGBT_LOW_LIMIT_TEMP);
}

/*
 * 函数名：temperatureDetectionProcess
 * 描述  ：igbt及油温超温检查函数,一秒监测一次
 * 调用  ：main函数的if(secFlag）条件,需要放在reducePower函数之后
 * 输入  : 无
 * 返回  : 无
 */
void temperatureDetectionProcess(void)
{
		igbtTemperatureCheck();
		oilTemperatureCheck();
}

/*
 * 函数名：keepWarmProcess
 * 描述  ：保温处理函数
 * 输入  : 无
 * 返回  : 无
 */
static void keepWarmProcess(pGear_Time_CON gt, uint16_t tmp)
{
		if(gt->KeepWarmFlag == 1)
		{
				if(tmp <= 40)
				{
						gt->Gear = 3;
				}
				else if(tmp <= 60)
				{
						gt->Gear = 2;
				}
				else// if(tmp <= 85)
				{
						gt->Gear = 1;
				}
				gt->RealGear = gt->Gear;
		}
}

/*
 * 函数名：keepWarmProcess
 * 描述  ：保温处理函数
 * 输入  : 无
 * 返回  : 无
 */
void keepWarmFunction(void)
{
		uint16_t tmp;
	
		tmp = getTemperature(g_1st_MainBoard_Data.Stove_1st_Coil_Temp & 0x0FFF,COIL_NTC);
		keepWarmProcess(&g_Zone1_GT, tmp);
		tmp = getTemperature(g_1st_MainBoard_Data.Stove_2nd_Coil_Temp & 0x0FFF,COIL_NTC);
		keepWarmProcess(&g_Zone2_GT, tmp);
		tmp = getTemperature(g_2nd_MainBoard_Data.Stove_1st_Coil_Temp & 0x0FFF,COIL_NTC);
		keepWarmProcess(&g_Zone3_GT, tmp);
		tmp = getTemperature(g_2nd_MainBoard_Data.Stove_2nd_Coil_Temp & 0x0FFF,COIL_NTC);
		keepWarmProcess(&g_Zone4_GT, tmp);
}

/*
 * 函数名：BBQ_Function
 * 描述  ：保温处理函数
 * 输入  : 无
 * 返回  : 无
 */
void BBQ_Function(void)
{
		
		if(bbqEnable_Left == ENABLE)
		{
				g_BBQ_WorkTime_Left++;
				if(g_BBQ_WorkTime_Left <= 75)
				{
						if(TRUE == realTotalPowerCalculate(10))
						{
							g_ZoneLeft_GT.Gear = 10;								//更新档位信息
						}
				}
				else if(g_BBQ_WorkTime_Left <= 120)
				{
						g_ZoneLeft_GT.Gear = 8;
				}
				else if(g_BBQ_WorkTime_Left <= 300)
				{
						g_ZoneLeft_GT.Gear = 7;
				}
				else if(g_BBQ_WorkTime_Left <= 600)
				{
						g_ZoneLeft_GT.Gear = 6;
				}
				else if(g_BBQ_WorkTime_Left > 600)
				{
						g_ZoneLeft_GT.Gear = 5;
				}
				
				g_ZoneLeft_GT.RealGear = g_ZoneLeft_GT.Gear;
		}
		
		if(bbqEnable_Right == ENABLE)
		{
				g_BBQ_WorkTime_Right++;
				if(g_BBQ_WorkTime_Right <= 75)
				{
						if(TRUE == realTotalPowerCalculate(10))
						{
							g_ZoneRight_GT.Gear = 10;								//更新档位信息
						}
				}
				else if(g_BBQ_WorkTime_Right <= 120)
				{
						g_ZoneRight_GT.Gear = 8;
				}
				else if(g_BBQ_WorkTime_Right <= 300)
				{
						g_ZoneRight_GT.Gear = 7;
				}
				else if(g_BBQ_WorkTime_Right <= 600)
				{
						g_ZoneRight_GT.Gear = 6;
				}
				else if(g_BBQ_WorkTime_Right > 600)
				{
						g_ZoneRight_GT.Gear = 5;
				}
				
				g_ZoneRight_GT.RealGear = g_ZoneRight_GT.Gear;
		}
}
