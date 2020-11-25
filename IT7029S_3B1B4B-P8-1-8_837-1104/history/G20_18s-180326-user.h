/** G20_user.h                                                                                                                                                                                                                                
/* Includes ------------------------------------------------------------------*/ 
#include "stm8s_type.h"
#include "stm8s.h"                                                                                                                                                
/* Private define ------------------------------------------------------------*/
#define User_option_address	((u32)0x48CD)		//stm8s005   
//****************************************************************
//    EEPROM Address define
//----------------------------------------------------------------
#define User_eeprom_address_1	((u32)0x4051)
#define User_eeprom_address_2	((u32)0x4052)
#define User_eeprom_address_3	((u32)0x4053)
#define User_eeprom_address_4	((u32)0x4054)
#define User_eeprom_address_5	((u32)0x4055)
#define User_eeprom_address_6	((u32)0x4056)
#define User_eeprom_address_7	((u32)0x4057)
#define User_eeprom_address_8	((u32)0x4058)

#define  OPERATION_TIMEOUT      ((u16)0x1000)
#define  boost_another_level	((u8)6)
//****************************************************************
//  Beeper  PWM HZ OUPPUT define
//----------------------------------------------------------------
#define OUTPUT_4KHZ       ((u16)16*250)   //counter16 time is 1us
#define OUTPUT_2KHZ       ((u16)16*500)   //counter16 time is 1us
//****************************************************************
//    buzzer_time define
//----------------------------------------------------------------
#define buz_50ms	   	(5)  
#define buz_100ms       	(10)   
#define buz_200ms       	(20)   
#define buz_500ms       	(20)   
#define buz_1000ms       	(100)  
//****************************************************************
#define Compare_min(a,b,c)   	((a<=b)?(c=a):(c=b))
//****************************************************************
//   Port define
//----------------------------------------------------------------
#define T_SCK_Port		GPIOD
#define T_SCK_Pin 	        GPIO_PIN_0	//PD0

#define T_SDA_Port		GPIOB
#define T_SDA_Pin 	        GPIO_PIN_0	//PB0

#define T1_SCK_Port		GPIOC
#define T1_SCK_Pin 	        GPIO_PIN_5	//PC5

#define T1_SDA_Port		GPIOC
#define T1_SDA_Pin 	        GPIO_PIN_7	//PC7

#define D_EN_Port		GPIOC
#define D_EN_Pin 	        GPIO_PIN_1	//PC1

#define D_SCK_Port		GPIOD
#define D_SCK_Pin 	        GPIO_PIN_3	//PD3

#define D_SDA_Port		GPIOF
#define D_SDA_Pin 	        GPIO_PIN_4	//PF4

#define RELAY_Port		GPIOD
#define RELAY_Pin 	        GPIO_PIN_7	//PD7 

#define FAN_Port		GPIOE
#define FAN_Pin 	        GPIO_PIN_5	//PE5 

#define BEEP_Port		GPIOD
#define BEEP_Pin 	        GPIO_PIN_2	//PD2 

#define TX_Port			GPIOD
#define TX_Pin 	        	GPIO_PIN_5	//PD5 

#define RX_Port			GPIOD
#define RX_Pin 	        	GPIO_PIN_6	//PD6 

#define CY8C21534_ADDR1         ((u8)0x0C)

#define IIC_DELAY  	 ((u8)40)

#define TX_OUT     	TX_Port->DDR |=TX_Pin 
#define TX_1       	TX_Port->ODR |=TX_Pin
#define TX_0       	TX_Port->ODR &=~TX_Pin

#define RX_IN      	RX_Port->DDR &=~RX_Pin
#define J_RX_1_or_0    ((RX_Port->IDR) & RX_Pin)
#define RX_OUT     	RX_Port->DDR |=RX_Pin 
#define RX_1       	RX_Port->ODR |=RX_Pin
#define RX_0       	RX_Port->ODR &=~RX_Pin

