#ifndef _TIMER_H
#define _TIMER_H

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

extern uint32_t Time_Count,Send_OneNET_Count;	//分时任务计数值
extern TIM_HandleTypeDef TIM2_Handler;      //定时器句柄 
extern void TIM2_Init(unsigned int arr,unsigned int psc);

#endif

