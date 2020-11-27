
#include "iot.h"
#include "embedded_flash.h"
#include "bsp_esp32.h"
#include "power_level_manage.h"
#include "stm32g0xx.h" 
#include <stdio.h>  
#include <string.h>  
#include <stdbool.h>
#include <stdlib.h>
#include "malloc.h"
#include "key.h"
#include "ntc.h"

/****** 热检测温度宏定义 ********/
#define HOT_DETECT_TEMPERATURE  50

/*************** 本地变量 *************************/
strCloudDataUploadTypeDef   g_IotUploadData     = {0};
strCloudDataDownloadTypeDef g_IotDownloadData   = {0};
ErrorStatus                 g_HttpWriteRequestResult;

/*************** 外部变量 *************************/
extern MB_RCV_MSG g_1st_MainBoard_Data, g_2nd_MainBoard_Data;
extern void beep_Button(uint8_t ms);


/*
 * 函数名：loadHttpData
 * 描述  ：加载要上传的IOT数据
 * 输入  ：无
 * 返回  : 无
 * 调用  ：被 httpUpload_JsonFormat 调用
 */
void loadHttpData(void)
{
	/* 允许远程控制一直开启 */
	g_IotUploadData.remoteCtrValid = 1;
	/* Zone 1 active or inactive */
	g_IotUploadData.onOffStatusZ1 = g_Zone1_GT.Gear?1:0;
	/* Zone 1 pan detection */
	g_IotUploadData.panStatusZ1 = (g_1st_MainBoard_Data.Stove_1st_State & BPotExists)?1:0;
	/* Zone 1 hot detection */
	g_IotUploadData.hotStatusZ1 = (g_Zone1_TE.CoilTemp >= HOT_DETECT_TEMPERATURE)?1:0;
	/* Zone 1 combination mode */
	g_IotUploadData.combiModeZ1 = (zoneLeft_State == ENABLE)?1:0;
	/* Z1 hob function */
	if(g_Zone1_GT.KeepWarmFlag)
	{
		/* 保温 */
		g_IotUploadData.prCodeZ1 = 1;
	}
	else if(g_Pause_State == 1)
	{
		/* 暂停 */
		g_IotUploadData.prCodeZ1 = 5;
	}
	else
	{
		g_IotUploadData.prCodeZ1 = 0;
	}
	/* Zone 1 cooking Phase 固定上传数据0 */
		g_IotUploadData.prPhaseZ1 = 0;
	/* Zone1 功率档位 */
	g_IotUploadData.powerZ1 = g_Zone1_GT.Gear;
	/* Hob1 线盘（蘑菇头）温度 */
	g_IotUploadData.tempZ1 = g_Zone1_TE.CoilTemp;
	/* Zone 1 recoverable error codes */
	g_IotUploadData.errorZ1 = g_Zone1_TE.ErrCode;
	/* Zone 1 remaining time in hours */
	g_IotUploadData.remainingTimeHHZ1 = g_Zone1_GT.Timer.Minute/60;
	/* Zone 1 remaining time in minutes */
	g_IotUploadData.remainingTimeMMZ1 =g_Zone1_GT.Timer.Minute%60;
	
	/* Zone 2 active or inactive */
	g_IotUploadData.onOffStatusZ2 = g_Zone2_GT.Gear?1:0;
	/* Zone 2 pan detection */
	g_IotUploadData.panStatusZ2 = (g_1st_MainBoard_Data.Stove_2nd_State & BPotExists)?1:0;
	/* Zone 2 hot detection */
	g_IotUploadData.hotStatusZ2 = (g_Zone2_TE.CoilTemp >= HOT_DETECT_TEMPERATURE)?1:0;
	/* Zone 2 combination mode */
	g_IotUploadData.combiModeZ2 = (zoneLeft_State == ENABLE)?1:0;
	/* Z2 hob function */
	if(g_Zone2_GT.KeepWarmFlag)
	{
		/* 保温 */
		g_IotUploadData.prCodeZ2 = 1;
	}
	else if(g_Pause_State == 1)
	{
		/* 暂停 */
		g_IotUploadData.prCodeZ2 = 5;
	}
	else
	{
		g_IotUploadData.prCodeZ2 = 0;
	}
	/* Zone 2 cooking Phase 固定上传数据0 */
		g_IotUploadData.prPhaseZ2 = 0;
	/* Zone2 功率档位 */
	g_IotUploadData.powerZ2 = g_Zone2_GT.Gear;
	/* Hob2 线盘（蘑菇头）温度 */
	g_IotUploadData.tempZ2 = g_Zone2_TE.CoilTemp;
	/* Zone 2 recoverable error codes */
	g_IotUploadData.errorZ2 = g_Zone2_TE.ErrCode;
	/* Zone 2 remaining time in hours */
	g_IotUploadData.remainingTimeHHZ2 = g_Zone2_GT.Timer.Minute/60;
	/* Zone 2 remaining time in minutes */
	g_IotUploadData.remainingTimeMMZ2 = g_Zone2_GT.Timer.Minute%60;
	
	/* Zone 3 active or inactive */
	g_IotUploadData.onOffStatusZ3 = g_Zone3_GT.Gear?1:0;
	/* Zone 3 pan detection */
	g_IotUploadData.panStatusZ3 = (g_2nd_MainBoard_Data.Stove_1st_State & BPotExists)?1:0;
	/* Zone 3 hot detection */
	g_IotUploadData.hotStatusZ3 = (g_Zone3_TE.CoilTemp >= HOT_DETECT_TEMPERATURE)?1:0;
	/* Zone 3 combination mode */
	g_IotUploadData.combiModeZ3 = (zoneRight_State == ENABLE)?1:0;
	/* Z3 hob function */
	if(g_Zone3_GT.KeepWarmFlag)
	{
		/* 保温 */
		g_IotUploadData.prCodeZ3 = 1;
	}
	else if(g_Pause_State == 1)
	{
		/* 暂停 */
		g_IotUploadData.prCodeZ3 = 5;
	}
	else
	{
		g_IotUploadData.prCodeZ3 = 0;
	}
	/* Zone 3 cooking Phase 固定上传数据0 */
		g_IotUploadData.prPhaseZ3 = 0;
	/* Zone3 功率档位 */
	g_IotUploadData.powerZ3 = g_Zone3_GT.Gear;
	/* Hob3 线盘（蘑菇头）温度 */
	g_IotUploadData.tempZ3 = g_Zone3_TE.CoilTemp;
	/* Zone 3 recoverable error codes */
	g_IotUploadData.errorZ3 = g_Zone3_TE.ErrCode;
	/* Zone 3 remaining time in hours */
	g_IotUploadData.remainingTimeHHZ3 = g_Zone3_GT.Timer.Minute/60;
	/* Zone 3 remaining time in minutes */
	g_IotUploadData.remainingTimeMMZ3 = g_Zone3_GT.Timer.Minute%60;
	
	/* Zone 4 active or inactive */
	g_IotUploadData.onOffStatusZ4 = g_Zone4_GT.Gear?1:0;
	/* Zone 4 pan detection */
	g_IotUploadData.panStatusZ4 = (g_2nd_MainBoard_Data.Stove_2nd_State & BPotExists)?1:0;
	/* Zone 4 hot detection */
	g_IotUploadData.hotStatusZ4 = (g_Zone4_TE.CoilTemp >= HOT_DETECT_TEMPERATURE)?1:0;
	/* Zone 4 combination mode */
	g_IotUploadData.combiModeZ4 = (zoneRight_State == ENABLE)?1:0;
	/* Z4 hob function */
	if(g_Zone4_GT.KeepWarmFlag)
	{
		/* 保温 */
		g_IotUploadData.prCodeZ4 = 1;
	}
	else if(g_Pause_State == 1)
	{
		/* 暂停 */
		g_IotUploadData.prCodeZ4 = 5;
	}
	else
	{
		g_IotUploadData.prCodeZ4 = 0;
	}
	/* Zone 4 cooking Phase 固定上传数据0 */
		g_IotUploadData.prPhaseZ4 = 0;
	/* Zone4 功率档位 */
	g_IotUploadData.powerZ4 = g_Zone4_GT.Gear;
	/* Hob4 线盘（蘑菇头）温度 */
	g_IotUploadData.tempZ4 = g_Zone4_TE.CoilTemp;
	/* Zone 4 recoverable error codes */
	g_IotUploadData.errorZ4 = g_Zone4_TE.ErrCode;
	/* Zone 4 remaining time in hours */
	g_IotUploadData.remainingTimeHHZ4 = g_Zone4_GT.Timer.Minute/60;
	/* Zone 4 remaining time in minutes */
	g_IotUploadData.remainingTimeMMZ4 = g_Zone4_GT.Timer.Minute%60;
	
	/* Hob Locked */
	g_IotUploadData.hobLockStatus = (lock_State == ENABLE)?1:0;
	/* general Timer hours */
	g_IotUploadData.timerHH = 0;
	/* general Timer minutes */
	g_IotUploadData.timerMM = 0;
	/* Last stored program (for one zone) Default:Keep Warm */
	g_IotUploadData.prCode = 1;
	/* Power Management Levels according to the model */
	 g_IotUploadData.powerManagement = 5;
	switch(g_TotalPower)
	{
		case 0x25: g_IotUploadData.powerManagement = 1; break;
		case 0x30: g_IotUploadData.powerManagement = 2; break;
		case 0x45: g_IotUploadData.powerManagement = 3; break;
		case 0x65: g_IotUploadData.powerManagement = 4; break;
		case 0x74: g_IotUploadData.powerManagement = 5; break;
	}
	/* Probe 1 on/off status Default:0 */ 
	g_IotUploadData.onOffStatusProbe1 = 0;
	/* Probe 1 temperature */
	g_IotUploadData.tempProbe1 = 0;
	/* Probe 1 charge */
	g_IotUploadData.chargeProbe1 = 0;
	/* Probe 1 signal */
	g_IotUploadData.signalProbe1 = 0;
	/* Probe 1 error */
	g_IotUploadData.errorProbe1 =0;
	/* Probe 2 on/off status Default:0 */ 
	g_IotUploadData.onOffStatusProbe2 = 0;
	/* Probe 2 temperature */
	g_IotUploadData.tempProbe2 = 0;
	/* Probe 2 charge */
	g_IotUploadData.chargeProbe2 = 0;
	/* Probe 2 signal */
	g_IotUploadData.signalProbe2 = 0;
	/* Probe 2 error */
	g_IotUploadData.errorProbe2 =0;

}

