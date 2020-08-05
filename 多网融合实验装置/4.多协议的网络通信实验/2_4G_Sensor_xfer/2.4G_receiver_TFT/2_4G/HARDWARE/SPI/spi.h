#ifndef __SPI_H
#define __SPI_H
#include "stm32f1xx_hal.h"
void SPI1_Init(void);			 //³õÊ¼»¯SPI¿Ú	
uint8_t SPI1_ReadWriteByte(uint8_t reg);
#endif