#define SDA_IN      	T_SDA_Port->DDR &=~T_SDA_Pin
#define SDA_OUT     	T_SDA_Port->DDR |=T_SDA_Pin            
#define SDA_1       	T_SDA_Port->ODR |=T_SDA_Pin              
#define SDA_0       	T_SDA_Port->ODR &=~T_SDA_Pin
#define SCL_1       	T_SCK_Port->ODR |=T_SCK_Pin
#define SCL_0       	T_SCK_Port->ODR &=~T_SCK_Pin
#define J_SDA_1_or_0   ((T_SDA_Port->IDR) & T_SDA_Pin)

#define SDA1_IN      	T1_SDA_Port->DDR &=~T1_SDA_Pin
#define SDA1_OUT     	T1_SDA_Port->DDR |=T1_SDA_Pin            
#define SDA1_1       	T1_SDA_Port->ODR |=T1_SDA_Pin              
#define SDA1_0       	T1_SDA_Port->ODR &=~T1_SDA_Pin
#define SCL1_1       	T1_SCK_Port->ODR |=T1_SCK_Pin
#define SCL1_0       	T1_SCK_Port->ODR &=~T1_SCK_Pin
#define J_SDA1_1_or_0   ((T1_SDA_Port->IDR) & T1_SDA_Pin)

#define RELAY_ON        RELAY_Port->ODR |=RELAY_Pin
#define RELAY_OFF       RELAY_Port->ODR &=~RELAY_Pin

#define FAN_ON          FAN_Port->ODR |=FAN_Pin
#define FAN_OFF         FAN_Port->ODR &=~FAN_Pin

#define BEEP_ON		BEEP_Port->ODR ^=BEEP_Pin; 
//****************************************************************
//Touch Sensor define
//---------------------------------------------------------------- 
//
//apt config(high address & low address)
#define APT_ADD_H	((u8)0x56)
#define APT_ADD_L	((u8)0x57)
//          
#define GSR  		((u8)0x03)			//0x20
#define MCON 		((u8)0x04)			//0x21
#define FILTER0 	((u8)0x20)			//0x22
#define K0_ENB_H 	((u8)0x80)			//0x23  disable         K07 touch
#define K1_ENB_H 	((u8)0x0C)			//0x24  disable     K12~K13 touch
#define K0_ENB_L 	((u8)0x00)			//0x23  non-disable K00~K07 touch
#define K1_ENB_L 	((u8)0x03)			//0x24  disable     K10~K11 touch
#define K0_ENB_AH 	((u8)0x00)			//0x23  non-disable K00~K07 touch
#define K1_ENB_AL 	((u8)0x00)			//0x24  non-disable K10~K17 touch
#define SENSE_CON	((u8)0x40)			//0x25
#define SENSE_S		((u8)0x08)			//0x26
#define GSR_K07		((u8)0x02)			//0x27
#define GSR_K17		((u8)0x02)			//0x28
#define	REF_UTH		((u8)0x80)			//0x29   
#define KEY_ATH		((u8)0xFF)			//0x2A
#define DSMIT		((u8)0x04)			//0x2B
#define MCONH		((u8)0x40)			//0x2C
#define FILTER1		((u8)0x00)

#define VALUE_1S6		((u16)0x0040)
#define VALUE_1S5		((u16)0x0020)
#define VALUE_1S4		((u16)0x0010)
#define VALUE_1S3		((u16)0x0008)
#define VALUE_1S2		((u16)0x0004)
#define VALUE_1DEC		((u16)0x0002)
#define VALUE_FL		((u16)0x0001)
#define VALUE_1S7		((u16)0x0100)	
#define VALUE_1S8		((u16)0x0200) 
#define VALUE_1INC		((u16)0x1000)  
#define VALUE_2DEC		((u16)0x2000)
#define VALUE_2S2		((u16)0x4000) 
#define VALUE_2S3		((u16)0x8000)	//up APT address is high

#define VALUE_2INC		((u16)0x0080)
#define VALUE_2S8		((u16)0x0040)
#define VALUE_2S7		((u16)0x0020)
#define VALUE_2S6		((u16)0x0010)
#define VALUE_2S5		((u16)0x0008)
#define VALUE_2S4		((u16)0x0004)
#define VALUE_INC		((u16)0x0002)
#define VALUE_DEC		((u16)0x0001)
#define VALUE_BOOST		((u16)0x0400) 
#define VALUE_LOCK		((u16)0x0800)	
#define VALUE_ON_OFF		((u16)0x1000)
#define VALUE_3S3		((u16)0x2000)
#define VALUE_3S2		((u16)0x4000)
#define VALUE_3DEC		((u16)0x8000)	//up APT address is low

