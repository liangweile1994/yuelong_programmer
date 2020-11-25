/*G20_APT_005_160402.c
 * DESCRIPTION:
 * Porject: Inteligient controller
 * Chip: STM8S003F3P6 MCU(SSOP20)  manufacture by ST Microelectronics
 * Hardware Tool: Raisonance(STX-Rlink)
 * Software Tool: Cosmic(16k limit free)
 * Author :Terry Mo
 * Date: 2015.04.12
 *---------------------------------------------------------------------------
 * Copyright (c) Youlong.,LTD, 2015
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
extern u8 buzzer_time;
extern u8  comm_list;
extern u8  comm_status;
extern u32  bit_comm;
extern u16 Get_word_1;
extern u16 Get_word_2;
extern u16 Get_word_3;
extern u16 Get_word_4;
extern u8  fan_status;
u8  High_time=0;
u8  Low_time=0;
u8  comm_bit_count =0;
u8  fan_on =0;
//****************************************************************
void tx_rx_beep_io_deal(void)
{
	if(buzzer_time) BEEP_ON; 
	else BEEP_OFF;
     	if(comm_status ==0)
     	{  
     	  comm_list++;    		
     	  //------->TX 	
     	  if(comm_list <50) 				TX_1;//start high 50(*125 =6.25ms)
     	  if((comm_list >=50) &&(comm_list <66)) 	TX_0;//start low 16(*125 =2ms)
     	  if(comm_list ==66)  
     	  {		
     		High_time =0;
     		Low_time =0;
     		comm_bit_count =0;     		
     	  }
     	  if(comm_list >=66)
     	  {    
     	  	comm_list =66; 		
		if(High_time) {TX_1;High_time--;Low_time =4;} //low 0.5ms
		else 
		{
			if(Low_time) {TX_0;Low_time--;}
			else 
			{
				if((High_time+Low_time) ==0)
     				{
					if(bit_comm &0x80000000) High_time =8;	//high 1.0ms
			    	    	    		    else High_time =4;	//high 0.5ms
				}
				bit_comm<<=1;
				comm_bit_count++;
			}
		}
		if(comm_bit_count >=33) {TX_1;comm_status =1;}
	  }
	  //<-------TX
	}		
	else if((comm_status)&&(comm_status <4))
	{
	  //------->RX
	  if(J_RX_1_or_0)   {High_time++;Low_time =0;if(High_time >50) High_time =50;}
	  else 
	  {
		Low_time++;
			if(Low_time >50) Low_time =50;
			if(Low_time ==2)  
				{
				   if(High_time >30) {comm_bit_count =0;bit_comm =0;} //for start
				   else
					{
					  if(High_time <6) bit_comm &=0xFFFFFFFE;	//2~4  bit0
					              else bit_comm |=0x00000001;	//6~8  bit1		  
										  									  
					  if(comm_bit_count <31)  bit_comm<<=1;	
					  comm_bit_count++;					
					  if(comm_bit_count ==32) 	
						{
						  if(comm_status ==1)
						  	{
							Get_word_1 =(u16)(bit_comm>>16);
							Get_word_2 =(u16)bit_comm;							
							comm_status =2;	
						        }
						  else
						  	{
						  	Get_word_3 =(u16)(bit_comm>>16);
							Get_word_4 =(u16)bit_comm;
							comm_status =4;
						  	}
						  	comm_bit_count =0;
						  	bit_comm =0;					
						}				
					}
				  High_time =0;
				}
	  }
	  //<--------RX
	}	
     	//	
}
//
/*******************************************************************************
* APT Touch Key Write one address data
********************************************************************************/
void delay(u8 cnt)
{   
    while (cnt) 
     cnt--;  			/* Decrement counter until it is zero */
}
//
void IIC_initial(void)
{
  SDA_OUT;
  SDA_1;
  SCL_1;
}
//
void IIC1_initial(void)
{
  D_SDA_OUT;
  D_SDA_1;
  D_SCL_1;
}
void Start(void)
{
  SDA_OUT;
  SDA_1;
  delay(IIC_DELAY);
  SCL_1;
  delay(IIC_DELAY);
  SDA_0;
  delay(IIC_DELAY);
  SCL_0;
  delay(IIC_DELAY);
}
//
void Start1(void)
{
  D_SDA_OUT;
  D_SDA_1;
  delay(IIC_DELAY);
  D_SCL_1;
  delay(IIC_DELAY);
  D_SDA_0;
  delay(IIC_DELAY);
  D_SCL_0;
  delay(IIC_DELAY);
}
void Stop(void)
{
  SDA_0;
  delay(IIC_DELAY);
  SCL_1;
  delay(IIC_DELAY);
  SDA_1;
  delay(IIC_DELAY);
}
void Stop1(void)
{
  D_SDA_0;
  delay(IIC_DELAY);
  D_SCL_1;
  delay(IIC_DELAY);
  D_SDA_1;
  delay(IIC_DELAY);
}
void TX_Byte(u8  WriteData)
{
  u8  i,j;
  j=WriteData;
  SDA_OUT;
  for (i=0; i<8; i++)
  {
    if ((j&0x80)==0)
    { SDA_0;}
    else
    { SDA_1;}
    j <<=1;
    delay(IIC_DELAY);
    SCL_1;
    delay(IIC_DELAY);
    SCL_0;
    delay(IIC_DELAY);
  }
}
//
void TX1_Byte(u8  WriteData)
{
  u8  i,j;
  j=WriteData;
  D_SDA_OUT;
  for (i=0; i<8; i++)
  {
    if ((j&0x80)==0)
    { D_SDA_0;}
    else
    { D_SDA_1;}
    j <<=1;
    delay(IIC_DELAY);
    D_SCL_1;
    delay(IIC_DELAY);
    D_SCL_0;
    delay(IIC_DELAY);
  }
}
u8 RX_Byte(void)
{
  u8 i;
  u8 TempData = 0;
  SDA_IN;
  for (i=0; i<8; i++)
  {
    delay(IIC_DELAY);
    SCL_1;
    delay(IIC_DELAY);
    TempData <<= 1;
    if(J_SDA_1_or_0)
    { TempData++; }
    SCL_0;
    delay(IIC_DELAY);
  }
  SDA_OUT;
  return(TempData);
}
//
u8 RX1_Byte(void)
{
  u8 i;
  u8 TempData = 0;
  D_SDA_IN;
  for (i=0; i<8; i++)
  {
    delay(IIC_DELAY);
    D_SCL_1;
    delay(IIC_DELAY);
    TempData <<= 1;
    if(J_D_SDA_1_or_0)
    { TempData++; }
    D_SCL_0;
    delay(IIC_DELAY);
  }
  D_SDA_OUT;
  return(TempData);
}
void  ReceiveAck(void)
{
  u8  k1=0;
  SDA_IN;
  SCL_1;
  delay(IIC_DELAY);
  while(J_SDA_1_or_0)
  {
    k1++;
    if(k1>=250)
    {
      break;
    }
  }
  SCL_0;
  SDA_OUT;
  delay(IIC_DELAY);

 // if(k1>=250)
//	  return 1;
 // else
//	  return 0;
}
//
void  ReceiveAck1(void)
{
  u8  k1=0;
  D_SDA_IN;
  D_SCL_1;
  delay(IIC_DELAY);
  while(J_D_SDA_1_or_0)
  {
    k1++;
    if(k1>=50)
    {
      break;
    }
  }
  D_SCL_0;
  D_SDA_OUT;
  delay(IIC_DELAY);

 // if(k1>=250)
//	  return 1;
 // else
//	  return 0;*/
}
void  APTTouchWrOneData(u8 apt_add,u8 APTWrAdd,u8 APTWrData)
{
   IIC_initial();
   Start();
   TX_Byte((apt_add<<1)|0x00);
   ReceiveAck();
   TX_Byte(APTWrAdd);
   ReceiveAck();
   TX_Byte(APTWrData);
   ReceiveAck();
   Stop();
}
//
void  APTTouchWrOneData1(u8 apt_add,u8 APTWrAdd,u8 APTWrData)
{
   IIC1_initial();
   Start1();
   TX1_Byte((apt_add<<1)|0x00);
   ReceiveAck1();
   TX1_Byte(APTWrAdd);
   ReceiveAck1();
   TX1_Byte(APTWrData);
   ReceiveAck1();
   Stop1();
}
/*******************************************************************************
* APT Touch Key Read one address data
********************************************************************************/
u8  APTTouchRdOneData(u8 apt_add,u8 APTRdAdd)
{
   u8 APTRdData=0;
   
   IIC_initial();
   Start();
   TX_Byte((apt_add<<1)|0x00);
   ReceiveAck();
   TX_Byte(APTRdAdd);
   ReceiveAck();
   Stop();
   Start();
   TX_Byte((apt_add<<1)|0x01);
   ReceiveAck();
   APTRdData=RX_Byte();
   Stop();
   return(APTRdData);
}
//
u8  APTTouchRdOneData1(u8 apt_add,u8 APTRdAdd)
{
   u8 APTRdData=0;
   
   IIC1_initial();
   Start1();
   TX1_Byte((apt_add<<1)|0x00);
   ReceiveAck1();
   TX1_Byte(APTRdAdd);
   ReceiveAck1();
   Stop1();
   Start1();
   TX1_Byte((apt_add<<1)|0x01);
   ReceiveAck1();
   APTRdData=RX1_Byte();
   Stop1();
   return(APTRdData);
}
//                                                                                                                                                             
void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)                
{                                                                                                                                                                                                                         
    assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));                   
                                                                                   
    IWDG->KR = (u8)IWDG_WriteAccess;                                                                                                               
}                                                                                                                                                                
void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)                      
{                                                                                                                                     
    assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));                            
                                                                                   
    IWDG->PR = (u8)IWDG_Prescaler;                                                 
}                                                                                                                                                                
void IWDG_SetReload(u8 IWDG_Reload)                                                
{                                                                                  
    IWDG->RLR = IWDG_Reload;                                                       
}                                                                                                                                                                 
void IWDG_ReloadCounter(void)                                                      
{                                                                                  
    IWDG->KR = IWDG_KEY_REFRESH;                                                   
}                                                                                  
                                                                              
