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

/* �������ޣ���ֹ�Ż� */
#define OIL_HIGH_LIMIT_TEMP   240
/* �������� ��֤���͵Ļ��� */
#define OIL_LOW_LIMIT_TEMP   (OIL_HIGH_LIMIT_TEMP - 30)
/* IGBT�¶����� */
#define IGBT_HIGH_LIMIT_TEMP  100
/* IGBT�¶����� */
#define IGBT_LOW_LIMIT_TEMP  (IGBT_HIGH_LIMIT_TEMP - 10)

/* ����4��ZONE���¶�&�������ṹ�� */
Z_TempErrDef  g_Zone1_TE, g_Zone2_TE, g_Zone3_TE, g_Zone4_TE;

ErrorStatus   mainBoardConnect = ERROR;

static FlagStatus    g_CommunicationFlag = RESET;

/* �豸����ʱ���ʱ�� */
uint8_t g_DevIdleTimer = 0;
/* �豸���б�־ */
FlagStatus idleFlag = SET;
/* ��BBQ����ʱ�� */
uint16_t g_BBQ_WorkTime_Left = 0;
/* ��BBQ����ʱ�� */
uint16_t g_BBQ_WorkTime_Right = 0;
/* ��BBQʹ�� */
FunctionalState bbqEnable_Left = DISABLE;
/* ��BBQʹ�� */
FunctionalState bbqEnable_Right = DISABLE;

/********** 8�׹��ʷ��� *****************/
uint16_t const g_PowerScheme[POWER_SCHEME_NUM] = {7400, 2000, 2500, 3000, 3500, 4500, 5500, 6800};
	
/********** ����״̬���� ****************  0, 1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,  P  ****/
uint16_t const g_PowerLevel_BigZone[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1300,1400,1500,1800};
	
/**************** 1#���� ****************  0, 1,  2,  3, 4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,   P  ****/
//uint16_t const g_PowerLevel_Stove_1[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,3000};
uint16_t const g_PowerLevel_Stove_1[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,2900};
/**************** 2#���� ****************  0, 1,  2,  3, 4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,   P  ****/
uint16_t const g_PowerLevel_Stove_2[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,3350};
//uint16_t const g_PowerLevel_Stove_2[17] = {0,50,100,200,300,500,600,700,800,900,1100,1200,1400,1500,1600,2000,2600};
/**************** 3#���� ****************  0, 1, 2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,   P  ****/
//uint16_t const g_PowerLevel_Stove_3[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1500,1600,2000,2600};
uint16_t const g_PowerLevel_Stove_3[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1500,1600,2000,1900};
/**************** 4#���� ****************  0, 1, 2,  3,  4,  5,  6,  7,  8,  9,  10,   11, 12,  13,  14,  15,  P  ****/
uint16_t const g_PowerLevel_Stove_4[17] = {0,50,100,200,300,400,500,600,700,800,1000,1100,1200,1300,1400,1500,2350};
	
/* �������� */
uint16_t g_TotalPower;
/* ���ʷ���ѡ�����������Ӧg_PowerScheme����Ĺ��� */
uint8_t g_PowerSchemeIdx = DEFAULT_TOTAL_POWER;
	
uint8_t g_SysErrorCode = 0;
	
extern TIM_HandleTypeDef htim3;

/*
 * ��������fan_PWM_Conctrol
 * ����  ������PWM����
 * ����  ��power_percent (��Χ��0-100��
 * ����  : ��
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
 * ��������getPowerSchemeFromFlash
 * ����  ����flash��ָ����ַ�������ʷ���
 * ����  ����
 * ����  : �豸���ܹ�����ֵ
 */
static uint32_t getPowerSchemeFromFlash(void)
{
		uint32_t val32_L, val32_H;
		readDoubleWordEmbeddedFlash(FLASH_PAGE62_START_ADDR, 0, &val32_L, &val32_H);
		return val32_L;
}

/*
 * ��������savePowerSchemeToFlash
 * ����  �����湦�ʷ�����flashd��ָ����ַ
 * ����  ��dat �豸���ܹ�����ֵ
 * ����  : ��
 */
void savePowerSchemeToFlash(uint32_t dat)
{
		writeDoubleWordEmbeddedFlash(FLASH_PAGE62, FLASH_PAGE62_START_ADDR, 0, dat);
}

