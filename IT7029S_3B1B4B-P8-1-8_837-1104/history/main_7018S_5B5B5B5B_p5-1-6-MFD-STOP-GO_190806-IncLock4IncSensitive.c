/*===========================================================================
 * DESCRIPTION:
 * Porject: Inteligient controller
 * Chip: STM8S005K6T6C MCU(QFP32)  manufacture by ST Microelectronics
 * Hardware Tool: Raisonance(STX-Rlink)
 * Software Tool: Cosmic(16k limit free)
 * Author :Terry Mo
 * Date: 2015.08.24
 *---------------------------------------------------------------------------
 * Copyright (c) Youlong Kitchen.,LTD, 2013
 *==========================================================================*/
#define STM8S105 (1)

#include "stm8s_type.h"
#include "stm8s.h"
#include "stm8s_conf.h"
#include "stm8s_gpio.h" 
#include "stm8s_clk.h"
#include "stm8s_tim1.h"
#include "stm8s_tim2.h"
#include "stm8s_tim4.h"
#include "stm8s_iwdg.h"
#include "stm8s_adc1.h"
#include "stm8s_uart1.h" 
#include "G20_user.h"    	
//****************************************************************
//   global variable define
//****************************************************************
//erp
#define pwm_145   (u8)(CON_PWM_6us)	//6us
#define pwm_180_b (u8)(CON_PWM_6us-4)	//6.5us
#define pwm_180_s (u8)(CON_PWM_8us-4)	//8.5us
#define pwm_fang  (u8)(CON_PWM_8us)	//8us
#define pwm_210   (u8)(CON_PWM_8us)	//8us
#define pwm_280   (u8)(CON_PWM_10us)	//10us
//erp
u32  bit_comm=0;
u8      Add_Status =0;
u8	syn_delay=CON_0500;
u8	cur_no =CON_NO_CUR1_MID;
u8	max_pwm=10;
//
u16 Get_word_1 =0;
u16 Get_word_2 =0;
u16 Get_word_3 =0;
u16 Get_word_4 =0;
//
u8  relay_delay_bz =FALSE;

u8  Ms10_bz1 = FALSE;
u8  Ms10_bz2 = FALSE;
u8  Ms10_bz3 = FALSE;
u8  Ms10_bz4 = FALSE;
u8  Ms10_bz5 = FALSE;
u8  Ms10_bz6 = FALSE;
u8  Ms10_bz7 = FALSE;
u8  Flash_500ms_bz = FALSE;
u8  ms10_counter;
u8  sec_counter;
u8  min_counter;

u8  timer_precise_bz =FALSE;
u8  Sec_bz =FALSE;
u8  Min_bz = FALSE; 

u8  Prepare_data_bz=FALSE;

u8  Power_on_bz =FALSE; 
u8  lock_bz =FALSE;
u8  flash_list =0;

u8  buzzer_time =0;
u8  buzzer_account =0;

u8  Disp_buf[7]={0,0,0,0,0,0,0};

u8  key_initial_count =250;    //10ms *250 =2.5s
u8  idle_count =0;
u8  zone_flash_count =0;
u8  cmd_relay_wait =200;		//10ms *200 =2s 
u8  change_count =0;

u8  count_1_key =0;
u8  count_2_key =0;
u8  count_3_key =0;
u8  count_4_key =0;

u8  key_zone =0;
u8  timer_status =0;
u8  time_flash_count =0;

u8  flash_H_1_min =0;
u8  flash_H_2_min =0;
u8  flash_H_3_min =0;
u8  flash_H_4_min =0;

u16  boost_time_1 =0;		
u16  boost_time_2 =0;		
u16  boost_time_3 =0;		
u16  boost_time_4 =0;			

u8  flex_L_bz =0;
u8  flex_R_bz =0;
u8  bbq_L_bz =0;
u8  bbq_R_bz =0;
u16 bbq_L_time =0;
u16 bbq_R_time =0;

u8  boost_1_save =0;		
u8  boost_2_save =0;		
u8  boost_3_save =0;		
u8  boost_4_save =0;		
//------------zone_x_level =  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  b.
u16 arr_default_timer[10]  = {0,480,480,480,240,240,240,120,120,120};        //minitue
//
u8  Comm_step =0;
u8 disp_debug1 =0;
u8 disp_debug2 =0;
u8 debug_list =0;			

u8  zone_1_pan=0;
u8  zone_2_pan=0;
u8  zone_3_pan=0;
u8  zone_4_pan=0;

u8  zone_1_nopan_time =0;
u8  zone_2_nopan_time =0;
u8  zone_3_nopan_time =0;
u8  zone_4_nopan_time =0;

u8  Get_addr =0;
u8  Get_data =0;
u8  Get_vol =0;
u8  Get_cur =0;
u8  Get_tigbt =0;
u8  Get_tmain =0;
u8  Get_ppg =0;
u8  Get_cur_no =0;

u8  Err_1_data =0;
u8  Err_2_data =0;
u8  Err_3_data =0;
u8  Err_4_data =0;

u8  Err_1_count =0;
u8  Err_2_count =0;
u8  Err_3_count =0;
u8  Err_4_count =0;

u8  boost_status =0;

u16  key_scan_value_H =0;
u16  key_scan_value_L =0;
u16  key_scan_value_AH =0;
u8 key_ok_bit =0;
u16 key_account =0;
u16 arr_save_scan[3] ={0,0,0};
u16 key_err_account =0;

u16  work_1_time =0;
u16  work_2_time =0;
u16  work_3_time =0;
u16  work_4_time =0;
u16  limit_time =0;

u8  zone_1_level =0;
u8  zone_2_level =0;
u8  zone_3_level =0;
u8  zone_4_level =0;

u8   general_timer =0;
u8   pause_x_timer =0;
u16  zone_1_timer =0;
u16  zone_2_timer =0;
u16  zone_3_timer =0;
u16  zone_4_timer =0; 

u16   I2C_GET_DATA_H =0;
u16   I2C_GET_DATA_L =0;
u16   I2C_GET_DATA_AH =0;
u8   match_ok =FALSE;

u8  vol_1 =0;
u8  vol_2 =0;
u8  vol_3 =0;
u8  vol_4 =0;

u8  cur_1 =0;
u8  cur_2 =0;
u8  cur_3 =0;
u8  cur_4 =0;

u8  tigbt_1 =0;
u8  tigbt_2 =0;
u8  tigbt_3 =0;
u8  tigbt_4 =0;

u8  tmain_1 =0;
u8  tmain_2 =0;
u8  tmain_3 =0;
u8  tmain_4 =0;

u8  ppg_1 =0;
u8  ppg_2 =0;
u8  ppg_3 =0;
u8  ppg_4 =0;

u8  time_level_1 =0;
u8  time_level_2 =0;
u8  time_level_3 =0;
u8  time_level_4 =0;

u8 pwm_temp_1 =0;
u8 pwm_temp_2 =0;
u8 pwm_temp_3 =0;
u8 pwm_temp_4 =0;

u8 com_count =0;
u8 comm_status =0;
u8 comm_list =0;

u8 fan_count =0;
u8 fan_status =0;

u8 Pause_bz =0;
u8 Pause_save_timer_1 =0;
u8 Pause_save_timer_2 =0;
u8 Pause_save_timer_3 =0;
u8 Pause_save_timer_4 =0;

u8 tiao_on_1 =0;
u8 tiao_on_2 =0;
u8 tiao_on_3 =0;
u8 tiao_on_4 =0;

@near u8 oil_high_1 =0;
@near u8 oil_high_2 =0;
@near u8 oil_high_3 =0;
@near u8 oil_high_4 =0;

@near u8 igbt_high_1 =0;
@near u8 igbt_high_2 =0;
@near u8 igbt_high_3 =0;
@near u8 igbt_high_4 =0;

@near u8 boost_1_count =0;
@near u8 boost_2_count =0;
@near u8 boost_3_count =0;
@near u8 boost_4_count =0;

@near u8  zone_1_nopan_wait =0;
@near u8  zone_2_nopan_wait =0;
@near u8  zone_3_nopan_wait =0;
@near u8  zone_4_nopan_wait =0;
		//0.73*(arr_value -1)=S(ton)    
		//0.73*(11+1) =8.76S =S(tzong)
	     //    1,    2,    3,    4,    5,    6
	     //2.19s,2.92s,3.65s,4.38s,5.11s,6.57s
u8 arr_tiao_on[6]={4,    5,    6,    7,    8,   10};    //erp
u8 arr_tiao_180_pwm[6] ={CON_PWM_8us,CON_PWM_8us,CON_PWM_9us,CON_PWM_10us,CON_PWM_10us,CON_PWM_10us};    
		    // 1#,       2#,       3#,     4#
u8 erp_pwm[4] ={pwm_180_b,pwm_180_s,pwm_180_b,pwm_180_s};//erp
//APT
u8 apt_min_reset =0;
//external subroutine
u8 Check_Unique_ID(void);
u8 flex_ntc_deal(u8 par,u8 data);
u8 zone_x_cur_no_set(u8 par,u8 count_ppg);
void delay(u8 cnt);
void SM1668_SENT_DATA(u8 send_data);
void SM1668_SEND_COMMAND(u8 send_command);	
u8  APTTouchRdOneData(u8 apt_add,u8 APTRdAdd);
void  APTTouchWrOneData(u8 apt_add,u8 APTWrAdd,u8 APTWrData);
u8  APTTouchRdOneData1(u8 apt_add,u8 APTRdAdd);
void  APTTouchWrOneData1(u8 apt_add,u8 APTWrAdd,u8 APTWrData);
//
#pragma section const {user}
		    //   7   8   9   P
		    // 1k3,1k8,2k0,2k6
const u8 arr_1_pow[4]={ 74,102,113,152};	//180mm 58.9uH	  *1.055 for D358  //70, 76, 86, 97,108,143
const u8 arr_3_pow[4]={ 74,102,113,152};	//180mm 58.9uH	  *1.055 for D358  //70, 76, 86, 97,108,143
		    // 1k2,1k2,1k5,1k9
const u8 arr_2_pow[4]={128,154,170,230};  	//180mm 68uH      *1.065 for D358  //120,130,145,160,175,230
const u8 arr_4_pow[4]={128,154,170,230};  	//180mm 68uH      *1.065 for D358  //120,130,145,160,175,230
			// 5,  6,  7,  8,  9,  P
const u8 arr_flex_b[6] ={ 55, 59, 63, 67, 71, 80};
const u8 arr_flex_s[6] ={110,118,126,134,142,153};
			//      5          6    	   7     	8     	  9    	       P