#define VALUE_4S3		((u16)0x0080)
#define VALUE_3S4		((u16)0x0040)
#define VALUE_3INC		((u16)0x0020)
#define VALUE_3S8		((u16)0x0010)
#define VALUE_3S7		((u16)0x0008)
#define VALUE_3S6		((u16)0x0004)
#define VALUE_3S5		((u16)0x0002)
#define VALUE_FR		((u16)0x0001)
#define VALUE_4S2		((u16)0x0100)
#define VALUE_4DEC 		((u16)0x0200)
#define VALUE_4S4		((u16)0x0400)
#define VALUE_4S5		((u16)0x0800)
#define VALUE_4S6		((u16)0x1000)
#define VALUE_4S7		((u16)0x2000)
#define VALUE_4S8		((u16)0x4000)	
#define VALUE_4INC		((u16)0x8000)	//another APT address is high
//key code define
#define KEY_ON_OFF            	((u8)0x01)
#define KEY_LOCK		((u8)0x02)
#define KEY_BOOST		((u8)0x03)
#define KEY_FL            	((u8)0x04)
#define KEY_FR            	((u8)0x05)
#define KEY_INC			((u8)0x06)
#define KEY_DEC			((u8)0x07)

#define KEY_1DEC		((u8)0x11)
#define KEY_1S2			((u8)0x12)
#define KEY_1S3			((u8)0x13)
#define KEY_1S4			((u8)0x14)
#define KEY_1S5			((u8)0x15)
#define KEY_1S6			((u8)0x16)
#define KEY_1S7			((u8)0x17)
#define KEY_1S8			((u8)0x18)
#define KEY_1INC		((u8)0x19)

#define KEY_2DEC		((u8)0x21)
#define KEY_2S2			((u8)0x22)
#define KEY_2S3			((u8)0x23)
#define KEY_2S4			((u8)0x24)
#define KEY_2S5			((u8)0x25)
#define KEY_2S6			((u8)0x26)
#define KEY_2S7			((u8)0x27)
#define KEY_2S8			((u8)0x28)
#define KEY_2INC		((u8)0x29)

#define KEY_3DEC		((u8)0x31)
#define KEY_3S2			((u8)0x32)
#define KEY_3S3			((u8)0x33)
#define KEY_3S4			((u8)0x34)
#define KEY_3S5			((u8)0x35)
#define KEY_3S6			((u8)0x36)
#define KEY_3S7			((u8)0x37)
#define KEY_3S8			((u8)0x38)
#define KEY_3INC		((u8)0x39)

#define KEY_4DEC		((u8)0x41)
#define KEY_4S2			((u8)0x42)
#define KEY_4S3			((u8)0x43)
#define KEY_4S4			((u8)0x44)
#define KEY_4S5			((u8)0x45)
#define KEY_4S6			((u8)0x46)
#define KEY_4S7			((u8)0x47)
#define KEY_4S8			((u8)0x48)
#define KEY_4INC		((u8)0x49)
//key press time define
#define short_press_time        ((u8)2)		//10ms *(2+1) =30ms
#define short_80ms_time         ((u8)10)	//10ms *(10+1) =110ms
#define press_500ms_time        ((u8)50)	//10ms *(50)=500ms 
#define long_press_time         ((u8)100)	//10ms *(100)=1s
#define lock_press_time         ((u8)250)	//10ms *(250)=2.5s
#define err_mul_key_time        ((u16)500)	//10ms *(500) =5s
//****************************************************************
// TIMER ZONE Display define
//----------------------------------------------------------------
#define Select_1_KEY    	(0x01)
#define Select_2_KEY    	(0x02)
#define Select_3_KEY    	(0x04)    	
#define Select_4_KEY    	(0x08)
#define Select_5_KEY    	(0x10)
//****************************************************************
// 1668 Display define
//----------------------------------------------------------------
#define SEG_A                   ((u8)0x01)
#define SEG_B                   ((u8)0x02)
#define SEG_C                   ((u8)0x04)
#define SEG_D                   ((u8)0x08)
#define SEG_E                   ((u8)0x10)
#define SEG_F                   ((u8)0x20)
#define SEG_G                   ((u8)0x40)
#define SEG_P                   ((u8)0x80) 

