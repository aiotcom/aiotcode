#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "Rs485.h"
#include "Usart.h"
#include "string.h"
#include "CC2500.h"
#include "CC2500_reg.h"
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
*	说明： 		跑马灯库函数操作实验-HAL库版本
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
uint8_t CC2500_Version;
uint8_t CC2500_ReceiveBuffer[32],CC2500_ReceiveLen;
uint8_t CC2500_SendBuffer[32];
uint8_t CC2500_SendCmd = 0;
void RS485_HandlerCb(void);
int main(void)
{ 
    HAL_Init();        
    CC2500_Init();
   
    delay_ms(10); 
    CC2500_ModeIdle();
    delay_ms(10); 
    CC2500_Version = CC2500_ReadReg(VERSION);
    
    Rs485_Init();
    UART1_Init(115200);
    USART3_Init(115200);
    TIM3_Init(10000-1,64-1,RS485_HandlerCb);	//初始化定时器中断周期64M/64/10000/ = 100HZ
    
    CC2500_Version  = CC2500_ReadStatus(); 
    printf("Status:%x\r\n",CC2500_Version);  
    printf("debug\r\n");
    while(1)
    {          
        HAL_Delay(1);
        if(CC2500_SendCmd)
        {
            CC2500_SendCmd = 0;
            if(CC2500_SendBuffer[0] == 1)
            {
                
                CC2500_SendPacket(8,"led on\r\n");
            }
            else if(CC2500_SendBuffer[0] == 0)
            {
                CC2500_SendPacket(9,"led off\r\n");
            }          
        }
    }//while(1)
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
    if((!DataHandling_485(Addr_UHF_RFID))&&(Rx_Stack.Command == UHF_DATA))
    {
        printf("get req\r\n");
        CC2500_SendCmd = 1;
        CC2500_SendBuffer[0]  = Rx_Stack.Data[0];
        printf("data[0]=%d\r\n",Rx_Stack.Data[0]);
    }        
}
