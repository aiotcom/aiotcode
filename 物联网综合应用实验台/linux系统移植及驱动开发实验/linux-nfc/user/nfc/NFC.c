#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/select.h>
#include <sys/time.h>
#include <errno.h>
#include "string.h"
#define msleep(n) usleep(n*1000)
#include "NFC.h"
#include "PN532.h"

#define NFC_MAGIC 'k'
#define IOCTRL_CMD_CS        _IOW(NFC_MAGIC, 1, int)
#define IOCTRL_CMD_RST       _IOW(NFC_MAGIC, 2, int)
#define IOCTRL_CMD_READ_RST  _IOW(NFC_MAGIC, 3, int) 

unsigned char SPI1_WriteByte(unsigned char TxData);
unsigned char SPI1_ReadByte(void);
const unsigned int arg_0=0,arg_1=1;
int nfc_fd;
//==========================================================
//	函数名称：	void macnfc_Reset_Disable()
//
//	函数功能：	停步复位
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void macnfc_Reset_Disable(void)
{
	ioctl(nfc_fd, IOCTRL_CMD_RST, &arg_1);		
}
//==========================================================
//	函数名称：	void macnfc_Reset_Enable()
//
//	函数功能：	使能复位
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================	
void macnfc_Reset_Enable(void)
{
	ioctl(nfc_fd, IOCTRL_CMD_RST, &arg_0);		
}
//==========================================================
//	函数名称：	void PN532_CSn_H(void)
//
//	函数功能：	停止片选
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void PN532_CSn_H(void)
{
	ioctl(nfc_fd, IOCTRL_CMD_CS, &arg_1);	
}
//==========================================================
//	函数名称：	void PN532_CSn_L(void)
//
//	函数功能：	使能片选
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void PN532_CSn_L(void)
{
	ioctl(nfc_fd, IOCTRL_CMD_CS, &arg_0);	
}
//==========================================================
//	函数名称：	SPI1_ReadWriteByte
//
//	函数功能：	通过SPI1发送一个字节，并返回接收的一个字节。
//
//	入口参数：	unsigned char TxData，期望发送的数据
//
//	返回参数：	unsigned char 返回的数。
//
//	说明：
//==========================================================
unsigned char SPI1_WriteByte(unsigned char TxData)
{
    unsigned char Rxdata;
    usleep(10);
	Rxdata = write(nfc_fd,&TxData,1);
 	return Rxdata;          		    //返回收到的数据		
}
unsigned char SPI1_ReadByte(void)
{
    unsigned char Rxdata;
    usleep(10);
	read(nfc_fd,&Rxdata,1);
 	return Rxdata;          		    //返回收到的数据		
}
/*****************以上都是与移植的驱动部分的代码************************/
/*****************以上都是与移植的驱动部分的代码************************/
/*****************以上都是与移植的驱动部分的代码************************/
void nfc_init(void)
{
	nfc_fd = open("/dev/nfc", O_RDWR);
	if (nfc_fd < 0) {
		perror("**/dev/nfc\r\n");
		exit(1);
	}
	
	msleep(100);
	PN532_CSn_L();
	msleep(100);
	PN532_CSn_H();
	printf("init nfc\r\n");
}
void nfc_close(void)
{
	close(nfc_fd);
}
unsigned char gStatus = 0xAA;
unsigned char ReadStatus(void)
{
    unsigned char cmd=0x02;//0000 0010
    PN532_CSn_L();
    SPI1_WriteByte(cmd);
    gStatus = SPI1_ReadByte();
	printf("gStatus=%d\r\n",gStatus);
    PN532_CSn_H();
    return gStatus;
} 

unsigned char PN532_RxBuffer[500];	//接收缓存
unsigned short PN532_RXCounter;	//接收到串口数据量
unsigned char flag_rev_finish;		//串口接收到数据的标志， 1为接收到


unsigned char UID[4];		   		//存储 UID
unsigned char KeyBuf[6] = {0xff,0xff,0xff,0xff,0xff,0xff};
unsigned char BlockBuf[16];

void delay_10ms(unsigned short n10ms)
{
    msleep(10*n10ms);
}

