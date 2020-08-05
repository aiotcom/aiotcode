#ifndef _TIMER_H
#define _TIMER_H

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

extern uint32_t Time_Count;
extern TIM_HandleTypeDef TIM2_Handler;      //¶¨Ê±Æ÷¾ä±ú 
extern void TIM2_Init(unsigned int arr,unsigned int psc);

#endif

