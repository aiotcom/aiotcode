#include "stm32f1xx_hal.h"
#include "Martix_Key.h"	
#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "timer.h"
#include "Rs485.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-03-18
*
*	版本： 		V1.0
*
*	说明： 		矩阵键盘程序
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
void RS485_HandlerCb(void);
uint8_t KeyValue;
int main(void)
{
    HAL_Init();             					//初始化HAL库  
	KEY_Init();												//初始化按键
	UART1_Init(115200);								//初始化串口二
    Rs485_Init();
    USART3_Init(115200);
    printf("usart3 printf\r\n");
    TIM3_Init(5000-1,64-1,RS485_HandlerCb);	//初始化定时器中断周期64M/64/10000/ = 200HZ
	while(1)
	{
        KeyValue = KEY_Process();  								//接收按键输入
	}
}
//==========================================================
//	函数名称：	void RS485_HandlerCb(void)
//
//	函数功能：	通过485总线获取数据处理函数
//
//	入口参数：	void
//
//	返回参数：	无
//
//	说明：		接收通过485总线发送过来的数据请求
//==========================================================
void RS485_HandlerCb(void)
{
    static uint8_t count = 0;
    if(!DataHandling_485(Addr_Matrixkey))	
    {
        if(KeyValue != KEY_NULL)
        {
           // printf("KeyValue=%d\r\n",KeyValue);
        }        
        Rs485_Send(Addr_Matrixkey,Addr_LCD,Matrixkey_value,1,&KeyValue);
        KeyValue = KEY_NULL;
    }    
}

