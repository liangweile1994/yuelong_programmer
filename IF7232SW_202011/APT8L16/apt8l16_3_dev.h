#ifndef  _APT8L16_3_DEV_H
#define  _APT8L16_3_DEV_H

#include "main.h"

#define APT8L16_3_DevAddr	(0x56 << 1)   //3号apt8l16的地址

/* APT8L16寄存器地址宏定义 */
#define KOR1						0x00
#define KOR2						0x01
#define KOR3						0x02
#define KOR4						0x03
#define KOR5						0x04
#define KOR6						0x05
#define KOR7						0x06
#define KOR8						0x07
#define KOR9						0x08
#define KOR10						0x09
#define KOR11						0x0A
#define KOR12						0x0B
#define KOR13						0x0C
#define KOR14						0x0D
#define KOR15						0x0E
#define KOR16						0x0F
#define K0_CON					0x18
#define K1_CON					0x19
#define K0_IN						0x1C
#define K1_IN						0x1D
#define K0_OUT					0x1A
#define K1_OUT					0x1B
#define GSR							0x20
#define MCON						0x21
#define BUR							0x22
#define KDR0						0x23
#define KDR1						0x24
#define DMR0						0x2D
#define DMR1						0x2A

#define KVR0						0x34
#define KVR1						0x35

/* APT8L16寄存器数值宏定义 */
#define GSR_VAL  		  0x03			//0x20 灵敏度（可调）
#define MCON_VAL 		  0x05			//0x21 工作模式（可调）
#define FILTER0_VAL 	0xF4			//0x22 基线更新寄存器（固定值）
#define K0_ENB_VAL 	  0x00			//0x23 K0触摸禁能（可调，置0为使能，置1为禁止）
#define K1_ENB_VAL 	  0x00			//0x24 K1触摸禁能（可调，置0为使能，置1为禁止）
#define SENSE_CON_VAL	0x00			//0x25 （固定值）
#define SENSE_S_VAL	  0x08			//0x26 （固定值）
#define GSR_K07_VAL		0x02			//0x27 （固定值）
#define GSR_K17_VAL		0x02			//0x28 （固定值）
#define	REF_UTH_VAL		0x10			//0x29 （固定值）
#define KEY_ATH_VAL		0x10			//0x2A （固定值）
#define DSMIT_VAL		  0x04			//0x2B （固定值）
#define MCONH_VAL		  0x00			//0x2C （固定值）
#define FILTER1_VAL		0x00			//0x2D （固定值）

#define KEY_ALL_ENABLE	0x00
#define KEY_ALL_DISABLE	0xFF
#define K00							(uint8_t)(~(1<<BIT_0))
#define K01							(uint8_t)(~(1<<BIT_1))
#define K02							(uint8_t)(~(1<<BIT_2))
#define K03							(uint8_t)(~(1<<BIT_3))
#define K04							(uint8_t)(~(1<<BIT_4))
#define K05							(uint8_t)(~(1<<BIT_5))
#define K06							(uint8_t)(~(1<<BIT_6))
#define K07							(uint8_t)(~(1<<BIT_7))
#define K10							(uint8_t)(~(1<<BIT_0))
#define K11							(uint8_t)(~(1<<BIT_1))
#define K12							(uint8_t)(~(1<<BIT_2))
#define K13							(uint8_t)(~(1<<BIT_3))
#define K14							(uint8_t)(~(1<<BIT_4))
#define K15							(uint8_t)(~(1<<BIT_5))
#define K16							(uint8_t)(~(1<<BIT_6))
#define K17							(uint8_t)(~(1<<BIT_7))

#define SYSCON					0x3A

/************* APT8L16_3的键值 *******************/

#define VALUE_3S4				(uint16_t)(1<<BIT_1)
#define VALUE_3S5				(uint16_t)(1<<BIT_2)
#define VALUE_3S6				(uint16_t)(1<<BIT_3)
#define VALUE_3S7				(uint16_t)(1<<BIT_4)
#define VALUE_3S8				(uint16_t)(1<<BIT_7)
#define VALUE_3S9				(uint16_t)(1<<BIT_6)

#define VALUE_FR				(uint16_t)(1<<BIT_0)

#define VALUE_4S1				(uint16_t)(1<<BIT_5)
#define VALUE_4S2				(uint16_t)(1<<BIT_8)
#define VALUE_4S3				(uint16_t)(1<<BIT_9)
#define VALUE_4S4				(uint16_t)(1<<BIT_10)
#define VALUE_4S5				(uint16_t)(1<<BIT_11)
#define VALUE_4S6				(uint16_t)(1<<BIT_12)
#define VALUE_4S7				(uint16_t)(1<<BIT_13)
#define VALUE_4S8				(uint16_t)(1<<BIT_14)
#define VALUE_4S9				(uint16_t)(1<<BIT_15)

/************* ZONE3虚拟档位按键值 ***********************/
#define Z3_S6						VALUE_3S4
#define Z3_S7						(VALUE_3S4|VALUE_3S5)
#define Z3_S8						VALUE_3S5
#define Z3_S9						(VALUE_3S5|VALUE_3S6)
#define Z3_S10					VALUE_3S6
#define Z3_S11					(VALUE_3S6|VALUE_3S7)
#define Z3_S12					VALUE_3S7
#define Z3_S13					(VALUE_3S7|VALUE_3S8)
#define Z3_S14					VALUE_3S8
#define Z3_S15					(VALUE_3S8|VALUE_3S9)
#define Z3_BOOST				VALUE_3S9


/************* ZONE4虚拟档位按键值 ***********************/
#define Z4_S0						VALUE_4S1
#define Z4_S1						(VALUE_4S1|VALUE_4S2)
#define Z4_S2						VALUE_4S2
#define Z4_S3						(VALUE_4S2|VALUE_4S3)
#define Z4_S4						VALUE_4S3
#define Z4_S5						(VALUE_4S3|VALUE_4S4)
#define Z4_S6						VALUE_4S4
#define Z4_S7						(VALUE_4S4|VALUE_4S5)
#define Z4_S8						VALUE_4S5
#define Z4_S9						(VALUE_4S5|VALUE_4S6)
#define Z4_S10					VALUE_4S6
#define Z4_S11					(VALUE_4S6|VALUE_4S7)
#define Z4_S12					VALUE_4S7
#define Z4_S13					(VALUE_4S7|VALUE_4S8)
#define Z4_S14					VALUE_4S8
#define Z4_S15					(VALUE_4S8|VALUE_4S9)
#define Z4_BOOST				VALUE_4S9





extern  const uint8_t APT8L16_3_KOR_CONFIG[16];
void APT8L16_3_Init(uint8_t K0_Enable_Cfg, uint8_t K1_Enable_Cfg, const uint8_t *KOR_Cfg);
uint16_t APT8L16_3_key_Scan(void);
#endif