const u8 arr_flex_pwm[6] ={CON_PWM_9us,CON_PWM_10us,CON_PWM_11us,CON_PWM_11_5us,CON_PWM_12us,CON_PWM_13us};
//APT-share T_SDA & T_SCK---------
const u8 arr_APTRegData_H[14]={GSR,MCON,FILTER0,K0_ENB_H,K1_ENB_H,SENSE_CON,SENSE_S,GSR_K07,GSR_K17,REF_UTH,KEY_ATH,DSMIT,MCONH,FILTER1};
const u8 arr_T_Sens_H[16]={  8,   5,  6,  6,  6,  7,  7,255,  10,  8,255,255,   6,   7,  6,  6};
//------------=             FL,1DEC,1S2,1S3,1S4,1S5,1S6,     1S7,1S8,        1INC,2DEC,2S2,2S3
const u8 arr_APTRegData_L[14]={GSR,MCON,FILTER0,K0_ENB_L,K1_ENB_L,SENSE_CON,SENSE_S,GSR_K07,GSR_K17,REF_UTH,KEY_ATH,DSMIT,MCONH,FILTER1};
const u8 arr_T_Sens_L[16]={ 10, 10,  6,  6,  7,  9,  7,   6,255,255,   8,   7,    9,  4,  4,   4};
//------------=            DEC,INC,2S4,2S5,2S6,2S7,2S8,2INC,       BOOST,LOCK,ONOFF,3S3,3S2,3DEC
//APT- T1_SDA & T1_SCK---------
const u8 arr_APTRegData_AH[14]={GSR,MCON,FILTER0,K0_ENB_AH,K1_ENB_AL,SENSE_CON,SENSE_S,GSR_K07,GSR_K17,REF_UTH,KEY_ATH,DSMIT,MCONH,FILTER1};
const u8 arr_T_Sens_AH[16]={10,  4,  5,  5,  6,   8,  5,  7,  6,   6,  9,  9,  7,  6,  6,   7};
//------------=             FR,3S5,3S6,3S7,3S8,3INC,3S4,4S3,4S2,4DEC,4S4,4S5,4S6,4S7,4S8,4INC
/*private prototypes ******************************************************/
// 
u8 comm_vertify(void)
{
   u8 status =0;
   	if(Get_addr ==Add_Status)						status++;
	if(Get_cur_no == cur_no)		   	        		status++;  
	if((Get_data ==0)||(Get_data ==DATA_PAN_NO)||(Get_data ==DATA_PAN_OK))  status++;	
        if(status ==3) return(1);
   else return(0);
}
//
void flex_deal(u8 index)
{	
   u8 ds =0;
   u8 dr =0;
    
   if((index ==1)||(index ==0x11))
	{
		if(flex_L_bz)  	
		{
		ds =0;	
		dr =1;
		count_2_key =0;
		if(timer_status &0x01)  timer_status |=0x02;
		else timer_status &=~0x02;
		}
	}
	 
   if((index ==2)||(index ==0x12))
	{
		if(flex_L_bz)  	
		{
		ds =1;	
		dr =0;
		count_1_key =0;
		if(timer_status &0x02)  timer_status |=0x01;
		else timer_status &=~0x01;
		}
	} 
	
   if((index ==3)||(index ==0x14))
	{
		if(flex_R_bz)  	
		{
		ds =2;	
		dr =3;
		count_4_key =0;
		if(timer_status &0x04)  timer_status |=0x08;
		else timer_status &=~0x08;
		}
	}
		
   if((index ==4)||(index ==0x18))
	{
		if(flex_R_bz)  
		{
		ds =3;	
		dr =2;
		count_3_key =0;
		if(timer_status &0x08)  timer_status |=0x04;
		else timer_status &=~0x04;
		}
	}
   if(ds+dr)    
     	{    		
     		*((u8*)(&zone_1_level+dr)) =*((u8*)(&zone_1_level+ds));
     		*((u16*)(&boost_time_1)+dr)  =*((u16*)(&boost_time_1)+ds);
     		*((u16*)(&zone_1_timer)+dr)  =*((u16*)(&zone_1_timer)+ds);    		
     	}
}
//
void comm_asm_deal(void)
{
	#asm
     		mov _bit_comm+0,_Add_Status
     		mov _bit_comm+1,_syn_delay
     		mov _bit_comm+2,_cur_no
     		mov _bit_comm+3,_max_pwm
     	#endasm
     	comm_status =0;  
        comm_list =0; 
}
//
void comm_get_deal(u8 index)
{
      u8 result =0;
	u8 *v =&vol_1 +index;   
	u8 *c =&cur_1 +index;   
	u8 *i =&tigbt_1 +index; 
	u8 *m =&tmain_1 +index; 
	u8 *p =&ppg_1 +index;   
	u8 *z =&zone_1_pan +index;  
	u8 *so =&oil_high_1 +index;
	u8 *si =&igbt_high_1 +index;
	u8 *time =&zone_1_nopan_time +index; 
	u8 *npan =&zone_1_nopan_wait +index;
	u8 *level =&zone_1_level +index; 
	u8 *count =&Err_1_count +index; 
	u8 *err =&Err_1_data +index; 

       (*v) =Get_vol;
       (*c) =Get_cur;  
       (*i) =Get_tigbt;
       (*m) =Get_tmain;  
       (*p) =Get_ppg;
       (*z) =Get_data;
       
       //2# 4# IH heating NTC 
     if(index >=1)	//  //2# 3# 4#special deal temperature  ((index ==1)||(index==3))
      {
      	if(Get_tmain >CON_TMAIN_180)  (*so) =3;		//180  0xF1
        if(Get_tmain >CON_TMAIN_190)  (*so) =1;       	//190  0xF3
        if(*so)
        {
       	if(Get_tmain <CON_TMAIN_170)  (*so) =4;		//170  0xED
       	if(Get_tmain <CON_TMAIN_160)  (*so) =0;		//160  0xE9
        }
      }
     else		//1# normal	//1# 3# normal
      {
       if(Get_tmain >CON_TMAIN_180)  (*so) =1;
       else if(*so)
       {
       	if(((*c) <0x10)&&(Get_tmain <CON_TMAIN_160)) (*so) =2;
       	if(Get_tmain <CON_TMAIN_140) (*so) =0;		//140  0xDD
       }
      }
      //

       if(Get_tigbt >CON_TIGBT_105)   (*si) =1;
     else  if((*si)&&(Get_tigbt <CON_TIGBT_90))  (*si) =0;

      if(Get_data ==DATA_PAN_NO)  
      {
      	(*npan) =5;
      	if((*time)<3)  (*time)++;
     	if((*time) >=60)  	
     	{
     		(*time) =60;    	    
     	    	if(index <=1)
     	    	{
     	          if(flex_L_bz) {if((zone_1_nopan_time >=60)&&(zone_2_nopan_time >=60)) result=1;}
     	    	}
     	    	else 
     	    	{
     	    	  if(flex_R_bz) {if((zone_3_nopan_time >=60)&&(zone_4_nopan_time >=60)) result =1;} 
     	    	}
     	    	 	   
     	    if(result)  (*((u8*)(&zone_1_level +index))) =0;
     	    flex_deal(index+1);	
     	 }     
       }
      if(Get_data ==DATA_PAN_OK) (*time) =0;
      if(Pause_bz) 	(*time) =0;			
         	
       if(Get_vol >CON_VOL_270V)    result=0xE1;
       if(Get_vol <CON_VOL_160V)    result=0xE2;

       if(Get_tigbt >CON_TIGBT_120) result=0xE5;       
       if(Get_tigbt >CON_NTC_SHORT) result=0xF9;       
       if(Get_tigbt <CON_NTC_OPEN)  result=0xFA; 
 
       if(Get_tmain >CON_TMAIN_220) result=0xE3;       
       if(Get_tmain >CON_NTC_SHORT) result=0xF3;       
       if(Get_tmain <CON_NTC_OPEN)  result=0xF4; 
       
       if(result)  
        {       	
         if((*count)>3) (*err) =result;
       	 else (*count)++;
       	}
       else 
       {
       	(*count) =0;
       	(*err) =0;
       }
}
void set_off_power(u8 ADD)
{
	Add_Status =ADD|DATA_TURN_OFF;		
	cur_no =0x0A;				
	syn_delay =CON_0500;			
	max_pwm =CON_PWM_10us;	
	
	comm_asm_deal(); 		
}
u8  zone_x_t_status(u8 level,u8 ton_js)
{
    if(ton_js >= arr_tiao_on[level-1]) return(0);
  	else  return(1);
}
u8  syn_deal(u8 par,u8 pwm)
{
   u8 data =CON_0750;				
   if(pwm >CON_PWM_23us)  data =CON_0250;	//23us(72)
   if(pwm >CON_PWM_21us)  data =CON_0375;	//21us(88)
   if(pwm >CON_PWM_19us)  data =CON_0500;	//19us(104)
   if(pwm >CON_PWM_17us)  data =CON_0625;	//17us(120)


    if(data >0x30)   data =0x30;     				//00xx xxxx  low 6bits is active
    return(data);
}
void comm_deal(u8 index,u8 add,u8 level,u8 limit_t,u8 err)
{
  u8 temp_pwm =0;
  u8 heat_status =0;

        u8 *o =&oil_high_1 +index;
        u8 *i =&igbt_high_1+index;
        u8 *t =&tiao_on_1+index;
        u8 *pwm =&pwm_temp_1+index;
        u8 *g =&ppg_1+index;
        u16 *tw =&work_1_time+index;
        u8 *npan =&zone_1_nopan_wait+index;

       if((limit_time >2400)&&(level >5)&&(level <10)) level =5;  // if(limit_time >2400) level =5;
  
  if(err)  {set_off_power(add);(*t) =0;}	//issue of "E5->U->9"
  else 
  {
  if(level ==0)  set_off_power(add);
  else  
    {
	Add_Status =add|DATA_TURN_ON|DATA_PULSE;		                     
		//
		if(*o) level =(*o);
		if(*i) level =3;
		//
	heat_status =1;
		if(level <7)      
		{
			(*t)++;  
			heat_status =zone_x_t_status(level,(*t)); 
			if(level ==1) {if((*t)>=41) (*t) =0;}
			else {if((*t)>=11) (*t) =0;}
		}	 
		else  (*t) =0;
		//				
	if(heat_status ==0) set_off_power(add);
	else 
	{
		index++;
		
		if(level >=7)
		{
		   if(index ==1)		
		   	{
		   		temp_pwm =arr_1_pow[level-7]; 		   		
		   		if(flex_L_bz)  {temp_pwm =arr_flex_b[level-5];Add_Status +=2;}	//felx detect pulse++	
		   		// 
		   		if((limit_t)&&(temp_pwm > limit_t))         temp_pwm =limit_t; 
		   		if((vol_1 >=CON_VOL_240V)&&(temp_pwm <=87)) temp_pwm +=(vol_1-CON_VOL_230V); 
		   	}
	           if(index ==2)		
	           	{
	           		temp_pwm =arr_2_pow[level-7];
	           		if(flex_L_bz) {temp_pwm =arr_flex_s[level-5];Add_Status +=4;}	//felx detect pulse++
	           		// 
		   		if((limit_t)&&(temp_pwm > limit_t))          temp_pwm =limit_t; 
		   		if((vol_2 >=CON_VOL_240V)&&(temp_pwm <=142)) temp_pwm +=(vol_2-CON_VOL_230V)*2;
	           	}
	           if(index ==3)		
	           	{
	           		temp_pwm =arr_3_pow[level-7];
	           		if(flex_R_bz)  {temp_pwm =arr_flex_b[level-5];Add_Status +=2;}	//felx detect pulse++
	           		// 
		   		if((limit_t)&&(temp_pwm > limit_t))         temp_pwm =limit_t; 
		   		if((vol_3 >=CON_VOL_240V)&&(temp_pwm <=87)) temp_pwm +=(vol_3-CON_VOL_230V);
	           	}
	           if(index ==4)		
	           	{
	           		temp_pwm =arr_4_pow[level-7];
	           		if(flex_R_bz)  {temp_pwm =arr_flex_s[level-5];Add_Status +=4;}	//felx detect pulse++
	           		// 
		   		if((limit_t)&&(temp_pwm > limit_t))          temp_pwm =limit_t; 
		   		if((vol_4 >=CON_VOL_240V)&&(temp_pwm <=142)) temp_pwm +=(vol_4-CON_VOL_230V)*2;
	           	}
	           	
		   //if((limit_t)&&(temp_pwm > limit_t))       temp_pwm =limit_t;
		   (*pwm) =temp_pwm;
		   cur_no =zone_x_cur_no_set(index,(*g));
		   //if(index ==1)	pwm_temp_1 =noise_xx_deal(ppg_2,temp_pwm);		
		   //if(index ==2)	pwm_temp_2 =noise_xx_deal(ppg_1,temp_pwm);		
		   //if(index ==4)	pwm_temp_4 =noise_xx_deal(ppg_3,temp_pwm);
		   //
		   if(((*tw)<5)||(*npan))  
		  {
			cur_no =0x10;
			if(index%2)  (*pwm) =70;				
			else   (*pwm) =115;
		  }
		   //
		}
		else												
		{
		    	//if(index ==1) 		(*pwm) =arr_tiao_180_pwm[level-1];
		    	//if((index ==2)||(index ==4)) 	(*pwm) =arr_tiao_180_pwm[level-1];
		    	//if(index ==3)	
		    	(*pwm) =arr_tiao_180_pwm[level-1];
		    	//erp
		    	if(level ==2)  (*pwm) =erp_pwm[index-1];	
		    	//erp
		    	cur_no =0x10;
		}		
		if((index ==1)||(index ==3))  cur_no =cur_no/2;		//1# 3# boost double igbt & current
		
		if((flex_L_bz)&&(index ==1))  
		   {
		   	if(cur_no ==0x10)     cur_no =0x05;
		   	if(cur_no ==0x18)     cur_no =0x09;
		   	if(cur_no ==0x1C)     cur_no =0x0E;
		   	if(cur_no ==0x24)     cur_no =0x12;
		   }
		if((flex_L_bz)&&(index ==2))  cur_no -=10;
		if((flex_R_bz)&&(index ==3))  
		   {
		   	if(cur_no ==0x10)     cur_no =0x05;
		   	if(cur_no ==0x18)     cur_no =0x09;
		   	if(cur_no ==0x1C)     cur_no =0x0E;
		   	if(cur_no ==0x24)     cur_no =0x12;
		   }		
		if((flex_R_bz)&&(index ==4))  cur_no -=10;
			
                max_pwm =(*pwm);
	       //synchronous deal		
			//syn_delay=syn_deal(max_pwm);
		syn_delay=syn_deal(index,(*g));
	       //flex ntc deal
	       //syn_delay =flex_ntc_deal(index,syn_delay);
	       if(level <7)  syn_delay |=0x40;			//bit7 ->1 -> PWM direct setting mode
	       //
	       comm_asm_deal();	
	}		
    }	
  }
}
void  speed_up(void)
{
	//speed up 0827
	ms10_counter =48;
	buzzer_account =0;
	//speed up 0827
} 
void Power_off_deal(void)
{
 	Power_on_bz =FALSE;
 	key_zone =0;
 	timer_status =0;
	buzzer_account =0;
 	
 	boost_status =0;
 	boost_time_1 =0;
 	boost_time_2 =0;
 	boost_time_3 =0;
 	boost_time_4 =0;
 	
 	time_flash_count =0;
 	zone_flash_count =0;
 	
 	zone_1_level =0;
 	zone_2_level =0;
 	zone_3_level =0;
 	zone_4_level =0; 
 		
 	general_timer =0;
 	flex_L_bz =0;	
 	flex_R_bz =0;
 	bbq_L_bz =0;
 	bbq_R_bz =0;	
 	
 	Pause_bz =0;	
 	pause_x_timer =0;
}
u8 minium_value(u8 a,u8 b)
{
	u8 data =0;
	return(Compare_min(a,b,data));
}
u8 calculate_min(u8 d1,u8 d2,u8 d3,u8 d4)
{
   u8 result =0;

   result =minium_value(d1,d2);
   result =minium_value(d3,result);
   result =minium_value(d4,result);   
   
   if(result ==255) result =0;
   return(result);
}   

