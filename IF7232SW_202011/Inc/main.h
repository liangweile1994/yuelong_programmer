/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32g0xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
	
	
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

typedef enum
{
  TRUE = 0,
  FALSE = !TRUE
}eResult;

typedef enum
{
  T_COIL = 0,
  T_IGBT = 1
}Zone_TempTypeSelect;

typedef enum
{
	TroubleFree,
  GearExceeded,
	HighVoltageInput,
	LowVoltageInput,
  IGBT_HeatOnZone1,
	IGBT_HeatOnZone2,
	IGBT_HeatOnZone3,
	IGBT_HeatOnZone4,
	Coil_HeatOnZone1,
	Coil_HeatOnZone2,
	Coil_HeatOnZone3,
	Coil_HeatOnZone4,
	ShortCircuit_IGBT_OnZone1,
	ShortCircuit_IGBT_OnZone2,
	ShortCircuit_IGBT_OnZone3,
	ShortCircuit_IGBT_OnZone4,
	ShortCircuit_Coil_OnZone1,
	ShortCircuit_Coil_OnZone2,
	ShortCircuit_Coil_OnZone3,
	ShortCircuit_Coil_OnZone4,
	OpenCircuit_IGBT_OnZone1,
	OpenCircuit_IGBT_OnZone2,
	OpenCircuit_IGBT_OnZone3,
	OpenCircuit_IGBT_OnZone4,
}ErrorCodeDef;

/********* ZONE�¶Ⱥʹ������ṹ�嶨�� *********/
typedef struct struct_TempAndErr
{
	int8_t     ErrCode;					//��ʱ������
	uint16_t   CoilTemp;				//¯ͷ�ر�ʱ��
	uint16_t   IgbtTemp;			  //boost��λ����ʱ��
	uint8_t    OverTempTime_Coil; //coil����ʱ��
	uint8_t    OverTempTime_Igbt; //igbt����ʱ��
}Z_TempErrDef, *pZ_TempErrDef;

/********* ʱ������ṹ�嶨�� *********/
struct str_Time
{
	int8_t     Minute;					//��ʱ������
	int8_t     Second;					//��ʱ����
	uint8_t    igbt_error_time;	//igbt����ʱ��
	uint8_t    oil_error_time;	//���³���ʱ��
	uint16_t   off_time;				//¯ͷ�ر�ʱ��
	uint16_t   boost_timer;			//boost��λ����ʱ��
};

/******** ��λ�Ͷ�ʱ�������ṹ�嶨�� ********/
typedef struct struct_Gear_Time_Ctrl
{
	uint8_t GrearActive	:	3;		//��λ�����־
	uint8_t Gear				:	5;		//��λ����������ʾ��
	uint8_t RealGear    : 7;		//ʵ�ʵ�λ��������
	uint8_t KeepWarmFlag: 1;		//���±�־
	uint8_t TempGear		:	7;		//��ʱ��λ�����ͣ�
	uint8_t TempDownFlag:	1;		//��ʱ������־
	struct  str_Time Timer ;		//ʱ�������
	uint16_t const *PowerTabel;	//�����б�ָ�룬�����󶨹�������
	
}Gear_Time_CON, *pGear_Time_CON;


/********* ���Ʋ����ṹ�嶨�� *********/
#pragma pack(1) 
typedef struct struct_ctrlMsg
{
	uint8_t   Addr;							//�����ַ
	uint8_t   SetState2;				//���õ�һ��¯��״̬
	uint16_t  SetPower2;				//���õ�һ��¯�Ĺ���
	uint8_t   SetState1;				//���õڶ���¯��״̬
	uint16_t  SetPower1;				//���õڶ���¯�Ĺ���
	uint8_t   ChkSum;						//У���
}MB_CON_PARM, *pMB_CON_PARM;
#pragma pack() 

#pragma pack(1) 

typedef struct struct_MainBoard_Msg
{
	uint16_t  Stove_2nd_State;						//��1��¯��״̬
	uint16_t  Stove_1st_State;						//��2��¯��״̬
	uint16_t  BoardVoltage;								//����ĵ�ѹֵ(AD)
	uint16_t  Board_TEMP;									//�м�Ģ��ͷ��ADֵ
	uint16_t  Stove_2nd_Current;					//���õ�1��¯�ĵ���(AD)
	uint16_t  Stove_2nd_WorkingFreq;			//����Ƶ��
	uint16_t  Stove_2nd_Igbt_Temp;				//IGBT�¶�(AD)
	uint16_t  Stove_2nd_Coil_Temp;				//�����¶�(AD)
	uint16_t  Stove_1st_Current;					//���õ�2��¯�ĵ���(AD)
	uint16_t  Stove_1st_WorkingFreq;			//����Ƶ��
	uint16_t  Stove_1st_Igbt_Temp;				//IGBT�¶�(AD)
	uint16_t  Stove_1st_Coil_Temp;				//�����¶�(AD)
	uint8_t   Address;										//����ĵ�ַ
	uint8_t   ChkSum;											//У���
}MB_RCV_MSG, *pMB_RCV_MSG;
#pragma pack() 

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/***** bitλ�궨��*****/
#define	BIT_0					0
#define	BIT_1					1
#define	BIT_2					2
#define	BIT_3					3
#define	BIT_4					4
#define	BIT_5					5
#define	BIT_6					6
#define	BIT_7					7
#define	BIT_8					8
#define	BIT_9					9
#define	BIT_10				10
#define	BIT_11				11
#define	BIT_12				12
#define	BIT_13				13
#define	BIT_14				14
#define	BIT_15				15

