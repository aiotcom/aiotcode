#ifndef _TIMER_H
#define _TIMER_H
#include "stm32f1xx.h"

extern uint8_t RFID_Data[];
extern uint16_t Command_Relay,Command_KEY,Command;	//控制继电器命令码、接收按键值命令码、接收RFID数据命令码
extern uint32_t Task_Count;								//分时任务计数值
extern TIM_HandleTypeDef TIM2_Handler;  	//定时器句柄 
void TIM2_Init(unsigned int arr,unsigned int psc);

#endif

