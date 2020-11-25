/*===========================================================================
 * DESCRIPTION:
 * Porject: Inteligient controller
 * Chip: STM8S003F3P6 MCU(SSOP20)  manufacture by ST Microelectronics
 * Hardware Tool: Raisonance(STX-Rlink)
 * Software Tool: Cosmic(16k limit free)
 * Author :Terry Mo
 * Date: 2013.05.05
 *---------------------------------------------------------------------------
 * Copyright (c) Youlong.,LTD, 2013
 *==========================================================================*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s_type.h"
#include "stm8s.h"
#include  "G20_user.h"
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/* Global variables ----------------------------------------------------------*/
extern u8 Ms10_bz1 ;
extern u8 Ms10_bz2 ;
extern u8 Ms10_bz3 ;
extern u8 Ms10_bz4 ;
extern u8 Ms10_bz5 ;
extern u8 Ms10_bz6 ;
extern u8 Ms10_bz7 ;
//extern u8 Ms10_bz8 ;
//extern u8 Ms10_bz9 ;
//extern u8 Ms10_bz10;
extern u8 Flash_500ms_bz;
extern u8 Sec_bz ;
extern u8 Min_bz ;
extern vu8 sec_LockFlag;
extern vu8 _10ms_cnt;
extern u8 Prepare_data_bz;
extern u8  ms10_counter;
extern vu8  sec_counter;
extern u8  min_counter;
extern u8  Led_speed;

extern @near vu8  version_dis_cnt;  //30s
extern @near vu8  lock_dis_cnt;

extern @near vu8  timer1_1min_cnt;
extern @near vu8  timer1_min_flg; 
extern @near vu8  timer2_1min_cnt;
extern @near vu8  timer2_min_flg; 
extern @near vu8  timer3_1min_cnt;
extern @near vu8  timer3_min_flg; 
extern @near vu8  timer4_1min_cnt;
extern @near vu8  timer4_min_flg; 

extern @near vu8  zone_1_nopan_flg;
extern @near vu8  zone_2_nopan_flg;
extern @near vu8  zone_3_nopan_flg;
extern @near vu8  zone_4_nopan_flg;

u8  Timer4_counter;
u8  Led_counter =0;
void vf_fan_deal(void);
void tx_rx_beep_io_deal(void);
//****************************************************************
typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

@far @interrupt void TIM1_UPD_OVF_IRQHandler(void)	//1.6ms  fan motor VF deal
{
	vf_fan_deal();
	//
	TIM1->SR1 = 0;
	return;
}     			  
@far @interrupt void TIM2_UPD_OVF_IRQHandler(void)	//125us  TX & RX deal
{  
	tx_rx_beep_io_deal();
	/*
	Led_counter++;
        if(Led_counter <Led_speed) LED_1;
        else LED_0;
	if(Led_counter >160) Led_counter =0;*/
	
     	TIM2->SR1 = (u8)(~TIM2_IT_UPDATE);
    return;
}
@far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
{
		

     Timer4_counter++;
     switch (Timer4_counter)
     {
     	case 1 :  Ms10_bz1 =TRUE; break;
     	case 2 :  Ms10_bz2 =TRUE; break;
     	case 3 :  Ms10_bz3 =TRUE; break;
     	case 4 :  Ms10_bz4 =TRUE; break;
     	case 5 :  Ms10_bz5 =TRUE; break;
     	case 6 :  Ms10_bz6 =TRUE; break;
     	case 7 :  Ms10_bz7 =TRUE; break;
  //   	case 8 :  Ms10_bz8 =TRUE; break;
  //   	case 9 :  Ms10_bz9 =TRUE; break;
     	case 10: 
  //   		Ms10_bz10 =TRUE;
     		Timer4_counter =0;
				if(++_10ms_cnt >= 100)
				{
					_10ms_cnt = 0;
					if(lock_dis_cnt)      lock_dis_cnt--;
					if(version_dis_cnt)   version_dis_cnt--;
					
				}
     		ms10_counter++;      
    		if(ms10_counter ==49) Prepare_data_bz =TRUE;
     		if(ms10_counter ==50) Flash_500ms_bz =TRUE;
     		if(ms10_counter ==99) Prepare_data_bz =TRUE;
     		if(ms10_counter ==100)//1Ãë
				{
					Sec_bz =TRUE;
					Flash_500ms_bz =TRUE;
					ms10_counter =0;
					sec_counter++;
					if(zone_1_nopan_flg == FALSE)
					{
						if(++timer1_1min_cnt >= 60) timer1_1min_cnt = 0, timer1_min_flg = TRUE;
					}
					if(zone_2_nopan_flg == FALSE)
					{
						if(++timer2_1min_cnt >= 60) timer2_1min_cnt = 0, timer2_min_flg = TRUE;
					}
					if(zone_3_nopan_flg == FALSE)
					{
						if(++timer3_1min_cnt >= 60) timer3_1min_cnt = 0, timer3_min_flg = TRUE;
					}
					if(zone_4_nopan_flg == FALSE)
					{
						if(++timer4_1min_cnt >= 60) timer4_1min_cnt = 0, timer4_min_flg = TRUE;
					}
				}
     		if(sec_counter ==60)
				{
					Min_bz =TRUE;
					sec_counter=0;
				}
     }
    TIM4->SR1 = (u8)(~TIM4_IT_UPDATE);
    return;
}


extern void _stext();     /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* trap  */
	{0x82, NonHandledInterrupt}, /* irq0  */
	{0x82, NonHandledInterrupt}, /* irq1  */
	{0x82, NonHandledInterrupt}, /* irq2  */
	{0x82, NonHandledInterrupt}, /* irq3  */
	{0x82, NonHandledInterrupt}, /* irq4  */
	{0x82, NonHandledInterrupt}, /* irq5  */
	{0x82, NonHandledInterrupt}, /* irq6  */
	{0x82, NonHandledInterrupt}, /* irq7  */
	{0x82, NonHandledInterrupt}, /* irq8  */
	{0x82, NonHandledInterrupt}, /* irq9  */
	{0x82, NonHandledInterrupt}, /* irq10 */
	{0x82, TIM1_UPD_OVF_IRQHandler}, /* irq11 */
	{0x82, NonHandledInterrupt}, /* irq12 */
	{0x82, TIM2_UPD_OVF_IRQHandler}, /* irq13 */
	{0x82, NonHandledInterrupt}, /* irq14 */
	{0x82, NonHandledInterrupt}, /* irq15 */
	{0x82, NonHandledInterrupt}, /* irq16 */
	{0x82, NonHandledInterrupt}, /* irq17 */
	{0x82, NonHandledInterrupt}, /* irq18 */
	{0x82, NonHandledInterrupt}, /* irq19 */
	{0x82, NonHandledInterrupt}, /* irq20 */
	{0x82, NonHandledInterrupt}, /* irq21 */
	{0x82, NonHandledInterrupt}, /* irq22 */
	{0x82, TIM4_UPD_OVF_IRQHandler}, /* irq23 */
	{0x82, NonHandledInterrupt}, /* irq24 */
	{0x82, NonHandledInterrupt}, /* irq25 */
	{0x82, NonHandledInterrupt}, /* irq26 */
	{0x82, NonHandledInterrupt}, /* irq27 */
	{0x82, NonHandledInterrupt}, /* irq28 */
	{0x82, NonHandledInterrupt}, /* irq29 */
};