/**
  * @brief  http-write请求执行函数
  * @param  无
  * @retval SUCCESS， 执行成功
  *         ERROR，执行失败
  */
ErrorStatus httpWriteCommandExecute(void)
{
	uint32_t        tmp1,tmp2;   //定义2个临时变量
	uint8_t         lever_save;  //定义档位缓存变量
	pGear_Time_CON  pGT;         //定义一个时间档位控制器指针

		/* 首先检查功率方案有没有改变 */
	if(g_IotDownloadData.powerManagement == 0)
	{
			macPC_Usart("\r\npowerManagement should not be set to 0\r\n");
			return ERROR;
	}
	switch(g_IotDownloadData.powerManagement)
	{
		case 1:
			g_TotalPower = 2000;
			break;
		case 2:
			g_TotalPower = 2500;
			break;
		case 3:
			g_TotalPower = 3000;
			break;
		case 4:
			g_TotalPower = 3500;
			break;
		case 5:
			g_TotalPower = 4500;
		case 6:
			g_TotalPower = 5500;
			break;
		case 7:
			g_TotalPower = 6800;
			break;
		case 8:
			g_TotalPower = 7400;
			break;
	}
	readDoubleWordEmbeddedFlash(FLASH_PAGE62_START_ADDR, 0, &tmp1, &tmp2);
	if(g_TotalPower != tmp1)
	{
			writeDoubleWordEmbeddedFlash(FLASH_PAGE62, FLASH_PAGE62_START_ADDR, 0, g_TotalPower);
			
			/* 重置功率完成，重启 */
			HAL_Delay(50);
			__set_PRIMASK(1); //for M0
			HAL_NVIC_SystemReset();
//			return SUCCESS;
	}
	
	/* 根据炉头编号确认时间档位控制器 */
	switch(g_IotDownloadData.zone)
	{
		case 1: pGT = &g_Zone1_GT;      break;
		case 2: pGT = &g_Zone2_GT;      break;
		case 3: pGT = &g_Zone3_GT;      break;
		case 4: pGT = &g_Zone4_GT;      break;
		case 5: pGT = &g_ZoneLeft_GT;   break;
		case 6: pGT = &g_ZoneRight_GT;  break;
	}
	
	/* 探针号请求，目前没有此功能，只接受0参数 */
	if(g_IotDownloadData.probe != 0)
	{
			macPC_Usart("\r\nprobe can only set to 0\r\n");
			return ERROR;
	}
	
	/* zone信息处理，目前只接受1-4 */
	if(g_IotDownloadData.zone > 4)
	{
			macPC_Usart("\r\nzone can only set 1 to 4\r\n");
			return ERROR;
	}
	
	/* 档位控制请求处理 */
	if(g_IotDownloadData.prPhase1_Power > 10)
	{
			macPC_Usart("\r\nzone power lever out of range\r\n");
			return ERROR;
	}
	else
	{
			lever_save = pGT->Gear;
			pGT->Gear = g_IotDownloadData.prPhase1_Power;
			if(TRUE == singleBoardPowerLimitAlgorithm(pGT->Gear))
			{
				if(TRUE == realTotalPowerCalculate(pGT->Gear))
				{
					/* 档位更新蜂鸣器响 */
					if(lever_save != pGT->Gear)
					{
						beep_Button(BUTTON_GEAR_BZ_TIME);
					}
				}
			}
			else
			{
					macPC_Usart("\r\nzone power lever out of 'powerManagement'\r\n");
					return ERROR;
			}

	}
	
	/* 定时时间设置请求处理 */
	if(g_IotDownloadData.prPhase1_Time > 99)
	{
			macPC_Usart("\r\nsetting beyond the confines of timer !\r\n");
			return ERROR;
	}
	else
	{
			timer_INC_Deal(pGT);
			if(pGT->Timer.Minute)
			{
					pGT->Timer.Minute--;
			}
	}
	
	return SUCCESS;
}







