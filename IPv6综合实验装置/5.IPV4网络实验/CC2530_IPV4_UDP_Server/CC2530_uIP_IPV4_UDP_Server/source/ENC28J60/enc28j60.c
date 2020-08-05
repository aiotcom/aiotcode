/********************************************************************************
 * vim:sw=8:ts=8:si:et
 * To use the above modeline in vim you must have "set modeline" in your .vimrc
 * Author: Guido Socher 
 * Copyright: GPL V2
 * http://www.gnu.org/licenses/gpl.html
 *
 * Based on the enc28j60.c file from the AVRlib library by Pascal Stang.
 * For AVRlib See http://www.procyonengineering.com/
 * Used with explicit permission of Pascal Stang.
 *
 * Title: Microchip ENC28J60 Ethernet Interface Driver
 * Chip type           : ATMEGA88 with ENC28J60
 *******************************************************************************/
#include "enc28j60.h"
#include "spi_enc28j60.h"
#include "stdio.h"
static unsigned char Enc28j60Bank;
static unsigned int NextPacketPtr;


unsigned char enc28j60ReadOp(unsigned char op, unsigned char address)
{
    unsigned char dat = 0;
    
    ENC28J60_CSL();
    
    dat = op | (address & ADDR_MASK);//高3位操作码+低五位 寄存器地址
    SPI1_ReadWrite(dat);
    dat = SPI1_ReadWrite(0xFF);
    // do dummy read if needed (for mac and mii, see datasheet page 29)
    if(address & 0x80)//SPRD_MASK使能，根据该位来判断立即读还是要读第二字节。
    {
        dat = SPI1_ReadWrite(0xFF);	
    }
    // release CS
    ENC28J60_CSH();
    return dat;
}

unsigned char enc28j60ReadByteOp(unsigned char op, unsigned char address,unsigned char len,unsigned char *pRet)
{
    unsigned char dat = 0;
    
    ENC28J60_CSL();
    
    dat = op | (address & ADDR_MASK);//高3位操作码+低五位 寄存器地址
    SPI1_ReadWrite(dat);
//    dat = SPI1_ReadWrite(0xFF);
//    // do dummy read if needed (for mac and mii, see datasheet page 29)
//    if(address & 0x80)//SPRD_MASK使能，根据该位来判断立即读还是要读第二字节。
//    {
//        dat = SPI1_ReadWrite(0xFF);	
//    }
	  while(len)
		{
			*pRet = SPI1_ReadWrite(0xFF);
			 pRet++;
			 len--;
		}		
    // release CS
    ENC28J60_CSH();
    return dat;
}

void enc28j60WriteOp(unsigned char op, unsigned char address, unsigned char data)
{
    unsigned char dat = 0;
    
    ENC28J60_CSL();
    // issue write command
    dat = op | (address & ADDR_MASK);
    SPI1_ReadWrite(dat);
    // write data
    dat = data;
    SPI1_ReadWrite(dat);
    ENC28J60_CSH();
}
void enc28j60WriteByteOp(unsigned char op, unsigned char address, unsigned char *pdata,unsigned char len)
{
    unsigned char dat = 0;
    
    ENC28J60_CSL();
    // issue write command
    dat = op | (address & ADDR_MASK);
    SPI1_ReadWrite(dat);
    // write data
	  while(len)
		{
			dat = *pdata;
			SPI1_ReadWrite(dat);
			len--;
			pdata++;
		}
    ENC28J60_CSH();
}
void enc28j60ReadBuffer(unsigned int len, unsigned char* data)
{
    ENC28J60_CSL();
    // issue read command
    SPI1_ReadWrite(ENC28J60_READ_BUF_MEM);
    while(len)
    {
        len--;
        // read data
        *data = (unsigned char)SPI1_ReadWrite(0);
        data++;
    }
    *data='\0';
    ENC28J60_CSH();
}

void enc28j60WriteBuffer(unsigned int len, unsigned char* data)
{
    ENC28J60_CSL();
    // issue write command
    SPI1_ReadWrite(ENC28J60_WRITE_BUF_MEM);
    
    while(len)
    {
        len--;
        SPI1_ReadWrite(*data);
        data++;
    }
    ENC28J60_CSH();
}

