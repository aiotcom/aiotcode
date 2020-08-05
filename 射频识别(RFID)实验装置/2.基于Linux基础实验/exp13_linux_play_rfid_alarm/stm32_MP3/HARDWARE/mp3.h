#ifndef _MP3_H
#define _MP3_H
#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "timer.h"
void MP3_DispalyTargetByname(uint8_t *name);
void MP3_StartDisplay(void);
void MP3_DispalyTarget(uint16_t item);
void MP3_PreItemDisplay(void);
void MP3_NextItemDisplay(void);
void MP3_StopDisplay(void);
void MP3_Init(void);
#endif
