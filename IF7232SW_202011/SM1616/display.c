#include "display.h"
#include "sm1616_dev.h"
#include "key.h"
#include "power_level_manage.h"
#include "usart.h"
#include "tim.h"
#include "ntc.h"
#include <string.h>

#define		POWER1_ENABLE  					0x01
#define		STOVE_ENABLE 						0x40
#define		FAN_ENABLE							0x80

__IO FlagStatus   secFlag;

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
__IO FlagStatus		ms200_flag = RESET;

__IO uint8_t		g_200ms_cnt;											//200ms������һ����λ��200ms
__IO uint8_t 		g_ShortFlash_Cnt;									//����˸������
__IO uint8_t 		g_GeneralFlash_Cnt;								//ͨ����˸������������˸��

__IO uint8_t		g_TimeOutCnt;											//��ʱ���������������Ƽ��λ��ĳ�ʱʱ��
__IO uint8_t		g_Beep_Cnt;												//������ʱ��������

__IO uint8_t		g_General_FlashFlag_500ms;				//500ms��ʾ��־
__IO uint8_t		g_General_FlashFlag_1s;						//1s��˸��־

uint8_t					g_Disp_Buf[16] = {0};							//�������ʾ������
uint16_t				g_RunningTime = 0;								//�����������е�ʱ��

FlagStatus			g_Zone1Gear_FlashFlag_Long = RESET;//1#��λ��ʱ����˸��־
FlagStatus			g_Zone2Gear_FlashFlag_Long = RESET;//2#��λ��ʱ����˸��־
FlagStatus			g_Zone3Gear_FlashFlag_Long = RESET;//3#��λ��ʱ����˸��־
FlagStatus			g_Zone4Gear_FlashFlag_Long = RESET;//4#��λ��ʱ����˸��־
FlagStatus			g_ZoneLeftGear_FlashFlag_Long = RESET;//��������λ��ʱ����˸��־
FlagStatus			g_ZoneRightGear_FlashFlag_Long = RESET;//��������λ��ʱ����˸��־

MB_RCV_MSG g_1st_MainBoard_Data, g_2nd_MainBoard_Data;

extern Z_TempErrDef  g_Zone1_TE, g_Zone2_TE, g_Zone3_TE, g_Zone4_TE;
extern FlagStatus		 g_GearError_Flag;
extern uint8_t       g_Err_BeepTimes;

static void powerSchemeDisplay(void);

/*
 * ��������disp_Init
 * ����  ��������ʾ��ʼ��
 * ����  ����
 * ����  : ��
 */
void disp_Init(void)
{
	uint8_t i;
	Beep_On(30);
	for(i=0;i<16;i++)
	{
		g_Disp_Buf[i] = 0xFF;
	}
	
	powerSchemeDisplay();
	
	sm1616_Display(g_Disp_Buf);
	
	HAL_Delay(500);
	for(i=0;i<16;i++)
	{
		g_Disp_Buf[i] = 0;
	}
	
	sm1616_Display(g_Disp_Buf);
	
}

void clearDispBuf(void)
{
		uint8_t i;
		for(i=0;i<16;i++)
		{
			g_Disp_Buf[i] = 0;
		}
}

/*
 * ��������clearAllLongFlashFlag
 * ����  ��������г���˸�ı�־
 * ����  ����
 * ����  : ��
 */
void clearAllLongFlashFlag(void)
{
		g_Zone1Gear_FlashFlag_Long = RESET;
		g_Zone2Gear_FlashFlag_Long = RESET;
		g_Zone3Gear_FlashFlag_Long = RESET;
		g_Zone4Gear_FlashFlag_Long = RESET;
}

/*
 * ��������get_Min_Timer
 * ����  ��ȡ��С��ʱ��
 * ����  ��6��¯ͷ����� ��λ&ʱ�� pGear_Time_CON�ṹ��ָ��
 * ����  : ��С ��λ&ʱ�� pGear_Time_CON�ṹ��ָ��
 */
