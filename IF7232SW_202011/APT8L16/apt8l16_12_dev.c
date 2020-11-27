#include "apt8l16_12_dev.h"
#include "apt8l16_12_drv.h"

const uint8_t APT8L16_1_REGS_CONFIG[14] = {GSR_VAL_1,MCON_VAL_1,FILTER0_VAL_1,K0_ENB_VAL_1,K1_ENB_VAL_1,SENSE_CON_VAL_1,SENSE_S_VAL_1,
                                          GSR_K07_VAL_1,GSR_K17_VAL_1,REF_UTH_VAL_1,KEY_ATH_VAL_1,DSMIT_VAL_1,MCONH_VAL_1,FILTER1_VAL_1};

	
const uint8_t APT8L16_2_REGS_CONFIG[14] = {GSR_VAL_2,MCON_VAL_2,FILTER0_VAL_2,K0_ENB_VAL_2,K1_ENB_VAL_2,SENSE_CON_VAL_2,SENSE_S_VAL_2,
                                          GSR_K07_VAL_2,GSR_K17_VAL_2,REF_UTH_VAL_2,KEY_ATH_VAL_2,DSMIT_VAL_2,MCONH_VAL_2,FILTER1_VAL_2};
	
	
const uint8_t APT8L16_1_KOR_CONFIG[16] = {
	6,		//K00	FL
	10,		//K01	2S3
	9,		//K02	2S2
	6,		//K03	2S1
	7,		//K04	1S9
	6,		//K05	1S8
	6,		//K06	1S7
	4,		//K07	1S6
	10,		//K10	1S5
	11,		//K11	1S4
	10,		//K12 
	10,		//K13	1S3
	9,		//K14	1S2
	6,		//K15	1S1
	5,	  //K16 CHEF
	4 	  //K17 WIFI
};

const uint8_t APT8L16_2_KOR_CONFIG[16] = {
	8,		//K00	DEC
	10,	  //K01 INC
	3,	  //K02 3S3
	6,		//K03	3S2
	4,		//K04	3S1
	4,		//K05	LOOK
	9,		//K06	BOOST
	6,		//K07	ON_OFF
	4,		//K10	2S7
	8,		//K11	2S8
	8,		//K12	2S9
	8,		//K13	2S6
	4,		//K14	2S5
	4,		//K15	2S4
	7,  //K16	
	8 	//K17	
};

/*
 * ��������APT8L16_1_Init
 * ����  ��APT8L16��ʼ������
 * ����  ��K0_Enable_Cfg��K0����ɨ��ʹ��,bit_0--K00,bit_7--K07
 *       ��K1_Enable_Cfg��K1����ɨ��ʹ��,bit_0--K10,bit_7--K17
 *       ��KOR_Cfg��������ֵ����
 * ����  : NONE
 * ����  �����ⲿ����
 */
void APT8L16_1_Init(uint8_t K0_Enable_Cfg, uint8_t K1_Enable_Cfg, const uint8_t *KOR_Cfg)
{
	uint8_t i;
	uint8_t val;
	const uint8_t *pKOR_Cfg = KOR_Cfg;
	HAL_Delay(5);
	
//	APT8L16_12_I2c_Init();

	do{
		APT8L16_12_Send_OneByte(APT8L16_1_DevAddr, SYSCON, 0x5A);//ϵͳ��������ģʽ
		
		val = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, SYSCON);
	}while(val!=0x5A);

	/* APT8L16�Ĵ������� */
	for(i=0;i<14;i++)
	{
		do{
			APT8L16_12_Send_OneByte(APT8L16_1_DevAddr, GSR+i, APT8L16_1_REGS_CONFIG[i]);
			val = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, GSR+i);
		}while(val != APT8L16_1_REGS_CONFIG[i]);
	}
	/* ����K0������������ */
	do{
		APT8L16_12_Send_OneByte(APT8L16_1_DevAddr, KDR0, K0_Enable_Cfg);
		val = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, KDR0);
	}while(val != (uint8_t)(K0_Enable_Cfg));
	/* ����K1������������ */
	do{
		APT8L16_12_Send_OneByte(APT8L16_1_DevAddr, KDR1, K1_Enable_Cfg);
		val = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, KDR1);
	}while(val != (uint8_t)(K1_Enable_Cfg));
	/* ������ֵ���� */
	for(i=0;i<16;i++)
	{
		do{
			APT8L16_12_Send_OneByte(APT8L16_1_DevAddr, KOR1+i, *pKOR_Cfg++);
			val = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, KOR1+i);
		}while(val != KOR_Cfg[i]);
	}
	
	do{
		APT8L16_12_Send_OneByte(APT8L16_1_DevAddr, SYSCON, 0);//ϵͳ���빤��ģʽ
		val = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, SYSCON);
	}while(val!=0);
	HAL_Delay(500);
}

