#ifndef  _KEY_H
#define  _KEY_H

#include "main.h"

/* 功率方案设置过程宏定义 */
#define  SETTING_POWER_SCHEME_FINISH    0
#define  SETTING_POWER_SCHEME_READY     1
#define  SETTING_POWER_SCHEME_CONFIRM   2

#define		SETTING_NONE					0
#define		SETTING_GEAR					1
#define		SETTING_TIMER					2
#define		SETTING_LEFT_ZONE			3
#define		SETTING_RIGHT_ZONE		4

#define		GEAR_INACTIVE					0
#define		GEAR_ACTIVE						2

#define		POWER_ON							1
#define		POWER_OFF							0

extern uint8_t	timeZoneCnt;

extern FunctionalState 	zoneLeft_State;
extern FunctionalState 	zoneRight_State;
extern FunctionalState 	lock_State;
extern FunctionalState 	g_Pause_State;

extern uint8_t g_SettingState;
extern uint8_t g_TurnOnFlag;
extern uint8_t g_powerSchemeState;

extern Gear_Time_CON g_Zone1_GT, g_Zone2_GT, g_Zone3_GT, g_Zone4_GT;
extern Gear_Time_CON g_ZoneLeft_GT, g_ZoneRight_GT;

extern pGear_Time_CON g_CurrentZone;

extern MB_CON_PARM g_Board1_Con_Parm, g_Board2_Con_Parm;

void key_Process(void);
void Beep_On(uint8_t cnt);
void Beep_Off(void);
void timer_INC_Deal(pGear_Time_CON pt);

#endif
