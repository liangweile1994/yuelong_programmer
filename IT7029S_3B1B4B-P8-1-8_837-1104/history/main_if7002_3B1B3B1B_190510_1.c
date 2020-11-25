/*===========================================================================
 * DESCRIPTION:
 * Porject: Inteligient controller
 * Chip: STM8S003F3P6 MCU(SSOP20)  manufacture by ST Microelectronics
 * Hardware Tool: Raisonance(STX-Rlink)
 * Software Tool: Cosmic(16k limit free)
 * Author :Terry Mo
 * Date: 2015.10.09
 *---------------------------------------------------------------------------
 * Copyright (c) Youlong Kitchen.,LTD, 2016
 *==========================================================================*/
#define STM8S103 (1)     

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
#include  "G20_user.h"                                     
//****************************************************************
//   global variable define
//****************************************************************
//erp
#define pwm_160   (u8)(CON_PWM_9us-1)	//9.125us
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
//u8  Ms10_bz6 = FALSE;
u8  Flash_500ms_bz = FALSE;
u8  ms10_counter;
u8  sec_counter;
u8  min_counter;

u8  timer_precise_bz =FALSE;
u8  Sec_bz =FALSE;
u8  Min_bz = FALSE; 
u8  Time_dot_bz =FALSE;

u8  Prepare_data_bz=FALSE;

u8  Power_on_bz =FALSE; 
u8  lock_bz =FALSE;
u8  lock_flash_accout =0;

u8  buzzer_time =0;
u8  buzzer_account =0;

u8  Disp_buf[7]={0,0,0,0,0,0,0};

u8  key_initial_count =250;    		//10ms *250 =2.5s
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

u16  key_scan_value =0;
u8 key_ok_bit =0;
u16 key_account =0;
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

u8  general_timer =0;
u16  zone_1_timer =0;
u16  zone_2_timer =0;
u16  zone_3_timer =0;
u16  zone_4_timer =0; 

u16   I2C_GET_DATA =0;
u8  match_ok =FALSE;

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

u8 tiao_on_1 =0;
u8 tiao_on_2 =0;
u8 tiao_on_3 =0;
u8 tiao_on_4 =0;

u8 heat_status_1 =0;
u8 heat_status_2 =0;
u8 heat_status_3 =0;
u8 heat_status_4 =0;

u8 oil_high_1 =0;
u8 oil_high_2 =0;
u8 oil_high_3 =0;
u8 oil_high_4 =0;

u8 igbt_high_1 =0;
u8 igbt_high_2 =0;
u8 igbt_high_3 =0;
u8 igbt_high_4 =0;

u8 boost_1_count =0;
u8 boost_2_count =0;
u8 boost_3_count =0;
u8 boost_4_count =0;

@near u8  zone_1_nopan_wait =0;
@near u8  zone_2_nopan_wait =0;
@near u8  zone_3_nopan_wait =0;
@near u8  zone_4_nopan_wait =0;
		//0.73*(arr_value -1)=S(ton)    
		//0.73*(11+1) =8.76S =S(tzong)
		//2.19s,2.92s,4.38s,5.84s
u8 arr_tiao_on[4]={4,5,7,9};    //erp
u8 arr_tiao_180_pwm[4] ={CON_PWM_8us,CON_PWM_8us,CON_PWM_9us,CON_PWM_10us};  
			// 1#,     2#,     3#,     4#
@near u8 erp_pwm[4] ={pwm_210,pwm_160,pwm_210,pwm_160};//erp
			//      5         6    	     7     	  8     	9    	    P
//u8 arr_180_b_pwm[6] ={CON_PWM_11us,CON_PWM_13us,CON_PWM_15us,CON_PWM_17us,CON_PWM_18us,CON_PWM_18us}; 
//u8 arr_180_s_pwm[6] ={CON_PWM_11us,CON_PWM_11us,CON_PWM_12us,CON_PWM_13us,CON_PWM_13us,CON_PWM_13us}; 
		    //   5   6   7   8   9   P
		    // 1k3,1k4,1k6,1k8,2k0,2k6
@near u8 arr_1_pow[6]={ 74, 80, 91,102,113,152};	//210mm 57.2uH  *1.055 for D358  //70, 76, 86, 97,108,150
@near u8 arr_3_pow[6]={ 74, 80, 91,102,113,152}; 	//210mm 57.2uH  *1.055
		    // 1k0,1k1,1k2,1k3,1k5,2k0
