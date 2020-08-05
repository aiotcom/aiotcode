#include "usart.h"	
#include "delay.h"
#include "Rs485.h"

#if UART1

UART_HandleTypeDef UART1_Handler; //UART句柄

//==========================================================
//	函数名称：	UART1_Init()
//
//	函数功能：	串口1初始化
//
//	入口参数：	bound:波特率
//              
//	返回参数：	无
//
//	说明：			
//==========================================================
void UART1_Init(int bound)
{
	//UART 初始化设置
	UART1_Handler.Instance          = USART1;					    	//USART1
	UART1_Handler.Init.BaudRate     = bound;				    		//波特率
	UART1_Handler.Init.WordLength   = UART_WORDLENGTH_8B;   //字长为8位数据格式
	UART1_Handler.Init.StopBits     = UART_STOPBITS_1;	    //一个停止位
	UART1_Handler.Init.Parity       = UART_PARITY_NONE;		  //无奇偶校验位
	UART1_Handler.Init.HwFlowCtl    = UART_HWCONTROL_NONE;  //无硬件流控
	UART1_Handler.Init.Mode         = UART_MODE_TX_RX;		  //收发模式
  UART1_Handler.Init.OverSampling = UART_OVERSAMPLING_16;
	HAL_UART_Init(&UART1_Handler);					    						//HAL_UART_Init()会使能UART1	

	/* Process Unlocked */
	__HAL_UNLOCK(&UART1_Handler);

	/* Enable the UART Parity Error Interrupt */
	__HAL_UART_ENABLE_IT(&UART1_Handler, UART_IT_PE);

	/* Enable the UART Error Interrupt: (Frame error, noise error, overrun error) */
	__HAL_UART_ENABLE_IT(&UART1_Handler, UART_IT_ERR);

	/* Enable the UART Data Register not empty Interrupt */
	__HAL_UART_ENABLE_IT(&UART1_Handler, UART_IT_RXNE);     
}

//==========================================================
//	函数名称：	USART1_IRQHandler
//
//	函数功能：	串口1的中断处理服务函数
//
//	入口参数：	无
//
//	返回参数：	无
// 
//	说明：			
//==========================================================
uint8_t USART1_RecvBuffer[USART1_RECV_BUFFER_LENGTH]={0};
uint16_t USART1_RecvIndex =0;
void USART1_IRQHandler(void)
{
    if((__HAL_UART_GET_FLAG(&UART1_Handler, UART_FLAG_RXNE) != RESET))
    { //USART1接收数据寄存器非空，表明有数据
        USART1_RecvBuffer[USART1_RecvIndex++] = USART1->RDR;//读取数据寄存器中的数据。

        if((USART1_RecvIndex>=2)&&(USART1_RecvBuffer[USART1_RecvIndex-2] == '\r')&&(USART1_RecvBuffer[USART1_RecvIndex-1] == '\n'))
        {
            USART1_RecvIndex = 0;
        }
        if(USART1_RecvIndex >= (USART1_RECV_BUFFER_LENGTH-1))
				{//USART1_RecvIndex 大于或者等于USART1_RECV_BUFFER_LENGTH，超出USART1_RecvBuffer[]数据的范围
            USART1_RecvIndex = 0;
        }
    }
}

#endif


#if USART7

//注意,读取USARTx->SR能避免莫名其妙的错误   	
unsigned char  USART7_RX_BUF[USART7_REC_LEN];     //接收缓冲,最大USART_REC_LEN个字节.

unsigned int USART7_RX_STA=0;       //接收状态标记	  

unsigned char UART7_RxBuffer[UART7_RXBUFFERSIZE];//HAL库使用的串口接收缓冲

UART_HandleTypeDef UART7_Handler; //UART句柄

  
//==========================================================
//	函数名称：	UART7_Init
//
//	函数功能：	串口7初始化
//
//	入口参数：	bound:波特率
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void UART7_Init(int bound)
{	
	//UART 初始化设置
	UART7_Handler.Instance = UART7;					    				//UART7
	UART7_Handler.Init.BaudRate=bound;				    			//波特率
	UART7_Handler.Init.WordLength=UART_WORDLENGTH_8B;   //字长为8位数据格式
	UART7_Handler.Init.StopBits=UART_STOPBITS_1;	    	//一个停止位
	UART7_Handler.Init.Parity=UART_PARITY_NONE;		    	//无奇偶校验位
	UART7_Handler.Init.HwFlowCtl=UART_HWCONTROL_NONE;   //无硬件流控
	UART7_Handler.Init.Mode=UART_MODE_TX_RX;		    		//收发模式
  UART7_Handler.Init.OverSampling = UART_OVERSAMPLING_16;
	HAL_UART_Init(&UART7_Handler);					    				//HAL_UART_Init()会使能UART7
	
	HAL_UART_Receive_IT(&UART7_Handler, (unsigned char *)UART7_RxBuffer, UART7_RXBUFFERSIZE);//该函数会开启接收中断：标志位UART_IT_RXNE，并且设置接收缓冲以及接收缓冲接收最大数据量
	
	RS485_TX_EN();
	delay_ms(5);
	printf("欢迎使用蜂巢套件--串口通信实验\r\n");
	delay_ms(5);
	RS485_RX_EN();
}

