#ifndef _TIMER_H
#define _TIMER_H

#include "stm32f1xx_hal.h"

extern uint8_t Send_Data_Flame[];				//火焰传感器数据
extern uint16_t Data_Flam0,Data_Flam1;	//存放AD值
extern TIM_HandleTypeDef TIM3_Handler;  //定时器句柄 
extern void TIM3_Init(uint16_t arr,uint16_t psc);

#endif