@near u8 arr_2_pow[6]={128,138,150,160,170,230};  	//150mm 70uH    *1.065
@near u8 arr_4_pow[6]={128,138,150,160,170,230};  	//150mm 70uH    *1.065 for D358  //120,130,145,160,175,230
//-----------
@near u8 apt_min_reset =0;
@near u8 arr_APTRegData[14]={GSR,MCON,FILTER0,K0_ENB,K1_ENB,SENSE_CON,SENSE_S,GSR_K07,GSR_K17,REF_UTH,KEY_ATH,DSMIT,MCONH,FILTER1};
@near u8 arr_T_Sens[16]={255, 13,  16,    6,    5,   6,   8,255,255,   10,  12, 14, 22,  25,  22,  16};
//------------=             1DEC,LOCK,ONOFF,BOOST,4INC,4DEC,         3INC,3DEC,INC,DEC,2INC,2DEC,1INC   
//external subroutine
u8 Check_Unique_ID(void);
u8 flex_ntc_deal(u8 par,u8 data);
u8 zone_x_cur_no_set(u8 par,u8 count_ppg);
void delay(u8 cnt);
void SM1668_SENT_DATA(u8 send_data);
void SM1668_SEND_COMMAND(u8 send_command);
u8  APTTouchRdOneData(u8 apt_add,u8 APTRdAdd);
void  APTTouchWrOneData(u8 apt_add,u8 APTWrAdd,u8 APTWrData);
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
     if((index ==2)||(index==4))  //2# 4#special deal temperature
      {
      	if(Get_tmain >CON_TMAIN_180)  (*so) =3;		//180  0xF1
        if(Get_tmain >CON_TMAIN_190)  (*so) =1;       	//190  0xF3
        if(*so)
        {
       	if(Get_tmain <CON_TMAIN_170)  (*so) =4;		//170  0xED
       	if(Get_tmain <CON_TMAIN_160)  (*so) =0;		//160  0xE9
        }
      }
     else	//1# 3# normal
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
     else if((*si)&&(Get_tigbt <CON_TIGBT_90))  (*si) =0;

      if(Get_data ==DATA_PAN_NO)   {(*npan) =5;if((*time)<3)  (*time)++;}
      if(Get_data ==DATA_PAN_OK) (*time) =0;			
         	
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

   if((limit_time >2400)&&(level >4)) level =4;  // if(limit_time >2400) level =4;
  
  if(err)  {set_off_power(add);(*t) =0;}	//issue of "E5->U->9"
  else 
  {
  if(level ==0)  set_off_power(add);
  else  
    {
	Add_Status =add|DATA_TURN_ON|DATA_PULSE;
	//
	if((index ==0)||(index ==2))  Add_Status++;	//210mm coil 120 pan 340# pulse =7
	//		                     
		//
		if(*o) level =(*o);
		if(*i) level =3;
		//
	heat_status =1;
		if(level <5)      
		{
			(*t)++;  
			heat_status =zone_x_t_status(level,(*t)); 
			if(level ==1) {if((*t)>=41) (*t) =0;}
			if(level ==2) {if((*t)>=11) (*t) =0;}
			if(level ==3) {if((*t)>=11) (*t) =0;}
			if(level ==4) {if((*t)>=11) (*t) =0;}
		}	 
		else  (*t) =0;
		//				
	if(heat_status ==0) set_off_power(add);
	else 
	{
		index++;		
 
		if(level >=5)
		{
		   if(index ==1)		
		   {
		   	temp_pwm =arr_2_pow[level-5];  
		   	// 
		   		if((limit_t)&&(temp_pwm > limit_t))         temp_pwm =limit_t; 
		   		if((vol_1 >=CON_VOL_240V)&&(temp_pwm <=142)) temp_pwm +=(vol_1-CON_VOL_230V)*2;  
		   }
	           if(index ==2)		
	           {
	           	temp_pwm =arr_1_pow[level-5];
	           	// 
		   		if((limit_t)&&(temp_pwm > limit_t))          temp_pwm =limit_t; 
		   		if((vol_2 >=CON_VOL_240V)&&(temp_pwm <=87)) temp_pwm +=(vol_2-CON_VOL_230V);
	           }
	           if(index ==3)		
	           {
	           	temp_pwm =arr_4_pow[level-5];
	           	// 
		   		if((limit_t)&&(temp_pwm > limit_t))         temp_pwm =limit_t; 
		   		if((vol_3 >=CON_VOL_240V)&&(temp_pwm <=142)) temp_pwm +=(vol_3-CON_VOL_230V)*2;
	           }
	           if(index ==4)		
	           {
	           	temp_pwm =arr_3_pow[level-5];
	           	// 
		   		if((limit_t)&&(temp_pwm > limit_t))          temp_pwm =limit_t; 
		   		if((vol_4 >=CON_VOL_240V)&&(temp_pwm <=87)) temp_pwm +=(vol_4-CON_VOL_230V);
	           }
	            
		   //if((limit_t)&&(temp_pwm > limit_t))       temp_pwm =limit_t;
		   (*pwm) =temp_pwm;
		   cur_no =zone_x_cur_no_set(index,(*g));
		   //if(index ==1)	pwm_temp_1 =noise_xx_deal(ppg_2,temp_pwm);		
		   //if(index ==2)	pwm_temp_2 =noise_xx_deal(ppg_1,temp_pwm);		
		   //if(index ==3)	pwm_temp_3 =noise_xx_deal(ppg_4,temp_pwm);	
		   //if(index ==4)	pwm_temp_4 =noise_xx_deal(ppg_3,temp_pwm);
		   //
		  if(((*tw)<5)||(*npan))  
		  {
			cur_no =0x10;
			if(index%2)  (*pwm) =115;				
			else   (*pwm) =70;
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
		if((index ==2)||(index ==4))  cur_no =cur_no/2;		//1# 3# boost double igbt & current		

                max_pwm =(*pwm);
	       //synchronous deal		
			//syn_delay=syn_deal(max_pwm);
		syn_delay=syn_deal(index,(*g));
	       //flex ntc deal
	       //syn_delay =flex_ntc_deal(index,syn_delay);
	       if(level <5)  syn_delay |=0x40;			//bit7 ->1 -> PWM direct setting mode
	       //
	       comm_asm_deal();	
	}		
    }	
  }
}
void Power_off_deal(void)
{
 	Power_on_bz =FALSE;
 	key_zone =0;
 	//idle_count =0;
 	timer_status =0;
 	time_flash_count =0;
 	zone_flash_count =0;
 	
 	boost_time_1 =0;
 	boost_time_2 =0;
 	boost_time_3 =0;
 	boost_time_4 =0;
 	
 	boost_1_count =0;
 	boost_2_count =0;
 	boost_3_count =0;
 	boost_4_count =0;
 	
 	zone_1_level =0;
 	zone_2_level =0;
 	zone_3_level =0;
 	zone_4_level =0; 
 		
 	general_timer =0;	
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
//**************************************************************************** 
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
u8 ON_disp_zone_x(u8 level,u8 *change,u8 select,u8 flash,u8 pan,u8 err)
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
               	if(level ==10)  dis_buf =CHR_P;           	
               	if(timer_status & select)     dis_buf |=SEG_P;

               	if((zone_flash_count ==0) && (pan >2))    //normal status            	
               	{           
               		if(Time_dot_bz ==TRUE)	   dis_buf =CHR_V;
      		 	else dis_buf =SEG_D;
      		}
             }
        else 
             {
             	if((zone_flash_count ==0)&&(flash)&&(Time_dot_bz ==TRUE)) dis_buf = CHR_H;
                else 
                	{
                	if(zone_flash_count)  dis_buf = NUM_0;            	
                	else dis_buf = SEG_G;
                	}
             }
        if(err)
            {
            	if(Time_dot_bz ==TRUE)  dis_buf = Display_decode((err & 0xF0) >>4);
            	else dis_buf =Display_decode(err & 0x0F);
            } 	
     }
      return(dis_buf);
}
void key_count_clear(void)
{
     key_scan_value =0;
     key_account =0;
     key_ok_bit =0;
     key_err_account =0;	
}
void APT8L16Init(void)
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
	  APTTouchWrOneData(APT_ADD_H,i,arr_APTRegData[i-0x20]);
	  if(APTTouchRdOneData(APT_ADD_H,i)==arr_APTRegData[i-0x20]) i++;
   	}
   for(i=0;i<=0x0F;)   
     {
     	APTTouchWrOneData(APT_ADD_H,i,arr_T_Sens[i]);            //Set sensing K00~K17
     	if(APTTouchRdOneData(APT_ADD_H,i)==arr_T_Sens[i]) i++;   //vertify K00~K17
     }
   do
   {
   APTTouchWrOneData(APT_ADD_H,0x3A,0x00);    //working mode
   j =APTTouchRdOneData(APT_ADD_H,0x3A); 
   }while (j !=0x00);
}
void key_scan_I2C(void)
{
  u8  APTTouchKeyValueA,APTTouchKeyValueB;

  //KeyValue=0x00;
  APTTouchKeyValueA =APTTouchRdOneData(APT_ADD_H,0x34);
  APTTouchKeyValueB =APTTouchRdOneData(APT_ADD_H,0x35);
  //APTTouchKeyValueA=APTTouchRdOneData(APTAllKeyAdd);
  I2C_GET_DATA =(APTTouchKeyValueB<<8)|APTTouchKeyValueA;
         
  if(I2C_GET_DATA ==0)  key_count_clear();
  else 
        {
              apt_min_reset =0;
              if(I2C_GET_DATA == key_scan_value)  key_account++;
              else      {key_scan_value =I2C_GET_DATA;key_account =0;} 
        }     
}
void key_next_deal(void)
{ 
  u8  key_effective =0;
              if((key_account == short_press_time) || (key_account == long_press_time))   key_effective =1;
              if((key_account > long_press_time)  && (((key_account - long_press_time) %50) ==0))   key_effective =1;//speed up 0827
              if(key_effective)
                {
               	  switch(key_scan_value)
		   {
                   case VALUE_LOCK:	    key_ok_bit =KEY_LOCK;  break;
                   case VALUE_BOOST:	    key_ok_bit =KEY_BOOST; break;
                   case VALUE_INC:          key_ok_bit =KEY_INC;   break;
                   case VALUE_DEC:	    key_ok_bit =KEY_DEC;   break;
                   case VALUE_1INC_KEY:	    key_ok_bit =KEY_1INC;  break;
		   case VALUE_2INC_KEY:	    key_ok_bit =KEY_2INC;  break;
		   case VALUE_3INC_KEY:	    key_ok_bit =KEY_3INC;  break;
		   case VALUE_4INC_KEY:	    key_ok_bit =KEY_4INC;  break;
		   case VALUE_1DEC_KEY:	    key_ok_bit =KEY_1DEC;  break;
		   case VALUE_2DEC_KEY:	    key_ok_bit =KEY_2DEC;  break;
		   case VALUE_3DEC_KEY:	    key_ok_bit =KEY_3DEC;  break;
		   case VALUE_4DEC_KEY:	    key_ok_bit =KEY_4DEC;  break;
                   default:
                   if(key_scan_value &VALUE_ON_OFF)  key_ok_bit =KEY_ON_OFF;
                   	else
                   	{
                   	key_err_account++;
                   	if(key_err_account == 10)   {Power_off_deal();buzzer_time = buz_1000ms;} //5s
                   	}
                  }
                }    	                           	                                   
              else key_ok_bit =0;
                                                                            
} 
void boost_x_time_deal(u16 *time1,u8 *save1,u8 *level1,u8 *count)
{
	if((*time1) ==300)
	{
		(*save1) =(*level1);						
		(*level1) =10;
	}
	if(*time1)  
		{
			(*time1)--;
			if((*time1) ==0) {(*level1) =(*save1);(*count)++;}
		}
}
void boost_time_deal(void)
{
	boost_x_time_deal(&boost_time_1,&boost_1_save,&zone_1_level,&boost_1_count);
	boost_x_time_deal(&boost_time_2,&boost_2_save,&zone_2_level,&boost_2_count);
	boost_x_time_deal(&boost_time_3,&boost_3_save,&zone_3_level,&boost_3_count);
	boost_x_time_deal(&boost_time_4,&boost_4_save,&zone_4_level,&boost_4_count);
}
void time_b_power(u8 data)
{
	if(zone_2_level <10) time_level_2 =data;
	if(zone_4_level <10) time_level_4 =data;				   
}  
void time_s_power(u8 data)
{
	if(zone_1_level <10) time_level_1 =data;				   
	if(zone_3_level <10) time_level_3 =data;
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
   	if(zone_1_level >5)  	//1#  
   		{      
   			time_level_1  =Zone_Small_Set(zone_1_level,boost_1_count,arr_2_pow[5],work_1_time); // Zone_Big_Set(1,zone_1_level,boost_1_count,arr_1_pow[5],work_1_time);
   		}
   	if(zone_2_level >5)	//2#
   		{
   			time_level_2 = Zone_Big_Set(1,zone_2_level,boost_2_count,arr_1_pow[5],work_2_time); //Zone_Small_Set(zone_2_level,boost_2_count,arr_2_pow[5],work_2_time);
   		}
   	if(zone_3_level >5) 	//3#   
   		{
   			time_level_3  =Zone_Small_Set(zone_3_level,boost_3_count,arr_4_pow[5],work_3_time); //Zone_Big_Set(3,zone_3_level,boost_3_count,arr_3_pow[5],work_3_time);
   		}
   	if(zone_4_level >5)	//4#
   		{
   			time_level_4 = Zone_Big_Set(3,zone_4_level,boost_4_count,arr_3_pow[5],work_4_time); //Zone_Small_Set(zone_4_level,boost_4_count,arr_4_pow[5],work_4_time);
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
       	timer_precise_bz =TRUE;	 
}
void  speed_up(void)
{
	//speed up 0827
	Prepare_data_bz =TRUE;
	Flash_500ms_bz =TRUE;
	//speed up 0827
}
void  on_off_key_deal(void)
{
   if(key_account == short_press_time)
     {
      buzzer_time = buz_200ms;
      if(Power_on_bz == TRUE)  Power_off_deal();
      else         {Power_on_bz=TRUE; idle_count=60;}	
     }
}
void  boost_x_deal(u8 select,u8 *level1,u8 *level2,u16 *time,u16 *o_time,u16 *tim1,u16 *tim2)
{    
      if(key_zone & select)
    	{
         buzzer_time = buz_200ms;
         if((*level2)==0)
         	{	          	
     		if(*time)    (*time) =1; 
           	else      (*time) =300;  
        	}
         else 
         	{
         	if((*level2)==10)  
         	  {
         	  	*o_time =0;
         	  	(*level2)=9;
         	  	if((*tim2) >arr_default_timer[9])  	(*tim2)  =arr_default_timer[9];
         	  }
         	change_count =select;	
         	zone_flash_count =10;
         	(*level1) =9;
         	if((timer_status & select)==0) (*tim1)  =arr_default_timer[9];
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
     Sec_bz =TRUE;
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
      	   }
      }
     else 
      {
      	if(key_account == lock_press_time)
      	  {
      	  	buzzer_time = buz_200ms;
      	  	lock_bz =FALSE;
      	  	idle_count=60;
      	  }	
      }	
}
void  inc_x_key_level(u8 *count,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select, u16 *tim1,u16 *tim2)
{
  buzzer_time = buz_200ms;
  zone_flash_count =10;
  change_count =0;
  if(time_flash_count)  time_flash_count =0;
  key_zone = select;	
  	if(time1 ==0)
  	{
  	  if((*count) ==0)		(*count) =1;  
	  else 	
	      {	
    		if(((*count) ==1) && ((*level) ==0))   (*level) = default_level;
        	else    (*level)++;
    		(*count) =2;	
    	           		     	
    		if((*level) >9)  (*level) =0;  
    		if(*time2)
    	  	  {
    	  	   (*time2) =0;
    	  	   (*o_level) =9;
    	  	   if((*tim2) >arr_default_timer[9]) (*tim2) =arr_default_timer[9];
    	  	  }
    		if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
    	      }
  	} 		     	 			
}
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
   }
}
void  dec_x_key_level(u8 *count,u8 *level,u8 *o_level,u16 time1,u16 *time2,u8 select, u16 *tim1,u16 *tim2)
{
  buzzer_time = buz_200ms;
  zone_flash_count =10;
  change_count =0;
  key_zone = select;	
   	if(time1 ==0)
  	{
  	  if((*count) ==0)		(*count) =1;  
	  else 	
	      {	
    		if(((*count) ==1) && ((*level) ==0))  	(*level) = default_level;
	   	else 	
	   	{
	         if(*level)  (*level)--;
	         else (*level) =9; 
	        }  
    		(*count) =2; 
    		if(*time2)
    	  	  {
    	  	   (*time2) =0;
    	  	   (*o_level) =9;
    	  	   if((*tim2) >arr_default_timer[9]) (*tim2) =arr_default_timer[9];
    	  	  }
    	  	if((timer_status & select) ==0)   (*tim1) =arr_default_timer[(*level)];
    	      }
  	} 	         		        		
}
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
           }	 
         else
           {
            if(timer_status == 0) 
         		{  
         		    if(time_flash_count)
         		    { 	
         		    if(key_account == short_press_time) general_timer++;
         		    else     general_timer +=10; 
         		    if(general_timer >99) general_timer =0;
         		    }
         		    
         		    inc_dec_deal();       		   
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
         }
      else 
         {
          if(timer_status == 0)   
         	{
         	if(time_flash_count)
         	  {            	
              	   if(key_account == short_press_time)
              			 {              				
          				if(general_timer) general_timer--;
          				else general_timer =99;
               			 }
             	   else if(general_timer >10) general_timer -=10;
                        else general_timer=99; 
                  }
                  
                 inc_dec_deal();
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
    u8  slide_temp =0;
    
    u8  par_1 =0;
    u8  par_2 =0;
    u8  par_3 =0;
    u8  par_4 =0;  
    
    u16 list_counter =0;  
    
    u8 *p;
    u8 *q;
    u8 *x;
    u8 *y;
    u16 *tz;
    u16 *tw;
    u16 *tb;
    u8 *b; 
    u8 *c;  	           
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
    //CLK_DeInit();
    //CLK_HSECmd(DISABLE);
    CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
    //CLK_HSICmd(ENABLE);
    CLK->ICKR |= CLK_ICKR_HSIEN;
    //CLK_LSICmd(ENABLE); 
    CLK->ICKR |= CLK_ICKR_LSIEN;  
    //CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
    CLK->CKDIVR |= (u8)CLK_PRESCALER_HSIDIV1;
    //CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1 );
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
    
    GPIOA->CR1 |=GPIO_PIN_3;		//beeper	
    GPIOA->DDR |=GPIO_PIN_3;
    GPIOA->ODR |=GPIO_PIN_3;     
/*	
//----------------programe option byte------------
	for (j=0;j<5000;j++) ;					// Wait 10ms after reset to avoid bad option byte programming		 
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);	// Define FLASH programming time 
	FLASH_Unlock(FLASH_MEMTYPE_DATA);			// Unlock Data memory	
	if (FLASH_ReadOptionByte(0x480D) != 0x00FF)  {FLASH_ProgramOptionByte(0x480D, 0x00);} // Set 0 Wait State
	Opt = 0xAA;	
	OptComp = (u8)(~Opt) | (Opt << 8);
	if (OptComp != FLASH_ReadOptionByte(0x4800)) {FLASH_ProgramOptionByte(0x4800, Opt );}	
					
	Opt = 0x02;	
	OptComp = (u8)(~Opt) | (Opt << 8);	
	if (OptComp != FLASH_ReadOptionByte(0x4803)) {FLASH_ProgramOptionByte(0x4803, Opt );}				
	FLASH_Lock(FLASH_MEMTYPE_DATA);				// Lock Data memory 
//----------------programe option byte------------
*/
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
    //TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_DISABLE, OUTPUT_4KHZ/2, TIM2_OCPOLARITY_HIGH);          
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
	  if(buzzer_time)  
	  	{
	  	 buzzer_time--;
	  	 //TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, OUTPUT_4KHZ/2, TIM2_OCPOLARITY_HIGH);
	  	} 
	  //else   TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_DISABLE,OUTPUT_4KHZ/2, TIM2_OCPOLARITY_HIGH);     
	  
	  if(match_ok == FALSE)  buzzer_time =255;
	  else 	  
	     {
	     	if(key_initial_count==80) APT8L16Init(); 
	     	if(key_initial_count <30) key_scan_I2C();   	 
	     } 	      	
         }
//************************************************
//10ms_bz2
//************************************************        
         if(Ms10_bz2 == TRUE)
         {
         	Ms10_bz2 =FALSE; 

        	key_next_deal();
          	//------------------------------------------------ 
          	if(key_ok_bit == KEY_ON_OFF)    
          	{
			on_off_key_deal();
			speed_up();
          	}
          	//------------------------------------------------ 
          	if(key_ok_bit == KEY_LOCK)    
          	{
          		lock_key_deal();
          		speed_up();
          	}
          	//------------------------------------------------ 
          	if((Power_on_bz == TRUE) && (lock_bz == FALSE)) 
          	 {          	
          	   if(key_account == short_press_time)
          	   {
          	 	if(key_ok_bit == KEY_BOOST)          	
          		{          		
          	       	boost_key_deal();
          	       	/*
          	       	if(key_zone ==0)
          	       		{
          	       		debug_list++;
          	       		if(debug_list >4) debug_list =0;
          	       		}
          	       	*/
          	       	speed_up();		
          		}        	
          	//------------------------------------------------  
          		if(key_ok_bit == KEY_1INC)
          	 	{  
          	 	inc_x_key_level(&count_1_key,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer);
          	 	speed_up();
          	 	}
          	//------------------------------------------------  
          		if(key_ok_bit == KEY_2INC)
          	 	{  
          	 	inc_x_key_level(&count_2_key,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer); 
          	 	speed_up();
          	 	}  
          	//------------------------------------------------           	
          		if(key_ok_bit == KEY_3INC)
          	 	{  
          	 	inc_x_key_level(&count_3_key,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer); 
          	 	speed_up();
          	 	}
          	//------------------------------------------------  
          		if(key_ok_bit == KEY_4INC)
          	 	{  
          	 	inc_x_key_level(&count_4_key,&zone_4_level,&zone_3_level,boost_time_4,&boost_time_3,Select_4_KEY,&zone_4_timer,&zone_3_timer); 
          	 	speed_up();
          	 	}
          	//------------------------------------------------  
          		if(key_ok_bit == KEY_1DEC)
          	 	{  
          	 	dec_x_key_level(&count_1_key,&zone_1_level,&zone_2_level,boost_time_1,&boost_time_2,Select_1_KEY,&zone_1_timer,&zone_2_timer);
          	 	speed_up();
          	 	}
          	 //------------------------------------------------  
          		if(key_ok_bit == KEY_2DEC)
          	 	{  
          	 	dec_x_key_level(&count_2_key,&zone_2_level,&zone_1_level,boost_time_2,&boost_time_1,Select_2_KEY,&zone_2_timer,&zone_1_timer);
          	 	speed_up();
          	 	}
          	 //------------------------------------------------  
          		if(key_ok_bit == KEY_3DEC)
          	 	{  
          	 	dec_x_key_level(&count_3_key,&zone_3_level,&zone_4_level,boost_time_3,&boost_time_4,Select_3_KEY,&zone_3_timer,&zone_4_timer);
          	 	speed_up();
          	 	}
          	 //------------------------------------------------  
          		if(key_ok_bit == KEY_4DEC)
          	 	{  
          	 	dec_x_key_level(&count_4_key,&zone_4_level,&zone_3_level,boost_time_4,&boost_time_3,Select_4_KEY,&zone_4_timer,&zone_3_timer);
          	 	speed_up();
          	 	}
          	    }             	        	           	            	          	         	       
          	//------------------------------------------------          	
          		if(key_ok_bit == KEY_INC)
          		{         		 
          	        inc_key_deal();	
          	        speed_up();	
          		}  
          	//------------------------------------------------          	
          		if(key_ok_bit == KEY_DEC)
          		{
          	        dec_key_deal(); 
          	        speed_up(); 			
          		} 
               }
        	//------------------------------------------------        	  	         	
        }       
//************************************************
//10ms_bz3
//************************************************    
        if(Ms10_bz3 == TRUE) 
         {
          	Ms10_bz3 =FALSE;
          	if(cmd_relay_wait)  cmd_relay_wait--;           	        	   	       	         	            	         	   	           	          	          	        	        	       			
         }
//************************************************
//10ms_bz4
//************************************************ 
        if(Ms10_bz4 == TRUE)
         {
		Ms10_bz4 =FALSE;
		   
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
//10ms_bz5
//************************************************       
        if(Ms10_bz5 == TRUE)
        {
          	Ms10_bz5 =FALSE; 
            	//	
			if((relay_delay_bz ==TRUE) && (cmd_relay_wait ==0)) 	list_counter++;	//communication list begin
			else	
				{
					list_counter =0;
					Comm_step =0;
				}			
			if(list_counter == 1) 							//1~18
				{						
					Comm_step =comm_1_s;					//zone_1 communication begin														
          				comm_deal(0,Add_2,zone_1_level,time_level_1,Err_1_data);    				
          			}         		
			if(list_counter ==19)   						//19~36
				{						
					Comm_step =comm_2_s;					//zone_2 communication begin						
          				comm_deal(1,Add_1,zone_2_level,time_level_2,Err_2_data);  		 				
          			}         						
			if(list_counter ==37)							//37~54
				{	
					Comm_step =comm_3_s;					//zone_3 communication begin	
          				comm_deal(2,Add_4,zone_3_level,time_level_3,Err_3_data);       				
          			}			
			if(list_counter ==55)							//55~72
				{
					Comm_step =comm_4_s;					//zone_4 communication begin	
          				comm_deal(3,Add_3,zone_4_level,time_level_4,Err_4_data);         				
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
//************************************************
//10ms_bz6
//************************************************          
       //if(Ms10_bz6 == TRUE)
         //{
         //	Ms10_bz6 =FALSE;          	       	  	       
         //}                
//************************************************
//10ms_bz7
//************************************************          
	//if(Ms10_bz7 == TRUE)
	//  {
        // 	Ms10_bz7 =FALSE;         		
	//  }
//************************************************
//10ms_bz8
//************************************************          
	//if(Ms10_bz8 == TRUE)
       //  {
        //  	Ms10_bz8 =FALSE;        	       		          	          							
        // }
//************************************************
//10ms_bz9
//************************************************          				 
	//if(Ms10_bz9 == TRUE)
       //  {
       //   	Ms10_bz9 =FALSE; 		                	  						
       //  }
//************************************************
//10ms_bz10
//************************************************          	
	// if(Ms10_bz10 == TRUE)
        //{
       //   	Ms10_bz10 =FALSE;						
	//}
//************************************************
//Data prepare to display deal 
//***********************************************  	
	if(Prepare_data_bz ==TRUE)
	{
	   Prepare_data_bz =FALSE;
	   
	   if(lock_bz) lock_flash_accout++;	
	   else lock_flash_accout =0;   
	   if(lock_flash_accout ==8)  lock_flash_accout =1;
	   	   
	   if(Time_dot_bz ==TRUE) Time_dot_bz =FALSE;
	   else Time_dot_bz =TRUE;
	   
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
               	    			 
               	    			if((flash_H_1_min)&&(Time_dot_bz ==TRUE)) Disp_buf[0] = CHR_H;  //flash "H"
               	    			if((flash_H_2_min)&&(Time_dot_bz ==TRUE)) Disp_buf[1] = CHR_H;  //flash "H"
               	    			if((flash_H_3_min)&&(Time_dot_bz ==TRUE)) Disp_buf[2] = CHR_H;	//flash "H"
               	    			if((flash_H_4_min)&&(Time_dot_bz ==TRUE)) Disp_buf[3] = CHR_H;  //flash "H"	  			           	 		                       	    		    			             	         
               	  	}
        	}
            else	//on status
            	{            
               	   	if(time_flash_count %2)  {Disp_buf[5] =CHR_BLANK;Disp_buf[4] =CHR_BLANK;}	//timer flash blank
               	   	else  
               	   	{
               	 		if((time_flash_count) || (zone_flash_count))				//flash on
               	 			{
               	 			    temp_8 =0;
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
						 if(timer_status & Select_1_KEY) par_1 =zone_1_timer;
						 else par_1 =255;//give a biggest value ignore compare
						 if(timer_status & Select_2_KEY) par_2 =zone_2_timer;
						 else par_2 =255;//give a biggest value ignore compare						 
						 if(timer_status & Select_3_KEY) par_3 =zone_3_timer;
						 else par_3 =255;//give a biggest value ignore compare
						 if(timer_status & Select_4_KEY) par_4 =zone_4_timer;
						 else par_4 =255;//give a biggest value ignore compare
               	 		 		 temp_8 =calculate_min(par_1,par_2,par_3,par_4);
               	 		 		}
               	 		             	else temp_8 =general_timer; 				//reminder timer
               	 			}  
               	 	 
               	 	 if(temp_8)      		//if timer value is true	 	              	 	
               	 		{
               	 		 	if((lock_bz == TRUE) && (lock_flash_accout <=4)) 		//flash "Lo"and"timer value"
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
               	  	Disp_buf[0] =ON_disp_zone_x(zone_1_level,&change_count,Select_1_KEY,flash_H_1_min,zone_1_nopan_time,Err_1_data);	 //zone1 normal display
               	        
               	 	Disp_buf[1] =ON_disp_zone_x(zone_2_level,&change_count,Select_2_KEY,flash_H_2_min,zone_2_nopan_time,Err_2_data);	 //zone2 normal display
               	  	
               	  	Disp_buf[2] =ON_disp_zone_x(zone_3_level,&change_count,Select_3_KEY,flash_H_3_min,zone_3_nopan_time,Err_3_data);	 //zone3 normal display
               	  	
               	        Disp_buf[3] =ON_disp_zone_x(zone_4_level,&change_count,Select_4_KEY,flash_H_4_min,zone_4_nopan_time,Err_4_data);	 //zone4 normal display
               	      
               	 	if((zone_flash_count ==0) && (timer_status) && (Time_dot_bz ==TRUE))	//display flash timer indicator "."
               	 	{
               	 	  if(temp_8 == zone_1_timer)  Disp_buf[0] &=~SEG_P;
               	 	  if(temp_8 == zone_2_timer)  Disp_buf[1] &=~SEG_P;
               	 	  if(temp_8 == zone_3_timer)  Disp_buf[2] &=~SEG_P;
               	 	  if(temp_8 == zone_4_timer)  Disp_buf[3] &=~SEG_P;
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
		  
		if(debug_list ==1)
		{
		Disp_buf[2] =NUM_1;
		Disp_buf[5] =Display_decode((ppg_1 &0xF0) >>4);	 
		Disp_buf[4] =Display_decode( ppg_1 &0x0F);  
		}
		else
		{
		Disp_buf[2] =NUM_2;
		Disp_buf[5] =Display_decode((ppg_2 &0xF0) >>4);	 
		Disp_buf[4] =Display_decode( ppg_2 &0x0F); 	
		}
		*/
		//Disp_buf[3] = CHR_BLANK;             
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
          	/*
          	fan_status =debug_list;      
          	*/      
         }	                                                                                                                             
//************************************************ 
//Sec_bz 
//************************************************  
        if(Sec_bz ==TRUE)
        {
           Sec_bz =FALSE; 
           boost_time_deal();  
                 
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
           	c  =&zone_1_nopan_wait +i;
           	//
                if((*x)>2)  
                {
                   (*x)++;
                   (*tw) =0;			//avoid re-heat high power appear
                   if((*x) >=60) (*p) =0;
                }
                if(*c) (*c)--;
           	//
	   if((*p) ==0)  {(*tz) =0;(*q) =0;(*x) =0;(*tw) =0;(*tb) =0;(*y) =0;(*b)=0;}
	   else	(*tw)++; 
	   }
	   
	 //if((zone_1_level +zone_2_level +zone_3_level +zone_4_level) ==0)  limit_time =0;
	 
	 if(zone_1_timer ==0) timer_status &=~Select_1_KEY;                  
	 if(zone_2_timer ==0) timer_status &=~Select_2_KEY;
	 if(zone_3_timer ==0) timer_status &=~Select_3_KEY;
	 if(zone_4_timer ==0) timer_status &=~Select_4_KEY;
	   	  
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
	  //timer_deal(); 
	  apt_min_reset++;
	  if(apt_min_reset >=10) {APT8L16Init(); apt_min_reset =0;}
	  
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
       		if((*tz) ==0)       	{buzzer_time = buz_200ms;(*p) =0;}
       	   	} 
       	   	else if(*p) (*tz)= 120;		//no timer key,canceal timer function ,give 2h setting
       	   }	     	         	         	                   	     
        }
 //************************************************         
	
    IWDG_ReloadCounter();    /* Refresh IWDG */   
  }      
    IWDG_ReloadCounter();    /* Refresh IWDG */ 
}
