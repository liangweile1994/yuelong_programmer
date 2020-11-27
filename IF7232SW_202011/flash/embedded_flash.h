#ifndef  _EMBEDDED_FLASH_H
#define  _EMBEDDED_FLASH_H

#include "main.h"
#include <stdbool.h>

/* flash的第62页码 */
#define			FLASH_PAGE62											62
/* flash第62页起始地址 */
#define			FLASH_PAGE62_START_ADDR						0x0801F000
/* flash的最后一页页码 */
#define			FLASH_PAGE63											63
/* flash最后一页的地址 */
#define			FLASH_PAGE63_START_ADDR						0x0801F800

bool eraseEmbeddedFlash(uint8_t page_number);
bool writeDoubleWordEmbeddedFlash(uint8_t page_number, uint32_t page_start_addr, uint8_t offset, uint64_t flashData);
void readDoubleWordEmbeddedFlash(uint32_t page_start_addr, uint8_t offset, uint32_t *pVal1, uint32_t *pVal2);

#endif
