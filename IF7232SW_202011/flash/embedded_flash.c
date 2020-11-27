/**
  ******************************************************************************
  * @file    embedded_flash.c
  * @author  龙工
  * @version V1.0
  * @date    2020-01-xx
  * @brief   读写stm32G07内置flash最后一页的应用程序，页大小为2K bytes
  ******************************************************************************
  * @attention
  *
  * 用于存储整机的功率值
  *
  ******************************************************************************
  */ 

#include "embedded_flash.h"
#include "stdio.h"
#include <stdbool.h>



/*
 * 函数名：eraseEmbeddedFlash
 * 描述  ：擦除mcu内置flash的数值
 * 输入  ：无
 * 输出  ：无
 * 返回  : 无
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
 * 函数名：readDoubleWordEmbeddedFlash
 * 描述  ：读mcu内置flash的数值
 * 输入  ：address, 内存单元在最后一页的偏移地址0，1，2，3，……, 255
 * 输出  ：pVal1 address的低32位数据指针  pVal2 address的高32位数据指针
 * 返回  : 无
 */
void readDoubleWordEmbeddedFlash(uint32_t page_start_addr, uint8_t offset, uint32_t *pVal1, uint32_t *pVal2)
{
		*pVal1 = *(__IO uint32_t *)(page_start_addr + offset * 8);
		*pVal2 = *(__IO uint32_t *)(page_start_addr + offset * 8 + 4);
}

/*
 * 函数名：writeDoubleWordEmbeddedFlash
 * 描述  ：向mcu内置flash的写DoubleWord数据
 * 输入  ：address, 最后一页内存的8字节（DoubleWord）偏移地址0，1，2……, 255，flashData ，写入内存的数据
 * 返回  : 内存的数值
 */
bool writeDoubleWordEmbeddedFlash(uint8_t page_number, uint32_t page_start_addr, uint8_t offset, uint64_t flashData)
{
		uint32_t PageError = 0;
		uint32_t tmp1,tmp2;
		FLASH_EraseInitTypeDef EraseInitStruct;
		
		readDoubleWordEmbeddedFlash(page_start_addr, offset, &tmp1, &tmp2);
		/* 检查flash是否为空，为空则不需要执行擦除操作 */
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