#define SEG_ALL                 ((u8)0xFF) //                      ;"8."
#define CHR_BLANK               ((u8)0x00) //                      ;" "

#define CHR_DOT                 ((u8)SEG_P)//                      ;"."
                               
#define CHR_SQL                 ((u8)SEG_D|(u8)SEG_E)  //          ;"("
#define CHR_SQR                 ((u8)SEG_A|(u8)SEG_B)  //          ;")"
                                
#define NUM_8                   ((u8)SEG_ALL&~(u8)SEG_P)  //       ;"8"
#define NUM_1                   ((u8)SEG_B|(u8)SEG_C)   //         ;"1"
#define NUM_9                   ((u8)NUM_8&~(u8)SEG_E)   //        ;"9"
#define NUM_0                   ((u8)NUM_8&~(u8)SEG_G)   //        ;"0"
#define NUM_6                   ((u8)NUM_8&~(u8)SEG_B)   //        ;"6"
#define NUM_5                   ((u8)NUM_6&~(u8)SEG_E)   //        ;"5"
#define CHR_A                   ((u8)NUM_8&~(u8)SEG_D)   //        ;"A"
#define CHR_Q                   ((u8)NUM_9&~(u8)SEG_D)   //        ;"q"
#define NUM_4                   ((u8)CHR_Q&~(u8)SEG_A)   //        ;"4"
#define NUM_3                   ((u8)NUM_9&~(u8)SEG_F)   //        ;"3"
#define CHR_E                   ((u8)NUM_8&~(u8)NUM_1)   //        ;"E"
#define CHR_F                   ((u8)CHR_E&~(u8)SEG_D)   //        ;"F"
#define NUM_7                   ((u8)CHR_Q&~(u8)SEG_G)   //        ;"7"
#define CHR_C                   ((u8)CHR_SQL|SEG_G)   //           ;"c"
#define NUM_2                   ((u8)CHR_C|(u8)CHR_SQR)//          ;"2"
#define CHR_B                   ((u8)NUM_6&~(u8)SEG_A)//           ;"B"
#define CHR_D                   ((u8)CHR_C|(u8)NUM_1)//            ;"D"
#define CHR_G                   ((u8)NUM_6&~(u8)SEG_G)//           ;"G"
#define CHR_H                   ((u8)NUM_4|(u8)SEG_E) //           ;"H"
#define CHR_HL                  ((u8)CHR_B&~(u8)SEG_D) //          ;"h"
#define CHR_I                   ((u8)SEG_E|(u8)SEG_F) //           ;"I"
#define CHR_IL                  ((u8)SEG_E)    //                  ;"i"
#define CHR_J                   ((u8)CHR_D&~(u8)SEG_G) //          ;"J"
#define CHR_K                   ((u8)CHR_I|(u8)SEG_G)//            ;"K"
#define CHR_L                   ((u8)CHR_I|(u8)SEG_D)//            ;"L"
#define CHR_O                   ((u8)CHR_D&~(u8)SEG_B)//           ;"O"
#define CHR_P                   ((u8)CHR_F|(u8)SEG_B)//            ;"P"
#define CHR_R                   ((u8)SEG_E|(u8)SEG_G)//            ;"r"
#define CHR_S                   ((u8)NUM_5)      //                ;"S"
#define CHR_T                   ((u8)CHR_E&~(u8)SEG_A)  //         ;"t"
#define CHR_U                   ((u8)NUM_0&~(u8)SEG_A)  //         ;"U"
#define CHR_UL                  ((u8)CHR_O&~(u8)SEG_G)  //         ;"u"
#define CHR_Y                   ((u8)NUM_4|(u8)SEG_D)  //          ;"y"
#define CHR_V                   ((u8)CHR_Y&~(u8)SEG_C)  //         ;"v"
#define CHR_N                   ((u8)NUM_0&~(u8)SEG_D)  //         ;"N"
#define CHR_NL                  ((u8)CHR_O&~(u8)SEG_D)  //         ;"n"
#define CHR_M                   ((u8)CHR_NL|(u8)SEG_A)  //         ;"M"
#define CHR_NUL                 ((u8)NUM_0&~(u8)CHR_UL)   //       ;"^"
                              