pGear_Time_CON get_Min_Timer(pGear_Time_CON t1, pGear_Time_CON t2, pGear_Time_CON t3, 
														pGear_Time_CON t4, pGear_Time_CON t5, pGear_Time_CON t6)
{
		pGear_Time_CON buf[] = {t1,t2,t3,t4,t5,t6};
		pGear_Time_CON min_Val =NULL;
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
 * ��������isTimerAvailableDisplay
 * ����  ����ʱ��־��ʾ������������·���С�����ʾ
 * ����  ��t      ����λ&ʱ�������ָ��
 *         dis_Idx�������λ�����
 * ����  : ��
 */
void isTimerAvailableDisplay(pGear_Time_CON t, uint8_t dis_Idx)
{
		if(t->Timer.Minute)											//�ж�ʱ
		{
				g_Disp_Buf[dis_Idx] |= DIS_DOT;			//��λ���·���ʾ dot
		}
		else
		{
				g_Disp_Buf[dis_Idx] &= ~DIS_DOT;		//��λ���·�����ʾ dot
		}	
}

/*
 * ��������zone_GearDisplayDeal
 * ����  ����λ��ʾ����
 * ����  ��cur_zone   ����ǰ�ĵ�λ&ʱ�������ָ��
 *         tube_ten   ����λ�����ʮλ��λ�����
 *         tube_single����λ����ܸ�λ��λ�����
 * ����  : ��
 */
void zone_GearDisplayDeal(pGear_Time_CON cur_zone, uint8_t tube_ten, uint8_t tube_single)
{
		if( (g_CurrentZone == cur_zone)&&(g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_GEAR) )
		{
				g_Disp_Buf[tube_ten] = BLK_;
				g_Disp_Buf[tube_single] = BLK_;
		}
		else
		{
				if(cur_zone->Gear == BOOST_GEAR)
				{
						g_Disp_Buf[tube_ten] = CHR_B;
						g_Disp_Buf[tube_single] = CHR_O;
				}
				else
				{
						g_Disp_Buf[tube_ten] = disp_table[cur_zone->Gear/10];
						g_Disp_Buf[tube_single] = disp_table[cur_zone->Gear%10];
				}
				isTimerAvailableDisplay(cur_zone,tube_single);
		}
}

/*
 * ��������allZone_GearDisplay
 * ����  �����е�λ��ʾ����
 * ����  ����
 * ����  : ��
 */
void allZone_GearDisplay(void)
{
		zone_GearDisplayDeal(&g_Zone1_GT,TUBE1,TUBE2);
		zone_GearDisplayDeal(&g_Zone2_GT,TUBE5,TUBE6);
		zone_GearDisplayDeal(&g_ZoneLeft_GT,TUBE3,TUBE4);
		zone_GearDisplayDeal(&g_Zone3_GT,TUBE9,TUBE10);
		zone_GearDisplayDeal(&g_Zone4_GT,TUBE13,TUBE14);
		zone_GearDisplayDeal(&g_ZoneRight_GT,TUBE11,TUBE12);
}

/*
 * ��������Zone_GearDisplay_Select
 * ����  �����������ĵ�λ��ʾѡ����
 * ����  ����
 * ����  : ��
 */
void Zone_GearDisplay_Select(void)
{
		if(zoneLeft_State == DISABLE)
		{
				g_Disp_Buf[TUBE3] = BLK_;
				g_Disp_Buf[TUBE4] = BLK_;
		}
		else
		{
				g_Disp_Buf[TUBE1] = BLK_;
				g_Disp_Buf[TUBE2] = BLK_;
				g_Disp_Buf[TUBE5] = BLK_;
				g_Disp_Buf[TUBE6] = BLK_;
		}
		
		if(zoneRight_State == DISABLE)
		{
				g_Disp_Buf[TUBE11] = BLK_;
				g_Disp_Buf[TUBE12] = BLK_;
		}
		else
		{
				g_Disp_Buf[TUBE9] = BLK_;
				g_Disp_Buf[TUBE10] = BLK_;
				g_Disp_Buf[TUBE13] = BLK_;
				g_Disp_Buf[TUBE14] = BLK_;
		}
}

/*
 * ��������min_TimerDisplay
 * ����  ����С��ʱ����־��ʾ����λ���·�С��������
 * ����  ����
 * ����  : ��
 */
void min_TimerDisplay(void)
{
		pGear_Time_CON min_ZoneTimer = NULL;
		min_ZoneTimer = get_Min_Timer(&g_Zone1_GT,&g_Zone2_GT,&g_Zone3_GT,&g_Zone4_GT,&g_ZoneLeft_GT,&g_ZoneRight_GT);
		if(min_ZoneTimer != NULL)
		{
				if(min_ZoneTimer == &g_Zone1_GT)
				{
							g_CurrentZone = &g_Zone1_GT;
							if(g_General_FlashFlag_500ms == SET)
							{
									g_Disp_Buf[TUBE2] &= ~DIS_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE2] |= DIS_DOT;
							}
				}
				else if(min_ZoneTimer == &g_Zone2_GT)
				{
							g_CurrentZone = &g_Zone2_GT;
							if(g_General_FlashFlag_500ms == SET)
							{
									g_Disp_Buf[TUBE6] &= ~DIS_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE6] |= DIS_DOT;
							}
				}
				else if(min_ZoneTimer == &g_Zone3_GT)
				{
							g_CurrentZone = &g_Zone3_GT;
							if(g_General_FlashFlag_500ms == SET)
							{
									g_Disp_Buf[TUBE10] &= ~DIS_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE10] |= DIS_DOT;
							}
				}
				else if(min_ZoneTimer == &g_Zone4_GT)
				{
							g_CurrentZone = &g_Zone4_GT;
							if(g_General_FlashFlag_500ms == SET)
							{
									g_Disp_Buf[TUBE14] &= ~DIS_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE14] |= DIS_DOT;
							}
				}
				else if(min_ZoneTimer == &g_ZoneLeft_GT)
				{
							g_CurrentZone = &g_ZoneLeft_GT;
							if(g_General_FlashFlag_500ms == SET)
							{
									g_Disp_Buf[TUBE4] &= ~DIS_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE4] |= DIS_DOT;
							}
				}
				else if(min_ZoneTimer == &g_ZoneRight_GT)
				{
							g_CurrentZone = &g_ZoneRight_GT;
							if(g_General_FlashFlag_500ms == SET)
							{
									g_Disp_Buf[TUBE12] &= ~DIS_DOT;
							}
							else
							{
									g_Disp_Buf[TUBE12] |= DIS_DOT;
							}
				}
		}
		else
		{
				g_CurrentZone = NULL;
		}
}