/*
 * ��������defaultPowerSchemeSetting
 * ����  ��ȱʡ���ʷ�������
 * ����  ����
 * ����  : ��
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
 * ��������powerOffDeal
 * ����  ���ػ����㴦��
 * ����  ����
 * ����  : ��
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
 * ��������reducePower_Single
 * ����  ���������͹���
 * ����  ����
 * ����  : ��
 */
static void reducePower_Single(pGear_Time_CON  pGR)
{
		/* boost��λ���� */
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
 * ��������reducePower_Double
 * ����  ��˫�����͹���
 * ����  ����
 * ����  : ��
 */
static void reducePower_Double(pGear_Time_CON  pGR)
{
		/* boost��λ���� */
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
 * ��������reducePower_Three
 * ����  ���������͹���
 * ����  ����
 * ����  : ��
 */
static void reducePower_Three(pGear_Time_CON  pGR)
{
		/* boost��λ���� */
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
 * ��������reducePower_Four
 * ����  ���Ŀ����͹���
 * ����  ����
 * ����  : ��
 */
static void reducePower_Four(pGear_Time_CON  pGR)
{
		/* boost��λ���� */
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
 * ��������generalPowerReduction
 * ����  �����͹���
 * ����  ����
 * ����  : ��
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
 * ��������powerTabelAllot
 * ����  �������б�ָ�ɣ�ָ������/����״̬��Ӧ�Ĺ����б�
 * ����  ����
 * ����  ����
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
 * ��������powerLimitAlgorithm
 * ����  ����������Ĺ��������㷨
 * ����  ��gear_input ��λ
 * ����  ��TRUE ���빦��������FALSE ���빦�ʳ���
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
 * ��������realTotalPowerCalculate
 * ����  ������ʵ�ʹ��ʼ���
 * ����  ����
 * ����  ����
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
 * ��������get_ZoneTemp
 * ����  ����ȡZone�¶�
 * ����  ��void
 * ����  : void
 * ����  ��get_MainBoard_Message
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
 * ��������generateErrorCode
 * ����  �����ɴ������
 * ����  ��state  ״̬�룬
 *         t_coil �����¶�
 *         t_igbt IGBT�¶�
 * ����  : ���ϴ���
 */
static uint8_t generateErrorCode(uint16_t state, uint16_t t_coil, uint16_t t_igbt)
{
		uint8_t err_buf;
		if(g_CommunicationFlag != SET)  err_buf = DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID;  //ͨ��ʧ��
		else if(g_1st_MainBoard_Data.Stove_1st_State & PVHighErr)  g_SysErrorCode = HighVoltageInput, err_buf = HIGH_VOLTAGE_INPUT_PROTECT;//��ѹ����
		else if(g_1st_MainBoard_Data.Stove_1st_State & PVLowErr)  g_SysErrorCode = LowVoltageInput, err_buf = LOW_VOLTAGE_INPUT_PROTECT;//��ѹ����
		else if(t_coil == NTC_ERROR_OPEN)  err_buf = OPEN_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//Ģ��ͷ��·
		else if(t_coil == NTC_ERROR_SHORT_CIRCUIT)  err_buf = SHORT_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//Ģ��ͷ��·
		else if(t_igbt == NTC_ERROR_SHORT_CIRCUIT)  err_buf = SHORT_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//IGBT��·	
		else if(t_igbt == NTC_ERROR_OPEN)  err_buf = OPEN_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR;//IGBT��·
		else if(t_coil > CRYSTAL_PLATE_LIMIT_TEMPERATURE) err_buf = HEAT_PROTECTION_ON_ZONE;//�������
		else if(t_igbt > CRYSTAL_PLATE_LIMIT_TEMPERATURE) err_buf = HEAT_PROTECTION_OF_IGBT;//IGBT����
		else   err_buf = TROUBLE_FREE;  //�޹���
		return err_buf;
}

/*
 * ��������get_ErrCode
 * ����  ����ȡ�������
 * ����  ��void
 * ����  : void
 * ����  ��get_MainBoard_Message
 */
static void get_ErrCode(void)
{
		g_Zone1_TE.ErrCode = generateErrorCode(g_1st_MainBoard_Data.Stove_1st_State, g_Zone1_TE.CoilTemp, g_Zone1_TE.IgbtTemp);
		g_Zone2_TE.ErrCode = generateErrorCode(g_1st_MainBoard_Data.Stove_2nd_State, g_Zone2_TE.CoilTemp, g_Zone2_TE.IgbtTemp);
		g_Zone3_TE.ErrCode = generateErrorCode(g_2nd_MainBoard_Data.Stove_1st_State, g_Zone3_TE.CoilTemp, g_Zone3_TE.IgbtTemp);
		g_Zone4_TE.ErrCode = generateErrorCode(g_2nd_MainBoard_Data.Stove_2nd_State, g_Zone4_TE.CoilTemp, g_Zone4_TE.IgbtTemp);
}

/*
 * ��������get_MainBoard_Message
 * ����  ����������Ĵ�����Ϣ
 * ����  ����
 * ����  : ��
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
						/* ��λͨ�ű�־ */
						g_CommunicationFlag = SET;
						mainBoardConnect = SUCCESS;
						if(addr == 0xA0)//��һ������ĵ�ַ
						{
								memcpy(&g_1st_MainBoard_Data, &MainBoard_Fram_Record .Data_RX_BUF, 26);//�������ڽ��ջ����������ݵ�����1���ջ�������Ӧ���ڴ��
						}
						else if(addr == 0xA1)//�ڶ�������ĵ�ַ
						{
								memcpy(&g_2nd_MainBoard_Data, &MainBoard_Fram_Record .Data_RX_BUF, 26);//�������ڽ��ջ����������ݵ�����2���ջ�������Ӧ���ڴ��
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
 * ��������update_MB_Ctrl_Parm
 * ����  �����Ϳ��Ʋ��������壬����������Ʋ���
 * ����  ��pt1, �����ϵ�һ��¯ͷ��λ&ʱ��������Ľṹ��ָ��
 *         pt2, �����ϵڶ���¯ͷ��λ&ʱ��������Ľṹ��ָ��
 *         target����������ṹ��ָ��
 * ����  : ��
 */
void update_MB_Ctrl_Parm(pGear_Time_CON pt1, pGear_Time_CON pt2, uint8_t addr)
{
		uint8_t i;
		MB_CON_PARM  target = {0};
		uint8_t *ptr = (uint8_t *)&target;
		/* ��λͨ�ű�־ */
		g_CommunicationFlag = RESET;
		
		target.Addr = addr;
	
		/* �е�λ�ʹ�¯ͷ,����ر�¯ͷ */
		if(pt1->RealGear)
		{		
				target.SetState1 |= STOVE_ENABLE;
		}
		else
		{
				target.SetState1 &= ~STOVE_ENABLE;
		}
		/* �е�λ�ʹ�¯ͷ,����ر�¯ͷ */
		if(pt2->RealGear)
		{		
				target.SetState2 |= STOVE_ENABLE;
		}
		else
		{
				target.SetState2 &= ~STOVE_ENABLE;
		}
		/* �е�λ���ǿ���״̬ */
		if( idleFlag == RESET )
		{		/* ֻҪ�е�λ�ʹ򿪷��� */
				target.SetState1 |= (FAN_ENABLE | POWER1_ENABLE);
				target.SetState2 |= (FAN_ENABLE | POWER1_ENABLE);
				RELAY_ON();
				FAN_ON();
//				fan_PWM_Conctrol(100);
		}
		/* ����״̬ */
		else
		{
				target.SetState1 = 0;
				target.SetState2 = 0;
				RELAY_OFF();
				FAN_OFF();
//				fan_PWM_Conctrol(0);
		}
		
		/* ��¯ͷ��λ��Ӧ�Ĺ���ֵ������������ṹ��ָ��Ĺ���ֵ */
		target.SetPower1 = pt1->PowerTabel[pt1->RealGear];
		target.SetPower2 = pt2->PowerTabel[pt2->RealGear];

		/* У��ͼ������� */
		target.ChkSum = 0;
		for(i=0;i<7;i++)
		{		/* ����У��� */
				target.ChkSum += *ptr++;
		}
		
		HAL_UART_Transmit(&huart3,  (uint8_t *)&target,8, 0xFFFF);
}

/*
 * ��������send_ControlMsgToMainBoard
 * ����  ��������������Ŀ��Ʋ���������������Ʋ���
 * ����  : ��
 * ����  : ��
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
 * ��������send_ControlMsgToMainBoard
 * ����  �����Ϳհ׿��Ʋ���������
 * ����  : ��
 * ����  : ��
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
 * ��������oilTemperatureCtrl
 * ����  �����¿��ƺ���
 * ����  : te Zone���¶�&�������ṹ��ָ��
 * ����  : TRUE ����û�г��꣬FALSE ���³���
 */
static eResult oilTemperatureCtrl(pZ_TempErrDef te)
{
		uint16_t tmp;
		eResult ret;
		pGear_Time_CON  gt;//����һ��ʱ��&��λ�������ṹ��ָ��
	
		/* ��·���߶�·��ADֵ����ֱ�ӷ���FALSE */
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

		/* ����260��ʱ��ǰ10�������һ�� */
		if ( (te->CoilTemp >= OIL_HIGH_LIMIT_TEMP)&&(gt->Timer.oil_error_time <255) )
		{
				/* ���Ȱ�RealGear�������� */
				gt->TempGear = gt->RealGear;
				/* ���¼�ʱ��ʼ */
				gt->Timer.oil_error_time++;
				/* ������ʱ������־ */
				gt->TempDownFlag = SET;
				/* ʵ�ʵ�λ��Ϊ����ܽ��� */
				if( (gt->RealGear)&&(gt->Gear)&&(gt->TempDownFlag == SET) )
				{
						/* ǰ10�뽵1�� */
						if(gt->Timer.oil_error_time == 1)
						{
								gt->RealGear--;
						}
						/* ��10�뽵��1�� */
						else if(gt->Timer.oil_error_time == 10)
						{
								gt->RealGear--;
						}
						/* ��10���ٽ�1�� */
						else if(gt->Timer.oil_error_time == 20)
						{
								gt->RealGear--;
						}
						/* �ӵ�45�뿪ʼ����1��,��ཱུ4�Σ�������ݲ��Ե������Ҫ�����ټ� */
						else if(gt->Timer.oil_error_time == 30)
						{
								gt->RealGear--;
						}
						ret = FALSE;
				}
		}
		/* �����½����ָ���ԭ���ĵ�λ */
		else if( (gt->TempDownFlag == SET)&&(te->CoilTemp <= OIL_LOW_LIMIT_TEMP) )
		{
				gt->Timer.oil_error_time =0;
				if(gt->TempDownFlag == SET)
				{
						/* ��TempGear�ָ�RealGear */
						gt->RealGear = gt->TempGear;
						gt->TempDownFlag = RESET;
				}
				ret = TRUE;
		}
		return ret;
}
#endif
/*
 * ��������zoneTemperatureProtection
 * ����  ��zone�¶ȿ��Ʊ�������
 * ����  : te               Zone���¶�&�������ṹ��ָ��
 *         type_T           Zone���¶�����ѡ��
 *         high_temp_limit  ��������
 *         low_temp_limit   ��������
 *         
 * ����  : TRUE ����û�г��꣬FALSE ���³���
 */
static eResult zoneTemperatureProtection(pZ_TempErrDef te, Zone_TempTypeSelect type_T, uint16_t high_temp_limit, uint16_t low_temp_limit)
{
		uint16_t tmp;
		uint8_t  *tim;
		eResult ret;
		pGear_Time_CON  gt;//����һ��ʱ��&��λ�������ṹ��ָ��
	
		/* ��ȡ�¶�ֵ */
		tmp = (type_T == T_COIL)?(te->CoilTemp):(te->IgbtTemp);
		/* ������ѡcoil����igbt�¶����ͻ�ȡ��Ӧ�ĳ���ʱ��ָ�� */
		tim = (type_T == T_COIL)?(&te->OverTempTime_Coil):(&te->OverTempTime_Igbt);
	
		/* ��·���߶�·��ADֵ����ֱ�����GT��Ϣ���ر�GT������,����FALSE */
		if ( (tmp == NTC_ERROR_OPEN)||(tmp == NTC_ERROR_SHORT_CIRCUIT) )
		{
				memset(gt,0,sizeof(&gt));
				return FALSE;
		}
	 
		/* IGBT�¶ȳ���105��ʱ��ֱ�����GT��Ϣ���ر�GT������ */
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

		/* ���ڸ��������¶�ʱ��ǰ10�������һ�� */
		if ( (tmp >= OIL_HIGH_LIMIT_TEMP)&&(*tim <255) )
		{
				/* ���Ȱ�RealGear�������� */
				gt->TempGear = gt->RealGear;
				/* ���¼�ʱ��ʼ */
				(*tim)++;
				/* ������ʱ������־ */
				gt->TempDownFlag = SET;
				ret = FALSE;
		}
		else
		{	
				ret = TRUE;
		}
		/* ʵ�ʵ�λ��Ϊ����ܽ��� */
		if( (gt->RealGear)&&(gt->Gear)&&(gt->TempDownFlag == SET) )
		{
				/* ǰ10�뽵1�� */
				if((*tim)++ == 1)
				{
						gt->RealGear--;
				}
				/* ��10�뽵��1�� */
				else if(*tim == 10)
				{
						gt->RealGear--;
				}
				/* ��10���ٽ�1�� */
				else if(*tim == 20)
				{
						gt->RealGear--;
				}
				/* �ӵ�45�뿪ʼ����1��,��ཱུ4�Σ�������ݲ��Ե������Ҫ�����ټ� */
				else if(*tim == 30)
				{
						gt->RealGear--;
				}
				ret = FALSE;
		}
		
		/* �¶��½����ָ���ԭ���ĵ�λ */
		else if( (gt->TempDownFlag == SET)&&(tmp <= OIL_LOW_LIMIT_TEMP) )
		{
				*tim = 0;
				if(gt->TempDownFlag == SET)
				{
						/* ��TempGear�ָ�RealGear */
						gt->RealGear = gt->TempGear;
						gt->TempDownFlag = RESET;
				}
				ret = TRUE;
		}
		return ret;
}

/*
 * ��������oilTemperatureCheck
 * ����  �����¼�麯��,һ����һ��
 * ����  : ��
 * ����  : ��
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
 * ��������igbtTemperatureProtect
 * ����  ��IGBT�¶ȱ�������,һ����һ��
 * ����  : ��
 * ����  : ��
 */
static eResult igbtTemperatureProtect (pZ_TempErrDef te)
{
		uint16_t tmp = 0;
		eResult ret;
		pGear_Time_CON  gt;//����һ��ʱ��&��λ�������ṹ��ָ��
		
		/* ��·���߶�·��ADֵ����ֱ�ӷ���FALSE */
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
			
		/* ����105��ʱ��ֱ�������������Ϣ */
		if (te->IgbtTemp >= 105)
		{
				memset(gt,0,sizeof(&gt));
		}
		/* ����100��ʱ��ǰ10�������һ�� */
		else if ( (te->IgbtTemp >= 100)&&(gt->Timer.igbt_error_time <255) )
		{
				/* ���Ȱ�RealGear�������� */
				gt->TempGear = gt->RealGear;
				/* ���¼�ʱ��ʼ */
				gt->Timer.igbt_error_time++;
				/* ������ʱ������־ */
				gt->TempDownFlag = SET;
				/* ʵ�ʵ�λ��Ϊ����ܽ��� */
				if(gt->RealGear)
				{
						/* �ӵ�1�뿪ʼ��1�� */
						if(gt->Timer.igbt_error_time == 1)
						{
								/* ���Ȱ�RealGear�������� */
								gt->TempGear = gt->RealGear;
								gt->TempDownFlag = SET;
								gt->RealGear--;
						}
						/* �ӵ�10�뿪ʼ����1�� */
						else if(gt->Timer.igbt_error_time == 10)
						{
								gt->RealGear--;
						}
						/* �ӵ�20�뿪ʼ����1�� */
						else if(gt->Timer.igbt_error_time == 20)
						{
								gt->RealGear--;
						}
						/* �ӵ�30�뿪ʼ����1��,��ཱུ4�Σ�������ݲ��Ե������Ҫ�����ټ� */
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
						/* ��TempGear�ָ�RealGear */
						gt->RealGear = gt->TempGear;
						gt->TempDownFlag = RESET;
				}
				ret = TRUE;
		}
		return ret;
}
#endif
/*
 * ��������igbtTemperatureCheck
 * ����  ��igbt���¼�麯��,һ����һ��
 * ����  : ��
 * ����  : ��
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
 * ��������temperatureDetectionProcess
 * ����  ��igbt�����³��¼�麯��,һ����һ��
 * ����  ��main������if(secFlag������,��Ҫ����reducePower����֮��
 * ����  : ��
 * ����  : ��
 */
void temperatureDetectionProcess(void)
{
		igbtTemperatureCheck();
		oilTemperatureCheck();
}

/*
 * ��������keepWarmProcess
 * ����  �����´�����
 * ����  : ��
 * ����  : ��
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
 * ��������keepWarmProcess
 * ����  �����´�����
 * ����  : ��
 * ����  : ��
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
 * ��������BBQ_Function
 * ����  �����´�����
 * ����  : ��
 * ����  : ��
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
							g_ZoneLeft_GT.Gear = 10;								//���µ�λ��Ϣ
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
							g_ZoneRight_GT.Gear = 10;								//���µ�λ��Ϣ
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
