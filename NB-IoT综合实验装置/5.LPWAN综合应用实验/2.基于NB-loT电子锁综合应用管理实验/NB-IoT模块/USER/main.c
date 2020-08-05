#include "stm32f1xx_hal.h"
#include "MsgHandler.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "timer.h"
#include "M5310.h"
#include "nbiot.h"
#include "utils.h"
#include "coap.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-04-18
*
*	版本： 		V1.0
*
*	说明： 		基于NB-IoT电子锁综合应用管理实验
*
*	修改记录：
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
  HAL_Init();             					//初始化HAL库  
	Rs485_Init();											//初始化485
	M5310_Power_Init(); 							//M5310的复位控制IO初始化
	UART1_Init(115200);								//初始化串口1
	UART2_Init(9600);									//初始化串口2
	netdev_init();      							//初始化M5310
  init_miplconf(86400,coap_uri,endpoint_name);//上报注册码
	Subscription_esources();					//订阅 Object 组配置
	m5310_register_request();         //发出登陆请求
	TIM2_Init(1000-1,640-1);					//初始化定时器2(10ms)

	while(1)
	{
		USART1_IRQHand();								//串口一数据处理（接收485数据并将数据传输到云平台）
		Msg_Handler();									//串口二数据处理（NB-IoT与云平台交互处理）
	}
}






