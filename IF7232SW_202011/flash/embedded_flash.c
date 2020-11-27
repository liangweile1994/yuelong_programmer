/**
  ******************************************************************************
  * @file    embedded_flash.c
  * @author  ����
  * @version V1.0
  * @date    2020-01-xx
  * @brief   ��дstm32G07����flash���һҳ��Ӧ�ó���ҳ��СΪ2K bytes
  ******************************************************************************
  * @attention
  *
  * ���ڴ洢�����Ĺ���ֵ
  *
  ******************************************************************************
  */ 

#include "embedded_flash.h"
#include "stdio.h"
#include <stdbool.h>



/*
 * ��������eraseEmbeddedFlash
 * ����  ������mcu����flash����ֵ
 * ����  ����
 * ���  ����
 * ����  : ��
 */
bool eraseEmbeddedFlash(uint8_t page_number)
{
		uint32_t PageError = 0;
		FLASH_EraseInitTypeDef EraseInitStruct;
	
		HAL_FLASH_Unlock();
		EraseInitStruct.TypeErase   = FLASH_TYPEERASE_PAGES;
		EraseInitStruct.Page        = page_number;
		EraseInitStruct.NbPages     = 1;
		
		if (HAL_FLASHEx_Erase(&EraseInitStruct, &PageError) != HAL_OK)
		{
				printf("Erase flash ERROR...\r\n");
				return false;
		}
		HAL_FLASH_Lock();
		
		return true;
}

/*
 * ��������readDoubleWordEmbeddedFlash
 * ����  ����mcu����flash����ֵ
 * ����  ��address, �ڴ浥Ԫ�����һҳ��ƫ�Ƶ�ַ0��1��2��3������, 255
 * ���  ��pVal1 address�ĵ�32λ����ָ��  pVal2 address�ĸ�32λ����ָ��
 * ����  : ��
 */
void readDoubleWordEmbeddedFlash(uint32_t page_start_addr, uint8_t offset, uint32_t *pVal1, uint32_t *pVal2)
{
		*pVal1 = *(__IO uint32_t *)(page_start_addr + offset * 8);
		*pVal2 = *(__IO uint32_t *)(page_start_addr + offset * 8 + 4);
}

/*
 * ��������writeDoubleWordEmbeddedFlash
 * ����  ����mcu����flash��дDoubleWord����
 * ����  ��address, ���һҳ�ڴ��8�ֽڣ�DoubleWord��ƫ�Ƶ�ַ0��1��2����, 255��flashData ��д���ڴ������
 * ����  : �ڴ����ֵ
 */
bool writeDoubleWordEmbeddedFlash(uint8_t page_number, uint32_t page_start_addr, uint8_t offset, uint64_t flashData)
{
		uint32_t PageError = 0;
		uint32_t tmp1,tmp2;
		FLASH_EraseInitTypeDef EraseInitStruct;
		
		readDoubleWordEmbeddedFlash(page_start_addr, offset, &tmp1, &tmp2);
		/* ���flash�Ƿ�Ϊ�գ�Ϊ������Ҫִ�в������� */
		if( (tmp1 == 0xFFFFFFFF)&&(tmp2 == 0xFFFFFFFF) )
		{
				HAL_FLASH_Unlock();
				if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_DOUBLEWORD, (page_start_addr + offset * 8), flashData) != HAL_OK)
				{
					printf("Program flash ERROR...\r\n");
					return false;
				}
				HAL_FLASH_Lock();
		}
		else
		{
				HAL_FLASH_Unlock();
				
				EraseInitStruct.TypeErase   = FLASH_TYPEERASE_PAGES;
				EraseInitStruct.Page        = page_number;
				EraseInitStruct.NbPages     = 1;
				
				if (HAL_FLASHEx_Erase(&EraseInitStruct, &PageError) != HAL_OK)
				{
						printf("Erase flash ERROR...\r\n");
						return false;
				}

				if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_DOUBLEWORD, (page_start_addr + offset * 8), flashData) != HAL_OK)
				{
						printf("Program flash ERROR...\r\n");
						return false;
				}
				HAL_FLASH_Lock();
		}
		return true;
}