u8 Display_decode(u8 In_data)
{
	u8 code_data = 0;
	switch(In_data)
	{
		case 0: code_data  = NUM_0;break;
		case 1: code_data  = NUM_1;break;
		case 2: code_data  = NUM_2;break;
		case 3: code_data  = NUM_3;break;
		case 4: code_data  = NUM_4;break;
		case 5: code_data  = NUM_5;break;
		case 6: code_data  = NUM_6;break;
		case 7: code_data  = NUM_7;break;
		case 8: code_data  = NUM_8;break;
		case 9: code_data  = NUM_9;break;
		case 10: code_data = CHR_A;break;
		case 11: code_data = CHR_B;break;
		case 12: code_data = CHR_C;break;
		case 13: code_data = CHR_D;break;
		case 14: code_data = CHR_E;break;
		case 15: code_data = CHR_F;break;
  	}	 	
	 return ((u8)code_data);
}
u8 ON_disp_zone_x(u8 index,u8 BBQ,u8 level,u8 *change,u8 index_f,u8 select,u8 flash,u8 pan,u8 other_pan,u8 err)
{
   u8 dis_buf =CHR_BLANK;
   if((*change) &select)
   {
   	if(zone_flash_count %2) dis_buf =CHR_P; 
   	if(zone_flash_count <6) (*change) =0;
   } 
   if((key_zone != select) || ((zone_flash_count %2)==0)) 
   {
	if(level)  
             {
               	dis_buf = Display_decode(level);  
               	if(level ==10)      dis_buf =CHR_P; 
               	//
               	if(BBQ)  
               	{
               	if((index ==0)||(index ==2))   dis_buf =CHR_B;	
               	if((index ==1)||(index ==3))   dis_buf =CHR_Q;
        	}
               	//
               	if(timer_status & select) 	   dis_buf |=SEG_P;
		
		if(zone_flash_count ==0)
               	{
               		if(index_f ==0) 
               		{
               	 	if(pan >4)    //normal status            	
               	 		{             
               			if(flash_list %2)	   dis_buf =CHR_V;
      		 		else dis_buf =SEG_D;
      		 		}
      	        	}
      	        	else if((pan>4)&&(other_pan>4))   
      	        	{
      	          	if(flash_list %2)	   dis_buf =CHR_V;
      		 	else dis_buf =SEG_D;		
      	        	} 
      	        }              	               	                             	              	
             }
        else 
             {
             	if((zone_flash_count ==0)&&(flash)&&(flash_list %2)) dis_buf = CHR_H;
                else 
                	{
                	if(zone_flash_count)  dis_buf = NUM_0;            	
                	else dis_buf = SEG_G;
                	}               
             }
        if(err)
            {
            	if(flash_list %2)  dis_buf = Display_decode((err & 0xF0) >>4);
            	else dis_buf =Display_decode(err & 0x0F);
            } 	
     }
      return(dis_buf);
}
void APT8L16Init_H(void)
{
   u8 i=0;
   u8 j=0;
   do
   {
   APTTouchWrOneData(APT_ADD_H,0x3A,0x5A);    //setting mode  
   j =APTTouchRdOneData(APT_ADD_H,0x3A); 
   }while (j!=0x5A);
   
   for(i=0x20;i<=0x2D;)   
   	{
	  APTTouchWrOneData(APT_ADD_H,i,arr_APTRegData_H[i-0x20]);
	  if(APTTouchRdOneData(APT_ADD_H,i)==arr_APTRegData_H[i-0x20]) i++;
   	}
   for(i=0;i<=0x0F;)   
     {
     	APTTouchWrOneData(APT_ADD_H,i,arr_T_Sens_H[i]);            //Set sensing K00~K17
     	if(APTTouchRdOneData(APT_ADD_H,i)==arr_T_Sens_H[i]) i++;   //vertify K00~K17
     }
   do
   {
   APTTouchWrOneData(APT_ADD_H,0x3A,0x00);    //working mode
   j =APTTouchRdOneData(APT_ADD_H,0x3A); 
   }while (j !=0x00);
}
void APT8L16Init_L(void)
{
   u8 i=0;
   u8 j=0;
   do
   {
   APTTouchWrOneData(APT_ADD_L,0x3A,0x5A);    //setting mode  
   j =APTTouchRdOneData(APT_ADD_L,0x3A); 
   }while (j!=0x5A);
   
   for(i=0x20;i<=0x2D;)   
   	{
	  APTTouchWrOneData(APT_ADD_L,i,arr_APTRegData_L[i-0x20]);
	  if(APTTouchRdOneData(APT_ADD_L,i)==arr_APTRegData_L[i-0x20]) i++;
   	}
   for(i=0;i<=0x0F;)   
     {
     	APTTouchWrOneData(APT_ADD_L,i,arr_T_Sens_L[i]);            //Set sensing K00~K17
     	if(APTTouchRdOneData(APT_ADD_L,i)==arr_T_Sens_L[i]) i++;   //vertify K00~K17
     }
   do
   {
   APTTouchWrOneData(APT_ADD_L,0x3A,0x00);    //working mode
   j =APTTouchRdOneData(APT_ADD_L,0x3A); 
   }while (j !=0x00);
} 
void APT8L16Init_AH(void)
{
   u8 i=0;
   u8 j=0;
   do
   {
   APTTouchWrOneData1(APT_ADD_H,0x3A,0x5A);    //setting mode  
   j =APTTouchRdOneData1(APT_ADD_H,0x3A); 
   }while (j!=0x5A);
   
   for(i=0x20;i<=0x2D;)   
   	{
	  APTTouchWrOneData1(APT_ADD_H,i,arr_APTRegData_AH[i-0x20]);
	  if(APTTouchRdOneData1(APT_ADD_H,i)==arr_APTRegData_AH[i-0x20]) i++;
   	}
   for(i=0;i<=0x0F;)   
     {
     	APTTouchWrOneData1(APT_ADD_H,i,arr_T_Sens_AH[i]);            //Set sensing K00~K17
     	if(APTTouchRdOneData1(APT_ADD_H,i)==arr_T_Sens_AH[i]) i++;   //vertify K00~K17
     }
   do
   {
   APTTouchWrOneData1(APT_ADD_H,0x3A,0x00);    //working mode
   j =APTTouchRdOneData1(APT_ADD_H,0x3A); 
   }while (j !=0x00);
}
void key_scan_I2C(u8 list)
{
  u16 now_scan[3] ={0,0,0};
  u8 i =0;
  u8 result =0;
  u8  APTTouchKeyValueA,APTTouchKeyValueB;
  if(list ==1)
  {
  APTTouchKeyValueA =APTTouchRdOneData(APT_ADD_H,0x34);
  APTTouchKeyValueB =APTTouchRdOneData(APT_ADD_H,0x35);
  I2C_GET_DATA_H =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;
  key_scan_value_H =I2C_GET_DATA_H;
  }
  if(list ==2)
  {
  APTTouchKeyValueA =APTTouchRdOneData(APT_ADD_L,0x34);
  APTTouchKeyValueB =APTTouchRdOneData(APT_ADD_L,0x35);
  I2C_GET_DATA_L =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;
  key_scan_value_L =I2C_GET_DATA_L;

  APTTouchKeyValueA =APTTouchRdOneData1(APT_ADD_H,0x34);
  APTTouchKeyValueB =APTTouchRdOneData1(APT_ADD_H,0x35);
  I2C_GET_DATA_AH =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;  
  key_scan_value_AH =I2C_GET_DATA_AH;  
  }
  if(list ==3)
  {
  if((I2C_GET_DATA_H ==0)&&(I2C_GET_DATA_L ==0)&&(I2C_GET_DATA_AH ==0))
  	{     		
     		key_account =0;
     		key_ok_bit =0;
     		key_err_account =0;	
	}
   else 
   {
     apt_min_reset =0;
        
        now_scan[0]=I2C_GET_DATA_H;
        now_scan[1]=I2C_GET_DATA_L;
        now_scan[2]=I2C_GET_DATA_AH;
        
        for(i=0;i<=2;i++)
        {
        	if(now_scan[i] !=arr_save_scan[i])  result =1;
        }
        if(result) 
        {
        	key_account =0;
        	arr_save_scan[0]=now_scan[0];
        	arr_save_scan[1]=now_scan[1];
        	arr_save_scan[2]=now_scan[2];       	                	
        }
        else key_account++;
     } 
  }  
}
void key_next_deal(void)
{ 
  u8  key_effective =0;
              if((key_account == short_press_time) ||(key_account == press_500ms_time)|| (key_account == long_press_time))   key_effective =1;
              if((key_account > long_press_time)  && (((key_account - long_press_time) %50) ==0))   key_effective =1;//speed up 0827
              if(key_effective)
                {
                	
		   		if((key_scan_value_H == VALUE_1DEC)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))    key_ok_bit =KEY_1DEC; 
		   	else	if((key_scan_value_H ==(VALUE_1DEC|VALUE_1S2))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))		key_ok_bit =KEY_1DEC;  
		   	else	if((key_scan_value_H == VALUE_1S2)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_1S2; 
		   	else	if((key_scan_value_H ==(VALUE_1S2|VALUE_1S3))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))      	key_ok_bit =KEY_1S2;
		   	else	if((key_scan_value_H == VALUE_1S3)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))     key_ok_bit =KEY_1S3; 
		   	else	if((key_scan_value_H ==(VALUE_1S3|VALUE_1S4))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))      	key_ok_bit =KEY_1S3; 
		   	else	if((key_scan_value_H == VALUE_1S4)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_1S4;  
		   	else	if((key_scan_value_H ==(VALUE_1S4|VALUE_1S5))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))		key_ok_bit =KEY_1S4; 
		   	else	if((key_scan_value_H == VALUE_1S5)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_1S5;  
		   	else	if((key_scan_value_H ==(VALUE_1S5|VALUE_1S6))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_1S5;
		   	else	if((key_scan_value_H == VALUE_1S6)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_1S6; 
		   	else	if((key_scan_value_H ==(VALUE_1S6|VALUE_1S7))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_1S6;  
		   	else	if((key_scan_value_H == VALUE_1S7)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_1S7;  
		   	else	if((key_scan_value_H ==(VALUE_1S7|VALUE_1S8))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_1S7;
                   	else	if((key_scan_value_H == VALUE_1S8)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_1S8;  
                   	else	if((key_scan_value_H ==(VALUE_1S8|VALUE_1INC))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_1S8;
                   	else	if((key_scan_value_H == VALUE_1INC)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))    key_ok_bit =KEY_1INC; 
                   	else	if((key_scan_value_H == VALUE_2DEC)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))    key_ok_bit =KEY_2DEC;  
                   	else	if((key_scan_value_H ==(VALUE_2DEC|VALUE_2S2))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))    		key_ok_bit =KEY_2DEC;
		   	else	if((key_scan_value_H == VALUE_2S2)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_2S2; 
		   	else	if((key_scan_value_H ==(VALUE_2S2|VALUE_2S3))&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_2S2; 
		   	else	if((key_scan_value_H == VALUE_2S3)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_2S3; 
		   	else	if((key_scan_value_H == VALUE_2S3)&&(key_scan_value_L == VALUE_2S4)&&(key_scan_value_AH ==0x0000))	    		key_ok_bit =KEY_2S3; 
		   	else	if((key_scan_value_H == VALUE_FL)&&(key_scan_value_L == 0x0000)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_FL;  
                   		 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_2S4)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_2S4;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==(VALUE_2S4|VALUE_2S5))&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_2S4;
                   	else    if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_2S5)&&(key_scan_value_AH ==0x0000))      key_ok_bit =KEY_2S5;
                   	else    if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==(VALUE_2S5|VALUE_2S6))&&(key_scan_value_AH ==0x0000))      		key_ok_bit =KEY_2S5;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_2S6)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_2S6; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==(VALUE_2S6|VALUE_2S7))&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_2S6;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_2S7)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_2S7;   
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==(VALUE_2S7|VALUE_2S8))&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_2S7; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_2S8)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_2S8;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==(VALUE_2S8|VALUE_2INC))&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_2S8;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_2INC)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_2INC;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_3DEC)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_3DEC;   
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==(VALUE_3DEC|VALUE_3S2))&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_3DEC;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_3S2)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_3S2;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==(VALUE_3S2|VALUE_3S3))&&(key_scan_value_AH ==0x0000))	    	key_ok_bit =KEY_3S2;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_3S3)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_3S3;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_3S3)&&(key_scan_value_AH == VALUE_3S4))	    		key_ok_bit =KEY_3S3;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_LOCK)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_LOCK;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_BOOST)&&(key_scan_value_AH ==0x0000))    key_ok_bit =KEY_BOOST;                 	 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_INC)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_INC;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L == VALUE_DEC)&&(key_scan_value_AH ==0x0000))	    key_ok_bit =KEY_DEC;
                 		 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_3S4))	    key_ok_bit =KEY_3S4;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_3S4|VALUE_3S5)))	    key_ok_bit =KEY_3S4;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_3S5))	    key_ok_bit =KEY_3S5;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_3S5|VALUE_3S6)))	    key_ok_bit =KEY_3S5;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_3S6))	    key_ok_bit =KEY_3S6;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_3S6|VALUE_3S7)))	    key_ok_bit =KEY_3S6;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_3S7))	    key_ok_bit =KEY_3S7; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_3S7|VALUE_3S8)))	    key_ok_bit =KEY_3S7; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_3S8))	    key_ok_bit =KEY_3S8;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_3S8|VALUE_3INC)))	    key_ok_bit =KEY_3S8;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_3INC))	    key_ok_bit =KEY_3INC; 
                   	else    if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4DEC))	    key_ok_bit =KEY_4DEC; 
                   	else    if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4DEC|VALUE_4S2)))	    key_ok_bit =KEY_4DEC; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4S2))	    key_ok_bit =KEY_4S2;   
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4S2|VALUE_4S3)))	    key_ok_bit =KEY_4S2;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4S3))	    key_ok_bit =KEY_4S3; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4S3|VALUE_4S4)))	    key_ok_bit =KEY_4S3;
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4S4))	    key_ok_bit =KEY_4S4;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4S4|VALUE_4S5)))	    key_ok_bit =KEY_4S4; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4S5))	    key_ok_bit =KEY_4S5;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4S5|VALUE_4S6)))	    key_ok_bit =KEY_4S5;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4S6))	    key_ok_bit =KEY_4S6;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4S6|VALUE_4S7)))	    key_ok_bit =KEY_4S6; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4S7))	    key_ok_bit =KEY_4S7;  
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4S7|VALUE_4S8)))	    key_ok_bit =KEY_4S7; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4S8))	    key_ok_bit =KEY_4S8; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH ==(VALUE_4S8|VALUE_4INC)))	    key_ok_bit =KEY_4S8; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_4INC))	    key_ok_bit =KEY_4INC; 
                   	else	if((key_scan_value_H ==0x0000)&&(key_scan_value_L ==0x0000)&&(key_scan_value_AH == VALUE_FR))	    key_ok_bit =KEY_FR;                
                   
                   	else  
                   	{
                   	if(key_scan_value_L &VALUE_ON_OFF)  	    key_ok_bit =KEY_ON_OFF;   //first deal for multi-apt solution
                   	else
                   		{
                   		key_err_account++;
                   		if(key_err_account == 10)   
                   	  	    {
                   	  		if(Power_on_bz == TRUE)  
                   	  		{Power_off_deal();buzzer_time = buz_1000ms;} //8s
                   	  	    }
                   		}
                   	}
                }    	                           	                                   
              else key_ok_bit =0;
                                                                            
}
void boost_x_time(u8 index,u16 *time_x,u8 *save_x,u8 *level_x,u8 select,u8 *count,u16 *wk_time)
{
	if((*time_x) ==300)
	{
		(*save_x) =(*level_x);	
		(*level_x) =10;
	}
	if(*time_x)  
	{
		(*time_x)--;
		if((*time_x) ==0) 
			{
				(*level_x) =(*save_x);
				/*if(*save_x) (*level_x) =(*save_x);
				else
				    {
				    	(*level_x) =9;
				    	(*wk_time) =arr_default_timer[9];
				    }*/
				(*count)++;
				flex_deal(index);
				boost_status &=~select;
			}
	}
}
void boost_time_deal(void)
{
        boost_x_time(1,&boost_time_1,&boost_1_save,&zone_1_level,Select_1_KEY,&boost_1_count,&zone_1_timer);
	boost_x_time(2,&boost_time_2,&boost_2_save,&zone_2_level,Select_2_KEY,&boost_2_count,&zone_2_timer);
	boost_x_time(3,&boost_time_3,&boost_3_save,&zone_3_level,Select_3_KEY,&boost_3_count,&zone_3_timer);
	boost_x_time(4,&boost_time_4,&boost_4_save,&zone_4_level,Select_4_KEY,&boost_4_count,&zone_4_timer);		
}  		
void time_b_power(u8 data)
{
	if(zone_1_level <10) time_level_1 =data;  
	if(zone_3_level <10) time_level_3 =data;	  			   
}  
void time_s_power(u8 data)
{
	if(zone_2_level <10) time_level_2 =data;				   
	if(zone_4_level <10) time_level_4 =data;
} 
u8  Zone_Big_Set(u8 index,u8 level,u8 count,u8 data,u16 tw)  
{
      if(level ==10)
	{
	   //if(index ==3)
	   //{					// 2600W
	   if(count ==1)  data -=20;		//dec 400w 2300w
	   if(count >1)   data -=35;		//dec 600w 2000w
	   //}	
	   //else
	   //{
	   //if(count ==1)  data -=15;		//dec 300w 2300w
	   //if(count >1)   data -=30;		//dec 600w 2000w
	   //}
	}
      else
        {
           if(tw >720)	  data =102;	//12min  1800w
   	   if(tw >900)	  data =97;	//15min  1700w
   	   if(tw >1200)	  data =85;	//20min  1500w
   	   if(tw >1800)	  data =74;	//30min  1300w
        }
    return(data);
}  
u8  Zone_Small_Set(u8 level,u8 count,u8 data,u16 tw) 
{
      if(level ==10)
	{				//1800W
	   if(count ==1)  data -=20;	//dec 200w  1600w
	   if(count >1)   data -=40;	//dec 400w  1500w
	}
      else
        {
           if(tw >900)	  data =175;	//15min  1350w
   	   if(tw >1200)	  data =162;	//20min  1250w
   	   if(tw >1800)	  data =133;	//30min	 1150w
        }
    return(data);
}                                                  
void time_power_deal(void)
{
   	if(zone_1_level >6)  	//1#  
   		{      
   			time_level_1  = Zone_Big_Set(1,zone_1_level,boost_1_count,arr_1_pow[3],work_1_time);
   		}
   	if(zone_2_level >6)	//2#
   		{
   			time_level_2 =Zone_Small_Set(zone_2_level,boost_2_count,arr_2_pow[3],work_2_time);
   		}
   	if(zone_3_level >6) 	//3#   
   		{
   			time_level_3  = Zone_Big_Set(3,zone_3_level,boost_3_count,arr_3_pow[3],work_3_time);
   		}
   	if(zone_4_level >6)	//4#
   		{
   			time_level_4 =Zone_Small_Set(zone_4_level,boost_4_count,arr_4_pow[3],work_4_time);
   		}    	  	   	
   	if((zone_1_level)&&(zone_2_level)&&(zone_3_level)&&(zone_4_level))  //1# 2# 3# 4#
   		{
   			if(limit_time  ==0)  limit_time =1;
   			if(limit_time >300)  {time_b_power(80);time_s_power(138);}	  	//05min		 
			if(limit_time >600)  {time_b_power(70);time_s_power(128);}		//10min
			if(limit_time >1200) {time_b_power(60);time_s_power(117);}		//20min
			if(limit_time >1800) {time_b_power(55);time_s_power(107);}		//30min
			//if(limit_time >2400) time_x_power(4);		//40min
			limit_time++;
   		}
   	else  limit_time =0;
}                                                 
void  short_key_buzzer(void)
{
	if(key_account == short_press_time)  buzzer_time = buz_200ms; 
}
void  inc_dec_deal(void)
{
	short_key_buzzer();
	time_flash_count =10; 
	zone_flash_count =0;
       	timer_precise_bz =TRUE;	 
}
void  on_off_key_deal(void)
{       
      buzzer_time = buz_200ms;
      if(Power_on_bz == TRUE)  {Power_off_deal();idle_count =1;Sec_bz =TRUE;}
      else         {Power_on_bz=TRUE; idle_count=60;} 
}
void  boost_x_deal(u8 select,u8 *level1,u8 *level2,u16 *time,u16 *o_time,u16 *tim1,u16 *tim2)
{    
      if(key_zone & select)
    	{
         buzzer_time = buz_200ms;
         zone_flash_count =10;
         if(((select <=Select_2_KEY)&&(flex_L_bz))||((select >Select_2_KEY)&&(flex_R_bz)))
         {
         	if(*time)    (*time) =1; 
           	else      (*time) =300;  
           	flex_deal(select+0x10);
         }
         else 
         {
         if((*level2)<=5)
         	{	          	
     		if(*time)    (*time) =1; 
           	else      (*time) =300;  
           	flex_deal(select+0x10);
        	}
         else 
         	{
         		/*
         	if((*level2)==10)  
         	  {
         	  	*o_time =0;
         	  	(*level2)=9;
         	  	if((*tim2) >arr_default_timer[9])  	(*tim2)  =arr_default_timer[9];
         	  }*/
         	change_count =select;	         	
         	if(*o_time) (*level1) =5;
         	else (*level1) =9;
         	if((timer_status & select)==0) (*tim1)  =arr_default_timer[9];
        	} 
         }		    		           
    	}
}
void  boost_key_deal(void)
{
   if(key_zone)
   {        		    
     boost_x_deal(Select_1_KEY,&zone_1_level,&zone_2_level,&boost_time_1,&boost_time_2,&zone_1_timer,&zone_2_timer);
     boost_x_deal(Select_2_KEY,&zone_2_level,&zone_1_level,&boost_time_2,&boost_time_1,&zone_2_timer,&zone_1_timer);
     boost_x_deal(Select_3_KEY,&zone_3_level,&zone_4_level,&boost_time_3,&boost_time_4,&zone_3_timer,&zone_4_timer);
     boost_x_deal(Select_4_KEY,&zone_4_level,&zone_3_level,&boost_time_4,&boost_time_3,&zone_4_timer,&zone_3_timer);
   //boost_x_deal(Select_5_KEY,&zone_5_level,&zone_5_level,&boost_time_4,&boost_time_3,&zone_4_timer,&zone_3_timer);
     Sec_bz =TRUE;
   }	
} 
void bbq_key_deal(u8 index)
{
	if(index ==1)
	{
		if(flex_L_bz)	
			{
				buzzer_time = buz_200ms;
				if(bbq_L_bz ==0) 
				     {
				     	bbq_L_bz =1;
				        zone_1_level =1;
				        zone_2_level =1;
				        boost_time_1 =0;
				        boost_time_2 =0;
				        timer_status &=~Select_1_KEY;
				        timer_status &=~Select_2_KEY;
				        zone_1_timer =120;
				        zone_2_timer =120;	//default timer
				     }
				else {bbq_L_bz =0;zone_1_level =0;zone_2_level =0;}
			}
	}
	if(index ==3)
	{
		if(flex_R_bz)	
			{
				buzzer_time = buz_200ms;
				if(bbq_R_bz ==0) 
					{
					   bbq_R_bz =1;
					   zone_3_level =1;
					   zone_4_level =1;
					   boost_time_3 =0;
				           boost_time_4 =0;
					   timer_status &=~Select_3_KEY;
				           timer_status &=~Select_4_KEY;
					   zone_3_timer =120;
					   zone_4_timer =120;	//default timer
					}
				else {bbq_R_bz =0;zone_3_level =0;zone_4_level =0;}
			}
	}
}
void  flex_L_key_deal(void)
{
     	//if((key_zone ==Select_1_KEY)||(key_zone ==Select_2_KEY))
     	if(key_account == short_press_time)
     	 {
     	 	buzzer_time = buz_200ms;     	 	
     	 		 
     	 	if(flex_L_bz ==0)  
     	 	{
     	 		flex_L_bz =1;
     	 		if(key_zone ==Select_1_KEY)       {flex_deal(0x11);boost_2_save =boost_1_save;}
     	 	   else if(key_zone ==Select_2_KEY)       {flex_deal(0x12);boost_1_save =boost_2_save;}
     	 	   else {zone_1_level =0;zone_2_level =0;}
     	 	}
     		else 
     		{
     			flex_L_bz =0;
     			if(bbq_L_bz)  {bbq_L_bz =0;zone_1_level =0;zone_2_level =0;}
     			zone_1_nopan_time =0;
     			zone_2_nopan_time =0;
     			if(zone_1_level ==10)   boost_time_1 =1;
     			if(zone_2_level ==10)   boost_time_2 =1;
     		}
     	 } 
      if(key_account == lock_press_time)
      {	 	
     	 	key_account =lock_press_time+1;
     	 	bbq_key_deal(1);
      } 	
} 
void  flex_R_key_deal(void)
{
     	 //if((key_zone ==Select_3_KEY)||(key_zone ==Select_4_KEY))
     	 if(key_account == short_press_time)
     	 {
     	 	buzzer_time = buz_200ms;
     	 		 
     	 	if(flex_R_bz ==0)  
     	 	{
     	 		flex_R_bz =1;
     	 		if(key_zone ==Select_3_KEY)       {flex_deal(0x14);boost_4_save =boost_3_save;}
     	 	   else if(key_zone ==Select_4_KEY)       {flex_deal(0x18);boost_3_save =boost_4_save;}
     	 	   else {zone_3_level =0;zone_4_level =0;}
     	 	}
     		else 
     		{
     			flex_R_bz =0;
     			if(bbq_R_bz)  {bbq_R_bz =0;zone_3_level =0;zone_4_level =0;}
     			zone_3_nopan_time =0;
     			zone_4_nopan_time =0;
     			if(zone_3_level ==10)   boost_time_3 =1;
     			if(zone_4_level ==10)   boost_time_4 =1; 
     		}
     	 } 
       if(key_account == lock_press_time)
       {	 	
     	 	key_account =lock_press_time+1;
     	 	bbq_key_deal(3);
       }   	
} 
void  lock_key_deal(void)
{
     if(lock_bz == FALSE) 
      {
      	if(key_account == short_press_time)
      	   {
      		buzzer_time = buz_200ms;
      		lock_bz =TRUE;
      		idle_count=60;
      		key_account =lock_press_time+1;
      		
      		speed_up();
      	   }
      }
     else 
      {
      	if(key_account == lock_press_time)
      	  {
      	  	buzzer_time = buz_200ms;
      	  	lock_bz =FALSE;
      	  	idle_count=60;
      	  	
      	  	speed_up();
      	  }	
      }	
}
void  ktimer_x_deal(u8 select,u16 *p,u8 level)
{
   if(key_zone ==select)
   {
	if(timer_status & select) {timer_status &= ~select; (*p) =arr_default_timer[level];}
      	 	else {timer_status |= select; (*p) =default_timer;}
      	 flex_deal(select+0x10);
   }
}
void  timer_key_deal(void)
{
      if((key_zone) || (timer_status == 0))
      {
      	buzzer_time = buz_200ms;     
        time_flash_count =10;  
      }
      //zone_flash_count =0;      
      if(key_zone)
     	{
     	  timer_precise_bz =TRUE;
     	  ktimer_x_deal(Select_1_KEY,&zone_1_timer,zone_1_level);
      	  ktimer_x_deal(Select_2_KEY,&zone_2_timer,zone_2_level);
      	  ktimer_x_deal(Select_3_KEY,&zone_3_timer,zone_3_level);
      	  ktimer_x_deal(Select_4_KEY,&zone_4_timer,zone_4_level);
      	//ktimer_x_deal(Select_5_KEY,&zone_5_timer,zone_5_level);
      	  general_timer =0;
	}
      else
        {
          if(timer_status == 0)    
       	  {
       	     if(general_timer)  general_timer =0;
       	     else 	general_timer =default_timer;
       	  }
        }
}
/*
void  inc_x_key_level(u8 *count,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select, u16 *tim1,u16 *tim2)
{
  buzzer_time = buz_200ms;
  zone_flash_count =10;
  change_count =0;
  if(time_flash_count)  time_flash_count =0;
  key_zone = select;	
  	if(time1 ==0)
  	{
  		/*
  	  if((*count) ==0)		(*count) =1;  
	  else 	
	      {	
    		if(((*count) ==1) && ((*level) ==0))   (*level) = default_level;
        	else    (*level)++;
        	*/
              /*
        	//
    	        if(((*count) ==0) && ((*level) ==0))   (*level) = default_level;
    	        else    (*level)++;
    	        //
    		(*count) =2;	
    	         	        		     	
    		if((*level) >9)  (*level) =9;  
    		if(*time2)
    	  	  {
    	  	   (*time2) =0;
    	  	   (*o_level) =9;
    	  	   if((*tim2) >arr_default_timer[9])  (*tim2) =arr_default_timer[9];
    	  	  }
    		if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
    	      //}
  	} 		     	 			
}
*/
void  inc_x_timer(u8 select,u16 *timer)
{
  if(key_zone ==select) 
   {
	if(timer_status & select) 
        	{
        	   if(key_account == short_press_time) (*timer)++;
        	   else (*timer) +=10;
        	}
           else {timer_status |= select; (*timer) = default_timer;}
        if((*timer) >99)  (*timer)  =0; 
        general_timer =0;   //if setting to timer function ,clear counter function
        
        speed_up();
   }
}
/*
void  dec_x_key_level(u8 *count,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select, u16 *tim1,u16 *tim2)
{
  buzzer_time = buz_200ms;
  zone_flash_count =10;
  change_count =0;
  key_zone = select;	
   	if(time1 ==0)
  	{
  		/*
  	  if((*count) ==0)		(*count) =1;  
	  else 	
	      {	
    		if(((*count) ==1) && ((*level) ==0))  	(*level) = default_level;
    		*/
    		/*
    		//
    		if(((*count) ==0) && ((*level) ==0))   (*level) = default_level;
    		//
	   	else 	
	   	{
	         if(*level)  (*level)--;
	         //else (*level) =9; 
	        }  
    		(*count) =2; 
    		if(*time2)
    	  	  {
    	  	   (*time2) =0;
    	  	   (*o_level) =9;
    	  	   if((*tim2) >arr_default_timer[9])  (*tim2) =arr_default_timer[9];
    	  	  }
    	  	if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
    	      //}
  	} 	         		        		
}
*/
void  dec_x_timer(u8 select,u16 *timer)
{
   if(key_zone ==select) 
   {
	if(timer_status & select) 
         {
            	if(key_account == short_press_time)
               	 {
               	   if((*timer)) (*timer)--;
               	   else (*timer) =99;
               	 }
               	else 
               	 {
               	   if((*timer) >10) (*timer) -=10;
               	   else (*timer)=99;
               	}
          }
         else {timer_status |= select; (*timer) = default_timer;}
         general_timer =0;   //if setting to timer function ,clear counter function
         
         speed_up();
    }
}
void  inc_key_deal(void)
{                       	         	         	   
       	   if(key_zone)
           {  
        	inc_x_timer(Select_1_KEY,&zone_1_timer);       			   
        	inc_x_timer(Select_2_KEY,&zone_2_timer);
        	inc_x_timer(Select_3_KEY,&zone_3_timer);
        	inc_x_timer(Select_4_KEY,&zone_4_timer);
        	
        	inc_dec_deal();
        	if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);
           }	 
           else
           {
            if(timer_status == 0) 
         		{   	
         		    if(key_account == short_press_time) general_timer++;
         		    else     general_timer +=10; 
         		    if(general_timer >99) general_timer =0;
         		    
         		    inc_dec_deal(); 
         		    
         		    speed_up();      		   
         		}   	   
           } 			                 		 			
}
void  dec_key_deal(void)
{                        	   	    			
         if(key_zone)
         {    
         	 dec_x_timer(Select_1_KEY,&zone_1_timer);   	     
         	 dec_x_timer(Select_2_KEY,&zone_2_timer);  
         	 dec_x_timer(Select_3_KEY,&zone_3_timer);   
         	 dec_x_timer(Select_4_KEY,&zone_4_timer);
         	 
         	 inc_dec_deal();
         	 if(key_zone <=Select_4_KEY)	flex_deal(key_zone+0x10);		  			  
         }
         else 
         {
         if(timer_status == 0)   
         	{            	
              	if(key_account == short_press_time)
              			 {              				
          				if(general_timer) general_timer--;
          				else general_timer =99;
               			 }
             	else if(general_timer >10) general_timer -=10;
                  else general_timer=99; 
                  
                 inc_dec_deal();
                 
                 speed_up();
          	}		  	
        }
}
/*
void key_x_onoff_deal(u8 select,u8 *level)
{
   buzzer_time = buz_200ms;
   
      if(onoff_x_bz & select)  {onoff_x_bz &=~select;(*level) =0;}
      else        
      {
       onoff_x_bz |=select;	
       key_zone =select;
       zone_flash_count =10;
      }	
}
*/
void slide_x_setting(u8 select,u8 *level,u8 index,u16 *timer,u8 o_level)
{
	if((key_zone & select)&&((*level) !=10)) 
    	{         	          	          	
          if(o_level==10)    {if(index >5) index =5;}
       	  (*level) =index;
       	  if((timer_status & select) ==0)  (*timer) =arr_default_timer[index];
       	  zone_flash_count =10;         
          flex_deal(select+0x10);       	        	    		           
    	}		
}
//
void  cancel_boost_x_deal(u8 select,u8 *level1,u8 level2,u16 *time,u8 *save)
{    
      if(key_zone == select)
    	{         
         //if(level2 !=10)		//another !=10 
         	{	          	
     		if(*time)   
     			{
     				 (*time) =0; 
     				 (*save) =0;
     				 (*level1)=0;
     				 Sec_bz =TRUE;
     				 buzzer_time = buz_200ms;
     			}           	
        	}		    		           
    	}
}
//
void slide_x_deal(u8 select)
{ 
    zone_flash_count =10; 
    time_flash_count =0;   
    buzzer_time = buz_50ms;
    
  if(key_zone != select) key_zone = select;       
  else
  {
   if(key_zone)
   {	
     cancel_boost_x_deal(Select_1_KEY,&zone_1_level,zone_2_level,&boost_time_1,&boost_1_save);
     cancel_boost_x_deal(Select_2_KEY,&zone_2_level,zone_1_level,&boost_time_2,&boost_2_save);
     cancel_boost_x_deal(Select_3_KEY,&zone_3_level,zone_4_level,&boost_time_3,&boost_3_save);
     cancel_boost_x_deal(Select_4_KEY,&zone_4_level,zone_3_level,&boost_time_4,&boost_4_save);       		      
   }	 	
  }	     
}
void slide_1st_select(u8 select)
{
	zone_flash_count =10; 
   	time_flash_count =0;   
    	buzzer_time = buz_50ms;
    	key_zone =select;
}
void bbq_power_deal(void)
{
	if((bbq_L_bz)&&(zone_1_level+zone_2_level)) 
	{		
		bbq_L_time++;
		if(bbq_L_time <=75) 			  {zone_1_level =8;zone_2_level =8;}
		if((bbq_L_time >75)&&(bbq_L_time <=120))  {zone_1_level =7;zone_2_level =7;}
		if((bbq_L_time>120)&&(bbq_L_time <=300))  {zone_1_level =6;zone_2_level =6;}
		if((bbq_L_time>300)&&(bbq_L_time <=600))  {zone_1_level =5;zone_2_level =5;}
		if(bbq_L_time>600)	                  {zone_1_level =4;zone_2_level =4;}
	}
	else bbq_L_time =0;
	
	if((bbq_R_bz)&&(zone_3_level+zone_4_level))  
	{		
		bbq_R_time++;
		if( bbq_R_time <=75) 			  {zone_3_level =8;zone_4_level =8;}
		if((bbq_R_time >75)&&(bbq_R_time <=120))  {zone_3_level =7;zone_4_level =7;}
		if((bbq_R_time>120)&&(bbq_R_time <=300))  {zone_3_level =6;zone_4_level =6;}
		if((bbq_R_time>300)&&(bbq_R_time <=600))  {zone_3_level =5;zone_4_level =5;}
		if( bbq_R_time>600)	                  {zone_3_level =4;zone_4_level =4;}
	}
	else bbq_R_time =0;
}
void Pause_function_key(void)
{   
     if(key_account == short_press_time)    //with stop & go function
     {
      if((lock_bz == FALSE)&&(zone_1_level |zone_2_level|zone_3_level|zone_4_level))
      {
     	buzzer_time = buz_200ms;
     	zone_flash_count =0;
	time_flash_count =0;
	
	if(Pause_bz) 
	{
		Pause_bz =0;
		pause_x_timer =0;
		zone_1_timer =arr_default_timer[zone_1_level];
		zone_2_timer =arr_default_timer[zone_2_level];
		zone_3_timer =arr_default_timer[zone_3_level];
		zone_4_timer =arr_default_timer[zone_4_level];
		if(timer_status & Select_1_KEY)  zone_1_timer =Pause_save_timer_1; 
	 	if(timer_status & Select_2_KEY)  zone_2_timer =Pause_save_timer_2; 
	 	if(timer_status & Select_3_KEY)  zone_3_timer =Pause_save_timer_3; 
	 	if(timer_status & Select_4_KEY)  zone_4_timer =Pause_save_timer_4; 
	}
	else 
	{
	 	Pause_bz =1;
	 	pause_x_timer =120;	 	
	 	if(timer_status & Select_1_KEY)  Pause_save_timer_1 =zone_1_timer; 
	 	if(timer_status & Select_2_KEY)  Pause_save_timer_2 =zone_2_timer; 
	 	if(timer_status & Select_3_KEY)  Pause_save_timer_3 =zone_3_timer; 
	 	if(timer_status & Select_4_KEY)  Pause_save_timer_4 =zone_4_timer;
	 	zone_1_timer =0;
	 	zone_2_timer =0;
	 	zone_3_timer =0;
	 	zone_4_timer =0;	 	
	}
      }
    }
}
/*****************************************************************************
 * Main program entry point.
 ****************************************************************************/
