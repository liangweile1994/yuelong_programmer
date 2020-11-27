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

/********* ZONE温度和错误代码结构体定义 *********/
typedef struct struct_TempAndErr
{
	int8_t     ErrCode;					//定时器分钟
	uint16_t   CoilTemp;				//炉头关闭时间
	uint16_t   IgbtTemp;			  //boost档位持续时间
	uint8_t    OverTempTime_Coil; //coil超温时间
	uint8_t    OverTempTime_Igbt; //igbt超温时间
}Z_TempErrDef, *pZ_TempErrDef;

/********* 时间参数结构体定义 *********/
struct str_Time
{
	int8_t     Minute;					//定时器分钟
	int8_t     Second;					//定时器秒
	uint8_t    igbt_error_time;	//igbt出错时间
	uint8_t    oil_error_time;	//油温超温时间
	uint16_t   off_time;				//炉头关闭时间
	uint16_t   boost_timer;			//boost档位持续时间
};

/******** 档位和定时控制器结构体定义 ********/
typedef struct struct_Gear_Time_Ctrl
{
	uint8_t GrearActive	:	3;		//档位激活标志
	uint8_t Gear				:	5;		//档位控制器（显示）
	uint8_t RealGear    : 7;		//实际档位（调功）
	uint8_t KeepWarmFlag: 1;		//保温标志
	uint8_t TempGear		:	7;		//临时档位（煮油）
	uint8_t TempDownFlag:	1;		//临时降档标志
	struct  str_Time Timer ;		//时间控制器
	uint16_t const *PowerTabel;	//功率列表指针，用来绑定功率数组
	
}Gear_Time_CON, *pGear_Time_CON;


/********* 控制参数结构体定义 *********/
#pragma pack(1) 
typedef struct struct_ctrlMsg
{
	uint8_t   Addr;							//主板地址
	uint8_t   SetState2;				//设置第一个炉的状态
	uint16_t  SetPower2;				//设置第一个炉的功率
	uint8_t   SetState1;				//设置第二个炉的状态
	uint16_t  SetPower1;				//设置第二个炉的功率
	uint8_t   ChkSum;						//校验和
}MB_CON_PARM, *pMB_CON_PARM;
#pragma pack() 

#pragma pack(1) 

typedef struct struct_MainBoard_Msg
{
	uint16_t  Stove_2nd_State;						//第1个炉的状态
	uint16_t  Stove_1st_State;						//第2个炉的状态
	uint16_t  BoardVoltage;								//主板的电压值(AD)
	uint16_t  Board_TEMP;									//中间蘑菇头的AD值
	uint16_t  Stove_2nd_Current;					//设置第1个炉的电流(AD)
	uint16_t  Stove_2nd_WorkingFreq;			//工作频率
	uint16_t  Stove_2nd_Igbt_Temp;				//IGBT温度(AD)
	uint16_t  Stove_2nd_Coil_Temp;				//线盘温度(AD)
	uint16_t  Stove_1st_Current;					//设置第2个炉的电流(AD)
	uint16_t  Stove_1st_WorkingFreq;			//工作频率
	uint16_t  Stove_1st_Igbt_Temp;				//IGBT温度(AD)
	uint16_t  Stove_1st_Coil_Temp;				//线盘温度(AD)
	uint8_t   Address;										//主板的地址
	uint8_t   ChkSum;											//校验和
}MB_RCV_MSG, *pMB_RCV_MSG;
#pragma pack() 

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/***** bit位宏定义*****/
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

/********** 按键值定义 ****************/
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
#define	BUTTON_GEAR_BZ_TIME		5				  //档位按键蜂鸣器时长（5*10）ms
#define	ERROR_BZ_TIME		      25				//错误事件蜂鸣器时长（25*10）ms
#define	SHORT_FLASH_TIME			10				//闪烁时长(s)
#define	DEFAULT_TIMER					30				//默认定时30 minute
#define	LONG_PRESS_5S					50				//100ms*50=5000ms
#define	LONG_PRESS_3S					30				//100ms*30=3000ms
#define	LONG_PRESS_2S					20				//100ms*20=2000ms
#define	LONG_PRESS_1S					10				//100ms*10=1000ms
#define	LONG_PRESS_INTERVAL		5					//100ms*5=500ms

/********* 主板返回信息宏定义 ***********/
#define BPhaseErr    	0x0004   					//相位出错
#define BAdcPErr     	0x0008   					//电流出错
#define BPotExists   	0x0010   					//有锅无锅
#define BOpenFan     	0x0080   					//开启风扇

#define BOpenPor     	0x0100   					//开启能量
#define PVHighErr    	0x0200   					//电压高溢出
#define PVLowErr     	0x0400   					//电压低溢出
#define BHighPAdc    	0x0800   					//总电流溢出
#define HighWenDu    	0x1000   					//温度过高
#define DogErr       	0x2000   					//看门狗失败
#define ZreoErr      	0x4000   					//过零失败
#define BXianPanErr  	0x8000   					//线盘出差

/****** 错误代码定义（不可以修改） ******/
#define	TROUBLE_FREE                                        0  //无故障
#define	HIGH_VOLTAGE_INPUT_PROTECT                          1  //高压输入保护
#define	LOW_VOLTAGE_INPUT_PROTECT                           2  //低压输入保护
#define	HEAT_PROTECTION_ON_ZONE                             3  //Zone（晶板）高温保护
#define	HEAT_PROTECTION_OF_IGBT                             4  //IGBT过热保护
#define	SHORT_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR           5  //蘑菇头温度传感器短路
#define	OPEN_CIRCUIT_FOR_COIL_TEMPERATURE_SENSOR            6  //蘑菇头温度传感器开路
#define	TEMPERATURE_SENSOR_INVALID                          7  //温度传感器失效		
#define	SHORT_CIRCUIT_FOR_IGBT_TEMPERATURE_SENSOR           8  //IGBT温度传感器短路
#define	OPEN_CIRCUIT_FOR_IGBT_TEMPERATURE_SENSOR            9  //IGBT温度传感器开路
#define	DISPALY_BOARD_AND_MAIN_BOARD_COMMUNICATION_INVALID  10 //显示板和主板通信失败

/********** 极限温度宏定义 ****************/
#define CRYSTAL_PLATE_LIMIT_TEMPERATURE    315  //晶板极限温度(大于315℃，IGBT最大测到320℃)
#define IGBT_HEAT_PROTECTION_TEMPERATURE   105  //IGBT保护温度(大于105℃)
#define SHORT_CIRCUIT_FOR_NTC              315  //IGBT短路(小于1℃，AD靠近0)
#define OPEN_CIRCUIT_FOR_NTC               1    //IGBT开路(大于315℃，AD靠近FF)
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