#define CHR_LEFT                ((u8)NUM_0&~(u8)NUM_1) //          ;"["
#define CHR_RIGHT               ((u8)NUM_3&~(u8)SEG_G)  //         ;"]" 
//---------------------------------------------------------------- 
// work mode  define
//----------------------------------------------------------------
#define default_timer	   ((u8)0) 
#define boost_time	   ((u16)300) 		//unit is second
#define default_level	   ((u8)5)
#define boost_is_1         ((u8)0x01)
#define boost_is_2	   ((u8)0x02)
#define boost_is_3	   ((u8)0x04)
#define boost_is_4	   ((u8)0x08) 
#define boost_is_5	   ((u8)0x10) 
// Communication deal step list  
#define comm_1_s	((u8)0x10) 	//send
#define comm_1_g      	((u8)0x18) 	//got
#define comm_2_s	((u8)0x20) 
#define comm_2_g      	((u8)0x28) 
#define comm_3_s	((u8)0x30) 
#define comm_3_g      	((u8)0x38) 
#define comm_4_s	((u8)0x40) 
#define comm_4_g      	((u8)0x48)  
#define comm_5_s	((u8)0x50) 
#define comm_5_g      	((u8)0x58)

#define Add_1   	((u8)0x20)
#define Add_2   	((u8)0x40)
#define Add_3   	((u8)0x60)
#define Add_4   	((u8)0x80)
#define Add_5   	((u8)0xA0)
//****************************************************************
//command define
#define	DATA_PAN_OK	 ((u8)0x56)		//pan on mark
#define	DATA_PAN_NO	 ((u8)0x65)		//no pan mark   
#define DATA_TURN_ON	 ((u8)0x10)		//turn on mark
#define DATA_TURN_OFF	 ((u8)0x00)		//turn off mark     
#define DATA_PULSE	 ((u8)0x05)		//turn off mark                                         
//****************************************************************
//   global variable define
//****************************************************************
#define CON_PWM_6us	((u8)208)	//(256-208)*0.125 
#define CON_PWM_7us	((u8)200)	//(256-200)*0.125 
#define CON_PWM_8us	((u8)192)	//(256-192)*0.125 
#define CON_PWM_9us	((u8)184)	//(256-184)*0.125 
#define CON_PWM_10us	((u8)176)	//(256-176)*0.125 
#define CON_PWM_11us	((u8)168)	//(256-168)*0.125 
#define CON_PWM_11_5us	((u8)164)	//(256-164)*0.125 
#define CON_PWM_12us	((u8)160)	//(256-160)*0.125 
#define CON_PWM_13us	((u8)152)	//(256-152)*0.125 
#define CON_PWM_14us	((u8)144)	//(256-144)*0.125 
#define CON_PWM_14_5us	((u8)140)	//(256-140)*0.125 
#define CON_PWM_15us	((u8)136)	//(256-136)*0.125 
#define CON_PWM_16us	((u8)128)	//(256-128)*0.125 
#define CON_PWM_16_5us	((u8)124)	//(256-124)*0.125
#define CON_PWM_17us	((u8)120)	//(256-120)*0.125 
#define CON_PWM_18us	((u8)112)	//(256-112)*0.125 
#define CON_PWM_19us	((u8)104)	//(256-104)*0.125 
#define CON_PWM_20us	((u8)96)	//(256-96)*0.125 
#define CON_PWM_20_5us	((u8)92)	//(256-96)*0.125 
#define CON_PWM_21us	((u8)88)	//(256-88)*0.125 
#define CON_PWM_22us	((u8)80)	//(256-80)*0.125 
#define CON_PWM_23us	((u8)72)	//(256-72)*0.125 
#define CON_PWM_24us	((u8)64)	//(256-64)*0.125 
#define CON_PWM_25us	((u8)56)	//(256-56)*0.125 
#define CON_PWM_26us	((u8)48)	//(256-48)*0.125 
#define CON_PWM_27us	((u8)40)	//(256-40)*0.125 
#define CON_PWM_28us	((u8)32)	//(256-32)*0.125 
#define CON_PWM_29us	((u8)24)	//(256-24)*0.125 
#define CON_PWM_30us	((u8)16)	//(256-16)*0.125 
#define CON_PWM_31us	((u8)8)		//(256-8)*0.125 
#define CON_PWM_32us	((u8)0)		//(256-0)*0.125 

