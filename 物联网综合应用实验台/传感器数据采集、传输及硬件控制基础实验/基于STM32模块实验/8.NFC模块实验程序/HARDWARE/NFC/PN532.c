#include <stdbool.h>
#include "string.h"
#include "PN532.h"
#include "delay.h"
#include "NFC.h"

uint8_t Data_Code[2];		//数据码
uint8_t sendCommandCheckAck(uint8_t *cmd, uint8_t cmdlen);
void    spiwrite(uint8_t c);
uint8_t spiread(void);
void    spiwritecommand(uint8_t* cmd, uint8_t cmdlen);
void    readspidata(uint8_t* buff, uint8_t n);
uint8_t readspistatus(void); 
uint8_t spi_readack(void); 

uint8_t pn532ack[] = {0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00};
uint8_t pn532response_firmwarevers[] = {0x00, 0xFF, 0x06, 0xFA, 0xD5, 0x03};

#define PN532_PACKBUFFSIZ 64
uint8_t pn532_packetbuffer[PN532_PACKBUFFSIZ];

void begin() 
{
//    digitalWrite(_ss, LOW);
    PN532_CSn_L;
    delay_us(1000);

    // not exactly sure why but we have to send a dummy command to get synced up
    pn532_packetbuffer[0] = PN532_FIRMWAREVERSION;
    sendCommandCheckAck(pn532_packetbuffer, 1);

    // ignore response!
}

uint32_t getFirmwareVersion(void) 
{
    uint32_t response;

    pn532_packetbuffer[0] = PN532_FIRMWAREVERSION;

    if (! sendCommandCheckAck(pn532_packetbuffer, 1))
    {
        return 0;
    }
    // read data packet
    readspidata(pn532_packetbuffer, 12);
    // check some basic stuff
    if (0 != strncmp((char *)pn532_packetbuffer, (char *)pn532response_firmwarevers, 6))
		{
        return 0;
    }

    response = pn532_packetbuffer[6];
    response <<= 8;
    response |= pn532_packetbuffer[7];
    response <<= 8;
    response |= pn532_packetbuffer[8];
    response <<= 8;
    response |= pn532_packetbuffer[9];

    return response;
}

// default timeout of one second
uint8_t sendCommandCheckAck(uint8_t *cmd, uint8_t cmdlen) 
{
    uint16_t timer = 0;
    uint16_t timeout = 1000;

    // write the command
    spiwritecommand(cmd, cmdlen);

    // Wait for chip to say its ready!
    while (readspistatus() != PN532_SPI_READY) 
    {
        if (timeout != 0) 
        {
            timer++;
            if (timer > timeout)
            {
                return false;
            }
        }
        delay_us(100);
    }

    // read acknowledgement
    if (!spi_readack()) 
    {
        return false;
    }

    timer = 0;
    // Wait for chip to say its ready!
    while (readspistatus() != PN532_SPI_READY) 
    {
        if (timeout != 0) 
        {
            timer++;
            if (timer > timeout)
            {
                return false;
            }
        }
        delay_us(100);
    }

    return true; // ack'd command
}

//==========================================================
//	函数名称：	SAMConfig
//
//	函数功能：	PN532初始化
//
//	入口参数：	无
//              
//	返回参数：	成功：true
//							失败：false
//
//	说明：			
//==========================================================
uint8_t SAMConfig(void)
{
    pn532_packetbuffer[0] = PN532_SAMCONFIGURATION;
    pn532_packetbuffer[1] = 0x01; // normal mode;
    pn532_packetbuffer[2] = 0x14; // timeout 50ms * 20 = 1 second
    pn532_packetbuffer[3] = 0x01; // use IRQ pin!

    if (! sendCommandCheckAck(pn532_packetbuffer, 4))
    {
        return false;
    }
    // read data packet
    readspidata(pn532_packetbuffer, 8);

    return  (pn532_packetbuffer[5] == 0x15);
}

