#ifndef __DELAY_H
#define __DELAY_H 			   

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

extern void __us(void);
extern void delay_ms(unsigned int nms);
extern void delay_us(unsigned int ums);

#endif





