#define CON_0125	((u8) 1)	//0.125us
#define CON_0250	((u8) 2)	
#define CON_0375	((u8) 3)	
#define CON_0500	((u8) 4)	
#define CON_0625	((u8) 5)	
#define CON_0750	((u8) 6)	
#define CON_0875	((u8) 7)	
#define CON_1000	((u8) 8)	
#define CON_1125	((u8) 9)	//1.125us
#define CON_1250	((u8)10)	
#define CON_1375	((u8)11)	
#define CON_1500	((u8)12)	
#define CON_1625	((u8)13)	
#define CON_1750	((u8)14)	
#define CON_1875	((u8)15)
#define CON_2000	((u8)16)	
#define CON_2125	((u8)17)	//2.125us
#define CON_2250	((u8)18)	
#define CON_2375	((u8)19)	
#define CON_2500	((u8)20)	
#define CON_2625	((u8)21)	
#define CON_2750	((u8)22)	
#define CON_2875	((u8)23)
#define CON_3000	((u8)24)	
#define CON_3125	((u8)25)	//3.125us
#define CON_3250	((u8)26)	
#define CON_3375	((u8)27)	
#define CON_3500	((u8)28)	
#define CON_3625	((u8)29)	
#define CON_3750	((u8)30)	
#define CON_3875	((u8)31)
#define CON_4000	((u8)32)	
#define CON_4125	((u8)33)	//4.125us
#define CON_4250	((u8)34)	
#define CON_4375	((u8)35)	
#define CON_4500	((u8)36)	
#define CON_4625	((u8)37)	
#define CON_4750	((u8)38)	
#define CON_4875	((u8)39)
#define CON_5000	((u8)40)	
#define CON_5125	((u8)41)	//5.125us
#define CON_5250	((u8)42)	
#define CON_5375	((u8)43)	
#define CON_5500	((u8)44)	
#define CON_5625	((u8)45)	
#define CON_5750	((u8)46)	
#define CON_5875	((u8)47)
#define CON_6000	((u8)48)	
                             
#define CON_NO_CUR1_MIN	((u8)0x18)
#define CON_NO_CUR1_LOW	((u8)0x20)      
#define CON_NO_CUR1_MID	((u8)0x38)
#define CON_NO_CUR1_HIG	((u8)0x48)

#define CON_NO_CUR2_MIN	((u8)0x18)
#define CON_NO_CUR2_LOW	((u8)0x20)      
#define CON_NO_CUR2_MID	((u8)0x38)
#define CON_NO_CUR2_HIG	((u8)0x48)

#define CON_NO_CUR3_MIN	((u8)0x18)
#define CON_NO_CUR3_LOW	((u8)0x20)      
#define CON_NO_CUR3_MID	((u8)0x50)
#define CON_NO_CUR3_HIG	((u8)0x70)

#define CON_CUR_4a0	((u8)0x28) 		
#define CON_CUR_4a5	((u8)0x30) 	
#define CON_CUR_5a0	((u8)0x38)	 	 	 
#define CON_CUR_5a5	((u8)0x40)	 	 
#define CON_CUR_6a0	((u8)0x48)	 	 
#define CON_CUR_6a5	((u8)0x50)		
#define CON_CUR_7a0	((u8)0x58)		
#define CON_CUR_7a5	((u8)0x60)		
#define CON_CUR_8a0	((u8)0x68)		
#define CON_CUR_8a5	((u8)0x70)	
#define CON_CUR_9a0	((u8)0x76)	
#define CON_CUR_9a5	((u8)0x7B)
#define CON_CUR_10a0	((u8)0x80)
#define CON_CUR_10a5	((u8)0x85)


