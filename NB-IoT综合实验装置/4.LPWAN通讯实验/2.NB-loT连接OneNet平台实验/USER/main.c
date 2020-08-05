#include "stm32f1xx_hal.h"
#include "MsgHandler.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
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
*	说明： 		NB-loT连接OneNet平台实验
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
	delay_ms(1000);

	while(1)
	{
		msgcode = Msg_Handler();				//返回数据解析
	}
}






