#ifndef __EM4095_H
#define __EM4095_H

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

#define GET_ID 1
#define NOT_ID 0

extern void EM4095_Init(void);
extern uint8_t EM4095_SearchHdr(uint8_t *pcardid);

#define READ_DEMOD()	HAL_GPIO_ReadPin(GPIOG,GPIO_PIN_12)  

#endif