/*
 * ��������neutralGear_Display_Deal
 * ����  ��0����ʾ����
 * ����  ����
 * ����  : ��
 */
void zeroGear_Display_Deal(void)
{
		if(g_Zone1_GT.Gear == 0)
		{
				g_Disp_Buf[TUBE1] = DIS_SEG_G;
				g_Disp_Buf[TUBE2] = DIS_SEG_G;
		}
		if(g_Zone2_GT.Gear == 0)
		{
				g_Disp_Buf[TUBE5] = DIS_SEG_G;
				g_Disp_Buf[TUBE6] = DIS_SEG_G;
		}
		if(g_Zone3_GT.Gear == 0)
		{
				g_Disp_Buf[TUBE9] = DIS_SEG_G;
				g_Disp_Buf[TUBE10] = DIS_SEG_G;
		}
		if(g_Zone4_GT.Gear == 0)
		{
				g_Disp_Buf[TUBE13] = DIS_SEG_G;
				g_Disp_Buf[TUBE14] = DIS_SEG_G;
		}	
		if(g_ZoneLeft_GT.Gear == 0)
		{
				g_Disp_Buf[TUBE3] = DIS_SEG_G;
				g_Disp_Buf[TUBE4] = DIS_SEG_G;
		}
		if(g_ZoneRight_GT.Gear == 0)
		{
				g_Disp_Buf[TUBE11] = DIS_SEG_G;
				g_Disp_Buf[TUBE12] = DIS_SEG_G;
		}	
}

