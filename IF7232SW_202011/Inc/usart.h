/**
  ******************************************************************************
  * File Name          : USART.h
  * Description        : This file provides code for the configuration
  *                      of the USART instances.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __usart_H
#define __usart_H
#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

extern UART_HandleTypeDef huart1;
extern UART_HandleTypeDef huart2;
extern UART_HandleTypeDef huart3;

/* USER CODE BEGIN Private defines */
	 
#if defined ( __CC_ARM   )
#pragma anon_unions
#endif
	 
#define MB_RX_BUF_MAX_LEN     27                                 //接收主板信息最大缓存字节数 
	 
extern struct  STRUCT_USARTx_Fram_u8                             //串口数据帧的处理结构体
{
	char  Data_RX_BUF [ MB_RX_BUF_MAX_LEN ];
	
  union {
    __IO uint8_t InfAll;
    struct {
		  __IO uint8_t FramLength       :7;                       // 6:0 
		  __IO uint8_t FramFinishFlag   :1;                       // 7 
	  } InfBit;
  }; 
	
} MainBoard_Fram_Record;	 

/* USER CODE END Private defines */

void MX_USART1_UART_Init(void);
void MX_USART2_UART_Init(void);
void MX_USART3_UART_Init(void);

/* USER CODE BEGIN Prototypes */
extern void USART2_printf( UART_HandleTypeDef *huart, char *Data, ... );
/* USER CODE END Prototypes */

#ifdef __cplusplus
}
#endif
#endif /*__ usart_H */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