#define CON_VOL_130V    ((u8)0x56)    
#define CON_VOL_140V    ((u8)0x5C)
#define CON_VOL_150V    ((u8)0x63)
#define CON_VOL_160V    ((u8)0x69)
#define CON_VOL_170V    ((u8)0x6F)
#define CON_VOL_180V    ((u8)0x76)
#define CON_VOL_190V    ((u8)0x7C)
#define CON_VOL_200V    ((u8)0x82)
#define CON_VOL_210V    ((u8)0x8A)
#define CON_VOL_215V	((u8)0x8D)
#define CON_VOL_220V    ((u8)0x90)
#define CON_VOL_225V	((u8)0x94)
#define CON_VOL_230V    ((u8)0x97)
#define CON_VOL_235V	((u8)0x9B)
#define CON_VOL_240V    ((u8)0x9E)
#define CON_VOL_250V    ((u8)0xA4)
#define CON_VOL_260V    ((u8)0xAB)
#define CON_VOL_270V	((u8)0xB2)
#define CON_VOL_280V	((u8)0xB7)
#define CON_VOL_290V	((u8)0xC0)
#define CON_VOL_300V	((u8)0xC7)

//download resistor ->15k  igbt ntc 3990 minjie
#define CON_TIGBT_45    ((u8)0xC5)
#define CON_TIGBT_50    ((u8)0xCD)
#define CON_TIGBT_55    ((u8)0xD4)
#define CON_TIGBT_60    ((u8)0xDA)
#define CON_TIGBT_65    ((u8)0xE0)
#define CON_TIGBT_70    ((u8)0xE4)		
#define CON_TIGBT_75    ((u8)0xE8)
#define CON_TIGBT_80    ((u8)0xEB)
#define CON_TIGBT_85    ((u8)0xEE)
#define CON_TIGBT_90    ((u8)0xF0)
#define CON_TIGBT_95    ((u8)0xF2)
#define CON_TIGBT_98    ((u8)0xF3)
#define CON_TIGBT_100	((u8)0xF4)   
#define CON_TIGBT_105	((u8)0xF5)    	
#define CON_TIGBT_110   ((u8)0xF6)    	
#define CON_TIGBT_115   ((u8)0xF7)    
#define CON_TIGBT_120   ((u8)0xF8)
#define CON_TIGBT_125   ((u8)0xF9)
#define CON_TIGBT_300   ((u8)0xF0)    

 //download resistor ->15k
#define CON_TMAIN_45     ((u8)0x41)		//remain H
#define CON_TMAIN_50     ((u8)0x4B)
#define CON_TMAIN_55     ((u8)0x55)
#define CON_TMAIN_80     ((u8)0x8C)
#define CON_TMAIN_90     ((u8)0x9F)
#define CON_TMAIN_100    ((u8)0xB0)
#define CON_TMAIN_110    ((u8)0xBF)
#define CON_TMAIN_120    ((u8)0xCB)   
#define CON_TMAIN_130    ((u8)0xD7)  	
#define CON_TMAIN_140    ((u8)0xDD)
#define CON_TMAIN_150    ((u8)0xE4)		
#define CON_TMAIN_160    ((u8)0xE9)
#define CON_TMAIN_170    ((u8)0xED)		
#define CON_TMAIN_180    ((u8)0xF1) 
#define CON_TMAIN_190    ((u8)0xF3)
#define CON_TMAIN_200    ((u8)0xF5)
#define CON_TMAIN_210    ((u8)0xF7)
#define CON_TMAIN_220    ((u8)0xF8) 

#define CON_NTC_SHORT    ((u8)0xFA)    		
#define CON_NTC_OPEN     ((u8)0x04)
/* Private macro -------------------------------------------------------------*/   
/* Private variables ---------------------------------------------------------*/   
/* Private function prototypes -----------------------------------------------*/   
/* Private functions ---------------------------------------------------------*/   
/* Public functions ----------------------------------------------------------*/   
                                                                                   