void CleanBuffer(unsigned short num)//清零 前 多少个字节的数据
{
    unsigned short i=0;
    
    for(i=0;i<num;i++)PN532_RxBuffer[i]=0x00;
}
/*********************************************************************************************************
函数名：  SAMConfiguration
函数功能：设置PN532的内部参数
输入参数：
	mode: defines the way of using the SAM
      	0x01:normal mode
      	0x02:virtual mode
      	0x03:wired mode
      	0x04:dual mode
 	timeout:
      	0x00:不使用timeout
      	0x01-0xFF：超时值
 	irq:
      	0x00：不使用P70_IRQ
      	0x01：使用P70_IRQ
输出参数：
 	成功：TRUE
 	失败：FALSE
**********************************************************************************************************/
unsigned char SAMConfiguration(unsigned char mode,unsigned char timeout,unsigned char irq)
{
    unsigned char data[30];
    unsigned char i;
    unsigned char CheckCode=0; //数据校验码
    unsigned char temp=0;
  
    while(1)
    { 
        flag_rev_finish=0;
        //PN532 wakeup
		data[0]=0x55;
        data[1]=0x55;
        data[2]=0x00;
        data[3]=0x00;
        data[4]=0x00;
        data[5]=0x00;
        data[6]=0x00;
        data[7]=0x00;
        data[8]=0x00;
        data[9]=0x00;
        data[10]=0x00;
        data[11]=0x00;
        data[12]=0x00;
        data[13]=0x00;
        
		data[14]=0x00;	 //帧头
		data[15]=0x00;
        data[16]=0xFF;
       
	    data[17]=0x05; 			 //包 长度
        data[18]=0x100-data[17]; //包 长度 校验  0x100-data[3]
		
		data[19]=0xD4; //方向标识
		data[20]=0x14; //命令标识码
		data[21]= mode;
		data[22]= timeout;
		data[23]= irq;

		temp = 	data[19]+ data[20] + data[21] + data[22] + data[23];
        data[24]=0x100 - temp; //数据 校验   0x100-
        data[25]=0x00;
        
		delay_10ms(18); 
       
   		
		//00 00 FF 00 FF 00 00 00 FF 02 FE D5 15 16 00    
        if(flag_rev_finish)
        {         
            flag_rev_finish=0;
			temp = 0;
            for(i=11;i<13;i++)
            {
                temp+=PN532_RxBuffer[i];
            }
            CheckCode=0x100-temp;
            if(CheckCode==PN532_RxBuffer[13])
            {
                CleanBuffer(40);//清除 串口接收缓冲区前30 个字节数据
                return 1; 
            }
			return 0;
        }
		return 0;
		
    }
}

