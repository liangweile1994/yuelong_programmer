#ifndef  _NTC_H
#define  _NTC_H

#include "main.h"

#define NTC_ERROR_OPEN           998
#define NTC_ERROR_SHORT_CIRCUIT  999

enum ntcType
{
  IGBT_NTC = 0,
  COIL_NTC
};

extern eResult aboveZeroFlag;

uint16_t getTemperature(uint16_t adc_val, enum ntcType e_ntc_type);
//uint16_t calculated_Temperature(uint16_t adc_val);
//uint16_t	get_temperature(uint16_t adc);

#endif