void enc28j60SetBank(unsigned char address)
{
    // set the bank (if needed)
    if((address & BANK_MASK) != Enc28j60Bank)
    {
        // set the bank 位域操作
        enc28j60WriteOp(ENC28J60_BIT_FIELD_CLR, ECON1, (ECON1_BSEL1|ECON1_BSEL0));
        enc28j60WriteOp(ENC28J60_BIT_FIELD_SET, ECON1, (address & BANK_MASK)>>5);
        Enc28j60Bank = (address & BANK_MASK);
    }
}

unsigned char enc28j60Read(unsigned char address)
{
    // set the bank
    enc28j60SetBank(address);
    // do the read
    return enc28j60ReadOp(ENC28J60_READ_CTRL_REG, address);
}

void enc28j60Write(unsigned char address, unsigned char data)
{
    // set the bank
    enc28j60SetBank(address);
    // do the write
    enc28j60WriteOp(ENC28J60_WRITE_CTRL_REG, address, data);
}

void enc28j60PhyWrite(unsigned char address, unsigned int data)
{
    // set the PHY register address
    enc28j60Write(MIREGADR, address);
    // write the PHY data
    enc28j60Write(MIWRL, data);
    enc28j60Write(MIWRH, data>>8);
    // wait until the PHY write completes
    while(enc28j60Read(MISTAT) & MISTAT_BUSY)
    {
        //Del_10us(1);
        //_nop_();
    }
}
void ENC28J60_SetBits(uint8_t addr, uint8_t mask, uint8_t value)  
{  
    ENC28J60_CSL(); 
    SPI1_ReadWrite((addr & 0x1f) | value);  
    SPI1_ReadWrite(mask);  
    ENC28J60_CSH();   
}  
void ENC28J60_SelectBank(uint8_t bank)  
{  
    uint8_t value = enc28j60Read(ECON1);  
    bank &= ECON1_BSEL;  
    if ((value & ECON1_BSEL) != bank)  
    {  
        value = (value & ~ECON1_BSEL) | bank;  
        enc28j60Write(ECON1, value);  
    }  
}  
uint16_t ENC28J60_ReadPhy(uint8_t addr)  
{  
    uint16_t data;  
    ENC28J60_SelectBank(2);  
    enc28j60Write(MIREGADR, addr);  
    ENC28J60_SetBits(MICMD, MICMD_MIIRD, ENCSET);  
    ENC28J60_SelectBank(3);  
    while (enc28j60Read(MISTAT) & MISTAT_BUSY);  
    ENC28J60_SelectBank(2);  
    ENC28J60_SetBits(MICMD, MICMD_MIIRD, ENCCLR);  
    data = enc28j60Read(MIRDL);  
    data |= enc28j60Read(MIRDH) << 8;  
    return data;  
} 
static void delay_ms(uint32_t n)
{
    uint32_t t=1024;
	while(n--)
	{
	  	t = 1024;
		while(t--);
	}
}
void enc28j60clkout(unsigned char clk)
{
    //setup clkout. for instance:  clk->2 is 12.5MHz:
    enc28j60Write(ECOCON, clk & 0x7);
}
unsigned char EN_PHIE[2]={0x12,0x12};
unsigned int ret = 0xAAFF;
void enc28j60Init(unsigned char* macaddr)
{   
	  uint8_t retry=0;
      static uint8_t sta;
      ENC28J60_CSH();	      

    // perform system reset
    enc28j60WriteOp(ENC28J60_SOFT_RESET, 0, ENC28J60_SOFT_RESET);
   
    // check CLKRDY bit to see if reset is complete
    // The CLKRDY does not work. See Rev. B4 Silicon Errata point. Just wait.
	printf("ret=%d\r\n",ret);
    while(!(enc28j60Read(ESTAT) & ESTAT_CLKRDY)&&(retry <= 20))
	{
			delay_ms(1);//
			retry++;
    }
		
	if(retry>50)
	{
		
	}
    // do bank 0 stuff
    // initialize receive buffer
    // 16-bit transfers, must write low byte first
    // set receive buffer start address	   
    NextPacketPtr = RXSTART_INIT;
    // Rx start    
    enc28j60Write(ERXSTL, RXSTART_INIT&0xFF);	 
    enc28j60Write(ERXSTH, RXSTART_INIT>>8);
    // set receive pointer address     
    enc28j60Write(ERXRDPTL, RXSTART_INIT&0xFF);
    enc28j60Write(ERXRDPTH, RXSTART_INIT>>8);
    // RX end
    enc28j60Write(ERXNDL, RXSTOP_INIT&0xFF);
    enc28j60Write(ERXNDH, RXSTOP_INIT>>8);
    // TX start	  1500
    enc28j60Write(ETXSTL, TXSTART_INIT&0xFF);
    enc28j60Write(ETXSTH, TXSTART_INIT>>8);
    // TX end
    enc28j60Write(ETXNDL, TXSTOP_INIT&0xFF);
    enc28j60Write(ETXNDH, TXSTOP_INIT>>8);
    // do bank 1 stuff, packet filter:
    // For broadcast packets we allow only ARP packtets
    // All other packets should be unicast only for our mac (MAADR)
    //
    // The pattern to match on is therefore
    // Type     ETH.DST
    // ARP      BROADCAST
    // 06 08 -- ff ff ff ff ff ff -> ip checksum for theses bytes=f7f9
    // in binary these poitions are:11 0000 0011 1111
    // This is hex 303F->EPMM0=0x3f,EPMM1=0x30
    
    enc28j60Write(ERXFCON, ERXFCON_UCEN|ERXFCON_CRCEN|ERXFCON_PMEN);
    enc28j60Write(EPMM0, 0x3f);
    enc28j60Write(EPMM1, 0x30);
    enc28j60Write(EPMCSL, 0xf9);
    enc28j60Write(EPMCSH, 0xf7);    
    enc28j60Write(MACON1, MACON1_MARXEN|MACON1_TXPAUS|MACON1_RXPAUS);
    
   ret =  enc28j60Read(MACON1);
   printf("ret=%d\r\n",ret);
    // bring MAC out of reset 
    enc28j60Write(MACON2, 0x00);
    
    enc28j60WriteOp(ENC28J60_BIT_FIELD_SET, MACON3, MACON3_PADCFG0|MACON3_TXCRCEN|MACON3_FRMLNEN|MACON3_FULDPX);
    // set inter-frame gap (non-back-to-back)

    enc28j60Write(MAIPGL, 0x12);
    enc28j60Write(MAIPGH, 0x0C);
    // set inter-frame gap (back-to-back)

    enc28j60Write(MABBIPG, 0x15);
    // Set the maximum packet size which the controller will accept
    // Do not send packets longer than MAX_FRAMELEN:
  
    enc28j60Write(MAMXFLL, MAX_FRAMELEN&0xFF);	
    enc28j60Write(MAMXFLH, MAX_FRAMELEN>>8);
    // do bank 3 stuff
    // write MAC address
    // NOTE: MAC address in ENC28J60 is byte-backward
    enc28j60Write(MAADR5, macaddr[0]);	
    enc28j60Write(MAADR4, macaddr[1]);
    enc28j60Write(MAADR3, macaddr[2]);
    enc28j60Write(MAADR2, macaddr[3]);
    enc28j60Write(MAADR1, macaddr[4]);
    enc28j60Write(MAADR0, macaddr[5]);

    //配置PHY为全双工  LEDB为拉电流
    enc28j60PhyWrite(PHCON1, PHCON1_PDPXMD);    
    
    // no loopback of transmitted frames
    enc28j60PhyWrite(PHCON2, PHCON2_HDLDIS);

    // switch to bank 0    
    enc28j60SetBank(ECON1);
//**************
   enc28j60PhyWrite(PHIE,0x12);
	 ret = ENC28J60_ReadPhy(PHIE);
//    enc28j60WriteByteOp(ENC28J60_WRITE_CTRL_REG,PHIE,&EN_PHIE[0],1);
//		enc28j60ReadByteOp(ENC28J60_READ_CTRL_REG, PHIE,1,EN_PHIE);
//***************
    // enable interrutps
	//EIE： 以太网中断允许寄存器
	//bit 7 INTIE： 全局INT 中断允许位
	//1 = 允许中断事件驱动INT 引脚
	//0 = 禁止所有INT 引脚的活动（引脚始终被驱动为高电平）
	//bit 6 PKTIE： 接收数据包待处理中断允许位
	//1 = 允许接收数据包待处理中断
	//0 = 禁止接收数据包待处理中断	
//bit 4 LINKIE: Link Status Change Interrupt Enable bit
//1 = Enable link change interrupt from the PHY
//0 = Disable link change interrupt	
   enc28j60WriteOp(ENC28J60_BIT_FIELD_SET, EIE, EIE_INTIE|EIE_LINKIE);
// enc28j60WriteOp(ENC28J60_BIT_FIELD_CLR, EIE, EIE_INTIE|EIE_LINKIE);
    // enable packet reception
    enc28j60WriteOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_RXEN);
}