void main()
{  
    u8  i =0;
    u8  temp_8 =0;
        
    u8  par_1 =0;
    u8  par_2 =0;
    u8  par_3 =0;
    u8  par_4 =0;
    u8  par_5 =0;
     
    u16 list_counter =0;   
    
    u8 *p;
    u8 *q;
    u8 *x;
    u8 *y;
    u16 *tz;
    u16 *tw;
    u16 *tb;
    u16 *ta;
    u8 *b;
    u8 *u;	           
//***********************************************
//intial IWAG configure
//***********************************************
    IWDG_Enable();/* Enable the access to the IWDG registers*/        
    IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);/* Fixe IWDG Reset period */
        
    IWDG_SetPrescaler(IWDG_Prescaler_256);
    IWDG_SetReload(0xFF);       
    IWDG_ReloadCounter();/* Refresh IWDG */
//************************************************
    disableInterrupts();
//************************************************
//initial system clock 
//************************************************
    CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
    CLK->ICKR |= CLK_ICKR_HSIEN;
    CLK->ICKR |= CLK_ICKR_LSIEN;  
    CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (u8)CLK_PRESCALER_HSIDIV1;
    CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
    CLK->CKDIVR |= (u8)((u8)CLK_PRESCALER_CPUDIV1 & (u8)CLK_CKDIVR_CPUDIV);
