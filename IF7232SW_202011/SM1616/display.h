#ifndef  _DISPLAY_H
#define  _DISPLAY_H

#include "main.h"


extern __IO FlagStatus    secFlag;

extern __IO FlagStatus		Ms10_bz1;
extern __IO FlagStatus		Ms10_bz2;
extern __IO FlagStatus		Ms10_bz3;
extern __IO FlagStatus		Ms10_bz4;
extern __IO FlagStatus		Ms10_bz5;
extern __IO FlagStatus		Ms10_bz6;
extern __IO FlagStatus		Ms10_bz7;
extern __IO FlagStatus		Ms10_bz8;
extern __IO FlagStatus		Ms10_bz9;
extern __IO FlagStatus		Ms10_bz10;
extern __IO FlagStatus		ms200_flag;

extern __IO uint8_t		g_200ms_cnt;
extern __IO uint8_t	  g_General_FlashFlag_500ms;
extern __IO uint8_t	  g_General_FlashFlag_1s;

extern __IO uint8_t 	g_ShortFlash_Cnt;
extern __IO uint8_t 	g_GeneralFlash_Cnt;

extern __IO uint8_t		g_TimeOutCnt;
extern __IO uint8_t		g_Beep_Cnt;
extern uint16_t				g_RunningTime;

extern MB_RCV_MSG     g_1st_MainBoard_Data, g_2nd_MainBoard_Data;

void disp_Init(void);
void zone_Init(void);
void clearAllLongFlashFlag(void);
void display(void);
void zong_Timing_Shutdown_Deal(void);
void clearDispBuf(void);
#endif
