#ifndef __WiFi_H__
#define __WiFi_H__

#include "stm32f1xx_hal.h"

#define	CLOSE_TCP		 "+++"																						//关闭TCP连接，退出透传模式
#define AT         	 "AT\r\n"
#define CWMODE     	 "AT+CWMODE=3\r\n"																//设置模式为AP+STA
#define RST        	 "AT+RST\r\n"																			//软重启模块
#define CIFSR        "AT+CIFSR\r\n"																		//查询IP地址
#define CWJAP        "AT+CWJAP=\"bacheng\",\"f0f0f0f0f0\"\r\n"				//设置SID和PWD连接网络
#define TCP_CIPSTART "AT+CIPSTART=\"TCP\",\"183.230.40.40\",1811\r\n"	//设置为TCP协议传输并指定IP和端口号
#define CIPMODE      "AT+CIPMODE=1\r\n"																//透传
#define CIPSEND      "AT+CIPSEND\r\n"																	//开始传输
#define CIPSTATUS    "*238724#0001#sample*"														//ONE.NET平台个人账号识别码

/**
  * @brief  初始化ESP8266,并配置路由和连接平台
  * @param  server:按照AT指令配置服务器地址和端口字符串
    * @param  ssid_pwd: 按照AT指令配置路由器的SSID和PWD
  * @retval NONE
  **/
extern uint8_t WiFi_AT_STA;    /*AT指令发送完成标志位*/
void WiFi_Init(void);

#endif


