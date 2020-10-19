#ifndef SPI_ENC28J60_H
#define SPI_ENC28J60_H

#include "stm32f1xx.h"

void SPI_Enc28j60_Init(void);
uint8_t	SPI1_ReadWrite(uint8_t writedat);

#endif