void IWDG_Enable(void)                                                             
{                                                                                  
    IWDG->KR = IWDG_KEY_ENABLE;                                                    
} 
//
u8 Check_Unique_ID(void)
{
	//C3 =0x55 C2 =0xAA C1 =0x19 C0=0x82
  u8  UID[4]; 
  u8  Result[4];
  UID[0] =*(u8*)(User_option_address+0);
  UID[1] =*(u8*)(User_option_address+1);
  UID[2] =*(u8*)(User_option_address+2);
  UID[3] =*(u8*)(User_option_address+3);
  
  Result[0] =0x82&UID[0];
  Result[1] =0x19&UID[1];
  Result[2] =0xAA&UID[2];
  Result[3] =0x55&UID[3];
  
  if(((*(u8*)(0xFF00+0))==Result[0])&&((*(u8*)(0xFF00+1))==Result[1])&&((*(u8*)(0xFF00+2))==Result[2])&&((*(u8*)(0xFF00+3))==Result[3]))  return(0);
  else return(1); 	
}
//
void vf_fan_deal(void)
{
	fan_on++;
	if(fan_on >=4) fan_on =0;
	if(fan_on >=fan_status)  FAN_OFF;
	else 	FAN_ON;
}
//
u8 flex_ntc_deal(u8 par,u8 data)
{
	if((par ==2)||(par ==4))  data |=0x80;			//bit8 ->1 -> flex NTC
				  data |=0x40;			//bit7 ->1 -> PWM direct setting mode
	return(data);
}
//
u8 zone_x_cur_no_set(u8 par,u8 count_ppg)
{
  u8 result =0;
  if(par %2)		//1# 3#
  {
  result =CON_NO_CUR1_MIN;
  if((count_ppg >=CON_PWM_20us)&&(count_ppg <CON_PWM_17us)) 	result =CON_NO_CUR1_LOW;	//17US<PPG<20US 
  if((count_ppg >=CON_PWM_23us)&&(count_ppg <CON_PWM_20us)) 	result =CON_NO_CUR1_MID;	//20US<PPG<23US 
  if(count_ppg <CON_PWM_23us)		 			result =CON_NO_CUR1_HIG;	//23US<PPG
  } 
  else
  {
  result =CON_NO_CUR2_MIN;
  if((count_ppg >=CON_PWM_17us)&&(count_ppg <CON_PWM_15us)) 	result =CON_NO_CUR2_LOW;	//15US<PPG<17US 
  if((count_ppg >=CON_PWM_19us)&&(count_ppg <CON_PWM_17us)) 	result =CON_NO_CUR2_MID;	//17US<PPG<19US 
  if(count_ppg <CON_PWM_19us)		 			result =CON_NO_CUR2_HIG;	//19US<PPG
  }
  
  return(result);
}
//
//**************************************************************************** 
void UART2_DeInit(void)                                                                                                                                                                   
{                                                                                                                                                                                         
    u8 dummy = 0;                                                                                                                                                                                                                                                                                   
    dummy = UART2->SR;                                                                                                                                                                    
    dummy = UART2->DR;                                                                                                                                                                    
                                                                                                                                                                                          
    UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*< Set UART2_BRR2 to reset value 0x00 */                                                                                                      
    UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*< Set UART2_BRR1 to reset value 0x00 */                                                                                                      
                                                                                                                                                                                          
    UART2->CR1 = UART2_CR1_RESET_VALUE; /*< Set UART2_CR1 to reset value 0x00  */                                                                                                         
    UART2->CR2 = UART2_CR2_RESET_VALUE; /*< Set UART2_CR2 to reset value 0x00  */                                                                                                         
    UART2->CR3 = UART2_CR3_RESET_VALUE;  /*< Set UART2_CR3 to reset value 0x00  */                                                                                                        
    UART2->CR4 = UART2_CR4_RESET_VALUE;  /*< Set UART2_CR4 to reset value 0x00  */                                                                                                        
    UART2->CR5 = UART2_CR5_RESET_VALUE; /*< Set UART2_CR5 to reset value 0x00  */                                                                                                         
    UART2->CR6 = UART2_CR6_RESET_VALUE; /*< Set UART2_CR6 to reset value 0x00  */                                                                                                                                                                                                                                                                                                  
} 
/**                                                                                                                                                                                       
  * @brief Initializes the UART2 according to the specified parameters.                                                                                                                   
  * @param[in] BaudRate: The baudrate.                                                                                                                                                    
  * @param[in] WordLength : This parameter can be any of the @ref UART2_WordLength_TypeDef enumeration.                                                                                   
  * @param[in] StopBits: This parameter can be any of the @ref UART2_StopBits_TypeDef enumeration.                                                                                        
  * @param[in] Parity: This parameter can be any of the @ref UART2_Parity_TypeDef enumeration.                                                                                            
  * @param[in] SyncMode: This parameter can be any of the @ref UART2_SyncMode_TypeDef values.                                                                                             
  * @param[in] Mode: This parameter can be any of the @ref UART2_Mode_TypeDef values                                                                                                      
  * @retval None                                                                                                                                                                          
  */ 
