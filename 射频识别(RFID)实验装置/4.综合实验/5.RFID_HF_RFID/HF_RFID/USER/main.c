#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "key.h"
#include "usart.h"	
#include "RC522.h"
#include "Rs485.h"	
#include "string.h"
#include "timer.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2018-01-01
*
*	版本： 		V1.0
*
*	说明： 		按键函数操作实验-HAL库版本
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
void RS485_HandlerCb(void);
uint8_t DataToIC_Card[16]={1,2,3,5,6,7,8,9,0,1,2,3,4,5,6};//保存写入IC卡的信息
uint8_t kv;
uint8_t count = 0,Set_HF_Memblock;
uint8_t HF_SendBuffer[20];
uint8_t Buffer_WriteMemblock[32];
int main(void)
{
    uint8_t existflg = 0;
    uint8_t index;  
    uint8_t i;
    HAL_Init();             //初始化HAL库   
    RC522_Init ();     //RC522模块初始化
   
    HAL_Delay(200);	

    Rs485_Init();
    UART1_Init(115200);		//初始化串口    
    TIM3_Init(1000-1,640-1,RS485_HandlerCb);					//初始化定时器中断周期64M/640/1000/ = 100HZ
 
    USART3_Init(115200);		//初始化串口
    printf("hfrfid:wr memory:usart3 print\r\n");
    memset((void*)Buffer_WriteMemblock,0,32);    
	while(1)
	{
        HAL_Delay(1);
        if(!Set_HF_Memblock)
        {
            existflg = IC_Card_Search(&HF_SendBuffer[0]);
        }
        else if(existflg)
        {
            Set_HF_Memblock = 0;
            printf("===%s\r\n",Buffer_WriteMemblock);
            IC_Card_Write(Buffer_WriteMemblock);
        }
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
//	说明：		定时器3中断，回调函数，每100ms调用一次
//==========================================================
void RS485_HandlerCb(void)
{  
    if(!DataHandling_485(Addr_HF_RFID))
    {
        if(Rx_Stack.Command == HF_RFID_Get_All)
        {
            Rs485_Send(Addr_HF_RFID,Addr_LCD,HF_RFID_All,20,HF_SendBuffer);
        }
        else if(Rx_Stack.Command == HF_RFID_Set_Memblock)
        {            
            printf("write memory\r\n");
            memcpy((void*)Buffer_WriteMemblock,(const void*)Rx_Stack.Data,16);
            Set_HF_Memblock = 1;
        }            
    }        
}