void loadHttpData(void);

/**
* @brief 构建上传到云端的json数据
* decimal value.
*
* @param *json_str json字符串输出缓存区指针
*
* @return 无
*/
void httpUpload_JsonFormat(char *json_str)
{
	loadHttpData();
		sprintf ( json_str, "\"statusHob\":{\r\n\
\"remoteCtrValid\":\"%d\",\r\n\
\"onOffStatusZ1\":\"%d\",\r\n\
\"panStatusZ1\":\"%d\",\r\n\
\"hotStatusZ1\":\"%d\",\r\n\
\"combiModeZ1\":\"%d\",\r\n\
\"prCodeZ1\":\"%d\",\r\n\
\"prPhaseZ1\":\"%d\",\r\n\
\"powerZ1\":\"%d\",\r\n\
\"tempZ1\":\"%d\",\r\n\
\"errorZ1\":\"%d\",\r\n\
\"remainingTimeHHZ1\":\"%d\",\r\n\
\"remainingTimeMMZ1\":\"%d\",\r\n\
\"onOffStatusZ2\":\"%d\",\r\n\
\"panStatusZ2\":\"%d\",\r\n\
\"hotStatusZ2\":\"%d\",\r\n\
\"combiModeZ2\":\"%d\",\r\n\
\"prCodeZ2\":\"%d\",\r\n\
\"prPhaseZ2\":\"%d\",\r\n\
\"powerZ2\":\"%d\",\r\n\
\"tempZ2\":\"%d\",\r\n\
\"errorZ2\":\"%d\",\r\n\
\"remainingTimeHHZ2\":\"%d\",\r\n\
\"remainingTimeMMZ2\":\"%d\",\r\n\
\"onOffStatusZ3\":\"%d\",\r\n\
\"panStatusZ3\":\"%d\",\r\n\
\"hotStatusZ3\":\"%d\",\r\n\
\"combiModeZ3\":\"%d\",\r\n\
\"prCodeZ3\":\"%d\",\r\n\
\"prPhaseZ3\":\"%d\",\r\n\
\"powerZ3\":\"%d\",\r\n\
\"tempZ3\":\"%d\",\r\n\
\"errorZ3\":\"%d\",\r\n\
\"remainingTimeHHZ3\":\"%d\",\r\n\
\"remainingTimeMMZ3\":\"%d\",\r\n\
\"onOffStatusZ4\":\"%d\",\r\n\
\"panStatusZ4\":\"%d\",\r\n\
\"hotStatusZ4\":\"%d\",\r\n\
\"combiModeZ4\":\"%d\",\r\n\
\"prCodeZ4\":\"%d\",\r\n\
\"prPhaseZ4\":\"%d\",\r\n\
\"powerZ4\":\"%d\",\r\n\
\"tempZ4\":\"%d\",\r\n\
\"errorZ4\":\"%d\",\r\n\
\"remainingTimeHHZ4\":\"%d\",\r\n\
\"remainingTimeMMZ4\":\"%d\",\r\n\
\"hobLockStatus\":\"%d\",\r\n\
\"timerHH\":\"%d\",\r\n\
\"timerMM\":\"%d\",\r\n\
\"prCode\":\"%d\",\r\n\
\"powerManagement\":\"%d\",\r\n\
\"onOffStatusProbe1\":\"%d\",\r\n\
\"tempProbe1\":\"%d\",\r\n\
\"chargeProbe1\":\"%d\",\r\n\
\"signalProbe1\":\"%d\",\r\n\
\"errorProbe1\":\"%d\",\r\n\
\"onOffStatusProbe2\":\"%d\",\r\n\
\"tempProbe2\":\"%d\",\r\n\
\"chargeProbe2\":\"%d\",\r\n\
\"signalProbe2\":\"%d\",\r\n\
\"errorProbe2\":\"%d\"}"
	, g_IotUploadData.remoteCtrValid, g_IotUploadData.onOffStatusZ1, g_IotUploadData.panStatusZ1, g_IotUploadData.hotStatusZ1, g_IotUploadData.combiModeZ1, g_IotUploadData.prCodeZ1,
	g_IotUploadData.prPhaseZ1, g_IotUploadData.powerZ1, g_IotUploadData.tempZ1, g_IotUploadData.errorZ1, g_IotUploadData.remainingTimeHHZ1, g_IotUploadData.remainingTimeMMZ1,
	
	g_IotUploadData.onOffStatusZ2, g_IotUploadData.panStatusZ2, g_IotUploadData.hotStatusZ2, g_IotUploadData.combiModeZ2, g_IotUploadData.prCodeZ2, g_IotUploadData.prPhaseZ2,
	g_IotUploadData.powerZ2, g_IotUploadData.tempZ2, g_IotUploadData.errorZ2, g_IotUploadData.remainingTimeHHZ2, g_IotUploadData.remainingTimeMMZ2,
	
	g_IotUploadData.onOffStatusZ3, g_IotUploadData.panStatusZ3, g_IotUploadData.hotStatusZ3, g_IotUploadData.combiModeZ3, g_IotUploadData.prCodeZ3, g_IotUploadData.prPhaseZ3,
	g_IotUploadData.powerZ3, g_IotUploadData.tempZ3, g_IotUploadData.errorZ3, g_IotUploadData.remainingTimeHHZ3, g_IotUploadData.remainingTimeMMZ3,
	
	g_IotUploadData.onOffStatusZ4, g_IotUploadData.panStatusZ4, g_IotUploadData.hotStatusZ4, g_IotUploadData.combiModeZ4, g_IotUploadData.prCodeZ4, g_IotUploadData.prPhaseZ4,
	g_IotUploadData.powerZ4, g_IotUploadData.tempZ4, g_IotUploadData.errorZ4, g_IotUploadData.remainingTimeHHZ4, g_IotUploadData.remainingTimeMMZ4,
	
	g_IotUploadData.hobLockStatus, g_IotUploadData.timerHH, g_IotUploadData.timerMM, g_IotUploadData.prCode, g_IotUploadData.powerManagement, 
	g_IotUploadData.onOffStatusProbe1, g_IotUploadData.tempProbe1, g_IotUploadData.chargeProbe1, g_IotUploadData.signalProbe1, g_IotUploadData.errorProbe1,
	g_IotUploadData.onOffStatusProbe2, g_IotUploadData.tempProbe2, g_IotUploadData.chargeProbe2, g_IotUploadData.signalProbe2, g_IotUploadData.errorProbe2
	);
}