/*
 * ��������keepWarm_Display_Deal
 * ����  �����µ���ʾ����
 * ����  ����
 * ����  : ��
 */
void keepWarm_Display_Deal(void)
{
		if(g_Zone1_GT.KeepWarmFlag == 1)
		{
				g_Disp_Buf[TUBE1] = DIS_A;
				g_Disp_Buf[TUBE2] = DIS_A;
		}
		if(g_Zone2_GT.KeepWarmFlag == 1)
		{
				g_Disp_Buf[TUBE5] = DIS_A;
				g_Disp_Buf[TUBE6] = DIS_A;
		}
		if(g_Zone3_GT.KeepWarmFlag == 1)
		{
				g_Disp_Buf[TUBE9] = DIS_A;
				g_Disp_Buf[TUBE10] = DIS_A;
		}
		if(g_Zone4_GT.KeepWarmFlag == 1)
		{
				g_Disp_Buf[TUBE13] = DIS_A;
				g_Disp_Buf[TUBE14] = DIS_A;
		}	

}

/*
 * ��������timer_Display_Deal
 * ����  ����ʱ����ʾ����
 * ����  ����
 * ����  : ��
 */
void timer_Display_Deal(void)
{
		if(g_CurrentZone != NULL)
		{
				g_Disp_Buf[TUBE7] = disp_table[g_CurrentZone->Timer.Minute/10];
				g_Disp_Buf[TUBE8] = disp_table[g_CurrentZone->Timer.Minute%10];
		}
		else
		{
				g_Disp_Buf[TUBE7] = DIS_SEG_G;
				g_Disp_Buf[TUBE8] = DIS_SEG_G;
		}
		if( (g_CurrentZone->Timer.Minute==0)&&(g_ShortFlash_Cnt==0) )
		{
				g_Disp_Buf[TUBE7] = DIS_SEG_G;
				g_Disp_Buf[TUBE8] = DIS_SEG_G;
		}
}

/*
 * ��������noPan_Display
 * ����  ���޹���ʾ����
 * ����  ����
 * ����  : ��
 */
void noPan_Display(void)
{
	if(mainBoardConnect == SUCCESS)
	{
		if(g_TimeOutCnt == 0)
		{
				/* zone1 */
				if( (g_Zone1_GT.Gear) && ((g_1st_MainBoard_Data.Stove_1st_State & BPotExists) == 0) )//�������巵�ص���Ϣ�ж��й��޹�
				{		
						g_Zone1Gear_FlashFlag_Long = SET;
						g_Disp_Buf[TUBE1] = DIS_NO_POT;
						g_Disp_Buf[TUBE2] = DIS_NO_POT;
				}
				else
				{
						g_Zone1Gear_FlashFlag_Long = RESET;
				}
				/* zone2 */
				if( (g_Zone2_GT.Gear) && ((g_1st_MainBoard_Data.Stove_2nd_State & BPotExists) == 0) )//�������巵�ص���Ϣ�ж��й��޹�
				{
						g_Zone2Gear_FlashFlag_Long = SET;
						g_Disp_Buf[TUBE5] = DIS_NO_POT;
						g_Disp_Buf[TUBE6] = DIS_NO_POT;
				}
				else
				{
						g_Zone2Gear_FlashFlag_Long = RESET;
				}
				/* zone3 */
				if( (g_Zone3_GT.Gear) && ((g_2nd_MainBoard_Data.Stove_1st_State & BPotExists) == 0))//�������巵�ص���Ϣ�ж��й��޹�
				{
						g_Zone3Gear_FlashFlag_Long = SET;
						g_Disp_Buf[TUBE9] = DIS_NO_POT;
						g_Disp_Buf[TUBE10] = DIS_NO_POT;
				}
				else
				{
						g_Zone3Gear_FlashFlag_Long = RESET;
				}
				/* zone4 */
				if( (g_Zone4_GT.Gear) && ((g_2nd_MainBoard_Data.Stove_2nd_State & BPotExists) == 0) )//�������巵�ص���Ϣ�ж��й��޹�
				{
						g_Zone4Gear_FlashFlag_Long = SET;
						g_Disp_Buf[TUBE13] = DIS_NO_POT;
						g_Disp_Buf[TUBE14] = DIS_NO_POT;
				}
				else
				{
						g_Zone4Gear_FlashFlag_Long = RESET;
				}
				/* zoneLeft */
				if( (g_ZoneLeft_GT.Gear) && ((g_1st_MainBoard_Data.Stove_1st_State & BPotExists) == 0) && ((g_1st_MainBoard_Data.Stove_2nd_State & BPotExists) == 0) )//�������巵�ص���Ϣ�ж��й��޹�
				{
						g_ZoneLeftGear_FlashFlag_Long = SET;
						g_Disp_Buf[TUBE3] = DIS_NO_POT;
						g_Disp_Buf[TUBE4] = DIS_NO_POT;
				}
				else
				{
						g_ZoneLeftGear_FlashFlag_Long = RESET;
				}
				/* zoneRight */
				if( (g_ZoneRight_GT.Gear) && ((g_2nd_MainBoard_Data.Stove_1st_State & BPotExists) == 0) && ((g_2nd_MainBoard_Data.Stove_2nd_State & BPotExists) == 0) )//�������巵�ص���Ϣ�ж��й��޹�
				{
						g_ZoneLeftGear_FlashFlag_Long = SET;
						g_Disp_Buf[TUBE11] = DIS_NO_POT;
						g_Disp_Buf[TUBE12] = DIS_NO_POT;
				}	
				else
				{
						g_ZoneRightGear_FlashFlag_Long = RESET;
				}
		}
	}
}

