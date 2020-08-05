#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "Rs485.h"
#include "usart.h"
#include "delay.h"
#include "Relay.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-04-22
*
*	版本： 		V1.0
*
*	说明： 		继电器程序
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
  HAL_Init();             		//初始化HAL库  
	Relay_Init();   						//初始化继电器
	Rs485_Init();								//初始化485
	UART1_Init(115200);					//初始化串口一

	while(1)
	{
		if(!DataHandling_485(Addr_Relay))//接收发送到继电器的数据
		{
			if(Rx_Stack.Command == Relay1_ON)
			{
				RELAY1_OPEN();	 //打开继电器1
				delay_ms(3000);
				RELAY1_CLOSE();  //关闭继电器1
			}
			else if(Rx_Stack.Command == Relay1_OFF)
			{
				RELAY1_CLOSE();  //关闭继电器1
			}
			else if(Rx_Stack.Command == Relay2_ON)
			{
				RELAY2_OPEN();	 //打开继电器2
				delay_ms(3000);
				RELAY2_CLOSE();  //关闭继电器2
			}
			else if(Rx_Stack.Command == Relay2_OFF)
			{
				RELAY2_CLOSE();  //关闭继电器2
			}
		}
	}
}




