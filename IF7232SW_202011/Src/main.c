/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <string.h>
#include "sm1616_drv.h"
#include "sm1616_dev.h"
#include "apt8l16_12_dev.h"
#include "apt8l16_3_dev.h"
#include "key.h"
#include "display.h"
#include "ntc.h"
#include "power_level_manage.h"
#include "bsp_esp32.h"
#include "iot.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define 	MIN(a,b)					((a) =< (b) ? (a) : (b)) 

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* 上电初始化完成标志 */
uint8_t powerOnInitFinish = 0;
/* 蜂鸣器报错次数 */
uint8_t g_Err_BeepTimes = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

void user_pwm_setvalue(uint16_t value)
{
    TIM_OC_InitTypeDef sConfigOC;
 
    sConfigOC.OCMode = TIM_OCMODE_PWM1;
    sConfigOC.Pulse = value;
    sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
    sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
    HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4);   
}

/*
 * 函数名：timedTransmissionMsgToMainBoard
 * 描述  ：定时传输信息到主板
 * 输入  ：无
 * 返回  : 无
 */
static void timedTransmissionMsgToMainBoard(void)
{
		if(ms200_flag == SET)
		{
				ms200_flag = RESET;
				if( (g_Pause_State == ENABLE)||(g_TurnOnFlag == POWER_OFF) )
				{
						send_BlankMsgToMainBoard();
				}
				else
				{
						send_ControlMsgToMainBoard();
				}
		}
}

/* 等待开机 */
static void waittingPowerOn(void)
{
		while(g_TurnOnFlag == POWER_OFF)
		{
				if(Ms10_bz1 == SET)
				{
						key_Process();
						display();
						Ms10_bz1 = RESET;
				}
				timedTransmissionMsgToMainBoard();
				powerOffDeal();
		}
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
__IO uint16_t tmpw;
  /* USER CODE END 1 */
  

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */
	tmpw = getTemperature(0,COIL_NTC);
//	g_Zone1_GT.Timer.off_time = tmp;
  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM3_Init();
  MX_TIM6_Init();
  MX_USART1_UART_Init();
  MX_USART2_UART_Init();
  MX_USART3_UART_Init();
  MX_TIM15_Init();
  /* USER CODE BEGIN 2 */

//while(1)
//{
//	HAL_GPIO_WritePin(FAN_GPIO_Port, FAN_Pin, GPIO_PIN_SET);
//	HAL_Delay(500);
//	HAL_GPIO_WritePin(FAN_GPIO_Port, FAN_Pin, GPIO_PIN_RESET);
//	HAL_Delay(500);
//}
	sm1616_Brightness_Ctrl();
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4);
	HAL_TIM_PWM_Start(&htim15, TIM_CHANNEL_1);
	HAL_TIM_Base_Start_IT(&htim6);
//	HAL_TIM_Base_Start_IT(&htim3);
	__HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_4, 0);
	__HAL_TIM_SET_COMPARE(&htim15, TIM_CHANNEL_1, 10);

	APT8L16_1_Init(KEY_ALL_ENABLE, KEY_ALL_ENABLE, APT8L16_1_KOR_CONFIG);

	APT8L16_2_Init(KEY_ALL_ENABLE, KEY_ALL_ENABLE, APT8L16_2_KOR_CONFIG);
//	
	APT8L16_3_Init(KEY_ALL_ENABLE, KEY_ALL_ENABLE, APT8L16_3_KOR_CONFIG);
	
	SM1616_I2c_Init();
	sm1616_Brightness_Ctrl();
	
	/* 获取整机功率 */
	defaultPowerSchemeSetting();
	/* 上电立即把功率方案同步到g_IotDownloadData.powerManagement，防止云端下载的iot数据没有功率方案时powerManagement为0而导致重启 */
	g_IotDownloadData.powerManagement = g_TotalPower;    //add on 2020.6.8
	disp_Init();

	zone_Init();

	powerOnInitFinish = 1;
//	while(1)
//	{
//	ESP32_Rst();
//	}
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
//		user_pwm_setvalue(2000);
		
	/* 等待开机 */
	waittingPowerOn();

		get_MainBoard_Message();
		if(Ms10_bz1 == SET)
		{
				powerTabelAllot();
				key_Process();
				Ms10_bz1 = RESET;
		}
		
		if(Ms10_bz3 == SET)
		{
				display();
				Ms10_bz3 = RESET;
		}
		
		if(Ms10_bz9 == SET)
		{
				Ms10_bz9 = RESET;
		}
		
		if(Ms10_bz8 == SET)
		{
				Ms10_bz8 = RESET;
		}
		
		if(secFlag == SET)
		{
				if(g_Pause_State != ENABLE)
				{
						/* 设备运行时间 */
						g_RunningTime++;
						if( (g_Zone1_GT.Gear+g_Zone2_GT.Gear+g_Zone3_GT.Gear+g_Zone4_GT.Gear+g_ZoneLeft_GT.Gear+g_ZoneRight_GT.Gear) == 0)//档位为0不降功率
						{
								/* 空闲时间达到设定值，执行关机操作 */
								if(g_DevIdleTimer++ >= DEV_IDLE_TIME)
								{
									Beep_On(30);
									HAL_Delay(300);
									g_TurnOnFlag = POWER_OFF;
								}
								g_RunningTime = 0;
								idleFlag = SET;
						}
						else
						{
								idleFlag = RESET;
								g_DevIdleTimer = 0;
								generalPowerReduction();//降低功率
								/* 保温功能 */
								keepWarmFunction();
								/* BBQ功能 */
								BBQ_Function();
						}
						/* 定时关闭炉头 */
						zong_Timing_Shutdown_Deal();
				}
				/* 温度保护功能 */
//				temperatureDetectionProcess();
				/* 蜂鸣器报错次数 */
				if(g_Err_BeepTimes)
				{
					g_Err_BeepTimes--;
					Beep_On(ERROR_BZ_TIME);
				}
				secFlag	= RESET;
		}
		/* 定时传输信息到主板 */
		timedTransmissionMsgToMainBoard();
		
/*********************处理iot服务器的数据********************************/
	if(strEsp32_Fram_Record .InfBit .FramFinishFlag == 1)
		{
			strEsp32_Fram_Record .Data_RX_BUF [ strEsp32_Fram_Record .InfBit .FramLength ] = '\0';
			macPC_Usart("UART2 Meg: %s\r\n", strEsp32_Fram_Record.Data_RX_BUF);
			
//			memery = mallco_dev.perused();//查看使用率
//			printf("memory: %d\r\n",memery);
			ESP32_RevHandle();
			strEsp32_Fram_Record .InfBit .FramLength=0;
			
			__HAL_UART_ENABLE_IT(&huart2,UART_IT_IDLE);
			__HAL_UART_ENABLE_IT(&huart2,UART_IT_RXNE);
			
			strEsp32_Fram_Record .InfBit .FramLength = 0;
			strEsp32_Fram_Record .InfBit .FramFinishFlag = 0;
		}

		ESP32_AT_Cmd_Handle();
		
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage 
  */
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSIDiv = RCC_HSI_DIV1;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = RCC_PLLM_DIV1;
  RCC_OscInitStruct.PLL.PLLN = 8;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the peripherals clocks 
  */
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_USART2;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK1;
  PeriphClkInit.Usart2ClockSelection = RCC_USART2CLKSOURCE_PCLK1;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */



/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
