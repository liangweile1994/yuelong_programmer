#ifndef  _POWER_LEVEL_MANAGE_H
#define  _POWER_LEVEL_MANAGE_H

#include "main.h"


/* 整机功率存储地址(存放在flash最后一页内存单元的64位偏移地址,最大值2048/8)宏定义 */
#define TOTAL_POWER_ADDRESS		0


/******** 功率方案套数宏定义 **********/
#define		POWER_SCHEME_NUM  				8
/******** 单块主板的最大功率宏定义 **********/
#define		MAX_MAINBOARD_POWER				3600

/******** 整机功率缺省值宏定义(生产用，对应整机功率方案数组中的其中一个元素) **********/
#define		DEFAULT_TOTAL_POWER				0

/******** boost开启宏定义（5分钟） **********/
#define		BOOST_TIME								300


/******** 单炉头开启状态宏定义 **********/
#define	ZONE1_WORKING				0x01
#define	ZONE2_WORKING				0x02
#define	ZONE3_WORKING				0x04
#define	ZONE4_WORKING				0x08
#define	ZONE_LEFT_WORKING		0x10
#define	ZONE_RIGHT_WORKING	0x20

/******** 双炉头开启状态宏定义 **********/
#define	ZONE12_WORKING			0x03
#define	ZONE13_WORKING			0x05
#define	ZONE14_WORKING			0x09
#define	ZONE23_WORKING			0x06
#define	ZONE24_WORKING			0x0A
#define	ZONE34_WORKING			0x0C

/******** 三炉头开启状态宏定义 **********/
#define	ZONE123_WORKING			0x07
#define	ZONE124_WORKING			0x0B
#define	ZONE134_WORKING			0x0D
#define	ZONE234_WORKING			0x0E

/******** 四炉头开启状态宏定义 **********/
#define	ZONE1234_WORKING		0x0F

/*
BIT0 开1号继电器
BIT1 开2号继电器
BIT2 预留开3号继电器
BIT3 预留开4号继电器
BIT4 预留开5号继电器
BIT5 预留开6号继电器
BIT6 开机
BIT7 需要风扇
*/

#define		POWER1_ENABLE  					0x01
#define		STOVE_ENABLE 						0x40
#define		FAN_ENABLE							0x80

#define		MAIN_BOARD1_ADDR				0xA0
#define		MAIN_BOARD2_ADDR				0xA1

/* 设备空闲时间宏定义 */
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