//==========================================================
//	函数名称：	UART7_IRQHandler
//
//	函数功能：	串口7中断服务程序
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void UART7_IRQHandler(void)
{
	static unsigned char Res = 0;
	
	if((__HAL_UART_GET_FLAG(&UART7_Handler,UART_FLAG_RXNE)!=RESET))  //接收中断(接收到的数据必须是0x0d 0x0a结尾)
	{
		Res=UART7->RDR; 
		if((USART7_RX_STA&0x8000)==0)			//接收未完成
		{
			if(USART7_RX_STA&0x4000)				//接收到了0x0d
			{
				if(Res!=0x0a)USART7_RX_STA=0;	//接收错误,重新开始
				else USART7_RX_STA|=0x8000;		//接收完成了 
			}
			else //还没收到0X0D
			{
				if(Res==0x0d)USART7_RX_STA|=0x4000;
				else
				{
					USART7_RX_BUF[USART7_RX_STA&0X3FFF]=Res;
					USART7_RX_STA++;
					if(USART7_RX_STA>(USART7_REC_LEN-1))USART7_RX_STA=0;//接收数据错误,重新开始接收	  
				}		 
			}
		}   		 
	}
	HAL_UART_IRQHandler(&UART7_Handler);	
} 

#endif


//==========================================================
//	函数名称：	HAL_UART_MspInit
//
//	函数功能：	UART底层初始化，时钟使能，引脚配置，中断配置
//
//	入口参数：	huart:串口句柄
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void HAL_UART_MspInit(UART_HandleTypeDef *huart)
{
  //GPIO端口设置
	GPIO_InitTypeDef GPIO_Initure;

	if (huart->Instance==USART1)   								//如果是串口1，进行串口1 MSP初始化
	{
		__HAL_RCC_GPIOA_CLK_ENABLE();							//使能GPIOA时钟
		__HAL_RCC_USART1_CLK_ENABLE();						//使能USART1时钟

    GPIO_Initure.Pin = GPIO_PIN_9|GPIO_PIN_10;//PA9、PA10
    GPIO_Initure.Mode = GPIO_MODE_AF_PP;			//复用推挽输出
    GPIO_Initure.Pull = GPIO_NOPULL;					//无上下拉
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_VERY_HIGH;//高速
    GPIO_Initure.Alternate = GPIO_AF7_USART1;	//复用为UART1
    HAL_GPIO_Init(GPIOA, &GPIO_Initure);			//PA9、PA10
		
#if EN_USART1_RX
		HAL_NVIC_EnableIRQ(USART1_IRQn);					//使能USART1中断通道
		HAL_NVIC_SetPriority(USART1_IRQn,1,2);		//抢占优先级1，子优先级2
#endif	
	}
	else if(huart->Instance==UART7)							//如果是串口7，进行串口7MSP初始化
	{
		__HAL_RCC_GPIOF_CLK_ENABLE();							//使能GPIOF时钟
		__HAL_RCC_UART7_CLK_ENABLE();							//使能USART7时钟
		
    GPIO_Initure.Pin = GPIO_PIN_6|GPIO_PIN_7;	//PF6、PF7
    GPIO_Initure.Mode = GPIO_MODE_AF_PP;			//复用推挽输出
    GPIO_Initure.Pull = GPIO_NOPULL;					//无上下拉
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_VERY_HIGH;//高速
    GPIO_Initure.Alternate = GPIO_AF8_UART7;	//复用为UART7
    HAL_GPIO_Init(GPIOF, &GPIO_Initure);			//PF6、PF7
		
#if EN_USART7_RX
		HAL_NVIC_EnableIRQ(UART7_IRQn);					//使能UART7中断通道
		HAL_NVIC_SetPriority(UART7_IRQn,1,3);		//抢占优先级1，子优先级3
#endif	
	}
}



//////////////////////////////////////////////////////////////////
//加入以下代码,支持printf函数,而不需要选择use MicroLIB	  
#if 1
#pragma import(__use_no_semihosting)             
//标准库需要的支持函数                 
struct __FILE 
{ 
	int handle; 

}; 

FILE __stdout;       
//定义_sys_exit()以避免使用半主机模式    
void _sys_exit(int x) 
{ 
	x = x; 
} 
//重定义fputc函数 
int fputc(int ch, FILE *f)
{
	while((UART7->ISR&0X40)==0);//循环发送,直到发送完毕   
    UART7->TDR = (unsigned char) ch;      
	return ch;
}
#endif 



