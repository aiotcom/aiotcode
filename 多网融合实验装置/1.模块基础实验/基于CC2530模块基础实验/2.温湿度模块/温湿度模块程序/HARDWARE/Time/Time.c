#include "Time.h"
#include "Rs485.h"

uint32_t Display_Count = 0;		//数码管显示计数值
uint8_t Temp[10],Humi[10],Sum_Data[10]; //温度、湿度、数据集合

//==========================================================
//	函数名称：	Init_Timer1()
//
//	函数功能：	定时器1初始化函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：
//==========================================================
void Init_Timer1(void)
{
  T1CC0L = 0xC4;        //设置最大计数值的低8位
  T1CC0H = 0x09;        //设置最大计数值的高8位
  T1CCTL0 |= 0x04;      //开启通道0的输出比较模式
  T1IE = 1;             //使能定时器1中断
  T1OVFIM = 1;          //使能定时器1溢出中断
  EA = 1;               //使能总中断
  T1CTL = 0x0e;         //分频系数是128,模模式
}

//==========================================================
//	函数名称：	Timer1_Sevice()
//
//	函数功能：	定时器1服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
#pragma vector = T1_VECTOR
__interrupt void Timer1_Sevice()
{
  Display_Count++;
  if(!DataHandling_485(Addr_SHT20))//处理485数据
  {
    switch(Rx_Stack.Command)
    {
      case SHT20_Get_Temp:      //获取温度数据
        Rs485_Send(Addr_SHT20,Rx_Stack.Src_Adr,SHT20_Temp,1,Temp);  //发送温度数据
        break;
      case SHT20_Get_Humi:	//获取湿度数据
        Rs485_Send(Addr_SHT20,Rx_Stack.Src_Adr,SHT20_Humi,1,Humi);  //发送湿度数据
        break;
      case SHT20_Get_All:	//获取温湿度
        Rs485_Send(Addr_SHT20,Rx_Stack.Src_Adr,SHT20_All,2,Sum_Data);//发送温湿度+光强数据
        break;
      default:break;
    }
  }
  T1STAT &= ~0x01;              //清除定时器1通道0中断标志 
}