//
//UART2_Init((u32)1200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE)
//                                                                                                                                                                                     
void UART2_Init(u32 BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
{                                                                                                                                                                                         
    u8 BRR2_1, BRR2_2 = 0;                                                                                                                                                                
    u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;                                                                                                                                      
                                                                                                                                                                                          
    /* assert_param: BaudRate value should be <= 625000 bps */                                                                                                                            
    assert_param(IS_UART2_BAUDRATE_OK(BaudRate));                                                                                                                                         
                                                                                                                                                                                          
    assert_param(IS_UART2_WORDLENGTH_OK(WordLength));                                                                                                                                     
                                                                                                                                                                                          
    assert_param(IS_UART2_STOPBITS_OK(StopBits));                                                                                                                                         
                                                                                                                                                                                          
    assert_param(IS_UART2_PARITY_OK(Parity));                                                                                                                                             
                                                                                                                                                                                          
    /* assert_param: UART2_Mode value should exclude values such as  UART2_ModeTx_Enable|UART2_ModeTx_Disable */                                                                          
    assert_param(IS_UART2_MODE_OK((u8)Mode));                                                                                                                                             
                                                                                                                                                                                          
    /* assert_param: UART2_SyncMode value should exclude values such as                                                                                                                   
       UART2_CLOCK_ENABLE|UART2_CLOCK_DISABLE */                                                                                                                                          
    assert_param(IS_UART2_SYNCMODE_OK((u8)SyncMode));                                                                                                                                     
                                                                                                                                                                                          
    UART2->CR1 &= (u8)(~UART2_CR1_M);  /**< Clear the word length bit */                                                                                                                  
    UART2->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART2_WordLength value */                                                                                     
                                                                                                                                                                                          
    UART2->CR3 &= (u8)(~UART2_CR3_STOP);  /**< Clear the STOP bits */                                                                                                                     
    UART2->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART2_StopBits value  */                                                                                      
                                                                                                                                                                                          
    UART2->CR1 &= (u8)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));  /**< Clear the Parity Control bit */                                                                                         
    UART2->CR1 |= (u8)Parity;  /**< Set the Parity Control bit to UART2_Parity value */                                                                                                   
                                                                                                                                                                                          
    UART2->BRR1 &= (u8)(~UART2_BRR1_DIVM);  /**< Clear the LSB mantissa of UARTDIV  */                                                                                                    
    UART2->BRR2 &= (u8)(~UART2_BRR2_DIVM);  /**< Clear the MSB mantissa of UARTDIV  */                                                                                                    
    UART2->BRR2 &= (u8)(~UART2_BRR2_DIVF);  /**< Clear the Fraction bits of UARTDIV */                                                                                                    
                                                                                                                                                                                          
    /**< Set the UART2 BaudRates in BRR1 and BRR2 registers according to UART2_BaudRate value */                                                                                          
    BaudRate_Mantissa    = ((u32)16000000 / (BaudRate << 4));                                                                                                                   
    BaudRate_Mantissa100 = (((u32)16000000 * 100) / (BaudRate << 4));                                                                                                           
    /**< The fraction and MSB mantissa should be loaded in one step in the BRR2 register*/                                                                                                
    BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */                                                                                                    
    BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);                                                                                                                                   
                                                                                                                                                                                          
    UART2->BRR2 = (u8)(BRR2_1 | BRR2_2);                                                                                                                                                  
    UART2->BRR1 = (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UARTDIV  */                                                                                               
                                                                                                                                                                                          
    UART2->CR2 &= (u8)~(UART2_CR2_TEN | UART2_CR2_REN); /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */                                           
    UART2->CR3 &= (u8)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL); /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */                                             
    UART2->CR3 |= (u8)((u8)SyncMode & (u8)(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL));  /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */                          
                                                                                                                                                                                          
    if ((u8)Mode & (u8)UART2_MODE_TX_ENABLE)                                                                                                                                              
    {                                                                                                                                                                                     
        UART2->CR2 |= (u8)UART2_CR2_TEN;  /**< Set the Transmitter Enable bit */                                                                                                          
    }                                                                                                                                                                                     
    else                                                                                                                                                                                  
    {                                                                                                                                                                                     
        UART2->CR2 &= (u8)(~UART2_CR2_TEN);  /**< Clear the Transmitter Disable bit */                                                                                                    
    }                                                                                                                                                                                     
    if ((u8)Mode & (u8)UART2_MODE_RX_ENABLE)                                                                                                                                              
    {                                                                                                                                                                                     
        UART2->CR2 |= (u8)UART2_CR2_REN;  /**< Set the Receiver Enable bit */                                                                                                             
    }                                                                                                                                                                                     
    else                                                                                                                                                                                  
    {                                                                                                                                                                                     
        UART2->CR2 &= (u8)(~UART2_CR2_REN);  /**< Clear the Receiver Disable bit */                                                                                                       
    }                                                                                                                                                                                     
    /**< Set the Clock Enable bit, lock Polarity, lock Phase and Last Bit Clock pulse bits according to UART2_Mode value */                                                               
    if ((u8)SyncMode&(u8)UART2_SYNCMODE_CLOCK_DISABLE)                                                                                                                                    
    {                                                                                                                                                                                     
        UART2->CR3 &= (u8)(~UART2_CR3_CKEN); /**< Clear the Clock Enable bit */                                                                                                           
        /**< configure in Push Pull or Open Drain mode the Tx I/O line by setting the correct I/O Port register according the product package and line configuration*/                    
    }                                                                                                                                                                                     
    else                                                                                                                                                                                  
    {                                                                                                                                                                                     
        UART2->CR3 |= (u8)((u8)SyncMode & UART2_CR3_CKEN);                                                                                                                                
    }                                                                                                                                                                                     
}  
/**                                                                                                                                                                                       
  * @brief Enable the UART2 peripheral.                                                                                                                                                   
  * @par Full description:                                                                                                                                                                
  * Enable the UART2 peripheral.                                                                                                                                                          
  * @param[in] NewState new state of the UART2 Communication.                                                                                                                             
  * This parameter can be:                                                                                                                                                                
  * - ENABLE                                                                                                                                                                              
  * - DISABLE                                                                                                                                                                             
  * @retval None                                                                                                                                                                          
  */  