//==========================================================
//	函数名称：	authenticateBlock
//
//	函数功能：	验证密钥
//
//	入口参数：	cardnumber:选择卡1 or 卡2
//							cid:卡ID号
//							blockaddress:块地址
//							authtype: 验证密钥A or 密钥B
//							keys:密钥
//              
//	返回参数：	成功：true
//							失败：false
//
//	说明：		
//==========================================================
uint32_t authenticateBlock(uint8_t cardnumber /*1 or 2*/,uint32_t cid /*Card NUID*/, uint8_t blockaddress /*0 to 63*/,uint8_t authtype/*Either KEY_A or KEY_B */, uint8_t * keys) 
{
    pn532_packetbuffer[0] = PN532_INDATAEXCHANGE;
    pn532_packetbuffer[1] = cardnumber;  // either card 1 or 2 (tested for card 1)
    if(authtype == KEY_A)
    {
        pn532_packetbuffer[2] = PN532_AUTH_WITH_KEYA;
    }
    else
    {
        pn532_packetbuffer[2] = PN532_AUTH_WITH_KEYB;
    }
    pn532_packetbuffer[3] = blockaddress; //This address can be 0-63 for MIFARE 1K card

    pn532_packetbuffer[4] = keys[0];
    pn532_packetbuffer[5] = keys[1];
    pn532_packetbuffer[6] = keys[2];
    pn532_packetbuffer[7] = keys[3];
    pn532_packetbuffer[8] = keys[4];
    pn532_packetbuffer[9] = keys[5];

    pn532_packetbuffer[10] = ((cid >> 24) & 0xFF);
    pn532_packetbuffer[11] = ((cid >> 16) & 0xFF);
    pn532_packetbuffer[12] = ((cid >> 8) & 0xFF);
    pn532_packetbuffer[13] = ((cid >> 0) & 0xFF);

    if (! sendCommandCheckAck(pn532_packetbuffer, 14))
    {
				Data_Code[1] = Seq_Err;								//防冲撞错误
        return false;
    }
    // read data packet
    readspidata(pn532_packetbuffer, 2+6);

    if((pn532_packetbuffer[6] == 0x41) && (pn532_packetbuffer[7] == 0x00))
    {
        return true;
    }
    else
    {
        return false;
    }
}

//==========================================================
//	函数名称：	readMemoryBlock
//
//	函数功能：	读取块数据
//
//	入口参数：	cardnumber：选择卡1 or 卡2
//							blockaddress:块地址
//							block:存放数据的数组
//
//	返回参数：	成功：true
//							失败：false
//
//	说明：			
//==========================================================
uint32_t readMemoryBlock(uint8_t cardnumber /*1 or 2*/,uint8_t blockaddress /*0 to 63*/, uint8_t * block) 
{
    uint8_t i;
    pn532_packetbuffer[0] = PN532_INDATAEXCHANGE;
    pn532_packetbuffer[1] = cardnumber;  // either card 1 or 2 (tested for card 1)
    pn532_packetbuffer[2] = PN532_MIFARE_READ;
    pn532_packetbuffer[3] = blockaddress; //This address can be 0-63 for MIFARE 1K card

    if (! sendCommandCheckAck(pn532_packetbuffer, 4))
    {
        return false;
    }
    // read data packet
    readspidata(pn532_packetbuffer, 18+6);
    // check some basic stuff

    for(i=8;i<18+6;i++)
    {
        block[i-8] = pn532_packetbuffer[i];
    }
    if((pn532_packetbuffer[6] == 0x41) && (pn532_packetbuffer[7] == 0x00))
    {
        return true; //read successful
    }
    else
    {
        return false;
    }
}

//==========================================================
//	函数名称：	writeMemoryBlock
//
//	函数功能：	写入块数据
//
//	入口参数：	cardnumber：选择卡1 or 卡2
//							blockaddress:块地址
//							block:写入的数据
//
//	返回参数：	成功：true
//							失败：false
//
//	说明：		
//==========================================================
//Do not write to Sector Trailer Block unless you know what you are doing.
uint32_t writeMemoryBlock(uint8_t cardnumber /*1 or 2*/,uint8_t blockaddress /*0 to 63*/, uint8_t * block) 
{
    uint8_t byte;
    pn532_packetbuffer[0] = PN532_INDATAEXCHANGE;
    pn532_packetbuffer[1] = cardnumber;  // either card 1 or 2 (tested for card 1)
    pn532_packetbuffer[2] = PN532_MIFARE_WRITE;
    pn532_packetbuffer[3] = blockaddress;

    for(byte=0; byte <16; byte++)
    {
        pn532_packetbuffer[4+byte] = block[byte];
    }

    if (! sendCommandCheckAck(pn532_packetbuffer, 20))
    {
        return false;
    }
    // read data packet
    readspidata(pn532_packetbuffer, 2+6);

    if((pn532_packetbuffer[6] == 0x41) && (pn532_packetbuffer[7] == 0x00))
    {
        return true; //write successful
    }
    else
    {
        return false;
    }
}

