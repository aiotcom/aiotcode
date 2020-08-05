#ifndef SPI_ENC28J60_H
#define SPI_ENC28J60_H
#include <ioCC2530.h>
#include "type.h"
#include "TIM.h"

#define SPI_NSS        P1_4
#define SPI_SCK        P1_5
#define SPI_MOSI       P1_6
#define SPI_MISO       P1_7
#define ENC28J60_RST   P0_0
#define ENC28J60_INT   P0_1

void SPI_Enc28j60_Init(void);
uint8_t	SPI1_ReadWrite(uint8_t writedat);


#endif