//************************************************
//initial Timer4 clock 
//************************************************  
    //TIM4_DeInit();  
    //TIM4_TimeBaseInit(TIM4_PRESCALER_128,123 );/* Time base configuration 1ms interrupt*/ 
    /* Set the Prescaler value */
    TIM4->PSCR = (u8)(TIM4_PRESCALER_128);
    /* Set the Autoreload value */
    TIM4->ARR = (u8)(123);
    //TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    /* Enable the Interrupt sources */
    TIM4->IER |= (u8)(TIM4_IT_UPDATE);
    //TIM4_Cmd(ENABLE);   /* Enable TIM4 */
    TIM4->CR1 |= TIM4_CR1_CEN;
//************************************************   
//************************************************
//initial I/O ports  & modules
//************************************************
    T_SCK_Port->CR1 |=T_SCK_Pin;	
    T_SCK_Port->DDR |=T_SCK_Pin;
    SCL_0;
     
    T_SDA_Port->CR1 |=T_SDA_Pin;
    T_SDA_Port->CR2 &=~T_SDA_Pin;    
    SDA_OUT;
    SDA_0;
    
    T1_SCK_Port->CR1 |=T1_SCK_Pin;	
    T1_SCK_Port->DDR |=T1_SCK_Pin;
    SCL1_0;
     
    T1_SDA_Port->CR1 |=T1_SDA_Pin;
    T1_SDA_Port->CR2 &=~T1_SDA_Pin;    
    SDA1_OUT;
    SDA1_0;
    
    TX_Port->CR1 |=TX_Pin;
    TX_OUT;
    TX_1;

    RX_Port->CR1 |=RX_Pin;
    RX_IN;
                   
    D_SCK_Port->CR1 |=D_SCK_Pin;		
    D_SCK_Port->DDR |=D_SCK_Pin;		
    D_SCK_Port->ODR |=D_SCK_Pin;
            
    D_SDA_Port->CR1 |=D_SDA_Pin;		
    D_SDA_Port->DDR |=D_SDA_Pin;	
    D_SDA_Port->ODR |=D_SDA_Pin;   
    
    D_EN_Port->CR1  |=D_EN_Pin;		
    D_EN_Port->DDR  |=D_EN_Pin;	
    D_EN_Port->ODR  |=D_EN_Pin;     
    
    RELAY_Port->CR1 |=RELAY_Pin;		
    RELAY_Port->DDR |=RELAY_Pin;
    RELAY_OFF;  
   
    FAN_Port->CR1 |=FAN_Pin;		
    FAN_Port->DDR |=FAN_Pin;
    FAN_OFF;  	
    
    GPIOD->CR1 |=GPIO_PIN_2;		//beeper	
    GPIOD->DDR |=GPIO_PIN_2;
    GPIOD->ODR |=GPIO_PIN_2;  