/*
 * ��������gear_Flash_Long
 * ����  ����λ��˸��ʾ����
 * ����  ����
 * ����  : ��
 */
void gear_Flash_Long(void)
{
		if( (g_TimeOutCnt == 0)&&(g_Zone1Gear_FlashFlag_Long == SET)&&(g_General_FlashFlag_500ms) )
		{
				g_Disp_Buf[TUBE1] = BLK_;
				g_Disp_Buf[TUBE2] = BLK_;
		}
		if( (g_TimeOutCnt == 0)&&(g_Zone2Gear_FlashFlag_Long == SET)&&(g_General_FlashFlag_500ms) )
		{
				g_Disp_Buf[TUBE5] = BLK_;
				g_Disp_Buf[TUBE6] = BLK_;
		}
		if( (g_TimeOutCnt == 0)&&(g_Zone3Gear_FlashFlag_Long == SET)&&(g_General_FlashFlag_500ms) )
		{
				g_Disp_Buf[TUBE9] = BLK_;
				g_Disp_Buf[TUBE10] = BLK_;
		}
		if( (g_TimeOutCnt == 0)&&(g_Zone4Gear_FlashFlag_Long == SET)&&(g_General_FlashFlag_500ms) )
		{
				g_Disp_Buf[TUBE13] = BLK_;
				g_Disp_Buf[TUBE14] = BLK_;
		}
//		if(g_ZoneLeftGear_FlashFlag_Long == SET)
//		{
//				g_Disp_Buf[TUBE3] = BLK_;
//				g_Disp_Buf[TUBE4] = BLK_;
//		}
//		if(g_ZoneRightGear_FlashFlag_Long == SET)
//		{
//				g_Disp_Buf[TUBE11] = BLK_;
//				g_Disp_Buf[TUBE12] = BLK_;
//		}
}

