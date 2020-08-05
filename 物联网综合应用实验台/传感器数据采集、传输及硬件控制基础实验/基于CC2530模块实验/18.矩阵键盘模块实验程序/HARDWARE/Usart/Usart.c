#include "Martix_Key.h"	
#include "Usart.h"	
#include "delay.h"
#include "Rs485.h"
#include "OLED.h"

#if UART0   //使能接收

unsigned char WiFi_AT_STA = 0;                  //WiFi初始化完成标志位
unsigned char USART0_RX_BUF[USART0_REC_LEN];    //接收缓冲,最大USART0_REC_LEN个字节.
unsigned int  USART0_RX_STA = 0;       		//接收状态标记	
uint8_t Command_LED[10];		        //控制LED灯命令码

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
  U0BAUD = 216;     //32MHz的系统时钟产生115200BPS的波特率
  U0GCR = 11;
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
  URX0IF = 0;                             //清除RX接收中断标志

  if((USART0_RX_STA&0x8000)==0)	          //接收未完成
  {
    if(WiFi_AT_STA)                       //WiFi初始化完毕
    {
        USART0_Receive(U0DBUF);		  //串口0数据处理
    }
    else
    {
        USART0_RX_BUF[USART0_RX_STA&0X3FFF]=U0DBUF ;
        USART0_RX_STA++;
        if(USART0_RX_STA>(200-1))USART0_RX_STA=0;//接收数据错误,重新开始接收	  
    }
  } 
}

//==========================================================
//	函数名称：	USART0_Receive()
//
//	函数功能：	串口0接收
//
//	入口参数：	data:串口0数据
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void USART0_Receive(uint8_t data)
{
  static uint8_t End_Flag 	= 0;	//帧尾标志位
  static uint8_t Header_Flag 	= 0;	//帧头标志位
  static uint8_t Receive_Flag   = 0;	//接收标志位

/*
*
*	帧头接收
*
*/
  /*帧头1 数据帧头中第一个字节*/
  if(Header_Flag == 0 && data == 0x45)
  {
      USART0_RX_BUF[0] = data;
      Header_Flag = 1;
  }

  /*帧头2 数据帧头中第二个字节*/
  else if(Header_Flag == 1 && data == 0x41)
  {
      USART0_RX_STA = 1;  //存放数据数组下标清零
      Receive_Flag = 1;	  //开始接收数据标志位
  }

  else Header_Flag = 0;
  
/*
*
*	数据+帧尾接收
*
*/
  if(Receive_Flag)	//帧头接收完成
  {
      if(USART0_RX_STA>=199)
      {
          End_Flag = 0;
          Receive_Flag = 0;
          USART0_RX_STA = 0;
      }
      
      USART0_RX_BUF[USART0_RX_STA++] = data;//数据接收

      /*帧尾1  数据帧尾中第一个字节*/
      if(!End_Flag && data == 0x41)
      {	
          End_Flag = 1;
      }
      /*帧尾2  数据帧尾中第二个字节*/
      else if(End_Flag && data == 0x45)
      {
          USART0_RX_STA = 0x8000;	//接收完成
          Receive_Flag = 0;
          End_Flag = 0;
      }

      /*接收错误 重新接收*/
      else End_Flag = 0;
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
//	函数名称：	USART0_SendString()
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
void USART0_SendString(unsigned char *str,uint16_t Len)
{
  while(Len--)
  {
    USART0_SendByte(*str++);    //逐个发送字符串中的字节
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
  
  Rs485_Send("串口一初始化完成\r\n",18);
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

#endif


//==========================================================
//	函数名称：	Key_Feedback
//
//	函数功能：	检测到按键后将数据打印到串口中
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void Key_Feedback(void)
{
  if(Key_value)
  {
    switch(Key_value)
    {
      case Matrixkey0:
        OLED_P8x16Str(3,10,"KEY-Value:0    ");
        Rs485_Send("KEY-Value:0\r\n",13);     //485发送数据
      break;
      case Matrixkey1:
        OLED_P8x16Str(3,10,"KEY-Value:1    ");
        Rs485_Send("KEY-Value:1\r\n",13);     //485发送数据
      break;
      case Matrixkey2:
        OLED_P8x16Str(3,10,"KEY-Value:2    ");
        Rs485_Send("KEY-Value:2\r\n",13);     //485发送数据
      break;
      case Matrixkey3:
        OLED_P8x16Str(3,10,"KEY-Value:3    ");
        Rs485_Send("KEY-Value:3\r\n",13);     //485发送数据
      break;
      case Matrixkey4:
        OLED_P8x16Str(3,10,"KEY-Value:4    ");
        Rs485_Send("KEY-Value:4\r\n",13);     //485发送数据
      break;
      case Matrixkey5:
        OLED_P8x16Str(3,10,"KEY-Value:5    ");
        Rs485_Send("KEY-Value:5\r\n",13);     //485发送数据
      break;
      case Matrixkey6:
        OLED_P8x16Str(3,10,"KEY-Value:6    ");
        Rs485_Send("KEY-Value:6\r\n",13);     //485发送数据
      break;
      case Matrixkey7:
        OLED_P8x16Str(3,10,"KEY-Value:7    ");
        Rs485_Send("KEY-Value:7\r\n",13);     //485发送数据
      break;
      case Matrixkey8:
        OLED_P8x16Str(3,10,"KEY-Value:8    ");
        Rs485_Send("KEY-Value:8\r\n",13);     //485发送数据
      break;
      case Matrixkey9:
        OLED_P8x16Str(3,10,"KEY-Value:9    ");
        Rs485_Send("KEY-Value:9\r\n",13);     //485发送数据
      break;
      case MatrixkeyEnter:
        OLED_P8x16Str(3,10,"KEY-Value:Enter");
        Rs485_Send("KEY-Value:Enter\r\n",17); //485发送数据
      break;
      case MatrixkeyCanel:
        OLED_P8x16Str(3,10,"KEY-Value:Canel");
        Rs485_Send("KEY-Value:Canel\r\n",17); //485发送数据
      break;
      case MatrixkeyUP:
        OLED_P8x16Str(3,10,"KEY-Value:UP   ");
        Rs485_Send("KEY-Value:UP\r\n",14);    //485发送数据
      break;
      case MatrixkeyDown:
        OLED_P8x16Str(3,10,"KEY-Value:Down ");
        Rs485_Send("KEY-Value:Down\r\n",16);  //485发送数据
      break;
      case MatrixkeyLeft:
        OLED_P8x16Str(3,10,"KEY-Value:Left ");
        Rs485_Send("KEY-Value:Left\r\n",16);  //485发送数据
      break;
      case MatrixkeyRight:
        OLED_P8x16Str(3,10,"KEY-Value:Right");
        Rs485_Send("KEY-Value:Right\r\n",17); //485发送数据
      break;
      default:break;
    }
    Key_value = 0;
  }
}