#ifndef __PN532_H
#define __PN532_H
#include <stdbool.h>
#define  PN532_PREAMBLE            0x00
#define  PN532_STARTCODE1          0x00
#define  PN532_STARTCODE2          0xFF
#define  PN532_POSTAMBLE           0x00

#define  PN532_HOSTTOPN532         0xD4

#define  PN532_FIRMWAREVERSION     0x02
#define  PN532_GETGENERALSTATUS    0x04
#define  PN532_SAMCONFIGURATION    0x14
#define  PN532_INLISTPASSIVETARGET 0x4A
#define  PN532_INDATAEXCHANGE      0x40
#define  PN532_MIFARE_READ         0x30
#define  PN532_MIFARE_WRITE        0xA0

#define  PN532_AUTH_WITH_KEYA      0x60
#define  PN532_AUTH_WITH_KEYB      0x61


#define  PN532_WAKEUP              0x55

#define  PN532_SPI_STATREAD        0x02
#define  PN532_SPI_DATAWRITE       0x01
#define  PN532_SPI_DATAREAD        0x03
#define  PN532_SPI_READY           0x01

#define  PN532_MIFARE_ISO14443A    0x00

#define  KEY_A	1
#define  KEY_B	2

void     begin(void);
void PN532_CSn_H(void);
void PN532_CSn_L(void);
unsigned char  SAMConfig(void);
unsigned int getFirmwareVersion(void);
unsigned int readPassiveTargetID(unsigned char cardbaudrate);
unsigned int authenticateBlock(	unsigned char cardnumber /*1 or 2*/,
                            unsigned int cid /*Card NUID*/,
                            unsigned char  blockaddress /*0 to 63*/,
                            unsigned char authtype /*Either KEY_A or KEY_B */,
                            unsigned char * keys);

unsigned int readMemoryBlock(unsigned char cardnumber /*1 or 2*/,unsigned char blockaddress /*0 to 63*/, unsigned char * block);
unsigned int writeMemoryBlock(unsigned char cardnumber /*1 or 2*/,unsigned char blockaddress /*0 to 63*/, unsigned char * block);

unsigned char sendCommandCheckAck(unsigned char *cmd, unsigned char cmdlen);


unsigned char spi_readack(void);
unsigned char readspistatus(void);
void    readspidata(unsigned char* buff, unsigned char n);
void    spiwritecommand(unsigned char* cmd, unsigned char cmdlen);
void    spiwrite(unsigned char c);
unsigned char spiread(void);
#endif