/**
* @brief 处理从云端下载的httpWrite数据
* decimal value.
*
* @param 无
*
* @return 无
*/
// void httpDownloadDataSave(char *str)
//{
//		const char s = '=';
//		const char start_chr = '&';
//		char *p;
//		char *p_str;
//		char chr_num_buf[5];
//		int tmp;
//		uint8_t i, err;

//		p = strchr(str, start_chr);
//		p_str = (char *)&g_IotDownloadData.prCode;
//		for(i=0;i<DOWMLOAD_PARAM_NUM;i++)
//		{
//				err = 0;
//				while( *p != s ) 
//				{
//						p++;
//						if(err++ > 100)  break;
//				}
//				p++;        //跳过“=”号
//				memset(chr_num_buf, 0, sizeof(chr_num_buf));
//				sscanf(p, "%[^0-9]", chr_num_buf);
//				sscanf(chr_num_buf, "%d", &tmp);
//				*p_str++ = tmp;
//		}
//}

/**
* @brief 解析从云端下载的httpWrite数据
* decimal value.
*
* @param str  云端数据缓存区
*        cmp  匹配字符串指针
*        dest 数据输出
*
* @return 无
*/
void cloudDownloadDataDecode(char *str, char *cmp, uint8_t *dest)
{
		char *p;
		char chr_num_buf[5] = {0};
		int tmp;

		p = strstr(str, cmp);
		if(p != NULL)
		{
			p = strchr(p, '=');
			p++;
			sscanf(p, "%[^&]", chr_num_buf);
			sscanf(chr_num_buf, "%d", &tmp);
			*dest = tmp;
		}
}

