#include "stm32f1xx.h"
#include "string.h"
#include "delay.h"
#include "NFC.h"
#include "PN532.h"

#define PN532_CSn_L       HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_RESET)
#define PN532_CSn_H       HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_SET)
#define PN532_ReadResetSta()   HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_0)
#define CC2500_MI  (GPIOA->IDR & GPIO_PIN_6)//HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_6)
#define CC_MISO    GPIO_PIN_6 

/* SPI1 init function */
SPI_HandleTypeDef hspi1;
static void MX_SPI1_Init(void)
{
  /* SPI1 parameter configuration*/
  hspi1.Instance               = SPI1;
  hspi1.Init.Mode              = SPI_MODE_MASTER;
  hspi1.Init.Direction         = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize          = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity       = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase          = SPI_PHASE_1EDGE;
  hspi1.Init.NSS               = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_128;
  hspi1.Init.FirstBit          = SPI_FIRSTBIT_LSB;
  hspi1.Init.TIMode            = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation    = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial     = 7;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    while(1);
  }
  
}
void HAL_SPI_MspInit(SPI_HandleTypeDef* hspi)
{
  GPIO_InitTypeDef GPIO_InitStruct;
  if(hspi->Instance==SPI1)
  {
  /* USER CODE BEGIN SPI1_MspInit 0 */

  /* USER CODE END SPI1_MspInit 0 */
    /* Peripheral clock enable */
    __HAL_RCC_SPI1_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE(); 
      
    /**SPI1 GPIO Configuration    
    PA5     ------> SPI1_SCK
    PA6     ------> SPI1_MISO
    PA7     ------> SPI1_MOSI 
    */
    GPIO_InitStruct.Pin = GPIO_PIN_5|GPIO_PIN_7;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = GPIO_PIN_6;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
      
    GPIO_InitStruct.Pin   = GPIO_PIN_4;
    GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull  = GPIO_PULLUP;     
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct); 
    PN532_CSn_H;
  /* USER CODE BEGIN SPI1_MspInit 1 */

  /* USER CODE END SPI1_MspInit 1 */
  }

}
//==========================================================
//	函数名称：	_ByteSwap
//
//	函数功能：	将一个字节的数据，高低位交换。
//
//	入口参数：	uint8_t theByte，期望进行位交换的字节
//
//	返回参数：	uint8_t 返回交换之后的数。
//
//	说明：		例theByte=0xAA（1010 1010）转换后，theByte=0x55(0101 0101)
//==========================================================
uint8_t _ByteSwap(uint8_t theByte)
{
    uint8_t loop = 7,flg=0;
    while(loop--)
    {
        flg = 0;
        if(theByte&0x01)
        {
            flg = 0x01 << 7;
        }
        theByte = theByte >> 1;
        theByte = theByte | flg;
    }
    return theByte;
}
//==========================================================
//	函数名称：	SPI1_ReadWriteByte
//
//	函数功能：	通过SPI1发送一个字节，并返回接收的一个字节。
//
//	入口参数：	u8 TxData，期望发送的数据
//
//	返回参数：	uint8_t 返回的数。
//
//	说明：
//==========================================================
HAL_StatusTypeDef error;
u8 SPI1_ReadWriteByte(u8 TxData)
{
    u8 Rxdata;
    delay_us(10);
    //TxData = _ByteSwap(TxData);
    error  =  HAL_SPI_TransmitReceive(&hspi1,&TxData,&Rxdata,1, 1000); 
 	return Rxdata;          		    //返回收到的数据		
}
uint8_t gStatus = 0xAA;
uint8_t ReadStatus(void)
{
    uint8_t cmd=0x02;//0000 0010
    PN532_CSn_L;
    SPI1_ReadWriteByte(cmd);
    gStatus = SPI1_ReadWriteByte(0xff);
    PN532_CSn_H;
    return gStatus;
} 

void PN532_IO_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStruct; 
    __HAL_RCC_GPIOA_CLK_ENABLE(); 

    GPIO_InitStruct.Pin = GPIO_PIN_0;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

void PN532_Init(void)
{
    MX_SPI1_Init();
    PN532_IO_Init();
    //while(!PN532_ReadResetSta());//PA0读出是零表明在复位中。
}

u8 PN532_RxBuffer[500];	//接收缓存
u16 PN532_RXCounter;	//接收到串口数据量
u8 flag_rev_finish;		//串口接收到数据的标志， 1为接收到


u8 UID[4];		   		//存储 UID
u8 KeyBuf[6] = {0xff,0xff,0xff,0xff,0xff,0xff};
u8 BlockBuf[16];

void delay_10ms(u16 n10ms)
{
    delay_ms(10*n10ms);
}
//往USART1，发送 length长度的数据data
void SendData(u8 *data,u8 length)
{
    u8 i;
    for(i=0;i<length;i++)
    {
//        USART_SendData(USART1, data[i]);
//        while(USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET);//等待发送完成 
    }
}

void CleanBuffer(u16 num)//清零 前 多少个字节的数据
{
    u16 i=0;
    
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
u8 SAMConfiguration(u8 mode,u8 timeout,u8 irq)
{
    u8 data[30];
    u8 i;
    u8 CheckCode=0; //数据校验码
    u8 temp=0;
  
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
        
        SendData(data,26);//往USART3，发送 length长度的数据data
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
u8  nfc_InListPassiveTarget(u8 maxTag,u8 brty,u8 *CardID)
{
    u8 data[11];
    u8 i;
    u8 CheckCode=0; //数据校验码
    u8 temp=0;
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
        
        SendData(data,11);//往USART1，发送 length长度的数据data
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
    u8 AuthenticationType ：0x60 / 0x61 Authentication A / Authentication B
	u8 BlockNo：	0~63
	u8 * KeyData ：  卡密钥   
	u8 *SerialNum: 卡序列号	  
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
u8  nfc_PsdVerify(u8 AuthenticationType,u8 BlockNo,u8 * KeyData,u8 *SerialNum)
{
    u8 data[22];
    u8 temp=0; 
    u8 i;
    u8 CheckCode=0; //数据校验码
    
    
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
    SendData(data,22);
     
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
	u8 BlockNo：	   0~63
	u8 *BlockData ：  卡数据   
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
u8  nfc_read(u8 BlockNO,u8 *ReadData)
{
    u8 data[12];
    u8 temp=0; 
    u8 i;
    u8 CheckCode=0; //数据校验码

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

    SendData(data,12);
    
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
	u8 BlockNo：	   0~63
	u8 * BlockData ：  卡数据   
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
u8  nfc_write(u8 BlockNO,u8 *WriteData)
{
    u8 data[28];
    u8 temp=0;
    u8 i;
    u8 CheckCode=0;
    
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

    SendData(data,28);
    
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
/**************************************************************************************
函数名：  nfc_getIdentityID
函数功能：获取身份证UID
输入参数：
	u8 *identityid  
输出参数：
 	成功：TRUE
 	失败：FALSE
*****************************************************************************************/
#if 0
u8 	nfc_getIdentityID(u8 *identityid)
{
   
}
#endif

