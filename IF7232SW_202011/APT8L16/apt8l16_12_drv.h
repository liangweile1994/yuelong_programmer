#ifndef  _APT8L16_12_DRV_H
#define	 _APT8L16_12_DRV_H

#include "main.h"

#define TRUE  1
#define FALSE 0

void APT8L16_12_I2c_Init(void);
uint8_t APT8L16_12_Send_OneByte(uint8_t dev_addr, uint8_t reg_addr, uint8_t dat);
uint8_t APT8L16_12_Recv_OneByte(uint8_t dev_addr, uint8_t reg_addr);

#endif