/*
 * ��������APT8L16_2_Init
 * ����  ��APT8L16��ʼ������
 * ����  ��K0_Enable_Cfg��K0����ɨ��ʹ��,bit_0--K00,bit_7--K07
 *       ��K1_Enable_Cfg��K1����ɨ��ʹ��,bit_0--K10,bit_7--K17
 *       ��KOR_Cfg��������ֵ����
 * ����  : NONE
 * ����  �����ⲿ����
 */
void APT8L16_2_Init(uint8_t K0_Enable_Cfg, uint8_t K1_Enable_Cfg, const uint8_t *KOR_Cfg)
{
	uint8_t i;
	uint8_t val;
	
	HAL_Delay(5);

	do{
		APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, SYSCON, 0x5A);//ϵͳ��������ģʽ
		
		val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, SYSCON);
	}while(val!=0x5A);

	/* APT8L16�Ĵ������� */

	for(i=0;i<14;i++)
	{
		do{
			APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, GSR+i, APT8L16_2_REGS_CONFIG[i]);
			val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, GSR+i);
		}while(val != APT8L16_2_REGS_CONFIG[i]);
	}

	/* ���ù���ģʽ  MCON<2> = 1 ���ģʽ */
	do{
		APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, MCON, 0x05);
		val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, MCON);
	}while(val!=0x05);
	
	/* ����K0������������ */
	do{
		APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, KDR0, K0_Enable_Cfg);
		val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, KDR0);
	}while(val != (uint8_t)(K0_Enable_Cfg));
	/* ����K1������������ */
	do{
		APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, KDR1, K1_Enable_Cfg);
		val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, KDR1);
	}while(val != (uint8_t)(K1_Enable_Cfg));
	/* ������ֵ���� */
	for(i=0;i<16;i++)
	{
		do{
			APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, KOR1+i, KOR_Cfg[i]);
			val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, KOR1+i);
		}while(val != KOR_Cfg[i]);
	}
	/* ȫ������������ */
	do{
		APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, GSR, 0x06);
		val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, GSR);
	}while(val!=0x06);
	
	/* ϵͳ���빤��ģʽ */
	do{
		APT8L16_12_Send_OneByte(APT8L16_2_DevAddr, SYSCON, 0);
		val = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, SYSCON);
	}while(val!=0);
	HAL_Delay(500);
}

/*
 * ��������APT8L16_1_key_Scan
 * ����  ��APT8L16����ɨ�躯��
 * ����  ��NONE
 * ����  : ����ֵval,��8λ--K1����8λ--K0
 * ����  �����ⲿ����
 */
uint16_t APT8L16_1_key_Scan(void)
{
	uint8_t buf[2];
	uint16_t val;
	buf[0] = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, KVR0);
	buf[1] = APT8L16_12_Recv_OneByte(APT8L16_1_DevAddr, KVR1);
	val = (buf[1]<<8) + buf[0];
	return val;
}

/*
 * ��������APT8L16_2_key_Scan
 * ����  ��APT8L16����ɨ�躯��
 * ����  ��NONE
 * ����  : ����ֵval,��8λ--K1����8λ--K0
 * ����  �����ⲿ����
 */
uint16_t APT8L16_2_key_Scan(void)
{
	uint8_t buf[2];
	uint16_t val;
	buf[0] = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, KVR0);
	buf[1] = APT8L16_12_Recv_OneByte(APT8L16_2_DevAddr, KVR1);
	val = (buf[1]<<8) + buf[0];
	return val;
}