void debugDisplay(void)
{
		uint16_t tmp;
		if(timeZoneCnt == 1)
		{
				tmp = getTemperature(g_1st_MainBoard_Data.Stove_1st_Igbt_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;

				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_1st_MainBoard_Data.Stove_1st_Igbt_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_1st_MainBoard_Data.Stove_1st_Igbt_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_1st_MainBoard_Data.Stove_1st_Igbt_Temp & 0x000F];
		}
		else if(timeZoneCnt == 2)
		{
				tmp = getTemperature(g_1st_MainBoard_Data.Stove_1st_Coil_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;

				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_1st_MainBoard_Data.Stove_1st_Coil_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_1st_MainBoard_Data.Stove_1st_Coil_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_1st_MainBoard_Data.Stove_1st_Coil_Temp & 0x000F];
		}
		else if(timeZoneCnt == 3)
		{
				tmp = getTemperature(g_1st_MainBoard_Data.Stove_2nd_Igbt_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;
			
				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_1st_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_1st_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_1st_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x000F];
		}
		else if(timeZoneCnt == 4)
		{
				tmp = getTemperature(g_1st_MainBoard_Data.Stove_2nd_Coil_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;

				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_1st_MainBoard_Data.Stove_2nd_Coil_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_1st_MainBoard_Data.Stove_2nd_Coil_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_1st_MainBoard_Data.Stove_2nd_Coil_Temp & 0x000F];
		}
		else if(timeZoneCnt == 5)
		{
				tmp = getTemperature(g_2nd_MainBoard_Data.Stove_1st_Igbt_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;

				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_2nd_MainBoard_Data.Stove_1st_Igbt_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_2nd_MainBoard_Data.Stove_1st_Igbt_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_2nd_MainBoard_Data.Stove_1st_Igbt_Temp & 0x000F];
		}
		else if(timeZoneCnt == 6)
		{
				tmp = getTemperature(g_2nd_MainBoard_Data.Stove_1st_Coil_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;

				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_2nd_MainBoard_Data.Stove_1st_Coil_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_2nd_MainBoard_Data.Stove_1st_Coil_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_2nd_MainBoard_Data.Stove_1st_Coil_Temp & 0x000F];
		}
		else if(timeZoneCnt == 7)
		{
				tmp = getTemperature(g_2nd_MainBoard_Data.Stove_2nd_Igbt_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;

				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_2nd_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_2nd_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_2nd_MainBoard_Data.Stove_2nd_Igbt_Temp & 0x000F];
		}
		else if(timeZoneCnt == 8)
		{
				tmp = getTemperature(g_2nd_MainBoard_Data.Stove_2nd_Coil_Temp&0x0FFF,COIL_NTC);
				tmp &= 0x0FFF;

				g_Disp_Buf[TUBE4] = disp_table[tmp/100];
				g_Disp_Buf[TUBE11] = disp_table[tmp%100/10];
				g_Disp_Buf[TUBE12] = disp_table[tmp%10];
			
//				g_Disp_Buf[TUBE8] = disp_table[(g_2nd_MainBoard_Data.Stove_2nd_Coil_Temp & 0x0F00)>>8];
//				g_Disp_Buf[TUBE11] = disp_table[(g_2nd_MainBoard_Data.Stove_2nd_Coil_Temp & 0x00F0)>>4];
//				g_Disp_Buf[TUBE12] = disp_table[g_2nd_MainBoard_Data.Stove_2nd_Coil_Temp & 0x000F];
		}
		
		g_Disp_Buf[TUBE3] = disp_table[timeZoneCnt];

}

/*
 * ��������BBQ_Display
 * ����  ��BBQ��ʾ����
 * ����  ����
 * ����  : ��
 */
static void BBQ_Display(void)
{
		if(bbqEnable_Left == ENABLE)
		{
				g_Disp_Buf[TUBE3] = DIS_B;
				g_Disp_Buf[TUBE4] = DIS_Q;
		}
		
		if(bbqEnable_Right == ENABLE)
		{
				g_Disp_Buf[TUBE11] = DIS_B;
				g_Disp_Buf[TUBE12] = DIS_Q;
		}
		
}

/*
 * ��������powerSchemeDisplay
 * ����  �����ʷ�����ʾ
 * ����  ����
 * ����  : ��
 */
static void powerSchemeDisplay(void)
{
		g_Disp_Buf[TUBE7] = disp_table[g_TotalPower/1000] | DIS_DOT;
		g_Disp_Buf[TUBE8] = disp_table[g_TotalPower%1000/100];	
}

/*
 * ��������pauseDisplay
 * ����  ����ͣ��ʾ
 * ����  ����
 * ����  : ��
 */
