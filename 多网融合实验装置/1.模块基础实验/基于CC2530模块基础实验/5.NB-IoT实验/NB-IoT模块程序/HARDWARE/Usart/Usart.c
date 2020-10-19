#include "Usart.h"	
#include "delay.h"
#include "M5310.h"
#include "Rs485.h"
#include "Time.h"

#if UART0   //使能接收

uint8_t USART0_RecvBuffer[USART0_RECV_BUFFER_LENGTH]={0};
uint16_t USART0_RecvIndex =0;

//==========================================================
//	函数名称：	USRT0_Init()
//
//	函数功能：	初始化串口0
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void USRT0_Init(void)
{
  PERCFG = 0x00;    //串口0的引脚映射到位置1，即P0_2和P0_3
  P0SEL = 0x0C;     //将P0_2和P0_3端口设置成外设功能
  U0BAUD = 59;      //32MHz的系统时钟产生9600BPS的波特率
  U0GCR = 8;
  U0UCR |= 0x80;    //禁止流控，8位数据，清除缓冲器
  U0CSR |= 0xC0;    //选择UART模式，使能接收器
  UTX0IF = 0;       //清除TX发送中断标志
  URX0IF = 0;       //清除RX接收中断标志
  URX0IE = 1;       //使能URAT0的接收中断
  EA = 1;           //使能总中断
}

//==========================================================
//	函数名称：	UR0_RecvInt()
//
//	函数功能：	串口0接收中断服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
#pragma vector = URX0_VECTOR
__interrupt void UR0_RecvInt()
{
  URX0IF = 0;                     //清除RX接收中断标志

  USART0_RecvBuffer[USART0_RecvIndex++] = U0DBUF;//读取数据寄存器中的数据。

  if((USART0_RecvIndex>=2)&&(USART0_RecvBuffer[USART0_RecvIndex-2] == '\r')&&(USART0_RecvBuffer[USART0_RecvIndex-1] == '\n'))
  {
      USART0_RecvIndex = 0;
  }
  if(USART0_RecvIndex >= (USART0_RECV_BUFFER_LENGTH-1))//USART0_RecvIndex 大于或者等于USART0_RECV_BUFFER_LENGTH，超出USART0_RecvBuffer[]数据的范围
  {
      USART0_RecvIndex = 0;
  }
}

//==========================================================
//	函数名称：	USART0_SendByte()
//
//	函数功能：	串口0发送单字节函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void USART0_SendByte(unsigned char dat)
{
  U0DBUF = dat;         //将要发送的1字节数据写入U0DBUF
  while(!UTX0IF);       //等待TX中断标志，即数据发送完成
  UTX0IF = 0;           //清除TX中断标志，准备下一次发送
}

//==========================================================
//	函数名称：	USART0_SendBytes()
//
//	函数功能：	串口0发送字符串函数
//
//	入口参数：	*str: 发送的数据
//                      Len:  数据长度
//          
//	返回参数：	无
//
//	说明：		
//==========================================================
void USART0_SendBytes(char *pdata,uint16_t lenght)
{
  while(lenght--)
  {
    USART0_SendByte(*pdata++);    //逐个发送字符串中的字节
  }
}


#endif


#if UART1   //使能接收

unsigned char USART1_RX_BUF[USART1_REC_LEN];    //接收缓冲,最大USART1_REC_LEN个字节.
unsigned int  USART1_RX_STA=0;       		//接收状态标记	

//==========================================================
//	函数名称：	USRT1_Init()
//
//	函数功能：	串口1初始化函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void USRT1_Init(void)
{
  P2DIR = 0x40;
  PERCFG = 0x00;    //串口1的引脚映射到位置1，即P0_4和P0_5
  P0SEL |= 0x30;    //将P0_4和P0_5端口设置成外设功能
  U1BAUD = 216;     //32MHz的系统时钟产生115200BPS的波特率
  U1GCR = 11;
  U1UCR = 0x80;     //禁止流控，8位数据，清除缓冲器
  U1CSR = 0xC0;     //选择UART模式，使能接收器
  UTX1IF = 0;       //清除TX发送中断标志
  URX1IF = 0;       //清除RX接收中断标志
  URX1IE = 1;       //使能URAT1的接收中断
  EA = 1;           //使能总中断
}

//==========================================================
//	函数名称：	UR1_RecvInt()
//
//	函数功能：	UR1接收中断服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
#pragma vector = URX1_VECTOR
__interrupt void UR1_RecvInt()
{
  URX1IF = 0;                   //清除RX接收中断标志
  
  if((USART1_RX_STA&0x8000)==0)	//接收未完成
  {
      Rs485_Receive(U1DBUF);	//进入485接收函数
  } 
}

//==========================================================
//	函数名称：	USART1_SendByte()
//
//	函数功能：	串口1发送单字节函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void USART1_SendByte(unsigned char dat)
{
  U1DBUF = dat;         //将要发送的1字节数据写入U1DBUF
  while(!UTX1IF);       //等待TX中断标志，即数据发送完成
  UTX1IF = 0;           //清除TX中断标志，准备下一次发送
}

//==========================================================
//	函数名称：	USART1_SendString()
//
//	函数功能：	串口1发送字符串函数
//
//	入口参数：	*str: 发送的数据
//                      Len:  数据长度
//          
//	返回参数：	无
//
//	说明：          
//==========================================================
void USART1_SendString(unsigned char *str,uint16_t Len)
{
  while(Len--)
  {
    USART1_SendByte(*str++);    //逐个发送字符串中的字节
  }
}

//==========================================================
//	函数名称：	USART1_IRQHand()
//
//	函数功能：	处理485数据
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void USART1_IRQHand(void)
{
  static uint8_t SendOneNET[10];
  static uint16_t Light_Intensity;
  
  if(!DataHandling_485(Addr_NB))	//处理485中传输给NB模块的数据
  {
    if(Rx_Stack.Src_Adr == Addr_SHT20)	//处理温湿度光强数据
    {
      memset((void*)SendOneNET,0,10);
      sprintf((char *)SendOneNET,"%0.2f",(float)Rx_Stack.Data[0]);
      m5310_notify_upload(&temp_uri,NBIOT_FLOAT,(char*)&SendOneNET[0],1,0);//上传温度数据
      
      memset((void*)SendOneNET,0,10);
      sprintf((char *)SendOneNET,"%0.2f",(float)Rx_Stack.Data[1]);
      m5310_notify_upload(&humi_uri,NBIOT_FLOAT,(char*)&SendOneNET[0],1,0);//上传湿度数据
      
      memset((void*)SendOneNET,0,10);
      Light_Intensity = Rx_Stack.Data[2]*256+Rx_Stack.Data[3];
      sprintf((char *)SendOneNET,"%0.0f",(float)Light_Intensity);
      m5310_notify_upload(&illum_uri,NBIOT_FLOAT,(char*)&SendOneNET[0],1,0);//上传光强数据
    }
  }
}

#endif

//==========================================================
//	函数名称：	USART_Data_Send()
//
//	函数功能：	串口数据发送函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：          
//==========================================================
void USART_Data_Send(void)
{
  if(Task_Count>=500)   //500ms	获取温湿度、光强数据
  {
    Rs485_Send(Addr_NB,Addr_SHT20,SHT20_Get_All,0,"");
    Task_Count = 0;
  }
}
