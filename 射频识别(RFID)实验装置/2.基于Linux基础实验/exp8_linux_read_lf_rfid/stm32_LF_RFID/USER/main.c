#include "stm32f1xx.h"
#include "delay.h"
#include "timer.h"
#include "EM4095.h"
#include "usart.h"
#include "Rs485.h"





/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-17
*
*	版本： 		V2.0
*
*	说明： 		LF-RFID模块
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
uint8_t LF_HRFID_CardID[5];
uint8_t GetId = 0;
void RS485_HandlerCb(void);
int main(void)
{
	HAL_Init();                                 //初始化HAL库  
	Rs485_Init();    							//初始化485
	EM4095_Init();								//初始化EM4095
	UART1_Init(115200);						    //初始化串口1
	UART2_Init(115200);						    //初始化串口1    
	TIM2_Init(2000-1,64-1);				        //初始化定时器2(2ms中断)
    TIM3_Init(10000-1,64-1,RS485_HandlerCb);	//初始化定时器中断周期64M/64/10000/ = 100HZ
    printf("debug\r\n");
	while(1)
	{
		if(EM4095_SearchHdr(LF_HRFID_CardID) == GET_ID)
        {
            HAL_Delay(50);
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
//	说明：		接收通过485总线发送过来的数据请求
//==========================================================
void RS485_HandlerCb(void)
{  
    if((!DataHandling_485(Addr_LF_RFID))&&(LF_RFID_All == Rx_Stack.Command))
    {
        if(LF_HRFID_CardID[0]||LF_HRFID_CardID[1]||LF_HRFID_CardID[2]||LF_HRFID_CardID[3])
        {
            GetId = 0;
            Rs485_Send(Addr_LF_RFID,Addr_LinuxP,LF_RFID_ID,5,&LF_HRFID_CardID[0]);
            LF_HRFID_CardID[0] = 0;
            LF_HRFID_CardID[1] = 0;
            LF_HRFID_CardID[2] = 0;
            LF_HRFID_CardID[3] = 0;
            printf("requery\r\n");
        }
    }        
}