void UART2_Cmd(FunctionalState NewState)                                                                                                                                                  
{                                                                                                                                                                                         
                                                                                                                                                                                          
    if (NewState != DISABLE)                                                                                                                                                              
    {                                                                                                                                                                                     
        UART2->CR1 &= (u8)(~UART2_CR1_UARTD); /**< UART2 Enable */                                                                                                                        
    }                                                                                                                                                                                     
    else                                                                                                                                                                                  
    {                                                                                                                                                                                     
        UART2->CR1 |= UART2_CR1_UARTD;  /**< UART2 Disable (for low power consumption) */                                                                                                 
    }                                                                                                                                                                                     
} 
/**                                                                                                                                                                                       
  * @brief Enables or disables the specified UART2 interrupts.                                                                                                                            
  * @par Full description:                                                                                                                                                                
  * Enables or disables the specified UART2 interrupts.                                                                                                                                   
  * @param[in] UART2_IT specifies the UART2 interrupt sources to be enabled or disabled.                                                                                                  
  * This parameter can be one of the following values:                                                                                                                                    
  *   - UART2_IT_LBDF:  LIN Break detection interrupt                                                                                                                                     
  *   - UART2_IT_LHDF:  LIN Break detection interrupt                                                                                                                                     
  *   - UART2_IT_TXE:  Tansmit Data Register empty interrupt                                                                                                                              
  *   - UART2_IT_TC:   Transmission complete interrupt                                                                                                                                    
  *   - UART2_IT_RXNE_OR: Receive Data register not empty/Over run error interrupt                                                                                                        
  *   - UART2_IT_IDLE: Idle line detection interrupt                                                                                                                                      
  *   - UART2_IT_PE:   Parity Error interrupt                                                                                                                                             
  * @param[in] NewState new state of the specified UART2 interrupts.                                                                                                                      
  * This parameter can be: ENABLE or DISABLE.                                                                                                                                             
  * @retval None                                                                                                                                                                          
  */                                                                                                                                                                                      
