#ifndef _APP_BASICRF_H
#define _APP_BASICRF_H
#include "basic_rf.h"
#include "basic_rf_security.h"


void Rf_Init(uint8 rf_ch,uint16 panid,uint16 short_addr);
uint8_t Rf_Receive(uint8_t *precv);

#endif