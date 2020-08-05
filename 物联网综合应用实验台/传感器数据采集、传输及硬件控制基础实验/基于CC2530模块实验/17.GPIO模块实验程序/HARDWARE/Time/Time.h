#ifndef __Time_H
#define __Time_H 			   

#include <ioCC2530.h>
#include "delay.h"

extern uint8_t LED_Count_Flag,LED_Count_Flag2;
extern uint32_t LED_Count,LED_Count2;

extern void Init_Timer1(void); //LED≥ı ºªØ
extern void Time_LED_Set(uint16_t Delay);

#endif

