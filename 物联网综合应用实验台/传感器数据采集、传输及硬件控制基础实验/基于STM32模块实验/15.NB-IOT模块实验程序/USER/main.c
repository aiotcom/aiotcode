#include "MsgHandler.h"
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
*	日期： 		2020-03-19
*
*	版本： 		V1.0
*
*	说明： 		STM32F767-NB-IoT模块实验
*
*	修改记录：
************************************************************
************************************************************
************************************************************
**/

uint8_t uiuiui[10] = {1,2,3,4,5};

int main(void)
{
	HAL_Init();       		//初始化HAL库
	Rs485_Init();					//初始化485
	M5310_Power_Init(); 	//M5310的复位控制IO初始化
	UART1_Init(9600);			//初始化串口1
	UART7_Init(115200);		//初始化串口7
	netdev_init();      	//初始化M5310
  init_miplconf(86400,coap_uri,endpoint_name);//上报注册码
	Subscription_esources();					//订阅 Object 组配置
	m5310_register_request();         //发出登陆请求
	delay_ms(1000);

	while(1)
	{
//		HAL_UART_Transmit(&UART1_Handler,uiuiui,5,1000);
//		delay_ms(1000);
		msgcode = Msg_Handler();				//返回数据解析
	}
}