/**
* @brief 保存从云端下载的httpWrite数据
* decimal value.
*
* @param str  云端数据缓存区
*
* @return 无
*/
void httpDownloadDataSave(char *str)
{
	
//		char *p;
//		char chr_num_buf[5] = {0};
//		int tmp;
		
//		p = strstr(str, "prCode");
//		if(p != NULL)
//		{
//			p = strchr(p, '=');
//			p++;
//			sscanf(p, "%[^&]", chr_num_buf);
//			sscanf(chr_num_buf, "%d", &tmp);
//			g_IotDownloadData.prCode = tmp;
//		}
//		p = strstr(str, "prPhase1_Power");
//		if(p != NULL)
//		{
//			p = strchr(p, '=');
//			p++;
//			sscanf(p, "%[^&]", chr_num_buf);
//			sscanf(chr_num_buf, "%d", &tmp);
//			g_IotDownloadData.prPhase1_Power = tmp;
//		}
		
	
		cloudDownloadDataDecode(str, "prCode", &g_IotDownloadData.prCode);
	
		cloudDownloadDataDecode(str, "prPhase1_Power", &g_IotDownloadData.prPhase1_Power);
		cloudDownloadDataDecode(str, "prPhase2_Power", &g_IotDownloadData.prPhase2_Power);
		cloudDownloadDataDecode(str, "prPhase3_Power", &g_IotDownloadData.prPhase3_Power);
		cloudDownloadDataDecode(str, "prPhase4_Power", &g_IotDownloadData.prPhase4_Power);
		cloudDownloadDataDecode(str, "prPhase5_Power", &g_IotDownloadData.prPhase5_Power);
	
		cloudDownloadDataDecode(str, "prPhase1_Time", &g_IotDownloadData.prPhase1_Time);
		cloudDownloadDataDecode(str, "prPhase2_Time", &g_IotDownloadData.prPhase2_Time);
		cloudDownloadDataDecode(str, "prPhase3_Time", &g_IotDownloadData.prPhase3_Time);
		cloudDownloadDataDecode(str, "prPhase4_Time", &g_IotDownloadData.prPhase4_Time);
		cloudDownloadDataDecode(str, "prPhase5_Time", &g_IotDownloadData.prPhase5_Time);
	
		cloudDownloadDataDecode(str, "probe", &g_IotDownloadData.probe);
	
		cloudDownloadDataDecode(str, "prPhase1_Temp", &g_IotDownloadData.prPhase1_Temp);
		cloudDownloadDataDecode(str, "prPhase2_Temp", &g_IotDownloadData.prPhase2_Temp);
		cloudDownloadDataDecode(str, "prPhase3_Temp", &g_IotDownloadData.prPhase3_Temp);
		cloudDownloadDataDecode(str, "prPhase4_Temp", &g_IotDownloadData.prPhase4_Temp);
		cloudDownloadDataDecode(str, "prPhase5_Temp", &g_IotDownloadData.prPhase5_Temp);
		
		cloudDownloadDataDecode(str, "temp", &g_IotDownloadData.temp);
		cloudDownloadDataDecode(str, "zone", &g_IotDownloadData.zone);
		cloudDownloadDataDecode(str, "powerManagement", &g_IotDownloadData.powerManagement);
}


/*------------------------------------------------------------------------------*/