// read the revision of the chip:
unsigned char enc28j60getrev(void)
{
    //在EREVID 内也存储了版本信息。 EREVID 是一个只读控
    //制寄存器，包含一个5 位标识符，用来标识器件特定硅片
    //的版本号
    return(enc28j60Read(EREVID));
}

void enc28j60PacketSend(unsigned int len, unsigned char* packet)
{
    // Set the write pointer to start of transmit buffer area
    enc28j60Write(EWRPTL, TXSTART_INIT&0xFF);
    enc28j60Write(EWRPTH, TXSTART_INIT>>8);
    
    // Set the TXND pointer to correspond to the packet size given
    enc28j60Write(ETXNDL, (TXSTART_INIT+len)&0xFF);
    enc28j60Write(ETXNDH, (TXSTART_INIT+len)>>8);
    
    // write per-packet control byte (0x00 means use macon3 settings)
    enc28j60WriteOp(ENC28J60_WRITE_BUF_MEM, 0, 0x00);
    
    // copy the packet into the transmit buffer
    enc28j60WriteBuffer(len, packet);
    
    // send the contents of the transmit buffer onto the network
    enc28j60WriteOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_TXRTS);
    
    // Reset the transmit logic problem. See Rev. B4 Silicon Errata point 12.
    if( (enc28j60Read(EIR) & EIR_TXERIF) )
    {
        enc28j60WriteOp(ENC28J60_BIT_FIELD_CLR, ECON1, ECON1_TXRTS);
    }
}

