#ifndef _PLATFORM_RGB_LED_H
#define _PLATFORM_RGB_LED_H
#include "stm32f1xx.h"
void Platform_RGB_LED_Init(void);
void Platform_RGB_LED_Red(void);
void Platform_RGB_LED_Green(void);
void Platform_RGB_LED_Blue(void);
void Platform_RGB_LED_Blackout(void);
#endif