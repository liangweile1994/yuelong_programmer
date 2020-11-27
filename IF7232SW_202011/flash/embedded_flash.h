#ifndef  _EMBEDDED_FLASH_H
#define  _EMBEDDED_FLASH_H

#include "main.h"
#include <stdbool.h>

/* flash�ĵ�62ҳ�� */
#define			FLASH_PAGE62											62
/* flash��62ҳ��ʼ��ַ */
#define			FLASH_PAGE62_START_ADDR						0x0801F000
/* flash�����һҳҳ�� */
#define			FLASH_PAGE63											63
/* flash���һҳ�ĵ�ַ */
#define			FLASH_PAGE63_START_ADDR						0x0801F800

bool eraseEmbeddedFlash(uint8_t page_number);
bool writeDoubleWordEmbeddedFlash(uint8_t page_number, uint32_t page_start_addr, uint8_t offset, uint64_t flashData);
void readDoubleWordEmbeddedFlash(uint32_t page_start_addr, uint8_t offset, uint32_t *pVal1, uint32_t *pVal2);

#endif
