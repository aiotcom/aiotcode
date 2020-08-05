#include <ioCC2530.h>
#include "TIM.h"
#include "UART.h"
#include "stdio.h"
#include "string.h"
#include "type.h"
#include "LORA.h"
//****宏定义*******************  
#define RF_Frequency 500  //范围 410-525 (单位是M)
//****宏定义*******************

//****函数定义*****************
void System_clockInit(void);
uint8_t KeyPoll(void);
//****函数定义*****************

//****变量定义*******************
uint8 version,IRQ_RegValue,LedState=1;
uint8_t LoraSendBuffer[32]={"toggle led\r\n"};
uint8_t LoraRecvBuffer[32]={"toggle led\r\n"};
//****变量定义*******************

void main(void)
{
  	System_clockInit();
    TIM1_Init();
	LORA_Init(RF_Frequency);
    version = SX1276ReadBuffer(REG_LR_VERSION);
    if(version == 0x12)
    {//如果模块安放稳妥，亮500ms
        LED_SET=0;
        HAL_Delay(500);
        LED_SET=1;
    }	
	while(1)
	{
		if(KeyPoll())
		{
			Sx1278SendLong(LoraSendBuffer,strlen((const char*)LoraSendBuffer));  
		}

		IRQ_RegValue = SX1276ReadBuffer( REG_LR_IRQFLAGS );
		if((IRQ_RegValue)&&(IRQ_RegValue != 0XFF))//读 LORA中断寄存器 REG_LR_IRQFLAGS，判断是否有中断发生
		{
			if(INT_FLG_RX_DONE == SX1278_InteruptHandler(LoraRecvBuffer))
			{//是接收中断，将接收的数据保存到LoraRecvBuffer中
				if(strstr((const char*)LoraRecvBuffer,(const char*)"toggle led"))
				{
					LedState?(LED_SET=0):(LED_SET=1);
					LedState =  1-LedState;//切换灯的状态
				}
			}
		} 
	}
}	
//==========================================================
//	函数名称：	void System_clockInit(void)
//
//	函数功能：	初始化系统时钟
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		定时器时钟16MHz，中断周期1000HZ
//==========================================================
void System_clockInit(void)
{
  CLKCONCMD &= ~(1<<6);        /*选择32MHz晶振*/  
  while(!(CLKCONSTA & (1<<6))); /*等待晶振稳定*/  
  CLKCONCMD &= ~0x47;          /* 不分频,系统时钟32MHZ，定时器时钟16MHZ*/             
}
//==========================================================
//	函数名称：	uint8_t KeyPoll(void)
//
//	函数功能：	模块上面的按键扫描
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
uint8_t KeyPoll(void)
{
	static uint8_t kstate = 0;
		   uint8_t kv;
		   
	kv = !KEY_INPUT;
	
	if(kv&&(!kstate))
	{
		kstate = 1;
		return 1;
	}
	else if((!kv)&&(kstate))
	{
		kstate = 0;
	}
	
	return 0;
}