#include "UART.H"
/*
    U0BAUD = 59;     32M 9600bps
    U0GCR  = 8;
*/
void UART_Init(unsigned char port)
{
  if(UART_0 == port)
  {
    PERCFG = 0x00;    //串口0的引脚映射到位置1，即P0_2和P0_3
    P0SEL  |= 0x0C;     //将P0_2和P0_3端口设置成外设功能   
    U0BAUD = 59;      //16MHz的系统时钟产生115200BPS的波特率
    U0GCR  = 8;
    U0UCR |= 0x80;    //禁止流控，8位数据，清除缓冲器
    U0CSR |= 0xC0;    //选择UART模式，使能接收器
    UTX0IF = 0;       //清除TX发送中断标志
    URX0IF = 0;       //清除RX接收中断标志
    URX0IE = 1;       //使能URAT0的接收中断
    EA = 1;           //使能总中断
  }
  else if(UART_1 == port)
  {
    P2DIR   = 0X40;
    PERCFG  = 0x00;    //串口0的引脚映射到位置1，即P0_4和P0_5
    P0SEL  |= 0x30;     //将P0_4和P0_5端口设置成外设功能
    U1BAUD  = 216;     //32MHz的系统时钟产生115200BPS的波特率
    U1GCR   = 11;
    U1UCR   = 0x80;    //禁止流控，8位数据，清除缓冲器
    U1CSR  = 0xC0;    //选择UART模式，使能接收器
    UTX1IF = 0;       //清除TX发送中断标志
    URX1IF = 0;       //清除RX接收中断标志
    URX1IE = 1;       //使能URAT1的接收中断
    EA     = 1;           //使能总中断  
  }
}
unsigned char UART0_RxByte;
#pragma vector = URX0_VECTOR
__interrupt void UR0_RecvIntISR()
{
  URX0IF = 0;                             //清除RX接收中断标志 
  UART0_RxByte = U0DBUF;
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
unsigned char UART1_RxByte;
#pragma vector = URX1_VECTOR
__interrupt void UR1_RecvIntISR()
{
  URX1IF = 0;                             //清除RX接收中断标志 
  UART1_RxByte = U1DBUF;
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
__near_func int putchar(int c)
{
#if 1  
    UTX0IF = 0;
    U0DBUF = (char)c;
    while(UTX0IF == 0);
    return(c);
#else
    UTX1IF = 0;
    U1DBUF = (char)c;
    while(UTX1IF == 0);
    return(c);    
#endif    
}