#ifndef _TIMER_H
#define _TIMER_H
#include "stm32f1xx.h"

extern TIM_HandleTypeDef TIM2_Handler;      //¶¨Ê±Æ÷¾ä±ú 
extern uint8_t TIM2_IntFlag;

void TIM2_Init(unsigned int arr,unsigned int psc);
uint8_t TIM2_Delay(uint16_t nus);

#endif

