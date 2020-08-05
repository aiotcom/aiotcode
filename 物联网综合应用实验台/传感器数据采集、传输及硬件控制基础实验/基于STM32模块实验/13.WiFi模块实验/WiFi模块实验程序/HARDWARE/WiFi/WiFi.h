#ifndef __WiFi_H__
#define __WiFi_H__

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

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
#define 	WiFi_LED_GPIO_RCC_EN() 	__HAL_RCC_GPIOA_CLK_ENABLE()
#define 	WiFi_LED_PORT 					GPIOA
#define 	WiFi_LED_PIN 						GPIO_PIN_0

#define 	WiFi_KEY_GPIO_RCC_EN() 	__HAL_RCC_GPIOA_CLK_ENABLE()
#define 	WiFi_KEY_PORT 					GPIOA
#define 	WiFi_KEY_PIN						GPIO_PIN_3

#define 	WiFi_RST_GPIO_RCC_EN() 	__HAL_RCC_GPIOA_CLK_ENABLE()
#define 	WiFi_RST_PORT 					GPIOA
#define 	WiFi_RST_PIN 						GPIO_PIN_8

#define 	WiFi_LED_High() 				HAL_GPIO_WritePin(WiFi_LED_PORT,WiFi_LED_PIN,GPIO_PIN_SET)
#define 	WiFi_LED_Low() 					HAL_GPIO_WritePin(WiFi_LED_PORT,WiFi_LED_PIN,GPIO_PIN_RESET)

#define 	WiFi_RST_High() 				HAL_GPIO_WritePin(WiFi_RST_PORT,WiFi_RST_PIN,GPIO_PIN_SET)
#define 	WiFi_RST_Low() 					HAL_GPIO_WritePin(WiFi_RST_PORT,WiFi_RST_PIN,GPIO_PIN_RESET)

#define 	WiFi_KEY_Read()   			HAL_GPIO_ReadPin(WiFi_KEY_PORT,WiFi_KEY_PIN)  //按键

#define RED 		0xFF00  			//红光
#define GREEN 	0xFF0000  		//绿光
#define BLUE 		0xFF  				//蓝光
#define WHITE 	0xFFFFFF  		//白光
#define CUTDOWN 0		  				//关闭显示

extern uint8_t WiFi_AT_STA;    /*AT指令发送完成标志位*/

extern void WiFi_Init(void);
extern void WiFi_LED_Init(void);					//初始化LED
extern void WiFi_RST_Init(void);					//初始化RST
extern void WiFi_KEY_Init(void);					//初始化按键
extern void WiFi_RGB_Set_UP(void);				//1码  850ns高电平  400ns低电平
extern void WiFi_RGB_Set_Down(void);			//0码  400ns高电平  850ns低电平
extern void WiFi_RGB_SET(uint32_t G8R8B8);//设置颜色
extern void WiFi_RGB_REST(void);					//拉低电平等待下一次命令 
extern void WiFi_RGB_User(uint8_t Num_Lig,uint32_t DELAY);

#endif