/**************************************************************************************
函数名：  InListPassiveTarget
函数功能：PN532检测卡
输入参数：
	maxTag:
            PN532最大初始化卡的个数，PN532一次只能同时处理2张卡         
 	brty:
            0x00 : 106 kbps type A (ISO/IEC14443 Type A),
            0x01 : 212 kbps (FeliCa polling),
            0x02 : 424 kbps (FeliCa polling),
            0x03 : 106 kbps type B (ISO/IEC14443-3B),
            0x04 : 106 kbps Innovision Jewel tag.
	*CardID  
			卡片原始序列号
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
unsigned char  nfc_InListPassiveTarget(unsigned char maxTag,unsigned char brty,unsigned char *CardID)
{
    unsigned char data[11];
    unsigned char i;
    unsigned char CheckCode=0; //数据校验码
    unsigned char temp=0;
    {   
        flag_rev_finish=0;
        data[0]=0x00;  //帧头
        data[1]=0x00;  //起始标志
        data[2]=0xFF;
        data[3]=0x04;  //包长度
        data[4]=0xFC;  //包长度 校验  0x100-data[3]
        
		data[5]=0xD4;  //方向标识码
        data[6]=0x4A;  //命令标识码
        data[7]=maxTag;
        data[8]=brty;
        
		data[9]=0x100 - data[5] - data[6] - data[7] - data[8];  //数据校验
        data[10]=0x00;
        
	    delay_10ms(18); 
      
        temp=0;
        if(flag_rev_finish)
        {         
            flag_rev_finish=0;
			if((PN532_RxBuffer[12] == 0x4b) && (PN532_RxBuffer[13] != 0))
            {
				for(i=11;i<23;i++)
	            {
	                temp+=PN532_RxBuffer[i];
	            }
	            CheckCode=0x100-temp;
	            if(CheckCode==PN532_RxBuffer[23])
	            {
	                CardID[0]=PN532_RxBuffer[19];
	                CardID[1]=PN532_RxBuffer[20];
	                CardID[2]=PN532_RxBuffer[21];
	                CardID[3]=PN532_RxBuffer[22]; 
					//IndicateOn(1,1,1);
					CleanBuffer(40);//清除 串口接收缓冲区前30 个字节数据 
	                return 1;
	            }
			}
			CleanBuffer(40);
        }
		return 0;
		
    }
}

/**************************************************************************************
函数名：  nfc_PsdVerify
函数功能：Mifare 卡认证,对某一块验证通过后都可以对其所属的扇区所有的块进行读写操作
输入参数：
    unsigned char AuthenticationType ：0x60 / 0x61 Authentication A / Authentication B
	unsigned char BlockNo：	0~63
	unsigned char * KeyData ：  卡密钥   
	unsigned char *SerialNum: 卡序列号	  
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
unsigned char  nfc_PsdVerify(unsigned char AuthenticationType,unsigned char BlockNo,unsigned char * KeyData,unsigned char *SerialNum)
{
    unsigned char data[22];
    unsigned char temp=0; 
    unsigned char i;
    unsigned char CheckCode=0; //数据校验码
    
    
    flag_rev_finish=0;
    data[0]=0x00;
    data[1]=0x00;
    data[2]=0xFF;
    
    data[3]=0x0F; //包 长度
    data[4]=0xF1; //包 长度 校验  0x100-data[3]
    
    data[5]=0xD4; //命令标识码
    data[6]=0x40; //命令标识码
    
    data[7]=0x01;
    data[8]=AuthenticationType;    //KeyA 认证
    data[9]=BlockNo;  			   //块号
    
    memcpy(&data[10],KeyData,6);   //密钥
	memcpy(&data[16],SerialNum,4); //卡片原始序列号
    for(i=5;i<20;i++)
    {
        temp+=data[i];
    }
    data[20]=0x100-temp;   
    data[21]=0x00;
     
    delay_10ms(18);

    temp=0;
    for(i=11;i<14;i++)
    {
        temp+=PN532_RxBuffer[i];
    }
    CheckCode=0x100-temp;
	//41 00
    if(CheckCode==PN532_RxBuffer[14])
    {
       if((PN532_RxBuffer[13]==0x00) && (PN532_RxBuffer[12]==0x41))	//认证成功
       {
		 CleanBuffer(40);//清除 串口接收缓冲区前40 个字节数据
		 return 1;
       }
    }
	return 0;
}

/**************************************************************************************
函数名：  nfc_read
函数功能：Mifare 读块内容
输入参数：
	unsigned char BlockNo：	   0~63
	unsigned char *BlockData ：  卡数据   
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
unsigned char  nfc_read(unsigned char BlockNO,unsigned char *ReadData)
{
    unsigned char data[12];
    unsigned char temp=0; 
    unsigned char i;
    unsigned char CheckCode=0; //数据校验码

    flag_rev_finish=0;
    data[0]=0x00;
    data[1]=0x00;
    data[2]=0xFF;
    
    data[3]=0x05; //包 长度
    data[4]=0xFB; //包 长度 校验  0x100-data[3]
    
    data[5]=0xD4; //命令标识码
    data[6]=0x40; //命令标识码
    
    data[7]=0x01;
    data[8]=0x30;
    data[9]=BlockNO; //读第二块的16字节数据 
    
    temp=0;
    for(i=5;i<10;i++)
    {
        temp+=data[i];
    }
	data[10]=0x100-temp; 
    data[11]=0x00;
    
    delay_10ms(18);
  
    temp=0;
    for(i=11;i<30;i++)
    {
        temp+=PN532_RxBuffer[i];
    }
    CheckCode=0x100-temp;
    if(CheckCode==PN532_RxBuffer[30])
    {              
        if((PN532_RxBuffer[13]==0x00) && (PN532_RxBuffer[12]==0x41))
		{
			memcpy(ReadData,&PN532_RxBuffer[14],16);
			CleanBuffer(40);
			return 1;
		}
    }
	CleanBuffer(40);
	return 0;
}
/**************************************************************************************
函数名：  nfc_write
函数功能：Mifare 写块内容
输入参数：
	unsigned char BlockNo：	   0~63
	unsigned char * BlockData ：  卡数据   
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
unsigned char  nfc_write(unsigned char BlockNO,unsigned char *WriteData)
{
    unsigned char data[28];
    unsigned char temp=0;
    unsigned char i;
    unsigned char CheckCode=0;
    
    data[0]=0x00;
    data[1]=0x00;
    data[2]=0xFF;
    
    data[3]=0x15; //包 长度
    data[4]=0xEB; //包 长度 校验  0x100-data[3]
    
    data[5]=0xD4; //命令标识码
    data[6]=0x40; //命令标识码
    
    data[7]=0x01; //读写大于6字节 就置1，看手册
    data[8]=0xA0; //写
    data[9]=BlockNO; //写第二块的16字节数据 
    
    memcpy(&data[10],WriteData,16);

    
    for(i=5;i<26;i++)
    {
        temp+=data[i];
    }
    data[26]=0x100-temp; 
    data[27]=0x00;
    
    delay_10ms(18);

    temp=0;
    for(i=11;i<14;i++)
    {
        temp+=PN532_RxBuffer[i];
    }
    CheckCode=0x100-temp;
    if(CheckCode==PN532_RxBuffer[14])
    {
         if((PN532_RxBuffer[13]==0x00) && (PN532_RxBuffer[12]==0x41))
         {
			 CleanBuffer(40);//清除 串口接收缓冲区前40 个字节数据
			 return 1;
         }
    }
	CleanBuffer(40);
	return 0;
}