void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)                                                                                                                  
{                                                                                                                                                                                         
    u8 uartreg, itpos = 0x00;                                                                                                                                                             
    assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));                                                                                                                                        
    assert_param(IS_FUNCTIONALSTATE_OK(NewState));                                                                                                                                        
                                                                                                                                                                                          
    /* Get the UART2 register index */                                                                                                                                                    
    uartreg = (u8)(UART2_IT >> 0x08);                                                                                                                                                     
                                                                                                                                                                                          
    /* Get the UART2 IT index */                                                                                                                                                          
    ///itpos = (u8)((u8)1 << (u8)((u8)UART2_IT & (u8)0x0F));    确认这个语句有错 与.h文件定义不符 修改 st8s_uart2.h文件mgy091103                                                                                                                             
     itpos = (u8)UART2_IT ;                                                                                                                                                                                    
    if (NewState != DISABLE)                                                                                                                                                              
    {                                                                                                                                                                                     
        /**< Enable the Interrupt bits according to UART2_IT mask */                                                                                                                      
        if (uartreg == 0x01)                                                                                                                                                              
        {                                                                                                                                                                                 
            UART2->CR1 |= itpos;                                                                                                                                                          
        }                                                                                                                                                                                 
        else if (uartreg == 0x02)                                                                                                                                                         
        {                                                                                                                                                                                 
            UART2->CR2 |= itpos;                                                                                                                                                          
        }                                                                                                                                                                                 
        else if (uartreg == 0x03)                                                                                                                                                         
        {                                                                                                                                                                                 
            UART2->CR4 |= itpos;                                                                                                                                                          
        }                                                                                                                                                                                 
        else                                                                                                                                                                              
        {                                                                                                                                                                                 
            UART2->CR6 |= itpos;                                                                                                                                                          
        }                                                                                                                                                                                 
    }                                                                                                                                                                                     
    else                                                                                                                                                                                  
    {                                                                                                                                                                                     
        /**< Disable the interrupt bits according to UART2_IT mask */                                                                                                                     
        if (uartreg == 0x01)                                                                                                                                                              
        {                                                                                                                                                                                 
            UART2->CR1 &= (u8)(~itpos);                                                                                                                                                   
        }                                                                                                                                                                                 
        else if (uartreg == 0x02)                                                                                                                                                         
        {                                                                                                                                                                                 
            UART2->CR2 &= (u8)(~itpos);                                                                                                                                                   
        }                                                                                                                                                                                 
        else if (uartreg == 0x03)                                                                                                                                                         
        {                                                                                                                                                                                 
            UART2->CR4 &= (u8)(~itpos);                                                                                                                                                   
        }                                                                                                                                                                                 
        else                                                                                                                                                                              
        {                                                                                                                                                                                 
            UART2->CR6 &= (u8)(~itpos);                                                                                                                                                   
        }                                                                                                                                                                                 
    }                                                                                                                                                                                     
}
/**                                                                                                                                                                                       
  * @brief Returns the most recent received data by the UART2 peripheral.                                                                                                                 
  * @par Full description:                                                                                                                                                                
  * Returns the most recent received data by the UART2 peripheral.                                                                                                                        
  * @retval u16 Received Data                                                                                                                                                             
  * @par Required preconditions:                                                                                                                                                          
  * UART2_Cmd(ENABLE);                                                                                                                                                                    
  */                                                                                                                                                                                      
