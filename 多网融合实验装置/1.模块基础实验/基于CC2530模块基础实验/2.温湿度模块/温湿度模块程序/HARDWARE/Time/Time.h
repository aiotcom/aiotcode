#ifndef __Time_H
#define __Time_H 			   

#include <ioCC2530.h>
#include "delay.h"

extern uint32_t Display_Count;
extern uint8_t Temp[ ],Humi[ ],Sum_Data[ ];//温度、湿度、光强、数据集合
extern void Init_Timer1(void); //LED初始化

#endif

