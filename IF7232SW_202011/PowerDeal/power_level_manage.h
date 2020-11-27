#ifndef  _POWER_LEVEL_MANAGE_H
#define  _POWER_LEVEL_MANAGE_H

#include "main.h"


/* �������ʴ洢��ַ(�����flash���һҳ�ڴ浥Ԫ��64λƫ�Ƶ�ַ,���ֵ2048/8)�궨�� */
#define TOTAL_POWER_ADDRESS		0


/******** ���ʷ��������궨�� **********/
#define		POWER_SCHEME_NUM  				8
/******** �������������ʺ궨�� **********/
#define		MAX_MAINBOARD_POWER				3600

/******** ��������ȱʡֵ�궨��(�����ã���Ӧ�������ʷ��������е�����һ��Ԫ��) **********/
#define		DEFAULT_TOTAL_POWER				0

/******** boost�����궨�壨5���ӣ� **********/
#define		BOOST_TIME								300


/******** ��¯ͷ����״̬�궨�� **********/
#define	ZONE1_WORKING				0x01
#define	ZONE2_WORKING				0x02
#define	ZONE3_WORKING				0x04
#define	ZONE4_WORKING				0x08
#define	ZONE_LEFT_WORKING		0x10
#define	ZONE_RIGHT_WORKING	0x20

/******** ˫¯ͷ����״̬�궨�� **********/
#define	ZONE12_WORKING			0x03
#define	ZONE13_WORKING			0x05
#define	ZONE14_WORKING			0x09
#define	ZONE23_WORKING			0x06
#define	ZONE24_WORKING			0x0A
#define	ZONE34_WORKING			0x0C

/******** ��¯ͷ����״̬�궨�� **********/
#define	ZONE123_WORKING			0x07
#define	ZONE124_WORKING			0x0B
#define	ZONE134_WORKING			0x0D
#define	ZONE234_WORKING			0x0E

/******** ��¯ͷ����״̬�궨�� **********/
#define	ZONE1234_WORKING		0x0F

/*
BIT0 ��1�ż̵���
BIT1 ��2�ż̵���
BIT2 Ԥ����3�ż̵���
BIT3 Ԥ����4�ż̵���
BIT4 Ԥ����5�ż̵���
BIT5 Ԥ����6�ż̵���
BIT6 ����
BIT7 ��Ҫ����
*/

#define		POWER1_ENABLE  					0x01
#define		STOVE_ENABLE 						0x40
#define		FAN_ENABLE							0x80

#define		MAIN_BOARD1_ADDR				0xA0
#define		MAIN_BOARD2_ADDR				0xA1

/* �豸����ʱ��궨�� */
#define		DEV_IDLE_TIME						60


extern uint16_t const g_PowerLevel_Max[17];
extern uint16_t const g_PowerLevel_Mid[17];
extern uint16_t const g_PowerLevel_Min[17];
extern uint16_t const g_PowerScheme[POWER_SCHEME_NUM];

extern uint8_t g_DevIdleTimer;
extern FlagStatus idleFlag;
extern uint16_t BBQ_WorkTime_Left;
extern uint16_t BBQ_WorkTime_Right;
extern FunctionalState  bbqEnable_Left;
extern FunctionalState  bbqEnable_Right;
extern ErrorStatus mainBoardConnect;

extern uint16_t g_TotalPower;
extern uint8_t  g_PowerSchemeIdx;

extern uint16_t g_BBQ_WorkTime_Left;
extern uint16_t g_BBQ_WorkTime_Right;

extern Z_TempErrDef  g_Zone1_TE, g_Zone2_TE, g_Zone3_TE, g_Zone4_TE;

void generalPowerReduction(void);
void powerTabelAllot(void);
eResult singleBoardPowerLimitAlgorithm(uint8_t gear_input);
eResult realTotalPowerCalculate(uint8_t gear_input);
void get_MainBoard_Message(void);
void update_MB_Ctrl_Parm(pGear_Time_CON pt1, pGear_Time_CON pt2, uint8_t addr);
void send_ControlMsgToMainBoard(void);
void send_BlankMsgToMainBoard(void);
void temperatureDetectionProcess(void);
void powerOffDeal(void);
void defaultPowerSchemeSetting(void);
void savePowerSchemeToFlash(uint32_t dat);
void keepWarmFunction(void);
void BBQ_Function(void);

#endif