u8 UART2_ReceiveData8(void)                                                                                                                                                               
{                                                                                                                                                                                         
    return ((u8)UART2->DR);                                                                                                                                                               
} 
/**                                                                                                                                                                                       
  * @brief Transmits 8 bit data through the UART2 peripheral.                                                                                                                             
  * @par Full description:                                                                                                                                                                
  * Transmits 8 bit data through the UART2 peripheral.                                                                                                                                    
  * @param[in] Data: the data to transmit.                                                                                                                                                
  * @retval None                                                                                                                                                                          
  * @par Required preconditions:                                                                                                                                                          
  * UART2_Cmd(ENABLE);                                                                                                                                                                    
  */                                                                                                                                                                                      
void UART2_SendData8(u8 Data)                                                                                                                                                             
{                                                                                                                                                                                         
    /* Transmit Data */                                                                                                                                                                   
    UART2->DR = Data;                                                                                                                                                                     
} 
/**                                                                                                                                                                                       
 * @brief Clears the UART2 flags.                                                                                                                                                         
 * @par Full description:                                                                                                                                                                 
 * Clears the UART2 flags.                                                                                                                                                                
 * @param[in] UART2_FLAG specifies the flag to clear                                                                                                                                      
 * This parameter can be any combination of the following values:                                                                                                                         
 *   - UART2_FLAG_LBDF: LIN Break detection flag.                                                                                                                                         
 *   - UART2_FLAG_LHDF: LIN Header detection flag.                                                                                                                                        
 *   - UART2_FLAG_LSF: LIN synchrone field flag.                                                                                                                                          
 *   - UART2_FLAG_RXNE: Receive data register not empty flag.                                                                                                                             
 * @par Notes:                                                                                                                                                                            
 *   - PE (Parity error), FE (Framing error), NE (Noise error), OR (OverRun error)                                                                                                        
 *     and IDLE (Idle line detected) flags are cleared by software sequence: a read                                                                                                       
 *     operation to UART2_SR register (UART2_GetFlagStatus())followed by a read operation                                                                                                 
 *     to UART2_DR register(UART2_ReceiveData8() or UART2_ReceiveData9()).                                                                                                                
 *   - RXNE flag can be also cleared by a read to the UART2_DR register                                                                                                                   
 *     (UART2_ReceiveData8()or UART2_ReceiveData9()).                                                                                                                                     
 *   - TC flag can be also cleared by software sequence: a read operation to UART2_SR                                                                                                     
 *     register (UART2_GetFlagStatus()) followed by a write operation to UART2_DR register                                                                                                
 *     (UART2_SendData8() or UART2_SendData9()).                                                                                                                                          
 *   - TXE flag is cleared only by a write to the UART2_DR register (UART2_SendData8() or                                                                                                 
 *     UART2_SendData9()).                                                                                                                                                                
 *   - SBK flag is cleared during the stop bit of break.                                                                                                                                  
 * @retval None                                                                                                                                                                           
 */                                                                                                                                                                                       
                                                                                                                                                                                          
