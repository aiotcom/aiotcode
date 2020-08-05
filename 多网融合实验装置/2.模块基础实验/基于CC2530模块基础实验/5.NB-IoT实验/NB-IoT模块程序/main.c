/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-19
*
*	版本： 		V2.0
*
*	说明： 		NB_IoT实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

#include "MsgHandler.h"
#include <ioCC2530.h>
#include "Usart.h"
#include "Rs485.h"
#include "delay.h"
#include "M5310.h"
#include "nbiot.h"
#include "utils.h"
#include "coap.h"
#include "Lamp.h"
#include "Time.h"

//==========================================================
//	函数名称：	main()
//
//	函数功能：	程序入口函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void main(void)
{
    Hal_Init_32M();     //初始化32M时钟
    LampInit();         //初始化底座灯 
    Rs485_Init();       //初始化485
    M5310_Power_Init(); //M5310的复位控制IO初始化
    USRT0_Init();       //初始化串口0(9600)
    USRT1_Init();       //初始化串口1(115200)
    netdev_init();      //初始化M5310
    init_miplconf(86400,coap_uri,endpoint_name);//上报注册码
    Subscription_esources();	//订阅 Object 组配置
    m5310_register_request();   //发出登陆请求
    delay_ms(1000);             //延时等待
    Init_Timer1();              //初始化定时器1(1ms)   

    while(1)
    {
        msgcode = Msg_Handler();//返回数据解析
        USART_Data_Send();	//串口数据发送
        USART1_IRQHand();	//串口1数据处理(485数据处理)
    }
}

















//==========================================================
//	函数名称：	WiFi_Send_Cmd()
//
//	函数功能：	向WiFi发送命令
//
//	入口参数：	waittime:等待时间(单位:ms)
//			cmd:发送的命令字符串
//			ack:期待的应答结果,如果为空,则表示不需要等待应答
//
//	返回参数：	
//		        返回值:	非0,发送成功(得到了期待的应答结果)
//       			  0,发送失败
//
//	说明：		
//==========================================================
//uint8_t* WiFi_Send_Cmd(uint8_t *cmd,uint8_t *ack,uint16_t waittime)
//{
//    static uint8_t len = 0;	//存放数据长度
//    static uint16_t j = 0;
//    char *strx=0;
//  
//    len = strlen((char *)cmd);	//获取数据长度
//  
//    memset((void*)USART0_RX_BUF,0,USART0_REC_LEN);//清空数组
//    
//    USART0_SendString(cmd,len); //串口0发送数据
//    
//    for(j=0;j<waittime;j++)
//    {
//        delay_ms(50);
//        strx=strstr((const char*)USART0_RX_BUF,(const char*)ack);
//        if(strx)
//          break;
//    }
//
//    USART0_RX_STA=0;
//    return (uint8_t*)strx;
//}