// Gets a packet from the network receive buffer, if one is available.
// The packet will by headed by an ethernet header.
//      maxlen  The maximum acceptable length of a retrieved packet.
//      packet  Pointer where packet data should be stored.
// Returns: Packet length in bytes if a packet was retrieved, zero otherwise.
unsigned int enc28j60PacketReceive(unsigned int maxlen, unsigned char* packet)
{
    unsigned int rxstat;
    unsigned int len;
    
    // check if a packet has been received and buffered
    //if( !(enc28j60Read(EIR) & EIR_PKTIF) ){
    // The above does not work. See Rev. B4 Silicon Errata point 6.
    if( enc28j60Read(EPKTCNT) ==0 )  //收到的以太网数据包长度
    {
        return(0);
    }
    
    // Set the read pointer to the start of the received packet		 缓冲器读指针
    enc28j60Write(ERDPTL, (NextPacketPtr));
    enc28j60Write(ERDPTH, (NextPacketPtr)>>8);
    
    // read the next packet pointer
    NextPacketPtr  = enc28j60ReadOp(ENC28J60_READ_BUF_MEM, 0);
    NextPacketPtr |= enc28j60ReadOp(ENC28J60_READ_BUF_MEM, 0)<<8;
    
    // read the packet length (see datasheet page 43)
    len  = enc28j60ReadOp(ENC28J60_READ_BUF_MEM, 0);
    len |= enc28j60ReadOp(ENC28J60_READ_BUF_MEM, 0)<<8;
    
    len-=4; //remove the CRC count
    // read the receive status (see datasheet page 43)
    rxstat  = enc28j60ReadOp(ENC28J60_READ_BUF_MEM, 0);
    rxstat |= enc28j60ReadOp(ENC28J60_READ_BUF_MEM, 0)<<8;
    // limit retrieve length
    if (len>maxlen-1)
    {
        len=maxlen-1;
    }
    
    // check CRC and symbol errors (see datasheet page 44, table 7-3):
    // The ERXFCON.CRCEN is set by default. Normally we should not
    // need to check this.
    if ((rxstat & 0x80)==0)
    {
        // invalid
        len=0;
    }
    else
    {
        // copy the packet from the receive buffer
        enc28j60ReadBuffer(len, packet);
    }
    // Move the RX read pointer to the start of the next received packet
    // This frees the memory we just read out
    enc28j60Write(ERXRDPTL, (NextPacketPtr));
    enc28j60Write(ERXRDPTH, (NextPacketPtr)>>8);
    
    // decrement the packet counter indicate we are done with this packet
    enc28j60WriteOp(ENC28J60_BIT_FIELD_SET, ECON2, ECON2_PKTDEC);
    return(len);
}




