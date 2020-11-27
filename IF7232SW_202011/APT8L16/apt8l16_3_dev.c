#include "apt8l16_3_drv.h"
#include "apt8l16_3_dev.h"

const uint8_t APT8L16_3_REGS_CONFIG[14] = {GSR_VAL,MCON_VAL,FILTER0_VAL,K0_ENB_VAL,K1_ENB_VAL,SENSE_CON_VAL,SENSE_S_VAL,
                                          GSR_K07_VAL,GSR_K17_VAL,REF_UTH_VAL,KEY_ATH_VAL,DSMIT_VAL,MCONH_VAL,FILTER1_VAL};

const uint8_t APT8L16_3_KOR_CONFIG[16] = {
	8,//K00	4S9
	4,//K01	4S8
	4,//K02	4S7
	4,//K03	4S6
	5,//K04	4S5
	11,//K05	4S4
	7,//K06	4S3
	6,//K07	4S2
	9,//K10	4S1
	10,//K11	3S9
	9,//K12	3S8
	7,//K13	3S7
	6,//K14	3S6
	5,//K15	3S5
	4,//K16	3S4
	7 //K17	FR
};


/*
 * ��������APT8L16_Init
 * ����  ��APT8L16��ʼ������
 * ����  ��K0_Enable_Cfg��K0����ɨ��ʹ��,bit_0--K00,bit_7--K07
 *       ��K1_Enable_Cfg��K1����ɨ��ʹ��,bit_0--K10,bit_7--K17
 *       ��KOR_Cfg��������ֵ����
 * ����  : NONE
 * ����  �����ⲿ����
 */
void APT8L16_3_Init(uint8_t K0_Enable_Cfg, uint8_t K1_Enable_Cfg, const uint8_t *KOR_Cfg)
{
	uint8_t i;
	uint8_t val;
	const uint8_t *pKOR_Cfg = KOR_Cfg;
	HAL_Delay(5);

	APT8L16_3_I2c_Init();
	
	do{
		APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, SYSCON, 0x5A);//ϵͳ��������ģʽ
		
		val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, SYSCON);
	}while(val!=0x5A);
	
	/* APT8L16�Ĵ������� */
	
	for(i=0;i<14;i++)
	{
		do{
			APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, GSR+i, APT8L16_3_REGS_CONFIG[i]);
			val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, GSR+i);
		}while(val != APT8L16_3_REGS_CONFIG[i]);
	}
	
	
	/* ���ù���ģʽ  MCON<2> = 1 ���ģʽ */
	do{
		APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, MCON, 0x05);
		val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, MCON);
	}while(val!=0x05);
	
	/* ����K0������������ */
	do{
		APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, KDR0, K0_Enable_Cfg);//����K0������������
		val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, KDR0);
	}while(val != (uint8_t)(K0_Enable_Cfg));
	/* ����K1������������ */
	do{
		APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, KDR1, K1_Enable_Cfg);//����K1������������
		val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, KDR1);
	}while(val != (uint8_t)(K1_Enable_Cfg));
	
	/* ������ֵ���� */
	for(i=0;i<16;i++)
	{
		do{
			APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, KOR1+i, *pKOR_Cfg++);//������ֵ����
			val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, KOR1+i);
		}while(val != KOR_Cfg[i]);
	}
	/* ȫ������������ */
	do{
		APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, GSR, 0x05);
		val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, GSR);
	}while(val!=0x05);
	/* ϵͳ���빤��ģʽ */
	do{
		APT8L16_3_Send_OneByte(APT8L16_3_DevAddr, SYSCON, 0);
		val = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, SYSCON);
	}while(val!=0);
	HAL_Delay(500);
}


/*
 * ��������APT8L16_key_Scan
 * ����  ��APT8L16����ɨ�躯��
 * ����  ��NONE
 * ����  : ����ֵval,��8λ--K1����8λ--K0
 * ����  �����ⲿ����
 */
uint16_t APT8L16_3_key_Scan(void)
{
	uint8_t buf[2];
	uint16_t val;
	buf[0] = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, KVR0);
	buf[1] = APT8L16_3_Recv_OneByte(APT8L16_3_DevAddr, KVR1);
	val = (buf[1]<<8) + buf[0];
	return val;
}