//************************************************ 
//initial Timer1 clock    
//************************************************ 
 TIM1->ARRH = 0x64;
 TIM1->ARRL = 0x00;			//0x6400 =25600

 //TIM1->PSCRH = (u8)(0x0F >> 8);
 //TIM1->PSCRL = (u8)(0x0F);    	//PSCR =0
 //TIM1->CR1 = (u8)(((TIM1->CR1) & (u8)(~(TIM1_CR1_CMS | TIM1_CR1_DIR))) | (u8)(TIM1_COUNTERMODE_UP));
 //TIM1->RCR = TIM1_RCR_RESET_VALUE;
 /*TIM1_ITConfig( TIM1_IT_UPDATE , ENABLE); */
 
 TIM1->IER |= (u8)TIM1_IT_UPDATE;
 TIM1->CR1 |= TIM1_CR1_CEN;
 /*TIM1_ClearFlag(TIM1_FLAG_UPDATE); */
 //TIM1->SR1 = (u8)(~(u8)(TIM1_FLAG_UPDATE));
 //TIM1->SR2 = (u8)((u8)(~((u8)((u16)TIM1_FLAG_UPDATE >> 8))) & (u8)0x1E);
 	    
//************************************************	      
    enableInterrupts(); 
//************************************************ 
//initial Timer2 clock    
//************************************************  
    //TIM2_TimeBaseInit(0,OUTPUT_4KHZ);
    TIM2->PSCR = 0;                                                                                                                                                                                                                                                   
    TIM2->ARRH = (u8)(2000 >> 8);                                                                                                                      
    TIM2->ARRL = (u8)(2000);   
    //TIM2_OC3PreloadConfig(ENABLE);
    TIM2->CCMR3 |= (u8)TIM2_CCMR_OCxPE;
    //TIM2_Cmd(ENABLE);
    TIM2->CR1 |= (u8)TIM2_CR1_CEN;
    TIM2->IER |= (u8)TIM2_IT_UPDATE;          
//************************************************ 
     if(Check_Unique_ID())    match_ok =FALSE;
     else match_ok =TRUE;
//************************************************
//   while loop programe
//************************************************        
  while ( 1 )  
 {  
 	//communication recieve finished deal
 	if(comm_status == 2) 
	{
		comm_status =3;		
			   
        	   //Get_word_1 =add/data;
        	   //Get_word_2 =vol/cur;  
        	   //Get_word_3 =ti/tmain;
        	   //Get_word_4 =ppg/cur_no;
        	   
        	Get_addr =(u8)(Get_word_1 >>8);		//command address			
		Get_data =(u8)(Get_word_1); 		//command data	
		
		Get_vol =(u8)(Get_word_2 >>8);	
		Get_cur  =(u8)(Get_word_2);  
	}
	if(comm_status ==4)
	{
		comm_status =6;

		Get_tigbt =(u8)(Get_word_3 >>8);	
		Get_tmain  =(u8)(Get_word_3);  
		
		Get_ppg =(u8)(Get_word_4 >>8);	
		Get_cur_no  =(u8)(Get_word_4);

		temp_8 =comm_vertify();
	  			  			
		switch(Comm_step)
		{
		  case comm_1_s:if(temp_8)  comm_get_deal(1-1); break;
		  	/*
		  	if(temp_8)  
		  	{
		  	  if(debug_list ==1) {disp_debug1 =Get_addr; disp_debug2 =Get_data;}
			  if(debug_list ==2) {disp_debug1 =Get_vol;  disp_debug2 =Get_cur;}
			  if(debug_list ==3) {disp_debug1 =Get_tigbt;disp_debug2 =Get_tmain;}
			  if(debug_list ==4) {disp_debug1 =Get_ppg;  disp_debug2 =Get_cur_no;}
		  	  comm_get_deal(1-1);		
		  	}	
		  	else 	   {disp_debug1 =0;disp_debug2 =0;}
		  	break;
		  	*/		  			  	
		  case comm_2_s:if(temp_8)  comm_get_deal(2-1); break; 		  					         				
		  case comm_3_s:if(temp_8)  comm_get_deal(3-1); break;		  	
		  case comm_4_s:if(temp_8)  comm_get_deal(4-1); break;     		  	  			           			           			
		}
		
	}    	
//************************************************
//10ms_bz1
//************************************************ 					
        if(Ms10_bz1 == TRUE)
         {
         	Ms10_bz1 =FALSE;   
         	       	
	  if(key_initial_count) key_initial_count--; 
	  if(key_initial_count ==200) buzzer_time =buz_500ms;    //initial buzzer after power on 0.5s
	  if(buzzer_time)  buzzer_time--;   
	  
	  if(match_ok == FALSE)  buzzer_time =255;
	  else 	  
	     {
	     	if(key_initial_count==100) APT8L16Init_H(); 
	     	if(key_initial_count== 80) APT8L16Init_L();
	     	if(key_initial_count== 60) APT8L16Init_AH();	     	 	 
	     } 
	  if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(1);  	      	
         }
//************************************************
//10ms_bz2
//************************************************ 					
        if(Ms10_bz2 == TRUE)
         {
         	Ms10_bz2 =FALSE; 
          if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(2);
         }
//************************************************
//10ms_bz3
//************************************************ 					
        if(Ms10_bz3 == TRUE)
         {
         	Ms10_bz3 =FALSE; 
          if((match_ok ==TRUE)&&(key_initial_count <30))  key_scan_I2C(3); 
         }		
//************************************************
//10ms_bz4
//************************************************ 					
        if(Ms10_bz4 == TRUE)
         {
         	Ms10_bz4 =FALSE; 

        	key_next_deal();
          	//------------------------------------------------ 
          	if(key_ok_bit == KEY_ON_OFF)  
          	   {
          	   	if(key_account == short_press_time) {on_off_key_deal();speed_up();} 
          	   }
          	//------------------------------------------------ 
          	if(key_ok_bit == KEY_BOOST)    	//boost -> bbq  ->stop&go 
          	   {
          	   	 Pause_function_key();
          	   }
          	//------------------------------------------------ 
          	if(key_ok_bit == KEY_LOCK)  lock_key_deal();
          	//------------------------------------------------ 
          	if((Power_on_bz == TRUE) &&(Pause_bz ==0) && (lock_bz == FALSE)&&(key_account == lock_press_time))	//3s
          	   {	
          	   		
          		if(key_ok_bit == KEY_1INC)	{key_account =lock_press_time+1;boost_x_deal(Select_1_KEY,&zone_1_level,&zone_2_level,&boost_time_1,&boost_time_2,&zone_1_timer,&zone_2_timer);}
     		 	if(key_ok_bit == KEY_2INC)	{key_account =lock_press_time+1;boost_x_deal(Select_2_KEY,&zone_2_level,&zone_1_level,&boost_time_2,&boost_time_1,&zone_2_timer,&zone_1_timer);}
     			if(key_ok_bit == KEY_3INC)	{key_account =lock_press_time+1;boost_x_deal(Select_3_KEY,&zone_3_level,&zone_4_level,&boost_time_3,&boost_time_4,&zone_3_timer,&zone_4_timer);}
     			if(key_ok_bit == KEY_4INC)	{key_account =lock_press_time+1;boost_x_deal(Select_4_KEY,&zone_4_level,&zone_3_level,&boost_time_4,&boost_time_3,&zone_4_timer,&zone_3_timer);}
          	   }
          	//------------------------------------------------  
          	if((Power_on_bz == TRUE) && (lock_bz == FALSE) &&(Pause_bz ==0))  
          	 { 
          	 	//if(key_account == short_press_time)
          	 	//{         	 	
          	 	  //------------------------------------------------  
          	 	 /*if(key_ok_bit == KEY_BOOST)    	//boost -> bbq  ->stop&go 
          	   	  {
          	   	  Pause_function_key();
          	   	  }*/ 
          		  //------------------------------------------------ 
          		  if(key_ok_bit == KEY_FL)	
          		  {         		 
          	          flex_L_key_deal();	
          	          speed_up();          	          	
          		  } 
          	 	  //------------------------------------------------       
          	 	  		 
        		  if(key_ok_bit == KEY_FR)
          		  {
          	       	  flex_R_key_deal();  
          	       	  speed_up();		
          		  }          		   
          		//}
          		//------------------------------------------------ 
          		if(key_ok_bit == KEY_INC)	
          		{         		 
          	        inc_key_deal();	          	        	
          		}  
          		//------------------------------------------------          	
          		if(key_ok_bit == KEY_DEC)	
          		{
          	        dec_key_deal(); 			
          		}           		
          		//------------------------------------------------        	 	           		   
          	      //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  
          	      if(bbq_L_bz ==0) 
          	      {
          	       if(key_ok_bit == KEY_1DEC)	
          	        {
          	        if(key_account ==press_500ms_time)  {zone_flash_count =10;zone_1_level =0;buzzer_time = buz_200ms;flex_deal(1); }
          	        else if(key_account == short_press_time)
          	         {
          	           speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {          	             
          	             if(zone_1_level !=1)
          	             { 
          	             slide_x_deal(Select_1_KEY); 
          	 	     slide_x_setting(Select_1_KEY,&zone_1_level,1,&zone_1_timer,zone_2_level);         	 	     
          	 	     }
          	 	   }
          	 	 }
          	 	}
          	       if(key_account == short_press_time)
          	       {
          		if(key_ok_bit == KEY_1S2)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=2)
          	             {  
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,2,&zone_1_timer,zone_2_level);
          	 	     }
          	 	   }
          	 	}   
          	 	//----------------------- 
          		if(key_ok_bit == KEY_1S3)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=3)
          	             {   
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,3,&zone_1_timer,zone_2_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_1S4)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=4)
          	             {   
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,4,&zone_1_timer,zone_2_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_1S5)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=5)
          	             {   
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,5,&zone_1_timer,zone_2_level);
          	 	     }
          	 	   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_1S6)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=6)
          	             {  
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,6,&zone_1_timer,zone_2_level);
			     }
          	 	   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_1S7)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=7)
          	             {   
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,7,&zone_1_timer,zone_2_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_1S8)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=8)
          	             {   
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,8,&zone_1_timer,zone_2_level);
          	 	     }
          	 	   }
          	 	} 
          	 	//----------------------- 
          	 	if(key_ok_bit == KEY_1INC)	
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_1_KEY)  slide_1st_select(Select_1_KEY);
          	           else
          	           {
          	 	     if(zone_1_level !=9)
          	             {   
          	 	      slide_x_deal(Select_1_KEY);
          	 	      slide_x_setting(Select_1_KEY,&zone_1_level,9,&zone_1_timer,zone_2_level);
          	 	     }
          	 	   }
          	 	 } 
          		}
          	      //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
          	       if(key_ok_bit == KEY_2DEC)	
          	        {
          	        if(key_account ==press_500ms_time)  {zone_flash_count =10;zone_2_level =0;buzzer_time = buz_200ms;flex_deal(2);}
          	        else  if(key_account == short_press_time)
          	         {
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=1)
          	             {  
          	              slide_x_deal(Select_2_KEY);
          	 	      slide_x_setting(Select_2_KEY,&zone_2_level,1,&zone_2_timer,zone_1_level);
          	 	     }
          	 	   }
          	 	 }
          	 	} 
          	 	//----------------------- 
          	       if(key_account == short_press_time)
          	       {
          		if(key_ok_bit == KEY_2S2)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=2)
          	             {  
          	 	      slide_x_deal(Select_2_KEY);
          	 	      slide_x_setting(Select_2_KEY,&zone_2_level,2,&zone_2_timer,zone_1_level);
          	 	     }
          	 	   }
          	 	}   
          	 	//----------------------- 
          		if(key_ok_bit == KEY_2S3)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=3)
          	             { 
          	 	      slide_x_deal(Select_2_KEY);
          	 	      slide_x_setting(Select_2_KEY,&zone_2_level,3,&zone_2_timer,zone_1_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_2S4)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=4)
          	              {  
          	 	       slide_x_deal(Select_2_KEY);
          	 	       slide_x_setting(Select_2_KEY,&zone_2_level,4,&zone_2_timer,zone_1_level);
          	 	      }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_2S5)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=5)
          	             {  
          	 	      slide_x_deal(Select_2_KEY);
          	 	      slide_x_setting(Select_2_KEY,&zone_2_level,5,&zone_2_timer,zone_1_level);
          	 	     }
          		   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_2S6)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=6)
          	             { 
          	 	      slide_x_deal(Select_2_KEY);
          	 	      slide_x_setting(Select_2_KEY,&zone_2_level,6,&zone_2_timer,zone_1_level);
          	 	     }
          		   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_2S7)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=7)
          	             {  
          	 	      slide_x_deal(Select_2_KEY);
          	 	      slide_x_setting(Select_2_KEY,&zone_2_level,7,&zone_2_timer,zone_1_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_2S8)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=8)
          	              {  
          	 	       slide_x_deal(Select_2_KEY);
          	 	       slide_x_setting(Select_2_KEY,&zone_2_level,8,&zone_2_timer,zone_1_level);
          	 	      }
          	 	   }
          	 	}
          	 	//-----------------------   
          	 	if(key_ok_bit == KEY_2INC)	
          	 	{
          	 	    speed_up();
          	           if(key_zone !=Select_2_KEY)  slide_1st_select(Select_2_KEY);
          	           else
          	           {          	             
          	             if(zone_2_level !=9)
          	             {  
          	 	      slide_x_deal(Select_2_KEY);
          	 	      slide_x_setting(Select_2_KEY,&zone_2_level,9,&zone_2_timer,zone_1_level);
          	 	     }
          	 	   }
          	 	 } 
          		}
          	       }
          	      //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
          	      if(bbq_R_bz ==0)
          	      {
          	       if(key_ok_bit == KEY_3DEC)	
          	        { 
          	        if(key_account ==press_500ms_time)  {zone_flash_count =10;zone_3_level =0;buzzer_time = buz_200ms;flex_deal(3);}
          	        else  if(key_account == short_press_time)
          	         {
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=1)
          	             {
          	             slide_x_deal(Select_3_KEY); 
          	 	     slide_x_setting(Select_3_KEY,&zone_3_level,1,&zone_3_timer,zone_4_level);
          	 	     }
          	 	   }
          	 	 }
          	 	}  
          	 	//-----------------------
          	       if(key_account == short_press_time)
          	       {
          		if(key_ok_bit == KEY_3S2)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=2)
          	             {  
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,2,&zone_3_timer,zone_4_level);
          	 	     }
          		   }
          	 	}   
          	 	//----------------------- 
          		if(key_ok_bit == KEY_3S3)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=3)
          	             {  
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,3,&zone_3_timer,zone_4_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_3S4)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=4)
          	             {  
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,4,&zone_3_timer,zone_4_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_3S5)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=5)
          	             {  
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,5,&zone_3_timer,zone_4_level);
          	 	     }
          	 	   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_3S6)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=6)
          	             {  
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,6,&zone_3_timer,zone_4_level);
          	 	     }
          		   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_3S7)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=7)
          	             {   
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,7,&zone_3_timer,zone_4_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_3S8)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=8)
          	             {   
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,8,&zone_3_timer,zone_4_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          	 	if(key_ok_bit == KEY_3INC)	
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_3_KEY)  slide_1st_select(Select_3_KEY);
          	           else
          	           {          	             
          	             if(zone_3_level !=9)
          	             {   
          	 	      slide_x_deal(Select_3_KEY);
          	 	      slide_x_setting(Select_3_KEY,&zone_3_level,9,&zone_3_timer,zone_4_level);
          	 	     }
          	 	   }
          	 	 }
          		}   
          	       //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
          	       if(key_ok_bit == KEY_4DEC)	
          	        { 
          	        if(key_account ==press_500ms_time)  {zone_flash_count =10;zone_4_level =0;buzzer_time = buz_200ms;flex_deal(4);}
          	        else  if(key_account == short_press_time)
          	         {
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=1)
          	             { 
          	              slide_x_deal(Select_4_KEY); 
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,1,&zone_4_timer,zone_3_level);
          	 	     }
          	 	   }
          	 	 }
          	 	}  
          	 	//----------------------- 
          	       if(key_account == short_press_time)
          	       {
          		if(key_ok_bit == KEY_4S2)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=2)
          	             {  
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,2,&zone_4_timer,zone_3_level);
          	 	     }
          	 	   }
          	 	}   
          	 	//----------------------- 
          		if(key_ok_bit == KEY_4S3)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=3)
          	             {  
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,3,&zone_4_timer,zone_3_level);
          	 	     }
          		   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_4S4)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=4)
          	             {  
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,4,&zone_4_timer,zone_3_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_4S5)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=5)
          	             {  
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,5,&zone_4_timer,zone_3_level);
          	 	     }
          	 	   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_4S6)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=6)
          	             {  
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,6,&zone_4_timer,zone_3_level);
          	 	     }
          	 	   }
          	 	}
          	 	//-----------------------  
          		if(key_ok_bit == KEY_4S7)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=7)
          	             { 
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,7,&zone_4_timer,zone_3_level);
          	 	     }
          	 	   }
          	 	}
          	 	//----------------------- 
          		if(key_ok_bit == KEY_4S8)
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=8)
          	             {  
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,8,&zone_4_timer,zone_3_level);
          	 	     }
          	           }
          	 	} 
          	 	//----------------------- 
          	 	if(key_ok_bit == KEY_4INC)	
          	 	{
          	 	   speed_up();
          	           if(key_zone !=Select_4_KEY)  slide_1st_select(Select_4_KEY);
          	           else
          	           {          	             
          	             if(zone_4_level !=9)
          	             { 
          	 	      slide_x_deal(Select_4_KEY);
          	 	      slide_x_setting(Select_4_KEY,&zone_4_level,9,&zone_4_timer,zone_3_level);
          	 	     }
          	 	   }
          	 	}
          	       }
          	      }      	 		           	            	          	         	          	          	        	           	            	          	         	                	          	         		
                  }
        	//------------------------------------------------    	  	         	
        }       
