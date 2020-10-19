#include "Usart.h"	
#include "delay.h"
#include "Time.h"
#include "Ble.h"	

uint16_t i = 0;
uint8_t USART0_RX_STA = 0;    //串口接收标志位
uint8_t USART0_RX_BUF[200];   //串口接收数组

//==========================================================
//	函数名称：	Init_Uart0()
//
//	函数功能：	UR0初始化函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Init_Uart0()
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
//	函数功能：	UR0接收中断服务函数
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
    if(BLE_AT_STA)                        //藍牙初始化完毕
    {
        USART0_RX_BUF[USART0_RX_STA&0X3FFF]=U0DBUF ;
        USART0_RX_STA++;
        if(USART0_RX_STA>(195-1))USART0_RX_STA=0;//接收数据错误,重新开始接收	
        
        Time_Flag = 1;		          //开始计数
        Time_Count = 0;		          //清空标志位
    }
    else
    {
        USART0_RX_BUF[USART0_RX_STA&0X3FFF]=U0DBUF ;
        USART0_RX_STA++;
        if(USART0_RX_STA>(195-1))USART0_RX_STA=0;//接收数据错误,重新开始接收	  
    }
  }
}

//==========================================================
//	函数名称：	UR0SendByte()
//
//	函数功能：	UR0发送单字节函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void UR0SendByte(unsigned char dat)
{
  U0DBUF = dat;         //将要发送的1字节数据写入U0DBUF
  while(!UTX0IF);       //等待TX中断标志，即数据发送完成
  UTX0IF = 0;           //清除TX中断标志，准备下一次发送
}

//==========================================================
//	函数名称：	UR0SendString()
//
//	函数功能：	UR0发送字符串函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void UR0SendString(unsigned char *str)
{
  while(*str != '\0')       //发送一个字符串
  {
    UR0SendByte(*str++);    //逐个发送字符串中的字节
  }
}

//==========================================================
//	函数名称：	ble_send_cmd
//
//	函数功能：	向蓝牙模块发送命令
//
//	入口参数：	waittime:等待时间(单位:ms)
//			cmd:发送的命令字符串
//			ack:期待的应答结果,如果为空,则表示不需要等待应答
//
//	返回参数：	
//			返回值:	非0,发送成功(得到了期待的应答结果)
//       		0,发送失败
//
//	说明：		
//==========================================================
uint8_t* ble_send_cmd(uint8_t *cmd,uint8_t *ack,uint16_t waittime)
{
      static uint32_t j = 0;
      char *strx=0;

      for(i = 0;i<200;i++){
        USART0_RX_BUF[i] = 0;   //清空数组
      }
      
      UR0SendString(cmd);       //串口0发送数据
      
      for(j=0;j<waittime;j++)
      {
          delay_ms(100);
          strx=strstr((const char*)USART0_RX_BUF,(const char*)ack);
          if(strx)
            break;
      }
      
      USART0_RX_STA=0;
      for(i = 0;i<200;i++){
        USART0_RX_BUF[i] = 0;	//清空数组
      }
      return (uint8_t*)strx;
} 











