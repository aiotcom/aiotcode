#ifndef _Optocoupler_H
#define _Optocoupler_H

#include "stm32f7xx_hal.h"
#include "stm32f7xx.h"

#define 	Op_Switch_PORT 			GPIOG
#define 	Op_State_PORT 			GPIOA

#define 	Optocoupler_Switch 	GPIO_PIN_12
#define 	Optocoupler_State 	GPIO_PIN_6

#define 	Optocoupler_State_Read()   	HAL_GPIO_ReadPin(Op_State_PORT,Optocoupler_State)  //读取光电传感器状态

#define 	Optocoupler_Switch_ON()			HAL_GPIO_WritePin(Op_Switch_PORT,Optocoupler_Switch,GPIO_PIN_RESET)	//开启光电传感器
#define 	Optocoupler_Switch_OFF()		HAL_GPIO_WritePin(Op_Switch_PORT,Optocoupler_Switch,GPIO_PIN_SET)		//关闭光电传感器

extern void Optocoupler_Init(void);//光电传感器初始化

#endif


