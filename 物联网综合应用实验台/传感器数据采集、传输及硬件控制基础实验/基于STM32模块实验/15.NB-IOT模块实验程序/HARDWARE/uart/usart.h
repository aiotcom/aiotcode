#ifndef __USART_H
#define __USART_H
#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

#define UART1  	1
#define USART7  1

#if UART1

#define EN_USART1_RX   1
#define USART1_RECV_BUFFER_LENGTH 100	  	
extern uint8_t USART1_RecvBuffer[ ];
extern uint16_t USART1_RecvIndex;

extern UART_HandleTypeDef UART1_Handler; 	//UART句柄

//如果想串口中断接收，请不要注释以下宏定义
extern void UART1_Init(int bound);

#endif

#if USART7

#define USART7_REC_LEN  	200  			//定义最大接收字节数 200
#define EN_USART7_RX 			1					//使能（1）/禁止（0）串口1接收
	  	
extern unsigned char  USART7_RX_BUF[USART7_REC_LEN]; 	//接收缓冲,最大USART_REC_LEN个字节.末字节为换行符 
extern unsigned int USART7_RX_STA;        //接收状态标记	
extern UART_HandleTypeDef UART7_Handler; 	//UART句柄

#define UART7_RXBUFFERSIZE   1 						//缓存大小
extern unsigned char UART7_RxBuffer[UART7_RXBUFFERSIZE];			//HAL库USART接收Buffer

//如果想串口中断接收，请不要注释以下宏定义
extern void USART7_IRQHand(void);
extern void UART7_Init(int bound);
extern void USART7_Data_Send(void);

#endif


#endif

