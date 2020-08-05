#include "stm32f1xx.h"
#include "string.h"
#include "delay.h"
#include "RC522.h"
#include "usart.h"	
#include "timer.h"
#include "rs485.h"	
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-11
*
*	版本： 		V2.0
*
*	说明： 		HF-RFID
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
void RS485_HandlerCb(void);
uint8_t SendBuffer[32];
uint8_t GetData = 0;
uint8_t CardId[5],BlockData[32];
int main(void)
{
	HAL_Init();           		//初始化HAL库
    Rs485_Init();
	RC522_Init();     				//初始化RC522模块
	UART2_Init(115200);				//初始化串口2

    UART1_Init(115200);						    //初始化串口1
    TIM3_Init(10000-1,64-1,RS485_HandlerCb);	//初始化定时器中断周期64M/64/10000/ = 100HZ
	while(1)
	{
		GetData = IC_Card_Search(CardId,BlockData);				//检测卡-检测到将数据发送
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
//	说明：		定时器3中断，回调函数，每10ms调用一次
//==========================================================
void RS485_HandlerCb(void)
{  
    if((!DataHandling_485(Addr_HF_RFID))&&(Rx_Stack.Command == HF_RFID_Get_ID))
    {
        printf("get cmd\r\n");
        if(GetData)
        {
            GetData = 0;
            memcpy((void*)SendBuffer,(const void*)CardId,4);
            Rs485_Send(Addr_HF_RFID,Addr_Linux,HF_RFID_ID,4,SendBuffer);
        }
    }        
}


