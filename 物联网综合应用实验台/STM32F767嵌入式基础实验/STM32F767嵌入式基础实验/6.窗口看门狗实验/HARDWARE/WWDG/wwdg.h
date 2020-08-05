#ifndef __WWDG_H
#define __WWDG_H

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

void WWDG_Init(unsigned char tr,unsigned char wr,unsigned int fprer);

#endif
