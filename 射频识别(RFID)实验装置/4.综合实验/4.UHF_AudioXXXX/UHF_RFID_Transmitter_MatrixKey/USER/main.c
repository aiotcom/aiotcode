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
#define MSG_HEAD_LEN  9
void RS485_HandlerCb(void);
const uint8_t MSG_HEAD[]="mrk->lora";
unsigned char recv[1250];
uint8_t CC2500_Version;
uint16_t command[2];
int main(void)
{ 
    HAL_Init(); 
    Rs485_Init();
    UART1_Init(115200);
    USART3_Init(115200);
    CC2500_Init();
  
    delay_ms(10); 
    printf("cc2500 TX Mode\r\n");
    
    delay_ms(10); 
    CC2500_Version  = CC2500_ReadStatus();  
    printf("ver=%d\r\n",CC2500_Version);
    
    TIM3_Init(10000-1,64-1,RS485_HandlerCb);	//初始化定时器中断周期64M/64/10000/ = 100HZ
    while(1)
    {           
        if(command[0] && command[1])
        {       
            printf("%04x,%04x\r\n",command[0],command[1]);
            CC2500_SendPacket((uint8_t*)command,4);
            command[0] = 0;
            command[1] = 0;
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
    static uint8_t state = 1;
    if(state == 0)
    {
        Rs485_Send(Addr_UHF_RFID,Addr_Matrixkey,Matrixkey_Get_value,0,(void*)0);
        state = 1;
    }
    else if(state == 1)
    {
        state = 0;
        if(!DataHandling_485(Addr_UHF_RFID))	
        {
            command[0] = Rx_Stack.Command;
            command[1] = Rx_Stack.Data[0];
        }        
    }

}