//************************************************
//10ms_bz5
//************************************************    
        if(Ms10_bz5 == TRUE) 
         {
          	Ms10_bz5 =FALSE;
          	if(cmd_relay_wait)  cmd_relay_wait--;                     	       	         	            	         	   	           	          	          	        	        	       			
         }
//************************************************
//10ms_bz6
//************************************************ 
        if(Ms10_bz6 == TRUE)
         {
		Ms10_bz6 =FALSE;
		   
		if(Power_on_bz == TRUE)   
			{
				if((cmd_relay_wait ==0) && (relay_delay_bz ==FALSE)) 
				{
				  	RELAY_ON;
				  	relay_delay_bz =TRUE;
				  	cmd_relay_wait =200;
				}
			}
		   else
			{
				if(flash_H_1_min +flash_H_2_min +flash_H_3_min +flash_H_4_min) 	RELAY_ON;
				else if((cmd_relay_wait ==0)&& (relay_delay_bz ==TRUE))
				{
					RELAY_OFF;
					relay_delay_bz =FALSE;					
					cmd_relay_wait =200;					
				}
			}       					
         }         
//************************************************
//10ms_bz7
//************************************************       
        if(Ms10_bz7 == TRUE)
        {
          	Ms10_bz7 =FALSE; 
            	//	
			if((relay_delay_bz ==TRUE) && (cmd_relay_wait ==0)) 	list_counter++;	//communication list begin
			else	
				{
					list_counter =0;
					Comm_step =0;
				}			
			if(list_counter == 1) 							//1~18
				{						
					Comm_step =comm_1_s;
					if(Pause_bz ==0) 
          				{					//zone_1 communication begin														
          				     comm_deal(0,Add_1,zone_1_level,time_level_1,Err_1_data); 
          				} 
          				else comm_deal(0,Add_1,0,time_level_1,Err_1_data); 				
          			}         		
			if(list_counter ==19)   						//19~36
				{						
					Comm_step =comm_2_s;
					if(Pause_bz ==0) 
          				{					//zone_2 communication begin						
          				      comm_deal(1,Add_2,zone_2_level,time_level_2,Err_2_data); 
          				}
          				else  comm_deal(1,Add_2,0,time_level_2,Err_2_data); 		 				
          			}         						
			if(list_counter ==37)							//37~54
				{	
					Comm_step =comm_3_s;
					if(Pause_bz ==0) 
          				{					//zone_3 communication begin	
          				       comm_deal(2,Add_3,zone_3_level,time_level_3,Err_3_data); 
          				}
          				else   comm_deal(2,Add_3,0,time_level_3,Err_3_data);       				
          			}			
			if(list_counter ==55)							//55~72
				{
					Comm_step =comm_4_s;	
					if(Pause_bz ==0) 
          				{				//zone_4 communication begin	
          					comm_deal(3,Add_4,zone_4_level,time_level_4,Err_4_data);    
          				}
          				else    comm_deal(3,Add_4,0,time_level_4,Err_4_data);      				
          			}        								
			if(list_counter >=73)				//0.73s one cycle
				{
					list_counter=0;
					/*
					com_count++;
					if(com_count ==33) 
					{
						com_count =0;
						tiao_on_1 =0;
						tiao_on_2 =0;
						tiao_on_3 =0;
						tiao_on_4 =0;
					}
					*/
				}  		          	        	         	          		
        }  
