#ifndef __MsgHandler_H
#define __MsgHandler_H

#include "stm32f7xx_hal.h"
#include "stm32f7xx.h"

uint8_t Msg_Handler(void);
char AT_SendCmd(char* cmd, char *expected_result,uint8_t retry,uint16_t waittime);

#endif

