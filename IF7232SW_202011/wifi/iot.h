#ifndef  __IOT_H
#define	 __IOT_H

#include "main.h"
#include <stdbool.h>

/* 云端参数下载个数宏定义 */
#define DOWMLOAD_PARAM_NUM 20

/* 上传云端数据结构体定义 */
typedef struct{
	uint8_t remoteCtrValid    :1;
	uint8_t onOffStatusZ1     :1;
	uint8_t panStatusZ1       :1;
	uint8_t hotStatusZ1       :1;
	uint8_t combiModeZ1       :2;
	uint8_t prCodeZ1            ;
	uint8_t prPhaseZ1         :3;
	uint8_t powerZ1           :5;
	uint8_t tempZ1              ;
	uint8_t errorZ1             ;
	uint8_t remainingTimeHHZ1   ;
	uint8_t remainingTimeMMZ1   ;
	uint8_t onOffStatusZ2     :1;
	uint8_t panStatusZ2       :1;
	uint8_t hotStatusZ2       :1;
	uint8_t combiModeZ2       :2;
	uint8_t prCodeZ2            ;
	uint8_t prPhaseZ2         :3;
	uint8_t powerZ2           :5;
	uint8_t tempZ2              ;
	uint8_t errorZ2             ;
	uint8_t remainingTimeHHZ2   ;
	uint8_t remainingTimeMMZ2   ;
	uint8_t onOffStatusZ3     :1;
	uint8_t panStatusZ3       :1;
	uint8_t hotStatusZ3       :1;
	uint8_t combiModeZ3       :2;
	uint8_t prCodeZ3            ;
	uint8_t prPhaseZ3         :3;
	uint8_t powerZ3           :5;
	uint8_t tempZ3              ;
	uint8_t errorZ3             ;
	uint8_t remainingTimeHHZ3   ;
	uint8_t remainingTimeMMZ3   ;
	uint8_t onOffStatusZ4     :1;
	uint8_t panStatusZ4       :1;
	uint8_t hotStatusZ4       :1;
	uint8_t combiModeZ4       :2;
	uint8_t prCodeZ4            ;
	uint8_t prPhaseZ4         :3;
	uint8_t powerZ4           :5;
	uint8_t tempZ4              ;
	uint8_t errorZ4             ;
	uint8_t remainingTimeHHZ4   ;
	uint8_t remainingTimeMMZ4   ;
	uint8_t hobLockStatus     :1;
	uint8_t timerHH           :5;
	uint8_t timerMM             ;
	uint8_t prCode              ;
	uint8_t powerManagement     ;
	uint32_t onOffStatusProbe1  ;
	uint8_t tempProbe1          ;
	uint8_t chargeProbe1        ;
	char    signalProbe1        ;
	uint32_t onOffStatusProbe2  ;
	uint8_t errorProbe1         ;
	uint8_t tempProbe2          ;
	uint8_t chargeProbe2        ;
	char    signalProbe2        ;
	uint8_t errorProbe2         ;
}strCloudDataUploadTypeDef;

/* 接收下载云端数据结构体定义 */
#pragma pack(push)
#pragma pack(1) 
typedef struct{
	uint8_t prCode              ;
	uint8_t powerManagement     ;
	uint8_t probe               ;
	uint8_t prPhase1_Power      ;
	uint8_t prPhase1_Time       ;
	uint8_t prPhase1_Temp       ;
	uint8_t prPhase2_Power      ;
	uint8_t prPhase2_Time       ;
	uint8_t prPhase2_Temp       ;
	uint8_t prPhase3_Power      ;
	uint8_t prPhase3_Time       ;
	uint8_t prPhase3_Temp       ;
	uint8_t prPhase4_Power      ;
	uint8_t prPhase4_Time       ;
	uint8_t prPhase4_Temp       ;
	uint8_t prPhase5_Power      ;
	uint8_t prPhase5_Time       ;
	uint8_t prPhase5_Temp       ;
	uint8_t temp                ;
	uint8_t zone                ;
}strCloudDataDownloadTypeDef;
#pragma pack()
#pragma pack(pop)

/********************************** 外部全局变量 ***************************************/
extern strCloudDataUploadTypeDef   g_IotUploadData;
extern strCloudDataDownloadTypeDef g_IotDownloadData;

/********************************** 函数声明 ***************************************/
void httpUpload_JsonFormat(char *json_str);
void httpDownloadDataSave(char *str);

#endif