//***********************************************
//Data prepare to display deal 
//***********************************************  	
	if(Prepare_data_bz ==TRUE)
	{
	   Prepare_data_bz =FALSE;
	   
	   flash_list++;	  
	   if(flash_list >8)  flash_list =1;
	   	     	   
             //prepare write data to Display Buffer                                                                				          
            if(Power_on_bz ==FALSE)  				  //off status
               	{               		
               	 	if((key_initial_count >99) && (key_initial_count <200)) for(i=0;i<7;i++)   Disp_buf[i] =SEG_ALL;   //power on full light 1s
               	 	else      
               	 	 {               	   
               	 			for(i=0;i<7;i++)   Disp_buf[i] =CHR_BLANK;	     	//all blank
               	 					    
               	   			if((idle_count) && (lock_bz == TRUE))  	  //"Lo"			    
               	    				{
               	     					Disp_buf[5] = CHR_L;
               	     					Disp_buf[4] = CHR_O;
               	    				} 
               	    			if(flash_list %2)
               	    				{ 
               	    					if(flash_H_1_min) Disp_buf[0] = CHR_H;  //flash "H"
               	    					if(flash_H_2_min) Disp_buf[1] = CHR_H;  //flash "H"
               	    					if(flash_H_3_min) Disp_buf[2] = CHR_H;	//flash "H"
               	    					if(flash_H_4_min) Disp_buf[3] = CHR_H;  //flash "H"	
               	    				}  			           	 		                       	    		    			             	         
               	  	}
        	}
            else	//on status
            	{           
               	   	if((time_flash_count<10)&&(time_flash_count %2))  {Disp_buf[5] =CHR_BLANK;Disp_buf[4] =CHR_BLANK;}	//timer flash blank
               	   	else  
               	   	{
               	 		if((time_flash_count) || (zone_flash_count))				//flash on
               	 			{
               	 			    	     if((key_zone ==Select_1_KEY)&&(timer_status & Select_1_KEY))  temp_8 =zone_1_timer;
               	 			    	else if((key_zone ==Select_2_KEY)&&(timer_status & Select_2_KEY))  temp_8 =zone_2_timer;
               	 			    	else if((key_zone ==Select_3_KEY)&&(timer_status & Select_3_KEY))  temp_8 =zone_3_timer;
               	 			    	else if((key_zone ==Select_4_KEY)&&(timer_status & Select_4_KEY))  temp_8 =zone_4_timer;					
               	 			    	else temp_8 = general_timer;               	 			    	
               	 			}
               	 		else   									//not flash ,display normal,calculate the min timer zone
               	 			{
               	 		 		if(timer_status) 
               	 		 		{
               	 		 		 par_1 =255;//give a biggest value ignore compare
               	 		 		 par_2 =255;//give a biggest value ignore compare
               	 		 		 par_3 =255;//give a biggest value ignore compare
               	 		 		 par_4 =255;//give a biggest value ignore compare
               	 		 		 if(Pause_bz)
               	 				 {
               	 				 if(timer_status & Select_1_KEY) par_1 =Pause_save_timer_1;	
						 if(timer_status & Select_2_KEY) par_2 =Pause_save_timer_2;					
						 if(timer_status & Select_3_KEY) par_3 =Pause_save_timer_3;					
						 if(timer_status & Select_4_KEY) par_4 =Pause_save_timer_4;					
               	 				 }
               	 				 else
               	 				 {
               	 		 		 //		//avoid appear timer with c0               	 		 		                	 		 		                	 		 		               	 		 		 
               	 		 		 //	
						 if(timer_status & Select_1_KEY) {if(zone_1_timer >99) zone_1_timer =1;par_1 =zone_1_timer;}
						 if(timer_status & Select_2_KEY) {if(zone_2_timer >99) zone_2_timer =1;par_2 =zone_2_timer;}						 
						 if(timer_status & Select_3_KEY) {if(zone_3_timer >99) zone_3_timer =1;par_3 =zone_3_timer;}
						 if(timer_status & Select_4_KEY) {if(zone_4_timer >99) zone_4_timer =1;par_4 =zone_4_timer;}
						  }
               	 		 		 temp_8 =calculate_min(par_1,par_2,par_3,par_4);
               	 		 		}
               	 		             	else temp_8 =general_timer; 				//reminder timer
               	 			}  
               	 	 
               	 	 if(temp_8)      		//if timer value is true	 	              	 	
               	 		{
               	 		 	if((lock_bz == TRUE) && (flash_list <=4)) 		//flash "Lo"and"timer value"
               					{
               	  				Disp_buf[5] = CHR_L;
               	  				Disp_buf[4] = CHR_O;
               					}
               			 	else
               			 		{ 
               	 		 		Disp_buf[5] = Display_decode(temp_8 /10);
               	 		 		Disp_buf[4] = Display_decode(temp_8 %10);
               	 		 		}
               	 		}
               	 	 else 				//if timer value is false
               	 	 	{
               	 		 	if(lock_bz == TRUE)  			//display "Lo"
               	    				{
               	     				Disp_buf[5] = CHR_L;
               	     				Disp_buf[4] = CHR_O;
               	    				}
               	    			else if(time_flash_count) {Disp_buf[5] = NUM_0;Disp_buf[4] = NUM_0; }
               	    		 	else 					//display "--"
               	    		 		{
               	    		 		Disp_buf[5] = SEG_G;
               	 		 	 	Disp_buf[4] = SEG_G;
               	    		 		}	
               	 		}
               	   	}
               	  	Disp_buf[0] =ON_disp_zone_x(0,bbq_L_bz,zone_1_level,&change_count,flex_L_bz,Select_1_KEY,flash_H_1_min,zone_1_nopan_time,zone_2_nopan_time,Err_1_data);	 //zone1 normal display
               	        
               	 	Disp_buf[1] =ON_disp_zone_x(1,bbq_L_bz,zone_2_level,&change_count,flex_L_bz,Select_2_KEY,flash_H_2_min,zone_2_nopan_time,zone_1_nopan_time,Err_2_data);	 //zone2 normal display
               	  	
               	  	Disp_buf[2] =ON_disp_zone_x(2,bbq_R_bz,zone_3_level,&change_count,flex_R_bz,Select_3_KEY,flash_H_3_min,zone_3_nopan_time,zone_4_nopan_time,Err_3_data);	 //zone4 normal display
               	  	
               	        Disp_buf[3] =ON_disp_zone_x(3,bbq_R_bz,zone_4_level,&change_count,flex_R_bz,Select_4_KEY,flash_H_4_min,zone_4_nopan_time,zone_3_nopan_time,Err_4_data);	 //zone3 normal display
               	        
               	        if(flex_L_bz)	Disp_buf[6] |=SEG_A|SEG_D|SEG_G;
               	           else         Disp_buf[6] &=~(SEG_A|SEG_D|SEG_G);
               	        
               	        if(flex_R_bz)   Disp_buf[6] |=SEG_B|SEG_C|SEG_P;
               	           else         Disp_buf[6] &=~(SEG_B|SEG_C|SEG_P);
               	        //
               	        if(Pause_bz) 
               	           {
               	           for(i=0;i<=3;i++) Disp_buf[i] =SEG_B|SEG_C|SEG_E|SEG_F;
               	           }
               	        //   
               	        if((zone_flash_count ==0) && (timer_status) &&(flash_list %2))
               	        {   
               	          if(Pause_bz)
               	 	  {
               	 	   	if(temp_8 == Pause_save_timer_1)  Disp_buf[0] &=~SEG_P;
               	 	  	if(temp_8 == Pause_save_timer_2)  Disp_buf[1] &=~SEG_P;
               	 	  	if(temp_8 == Pause_save_timer_3)  Disp_buf[2] &=~SEG_P;
               	 	  	if(temp_8 == Pause_save_timer_4)  Disp_buf[3] &=~SEG_P;                	 	  	               	 	  	
               	 	  }
               	 	  else
               	 	  {          	 	               	 	  
               	 	  	if(temp_8 == zone_1_timer)  Disp_buf[0] &=~SEG_P;
               	 	  	if(temp_8 == zone_2_timer)  Disp_buf[1] &=~SEG_P;
               	 	  	if(temp_8 == zone_3_timer)  Disp_buf[2] &=~SEG_P;
               	 	  	if(temp_8 == zone_4_timer)  Disp_buf[3] &=~SEG_P;
               	 	  }
               	 	}
               	 	
                } 
                /*
                if(debug_list)
                {      			  
		Disp_buf[1] =Display_decode((disp_debug1 &0xF0) >>4);		 
		Disp_buf[2] =Display_decode( disp_debug1 &0x0F);
		Disp_buf[5] =Display_decode((disp_debug2 &0xF0) >>4);	 
		Disp_buf[4] =Display_decode( disp_debug2 &0x0F);  
		Disp_buf[0] =Display_decode(debug_list);      
		}  
		*/
		/*  
		Disp_buf[5] =Display_decode((ppg_1 &0xF0) >>4);	 
		Disp_buf[4] =Display_decode( ppg_1 &0x0F);   
		Disp_buf[2] =Display_decode((ppg_2 &0xF0) >>4);	 
		Disp_buf[3] =Display_decode( ppg_2 &0x0F);       
		*/        
	} 	
//************************************************ 
//Flash_500ms_bz
//************************************************                  	
	if(Flash_500ms_bz == TRUE)
         {
	     Flash_500ms_bz =FALSE;				
             //  SM1668 display up programe      	              
            SM1668_SEND_COMMAND(0x03);
            SM1668_SEND_COMMAND(0x40);
            SM1668_SEND_COMMAND(0xC0);
             //write user's data to Display Buffer  
             for (i=0;i<7;i++)
              {
              SM1668_SENT_DATA(Disp_buf[i]);
              SM1668_SENT_DATA(0x00);
              }
            SM1668_SEND_COMMAND(0x89);           
            D_EN_Port->ODR |= D_EN_Pin; //GPIO_WriteHigh(GPIOE,DISPEN); 
            
            if(zone_flash_count)   zone_flash_count--;
            if(zone_flash_count ==0)
           	   {
           	   	count_1_key =0;
           	   	count_2_key =0;
           	   	count_3_key =0;
           	   	count_4_key =0;
           	   }
           
          if(time_flash_count) 
           {
              	   time_flash_count--; 
              	   if((time_flash_count ==0) && (timer_precise_bz == TRUE))     
              	   {
              	   	sec_counter =0;     //in order to make the timer precise
              	   	timer_precise_bz =FALSE;
              	   }
           }
           if((zone_flash_count ==0) && (time_flash_count ==0))   key_zone =0; 	 
           
           if(zone_1_level+zone_2_level+zone_3_level+zone_4_level)     
          	{
          		fan_status =1;				//off
          		par_1 =1;
          		par_2 =1;
          		
        		//max igbt caculator
        		if(tigbt_1 >=tigbt_2) temp_8 =tigbt_1;
        		else	temp_8 =tigbt_2;		//1# 2# max
        		if(temp_8  <tigbt_3)  temp_8 =tigbt_3;  //1# 2# 3# max
        		if(temp_8  <tigbt_4)  temp_8 =tigbt_4;  //1# 2# 3# 4# max
        		    			
          		if(temp_8 >=CON_TIGBT_45) par_1 =1;	//1/3
          		if(temp_8 >=CON_TIGBT_50) par_1 =2;	//2/2
          		if(temp_8 >=CON_TIGBT_55) par_1 =3;	//3/1
          		if(temp_8 >=CON_TIGBT_60) par_1 =4; 	//on

			//max main caculator
        		if(tmain_1 >=tmain_2) temp_8 =tmain_1;
        		else	temp_8 =tmain_2;		//1# 2# max
        		if(temp_8  <tmain_3)  temp_8 =tmain_3;  //1# 2# 3# max
        		if(temp_8  <tmain_4)  temp_8 =tmain_4;  //1# 2# 3# 4# max
        		
        		if(temp_8 >=CON_TMAIN_80)  par_2 =1;	//1/3
          		if(temp_8 >=CON_TMAIN_100) par_2 =2;	//2/2
          		if(temp_8 >=CON_TMAIN_110) par_2 =3;	//3/1
          		if(temp_8 >=CON_TMAIN_120) par_2 =4; 	//on
        		
        		if(par_1 >par_2)   fan_status =par_1;
        		else fan_status =par_2;
        		
          		fan_count =120;
          	}        
         }	
//************************************************ 
//Sec_bz 
//************************************************  
        if(Sec_bz ==TRUE)
        {
           Sec_bz =FALSE; 
           
           if(Pause_bz ==0)  boost_time_deal(); 
           
           if(Pause_bz ==0)
           {      
             for(i=0;i<4;i++)
             {
           	p  =&zone_1_level+i;
           	tz =&zone_1_timer+i;
           	q  =&zone_1_pan+i;
           	x  =&zone_1_nopan_time+i;
           	tw =&work_1_time+i;
           	y  =&time_level_1+i;
           	b  =&boost_1_save+i;
           	tb =&boost_time_1+i;
           	u  =&zone_1_nopan_wait +i;
           	//
                if((*x)>2)  
                {
                   (*x)++;
                   if((*x) >=59) 
                   {
                   	if(i==0)  {if(flex_L_bz ==0) (*p) =0;}
                   	if(i==1)  {if(flex_L_bz ==0) (*p) =0;}
                   	if(i==2)  {if(flex_R_bz ==0) (*p) =0;}
                   	if(i==3)  {if(flex_R_bz ==0) (*p) =0;}
                   }
                }
                if(*u) (*u)--;
           	//
	      if((*p) ==0)  {(*tz) =0;(*q) =0;(*x) =0;(*tw) =0;(*tb) =0;(*y) =0;(*b)=0;}
	      else	(*tw)++;  
	     }
	   }
	 //
	 if((zone_1_level ==0)&&(bbq_L_bz))  bbq_L_bz =0;
	 if((zone_3_level ==0)&&(bbq_R_bz))  bbq_R_bz =0;
	 //	   
	 //if((zone_1_level +zone_2_level +zone_3_level +zone_4_level) ==0)  limit_time =0;
	 if((time_flash_count ==0)&&(Pause_bz ==0))
	 {
	 if(zone_1_timer ==0) timer_status &=~Select_1_KEY;                  
	 if(zone_2_timer ==0) timer_status &=~Select_2_KEY;
	 if(zone_3_timer ==0) timer_status &=~Select_3_KEY;
	 if(zone_4_timer ==0) timer_status &=~Select_4_KEY;
	 } 
	 	  
	 if(zone_1_level +zone_2_level +zone_3_level +zone_4_level)    		idle_count =60;   
	 if(flash_H_1_min +flash_H_2_min +flash_H_3_min +flash_H_4_min)    	idle_count =60;  
	 if(Err_1_data+Err_2_data +Err_3_data +Err_4_data) 			idle_count =60; 
	                
         if(idle_count)
           {
           	idle_count--;
           	if(idle_count ==0)       {buzzer_time = buz_500ms;Power_off_deal();} 
           }          
         
         if(buzzer_account) {buzzer_account--;buzzer_time =buz_200ms;}  
         time_power_deal(); 		//140614 
         bbq_power_deal();		//171111
         
	for(i=0;i<4;i++)
	  {
	  	p =&tmain_1 +i;
	  	q =&flash_H_1_min +i;
	  	if((*p) >CON_TMAIN_45)  (*q)=1;
		else (*q) =0; 
	  } 
	  if(fan_count) 
	  {
	  	fan_count--;
          	if(fan_count ==0) fan_status =0;//FAN_OFF;   
          }              	         	      	         	     	
        }        				 
//************************************************
//min bz
//************************************************  
        if(Min_bz ==TRUE)
        {
          Min_bz =FALSE;
          apt_min_reset++;
	  if(apt_min_reset >=30) {apt_min_reset =0;APT8L16Init_H();APT8L16Init_L();APT8L16Init_AH();}
	  	  
	   if(general_timer)
       	   {
       		general_timer--;	
       		if(general_timer ==0)   {buzzer_time = buz_200ms; buzzer_account =29;}
       	   }  
       	   for(i=0;i<4;i++)
       	   {
       	   	tz =&zone_1_timer+i;
       	   	p  =&zone_1_level+i;
    	   	if(*tz) 
       	   	{
       		(*tz)--;
       		if((*tz) ==0)       	{buzzer_time = buz_200ms;(*p) =0;flex_deal(i+1);}
       	   	}
       	   	else if(*p) (*tz)= 120;		//no timer key,canceal timer function ,give 2h setting
       	   }
       	   if(pause_x_timer) 
       	     {
       	     	pause_x_timer--;
       	     	if(pause_x_timer ==0)  Power_off_deal();
       	     } 	     	         	         	                   	     
        }
 //************************************************         
	
    IWDG_ReloadCounter();    /* Refresh IWDG */   
  }      
    IWDG_ReloadCounter();    /* Refresh IWDG */ 
}
