#include "delay.h"
#include "Time.h"
#include "LED.h"

//==========================================================
//	函数名称：	LED_Init()
//
//	函数功能：	初始化LED
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void LED_Init(void)
{
   P0DIR |= 0x0C;      //P0.2、P0.3定义为输出
   P1DIR |= 0xC0;      //P1.6、P1.7定义为输出
   LED1=1;LED2=1;LED3=1;LED4=1;
}

//==========================================================
//	函数名称：	LED_Set()
//
//	函数功能：	LED控制
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void LED_Set(void)
{ 
  LED1=0;delay_ms(500);LED1=1;
  LED2=0;delay_ms(500);LED2=1;
  LED4=0;delay_ms(500);LED4=1;
  LED3=0;delay_ms(500);LED3=1;
  
  LED1=0;delay_ms(400);LED1=1;
  LED2=0;delay_ms(400);LED2=1;
  LED4=0;delay_ms(400);LED4=1;
  LED3=0;delay_ms(400);LED3=1;
  
  LED1=0;delay_ms(300);LED1=1;
  LED2=0;delay_ms(300);LED2=1;
  LED4=0;delay_ms(300);LED4=1;
  LED3=0;delay_ms(300);LED3=1;
  
  LED1=0;delay_ms(200);LED1=1;
  LED2=0;delay_ms(200);LED2=1;
  LED4=0;delay_ms(200);LED4=1;
  LED3=0;delay_ms(200);LED3=1;
  
  LED1=0;delay_ms(100);LED1=1;
  LED2=0;delay_ms(100);LED2=1;
  LED4=0;delay_ms(100);LED4=1;
  LED3=0;delay_ms(100);LED3=1;
  
  LED1=0;LED2=0;LED3=0;LED4=0;delay_ms(500);
  LED1=1;LED2=1;LED3=1;LED4=1;delay_ms(500);
  LED1=0;LED2=0;LED3=0;LED4=0;delay_ms(300);
  LED1=1;LED2=1;LED3=1;LED4=1;delay_ms(300);
}

//==========================================================
//	函数名称：	Water_Lamp_Time
//
//	函数功能：	LED流水灯
//
//	入口参数：	time:控制流水灯时间间隔
//
//	返回参数：	无
//
//	说明：			
//==========================================================
uint8_t Water_Lamp_Time_Flag = 0,Water_Lamp_Time2_Flag = 0;
void Water_Lamp_Time(uint16_t time)
{
  switch(Water_Lamp_Time_Flag)
  {
    case 0:
      Water_Lamp_Time2_Flag = 0;
      LED_OFF();		//关闭所有LED灯
      LED_Count_Flag = 1;	//开始计数
      LED1_ON();		//开启LED1
      if(LED_Count>=time)
      {
        LED1_OFF();		//关闭LED1
        LED_Count_Flag = 0;	//停止计数
        LED_Count = 0;
        Water_Lamp_Time_Flag = 1;
      }
      break;
    case 1:
      LED_Count_Flag = 1;	//开始计数
      LED2_ON();		//开启LED2
      if(LED_Count>=time)
      {
        LED2_OFF();		//关闭LED2
        LED_Count_Flag = 0;	//停止计数
        LED_Count = 0;
        Water_Lamp_Time_Flag = 2;
      }
      break;
    case 2:
      LED_Count_Flag = 1;	//开始计数
      LED4_ON();		//开启LED4
      if(LED_Count>=time)
      {
        LED4_OFF();		//关闭LED4
        LED_Count_Flag = 0;	//停止计数
        LED_Count = 0;
        Water_Lamp_Time_Flag = 3;
      }
      break;
    case 3:
      LED_Count_Flag = 1;	//开始计数
      LED3_ON();		//开启LED3
      if(LED_Count>=time)
      {
        LED3_OFF();		//关闭LED3
        LED_Count_Flag = 0;	//停止计数
        LED_Count = 0;
        Water_Lamp_Time_Flag = 0;
      }
      break;
    default:break;
  }
}

//==========================================================
//	函数名称：	Water_Lamp_Time2
//
//	函数功能：	LED流水灯
//
//	入口参数：	time:控制流水灯时间间隔
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void Water_Lamp_Time2(uint16_t time)
{
  switch(Water_Lamp_Time2_Flag)
  {
    case 0:
      Water_Lamp_Time_Flag = 0;
      LED_OFF();		//关闭所有LED灯
      LED_Count_Flag2 = 1;	//开始计数2
      LED1_ON();		//开启LED1
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 1;
      }
      break;
    case 1:
      LED2_ON();		//开启LED2
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 2;
      }
      break;
    case 2:
      LED4_ON();		//开启LED4
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 3;
      }
      break;
    case 3:
      LED3_ON();		//开启LED3
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 4;
      }
      break;
    case 4:
      LED1_OFF();		//关闭LED1
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 5;
      }
      break;
    case 5:
      LED2_OFF();		//关闭LED2
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 6;
      }
      break;
    case 6:
      LED4_OFF();		//关闭LED4
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 7;
      }
      break;
    case 7:
      LED3_OFF();		//关闭LED3
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time)	
      {
        LED_Count_Flag2 = 0;    //停止计数2
        LED_Count2 = 0;
        Water_Lamp_Time2_Flag = 8;
      }
      break;
    case 8:
      LED_OFF();		//关闭所有LED灯
      LED_Count_Flag2 = 1;	//开始计数2
      if(LED_Count2>=time*9)	Water_Lamp_Time2_Flag = 0;
      {
        LED_Count_Flag2 = 0;    //停止计数2
        Water_Lamp_Time2_Flag = 0;
        LED_Count2 = 0;
      }
      break;
    default:break;
  }
}

//==========================================================
//	函数名称：	LED_Type
//
//	函数功能：	LED灯函数多样化亮灯
//
//	入口参数：	type:选择模式
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void LED_Type(uint8_t type)
{
  switch(type)
  {
    case 1:
      Water_Lamp_Time(200);	//流水灯
      break;
    case 2:
      Water_Lamp_Time(600);	//流水灯
      break;
    case 3:
      Water_Lamp_Time2(100);    //流水灯形式2
      break;
    case 4:
      LED_OFF();		//全部LED灯灭
      LED_Count_Flag = 0;	//停止计数2
      LED_Count_Flag2 = 0;	//停止计数2
      LED_Count = 0;
      LED_Count2 = 0;
      break;
    default:break;
  }
}