static void pauseDisplay(void)
{
		uint8_t i;
		if(g_Pause_State == ENABLE)
		{
				for(i=0;i<=15;i++)
				{
						if(i == LED)   continue;
						g_Disp_Buf[i] = DIS_PAUSE;
				}
				g_Disp_Buf[TUBE7] = DIS_SEG_G;
				g_Disp_Buf[TUBE8] = DIS_SEG_G;
		}
}

static void timerSettingDisplay(void)
{
		if( (g_ShortFlash_Cnt%2)&&(g_SettingState == SETTING_TIMER) )//���ö�ʱ���ж���˸��־
		{
				g_Disp_Buf[TUBE7] = BLK_;
				g_Disp_Buf[TUBE8] = BLK_;
		}
		else
		{
				if(lock_State == ENABLE)							//��ͯ��
				{
						if( (g_CurrentZone->Timer.Minute!=0)&&(g_General_FlashFlag_500ms) )//�ж�ʱ������˸��־
						{
								timer_Display_Deal();
						}
						else
						{
								g_Disp_Buf[TUBE7] = DIS_L;
								g_Disp_Buf[TUBE8] = DIS_o;
						}
				}
				else																	//�ر�ͯ��
				{
						timer_Display_Deal();
				}
		}
}

static void err_Display(void)
{
		/* �¶ȡ���ѹ��ͨ�Ŵ�����Ϣ��ͬcloud�Ĵ������һ�£� */
		if( (g_Zone1_TE.ErrCode + g_Zone2_TE.ErrCode + g_Zone3_TE.ErrCode + g_Zone4_TE.ErrCode)&&(g_SettingState != SETTING_TIMER) )
		{
				/* ͨ��ʧ�ܵ��������ʾ������� */
				if( (g_Zone1_TE.ErrCode != DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID)&&(g_Zone2_TE.ErrCode != DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID)&&
					(g_Zone3_TE.ErrCode != DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID)&&(g_Zone4_TE.ErrCode != DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID) )
				{
						if(g_200ms_cnt%2)
						{
								g_Disp_Buf[TUBE7] = BLK_;
								g_Disp_Buf[TUBE8] = BLK_;
						}
						else
						{
								if(g_Zone1_TE.ErrCode)
								{
										g_Disp_Buf[TUBE7] = NUM_1|CHR_DOT;
										g_Disp_Buf[TUBE8] = disp_table[g_Zone1_TE.ErrCode];
								}
								else if(g_Zone2_TE.ErrCode)
								{
										g_Disp_Buf[TUBE7] = NUM_2|CHR_DOT;
										g_Disp_Buf[TUBE8] = disp_table[g_Zone2_TE.ErrCode];
								}
								else if(g_Zone3_TE.ErrCode)
								{
										g_Disp_Buf[TUBE7] = NUM_3|CHR_DOT;
										g_Disp_Buf[TUBE8] = disp_table[g_Zone3_TE.ErrCode];
								}
								else if(g_Zone4_TE.ErrCode)
								{
										g_Disp_Buf[TUBE7] = NUM_4|CHR_DOT;
										g_Disp_Buf[TUBE8] = disp_table[g_Zone4_TE.ErrCode];
								}
						}
				}
		}
		/* ��λ������Ϣ */
		if(g_GearError_Flag == SET)
		{
				if(g_ShortFlash_Cnt)
				{
						if(g_General_FlashFlag_500ms == SET)
						{
								g_Disp_Buf[TUBE7] = BLK_;
								g_Disp_Buf[TUBE8] = BLK_;
						}
						else
						{
								g_Disp_Buf[TUBE7] = CHR_P;
								g_Disp_Buf[TUBE8] = CHR_N;
						}
				}
				else
				{
						g_GearError_Flag = RESET;
				}
		}
}

/*
 * ��������display
 * ����  ����ʾ����
 * ����  ����
 * ����  : ��
 */