void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)                                                                                                                                       
{                                                                                                                                                                                         
    assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));                                                                                                                                     
                                                                                                                                                                                          
    /*< Clear the Receive Register Not Empty flag */                                                                                                                                      
    if (UART2_FLAG == UART2_FLAG_RXNE)                                                                                                                                                    
    {                                                                                                                                                                                     
        UART2->SR = (u8)~(UART2_SR_RXNE);                                                                                                                                                 
    }                                                                                                                                                                                     
    /*< Clear the LIN Break Detection flag */                                                                                                                                             
    else if (UART2_FLAG == UART2_FLAG_LBDF)                                                                                                                                               
    {                                                                                                                                                                                     
        UART2->CR4 &= (u8)(~UART2_CR4_LBDF);                                                                                                                                              
    }                                                                                                                                                                                     
    /*< Clear the LIN Header Detection Flag */                                                                                                                                            
    else if (UART2_FLAG == UART2_FLAG_LHDF)                                                                                                                                               
    {                                                                                                                                                                                     
        UART2->CR6 &= (u8)(~UART2_CR6_LHDF);                                                                                                                                              
    }                                                                                                                                                                                     
    /*< Clear the LIN Synch Field flag */                                                                                                                                                 
    else                                                                                                                                                                                  
    {                                                                                                                                                                                     
        UART2->CR6 &= (u8)(~UART2_CR6_LSF);                                                                                                                                               
    }                                                                                                                                                                                     
                                                                                                                                                                                          
} 
/**                                                                                                                                                                                       
 * @brief Clears the UART2 pending flags.                                                                                                                                                 
 * @par Full description:                                                                                                                                                                 
 * Clears the UART2 pending bit.                                                                                                                                                          
 * @param[in] UART2_IT specifies the pending bit to clear                                                                                                                                 
 * This parameter can be one of the following values:                                                                                                                                     
 *   - UART2_IT_LBDF:  LIN Break detection interrupt                                                                                                                                      
 *   - UART2_IT_LHDF:  LIN Header detection interrupt                                                                                                                                     
 *   - UART2_IT_RXNE: Receive Data register not empty interrupt.                                                                                                                          
 *                                                                                                                                                                                        
 * @par Notes:                                                                                                                                                                            
 *   - PE (Parity error), FE (Framing error), NE (Noise error), OR (OverRun error) and                                                                                                    
 *     IDLE (Idle line detected) pending bits are cleared by software sequence: a read                                                                                                    
 *     operation to UART2_SR register (UART2_GetITStatus()) followed by a read operation                                                                                                  
 *     to UART2_DR register (UART2_ReceiveData8() or UART2_ReceiveData9() ).                                                                                                              
 *   - RXNE pending bit can be also cleared by a read to the UART2_DR register                                                                                                            
 *     (UART2_ReceiveData8() or UART2_ReceiveData9() ).                                                                                                                                   
 *   - TC (Transmit complet) pending bit can be cleared by software sequence: a read                                                                                                      
 *     operation to UART2_SR register (UART2_GetITStatus()) followed by a write operation                                                                                                 
 *     to UART2_DR register (UART2_SendData8()or UART2_SendData9()).                                                                                                                      
 *   - TXE pending bit is cleared only by a write to the UART2_DR register                                                                                                                
 *     (UART2_SendData8() or UART2_SendData9()).                                                                                                                                          
 * @retval None                                                                                                                                                                           
 */                                                                                                                                                                                       
void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)                                                                                                                                   
{                                                                                                                                                                                         
    assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));                                                                                                                                         
                                                                                                                                                                                          
    /*< Clear the Receive Register Not Empty pending bit */                                                                                                                               
    if (UART2_IT == UART2_IT_RXNE)                                                                                                                                                        
    {                                                                                                                                                                                     
        UART2->SR = (u8)~(UART2_SR_RXNE);                                                                                                                                                 
    }                                                                                                                                                                                     
    /*< Clear the LIN Break Detection pending bit */                                                                                                                                      
    else if (UART2_IT == UART2_IT_LBDF)                                                                                                                                                   
    {                                                                                                                                                                                     
        UART2->CR4 &= (u8)~(UART2_CR4_LBDF);                                                                                                                                              
    }                                                                                                                                                                                     
    /*< Clear the LIN Header Detection pending bit */                                                                                                                                     
    else                                                                                                                                                                                  
    {                                                                                                                                                                                     
        UART2->CR6 &= (u8)(~UART2_CR6_LHDF);                                                                                                                                              
    }                                                                                                                                                                                     
} 