//==========================================================
//	函数名称：	readPassiveTargetID
//
//	函数功能：	寻卡
//
//	入口参数：	卡号
//
//	返回参数：	成功：ID
//							失败：0x0
//
//	说明：			
//==========================================================
uint32_t readPassiveTargetID(uint8_t cardbaudrate)
{
    uint32_t cid = 0;
    uint16_t sens_res;
    uint8_t i;
    
    pn532_packetbuffer[0] = PN532_INLISTPASSIVETARGET;
    pn532_packetbuffer[1] = 1;  // max 1 cards at once (we can set this to 2 later)
    pn532_packetbuffer[2] = cardbaudrate;

    if (! sendCommandCheckAck(pn532_packetbuffer, 3))
    {
				Data_Code[1] = Car_DissExiste;				//找不到IC卡
        return 0x0;  // no cards read		
    }
#if 0
    //不能也可以的，但是只会读出数据数据，没有协议头
    //原本00 00 ff 0c f4 d5 4b 01 01 00 04 08 04 50 7e 7a 59 2d 00 aa 
    //只有01 01 00 04 08 04 50 7e 7a 59 2d 00 aa
    if(spi_readack())
    {
        delay_ms(1);
        readspidata(pn532_packetbuffer, 20);
    }
#else
    //读出这样00 00 ff 0c f4 d5 4b 01 01 00 04 08 04 50 7e 7a 59 2d 00 aa 
    readspidata(pn532_packetbuffer, 20);
#endif    

    if (pn532_packetbuffer[7] != 0x01)
    {
				Data_Code[1] = Car_DissExiste;				//找不到IC卡
        return 0;
    }
    
    sens_res = pn532_packetbuffer[9];
    sens_res <<= 8;
    sens_res |= pn532_packetbuffer[10];
    
    cid = 0;
    for (i=0; i< pn532_packetbuffer[12]; i++) 
    {
        cid <<= 8;
        cid |= pn532_packetbuffer[13+i];
    }
 
    return cid;
}


/************** high level SPI **************/

uint8_t spi_readack() 
{
    uint8_t ackbuff[6];

    readspidata(ackbuff, 6);

    return (0 == strncmp((char *)ackbuff, (char *)pn532ack, 6));
}

/************** mid level SPI */
 uint8_t sta;
uint8_t readspistatus(void) 
{  
    PN532_CSn_L;
    delay_us(2);
    spiwrite(PN532_SPI_STATREAD);
    
    sta = spiread();
    
    PN532_CSn_H;
    return sta;
}

void readspidata(uint8_t* buff, uint8_t n) 
{
    uint8_t i;
    
    PN532_CSn_L;
    delay_us(2);
    spiwrite(PN532_SPI_DATAREAD);

    for (i=0; i<n; i++) 
    {
        delay_us(1);
        buff[i] = spiread();
    }

    PN532_CSn_H;
}

void spiwritecommand(uint8_t* cmd, uint8_t cmdlen) 
{
    uint8_t checksum,i;
    uint8_t cmdlen_1;
    uint8_t checksum_1;
    
    cmdlen++;

    PN532_CSn_L;
    delay_us(20);     // or whatever the delay is for waking up the board
    spiwrite(PN532_SPI_DATAWRITE);

    checksum = PN532_PREAMBLE + PN532_PREAMBLE + PN532_STARTCODE2;
    spiwrite(PN532_PREAMBLE);
    spiwrite(PN532_PREAMBLE);
    spiwrite(PN532_STARTCODE2);

    spiwrite(cmdlen);
    cmdlen_1=~cmdlen + 1;
    spiwrite(cmdlen_1);

    spiwrite(PN532_HOSTTOPN532);
    checksum += PN532_HOSTTOPN532;



    for ( i=0; i<cmdlen-1; i++) 
    {
        spiwrite(cmd[i]);
        checksum += cmd[i];
    }
    checksum_1 = ~checksum;
    spiwrite(checksum_1);
    spiwrite(PN532_POSTAMBLE);
    PN532_CSn_H;


} 
/************** low level SPI */

void  spiwrite(uint8_t c) 
{
    SPI1_ReadWriteByte(c);
}

uint8_t spiread(void) 
{
    uint8_t x;
    x = SPI1_ReadWriteByte(0xff);
    return x;
}
