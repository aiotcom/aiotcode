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
*	说明： 		基于NB-IoT智能环境监测实验
*
*	修改记录：
*
************************************************************
************************************************************
************************************************************
**/

uint8_t SendOneNET[10];
uint16_t Light_Intensity;
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
	TIM2_Init(1000-1,64-1);						//初始化定时器2(1ms)

	while(1)
	{
		msgcode = Msg_Handler();							//返回数据解析
		
		if(!DataHandling_485(Addr_NB))				//处理485中传输给NB模块的数据
		{
			if(Rx_Stack.Src_Adr == Addr_SHT20)	//处理温湿度光强数据
			{
				memset((void*)SendOneNET,0,10);
				sprintf((char *)SendOneNET,"%0.2f",(float)Rx_Stack.Data[0]);
				m5310_notify_upload(&temp_uri,NBIOT_FLOAT,(char*)&SendOneNET[0],1,0);	//上传温度数据
				
				memset((void*)SendOneNET,0,10);
				sprintf((char *)SendOneNET,"%0.2f",(float)Rx_Stack.Data[1]);
				m5310_notify_upload(&humi_uri,NBIOT_FLOAT,(char*)&SendOneNET[0],1,0);	//上传湿度数据
				
				memset((void*)SendOneNET,0,10);
				Light_Intensity = Rx_Stack.Data[2]*256+Rx_Stack.Data[3];
				sprintf((char *)SendOneNET,"%0.0f",(float)Light_Intensity);
				m5310_notify_upload(&illum_uri,NBIOT_FLOAT,(char*)&SendOneNET[0],1,0);	//上传光强数据
			}
		}
	}
}