#define	BOOST_GEAR		16

/********** ����ֵ���� ****************/
#define	key_WIFI			1
#define	key_CHFE			2
#define	key_FL				3
#define	key_DEC				4
#define	key_INC				5
#define	key_BOOST			6
#define	key_ON_OFF		7
#define	key_LOCK			8
#define	key_FR				9
#define	key_KW_1			10
#define	key_KW_2			11
#define	key_KW_3			12
#define	key_KW_4			13
#define	key_POWER_SET	14

#define	BUTTON_TIMEOUT				5
#define	BUTTON_GEAR_BZ_TIME		5				  //��λ����������ʱ����5*10��ms
#define	ERROR_BZ_TIME		      25				//�����¼�������ʱ����25*10��ms
#define	SHORT_FLASH_TIME			10				//��˸ʱ��(s)
#define	DEFAULT_TIMER					30				//Ĭ�϶�ʱ30 minute
#define	LONG_PRESS_5S					50				//100ms*50=5000ms
#define	LONG_PRESS_3S					30				//100ms*30=3000ms
#define	LONG_PRESS_2S					20				//100ms*20=2000ms
#define	LONG_PRESS_1S					10				//100ms*10=1000ms
#define	LONG_PRESS_INTERVAL		5					//100ms*5=500ms

/********* ���巵����Ϣ�궨�� ***********/
#define BPhaseErr    	0x0004   					//��λ����
#define BAdcPErr     	0x0008   					//��������
#define BPotExists   	0x0010   					//�й��޹�
#define BOpenFan     	0x0080   					//��������

#define BOpenPor     	0x0100   					//��������
#define PVHighErr    	0x0200   					//��ѹ�����
#define PVLowErr     	0x0400   					//��ѹ�����
#define BHighPAdc    	0x0800   					//�ܵ������
#define HighWenDu    	0x1000   					//�¶ȹ���
#define DogErr       	0x2000   					//���Ź�ʧ��
#define ZreoErr      	0x4000   					//����ʧ��
#define BXianPanErr  	0x8000   					//���̳���

/****** ������붨�壨�������޸ģ� ******/
#define	TROUBLE_FREE                                        0  //�޹���
#define	HIGH_VOLTAGE_INPUT_PROTECT                          1  //��ѹ���뱣��
#define	LOW_VOLTAGE_INPUT_PROTECT                           2  //��ѹ���뱣��
#define	HEAT_PROTECTION_ON_ZONE                             3  //Zone�����壩���±���
#define	HEAT_PROTECTION_OF_IGBT                             4  //IGBT���ȱ���
#define	SHORT_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR           5  //Ģ��ͷ�¶ȴ�������·
#define	OPEN_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR            6  //Ģ��ͷ�¶ȴ�������·
#define	TEMPERATURE_SENSOR_INVALID                          7  //�¶ȴ�����ʧЧ		
#define	SHORT_CIRCUIT_FOR_IGBT_TEMPERATURE_SENSOR           8  //IGBT�¶ȴ�������·
#define	OPEN_CIRCUIT_FOR_IGBT_TEMPERATURE_SENSOR            9  //IGBT�¶ȴ�������·
#define	DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID  10 //��ʾ�������ͨ��ʧ��

/********** �����¶Ⱥ궨�� ****************/
#define CRYSTAL_PLATE_LIMIT_TEMPERATURE    315  //���弫���¶�(����315�棬IGBT���⵽320��)
#define IGBT_HEAT_PROTECTION_TEMPERATURE   105  //IGBT�����¶�(����105��)
#define SHORT_CIRCUIT_FOR_NTC              315  //IGBT��·(С��1�棬AD����0)
#define OPEN_CIRCUIT_FOR_NTC               1    //IGBT��·(����315�棬AD����FF)
/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define FAN_Pin GPIO_PIN_2
#define FAN_GPIO_Port GPIOC
#define RELAY_Pin GPIO_PIN_3
#define RELAY_GPIO_Port GPIOC
#define SM1616_SCL_Pin GPIO_PIN_4
#define SM1616_SCL_GPIO_Port GPIOC
#define SM1616_SDA_Pin GPIO_PIN_5
#define SM1616_SDA_GPIO_Port GPIOC
#define APT8L16_12_SDA_Pin GPIO_PIN_10
#define APT8L16_12_SDA_GPIO_Port GPIOB
#define APT8L16_12_SCL_Pin GPIO_PIN_12
#define APT8L16_12_SCL_GPIO_Port GPIOB
#define WIFI_EN_Pin GPIO_PIN_15
#define WIFI_EN_GPIO_Port GPIOA
#define APT8L16_3_SCL_Pin GPIO_PIN_6
#define APT8L16_3_SCL_GPIO_Port GPIOB
#define APT8L16_3_SDA_Pin GPIO_PIN_7
#define APT8L16_3_SDA_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