void display(void)
{
		/* ����״̬ */
		if(g_TurnOnFlag == ENABLE)
		{
				/****************** ��λ��ʾ���� ***********************/
				allZone_GearDisplay();

				if(g_ShortFlash_Cnt == 0)									//��˸����
				{
						min_TimerDisplay();										//��С��ʱ��¯ͷ��ʾ����
						zeroGear_Display_Deal();							//0����ʾ����
				}

				Zone_GearDisplay_Select();							//������λ��ʾ����ѡ����
				BBQ_Display();
				keepWarm_Display_Deal();                //���¹�����ʾ����
				noPan_Display();												//�޹���ʾ����
				pauseDisplay();
				gear_Flash_Long();

				/****************** ��ʱ����ʾ���� ***********************/
				timerSettingDisplay();
				err_Display();
//				debugDisplay();
		}
		/* �ػ�״̬ */
		else
		{
				clearDispBuf();
				if(g_powerSchemeState == SETTING_POWER_SCHEME_CONFIRM)
				{
						if(g_General_FlashFlag_500ms == SET)
						{
								powerSchemeDisplay();
						}
						else
						{
								g_Disp_Buf[TUBE7] = BLK_;
								g_Disp_Buf[TUBE8] = BLK_;
						}
				}
		}
		
		sm1616_Display(g_Disp_Buf);
}

void zone_Init(void)
{
		memset(&g_Zone1_GT,0,sizeof(g_Zone1_GT));
		memset(&g_Zone2_GT,0,sizeof(g_Zone2_GT));
		memset(&g_Zone3_GT,0,sizeof(g_Zone3_GT));
		memset(&g_Zone4_GT,0,sizeof(g_Zone4_GT));
		memset(&g_ZoneLeft_GT,0,sizeof(g_ZoneLeft_GT));
		memset(&g_ZoneRight_GT,0,sizeof(g_ZoneRight_GT));
	
		powerTabelAllot();
}


/*
 * ��������zone_Timer_Power_Off_Deal
 * ����  ����ʱ�ر�¯ͷ
 * ����  ����λ&ʱ��������ṹ��ָ��
 * ����  : ��
 */
void zone_Timer_Power_Off_Deal(pGear_Time_CON pt)
{
		if(--pt->Timer.Second <= 0)
		{
				if(--pt->Timer.Minute < 0)
				{
					pt->Timer.Minute =0;
				}
				if(--pt->Timer.off_time <= 0)
				{
						pt->Timer.off_time =0;
						pt->Gear = 0;
				}
				pt->Timer.Second = 60;
		}
}

/*
 * ��������zong_Timing_Shutdown_Deal
 * ����  ����ʱ�ر�¯ͷ
 * ����  ����
 * ����  : ��
 */
void zong_Timing_Shutdown_Deal(void)
{
		zone_Timer_Power_Off_Deal(&g_Zone1_GT);
		zone_Timer_Power_Off_Deal(&g_Zone2_GT);
		zone_Timer_Power_Off_Deal(&g_Zone3_GT);
		zone_Timer_Power_Off_Deal(&g_Zone4_GT);
		zone_Timer_Power_Off_Deal(&g_ZoneLeft_GT);
		zone_Timer_Power_Off_Deal(&g_ZoneRight_GT);
}


/**

  * @brief  Period elapsed callback in non blocking mode

  * @param  htim: TIM handle

  * @retval None

  */

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
		static uint8_t s_Timer6_Cnt = 0;
		static uint8_t s_Ms100_Cnt = 0;
		static uint8_t s_Ms200_Cnt = 0;
		static uint8_t s_FlashMS_Cnt = 0;
	//	static uint8_t s_Min_Cnt = 0;
		
		if (htim->Instance == htim6.Instance)
		{
				s_Timer6_Cnt++;									//10ms����
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
							if(++s_Ms200_Cnt >= 2)
							{
									g_200ms_cnt++;
									s_Ms200_Cnt = 0;
									ms200_flag = SET; 
							}
						
							if(++g_GeneralFlash_Cnt == 5)				//500ms
							{
									g_GeneralFlash_Cnt = 0;
									g_General_FlashFlag_500ms = !g_General_FlashFlag_500ms;
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
									g_General_FlashFlag_1s = !g_General_FlashFlag_1s;
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

