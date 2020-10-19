#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "Rs485.h"
#include "Usart.h"
#include "string.h"
#include "CC2500.h"
#include "CC2500_reg.h"
#include "Platform_RGB_LED.h"
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
void RS485_HandlerCb(void);
uint8_t CC2500_Version;
uint8_t RxBuffer[32],getKey=0;
uint16_t command[2];
int main(void)
{ 
    uint8_t ledstate = 0;
    HAL_Init(); 
    CC2500_Init();
    Platform_RGB_LED_Init();
    CC2500_ModeRx();   
    
    Rs485_Init();
    UART1_Init(115200);
    USART3_Init(115200);
    printf("usart3 print\r\n");
    CC2500_Version  = CC2500_ReadStatus();  
    printf("ver=%d\r\n",CC2500_Version);
    TIM3_Init(10000-1,64-1,RS485_HandlerCb);	//初始化定时器中断周期64M/64/10000/ = 100HZ    
    while(1)
    {                     
        if(CC2500_RevPacket(&RxBuffer[0]) == SUCCESS)
        {
            memcpy((void*)command,(const void*)RxBuffer,4);
            printf("%04x,%04x\r\n",command[0],command[1]);
            getKey = 1;
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
//	说明：		接收通过485总线发送过来的数据请求
//==========================================================
void RS485_HandlerCb(void)
{
    uint16_t cmd = 0;
    uint8_t item = 0;
    if(!DataHandling_485(Addr_UHF_RFID))	
    {
        if(getKey)
        {
            cmd    = command[0];
            item   = command[1];
            getKey = 0;
        }
        Rs485_Send(Addr_UHF_RFID,Addr_MP3,cmd,1,&item);
    }    
}
