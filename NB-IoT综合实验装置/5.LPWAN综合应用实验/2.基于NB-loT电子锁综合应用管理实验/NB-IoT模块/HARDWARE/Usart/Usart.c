#include "MsgHandler.h"
#include "stm32f1xx.h"
#include "usart.h"	
#include "Rs485.h"	
#include "timer.h"
#include "delay.h"
#include "M5310.h"
#include "nbiot.h"
#include "utils.h"
#include "coap.h"

#if UART1   //使能接收

//串口1中断服务程序
//注意,读取USARTx->SR能避免莫名其妙的错误   	
unsigned char  USART1_RX_BUF[USART1_REC_LEN];     //接收缓冲,最大USART_REC_LEN个字节.

unsigned int USART1_RX_STA=0;       							//接收状态标记	  

unsigned char UART1_RxBuffer[UART1_RXBUFFERSIZE];	//HAL库使用的串口接收缓冲

UART_HandleTypeDef UART1_Handler; 								//UART句柄
  

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
	UART1_Handler.Instance=USART1;					    			//USART1
	UART1_Handler.Init.BaudRate=bound;				    		//波特率
	UART1_Handler.Init.WordLength=UART_WORDLENGTH_8B; //字长为8位数据格式
	UART1_Handler.Init.StopBits=UART_STOPBITS_1;	    //一个停止位
	UART1_Handler.Init.Parity=UART_PARITY_NONE;		    //无奇偶校验位
	UART1_Handler.Init.HwFlowCtl=UART_HWCONTROL_NONE; //无硬件流控
	UART1_Handler.Init.Mode=UART_MODE_TX_RX;		    	//收发模式
	HAL_UART_Init(&UART1_Handler);					    			//HAL_UART_Init()会使能UART1
	
	HAL_UART_Receive_IT(&UART1_Handler, (unsigned char *)UART1_RxBuffer, UART1_RXBUFFERSIZE);//该函数会开启接收中断：标志位UART_IT_RXNE，并且设置接收缓冲以及接收缓冲接收最大数据量
}

//==========================================================
//	函数名称：	USART1_IRQHandler()
//
//	函数功能：	串口1中断服务程序
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void USART1_IRQHandler(void)
{
	static unsigned char Res = 0;

	if((__HAL_UART_GET_FLAG(&UART1_Handler,UART_FLAG_RXNE)!=RESET))  //接收中断
	{
		Res=USART1->DR; 
		if(USART1_RX_STA!=0x8000)
		{
			Rs485_Receive(Res);			//进入485接收函数
		}
	}
	HAL_UART_IRQHandler(&UART1_Handler);
}

#endif

#if UART2

//串口2中断服务程序
//注意,读取USARTx->SR能避免莫名其妙的错误   	
//串口2中断服务程序
//注意,读取USARTx->SR能避免莫名其妙的错误   	
//unsigned char  USART2_RX_BUF[USART2_REC_LEN];     //接收缓冲,最大USART_REC_LEN个字节.

//unsigned int USART2_RX_STA=0;       //接收状态标记	  

//unsigned char UART2_RxBuffer[UART2_RXBUFFERSIZE];//HAL库使用的串口接收缓冲

UART_HandleTypeDef UART2_Handler; //UART句柄
unsigned int 	USART2_RX_STA = 0;

//==========================================================
//	函数名称：	UART2_Init()
//
//	函数功能：	串口2初始化
//
//	入口参数：	bound:波特率
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void UART2_Init(int bound)
{	
	//UART 初始化设置
	UART2_Handler.Instance          = USART2;					    	//USART1
	UART2_Handler.Init.BaudRate     = bound;				    		//波特率
	UART2_Handler.Init.WordLength   = UART_WORDLENGTH_8B;   //字长为8位数据格式
	UART2_Handler.Init.StopBits     = UART_STOPBITS_1;	    //一个停止位
	UART2_Handler.Init.Parity       = UART_PARITY_NONE;		  //无奇偶校验位
	UART2_Handler.Init.HwFlowCtl    = UART_HWCONTROL_NONE;  //无硬件流控
	UART2_Handler.Init.Mode         = UART_MODE_TX_RX;		  //收发模式
  UART2_Handler.Init.OverSampling = UART_OVERSAMPLING_16;
	HAL_UART_Init(&UART2_Handler);					    						//HAL_UART_Init()会使能UART1	

	/* Process Unlocked */
	__HAL_UNLOCK(&UART2_Handler);

	/* Enable the UART Parity Error Interrupt */
	__HAL_UART_ENABLE_IT(&UART2_Handler, UART_IT_PE);

	/* Enable the UART Error Interrupt: (Frame error, noise error, overrun error) */
	__HAL_UART_ENABLE_IT(&UART2_Handler, UART_IT_ERR);

	/* Enable the UART Data Register not empty Interrupt */
	__HAL_UART_ENABLE_IT(&UART2_Handler, UART_IT_RXNE);    
}

//==========================================================
//	函数名称：	USART2_SendBytes()
//
//	函数功能：	通过串口2发送指令长度的数据。
//
//	入口参数：	uint8_t  *pdata,指向将发送数据的指针。
//              uint16_t lenght,将发送的数据长度。
//	返回参数：	无
//
//	说明：		
//==========================================================
void USART2_SendBytes(char *pdata,uint16_t lenght)
{
    while(lenght)
    {
        while((USART2->SR&0X40) == 0);  //USART_FLAG_TC 发送完成标志
        USART2->DR = *pdata;   //向USART2的DR寄存器写入数据，启动发送 
        pdata++;
        lenght--;
    }
}

//==========================================================
//	函数名称：	USART2_IRQHandler
//
//	函数功能：	串口2的中断处理服务函数
//
//	入口参数：	无
//
//	返回参数：	无
// 
//	说明：		
//==========================================================
uint8_t USART2_RecvBuffer[USART2_RECV_BUFFER_LENGTH]={0};
uint16_t USART2_RecvIndex =0;
void USART2_IRQHandler(void)
{
	if((__HAL_UART_GET_FLAG(&UART2_Handler, UART_FLAG_RXNE) != RESET))
	{ //USART2接收数据寄存器非空，表明有数据
		USART2_RecvBuffer[USART2_RecvIndex++] = (uint8_t)UART2_Handler.Instance->DR;//读取数据寄存器中的数据。

		if((USART2_RecvIndex>=2)&&(USART2_RecvBuffer[USART2_RecvIndex-2] == '\r')&&(USART2_RecvBuffer[USART2_RecvIndex-1] == '\n'))
		{
				USART2_RecvIndex = 0;
		}
		if(USART2_RecvIndex >= (USART2_RECV_BUFFER_LENGTH-1))
		{//USART2_RecvIndex 大于或者等于USART2_RECV_BUFFER_LENGTH，超出USART2_RecvBuffer[]数据的范围
				USART2_RecvIndex = 0;
		}
	}
}


#endif

//==========================================================
//	函数名称：	HAL_UART_MspInit()
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
  /*	GPIO端口设置	*/
	GPIO_InitTypeDef GPIO_Initure;
    
	if (huart->Instance==USART1)   								//如果是串口1，进行串口1 MSP初始化
	{
			__HAL_RCC_GPIOA_CLK_ENABLE();							//使能GPIOA时钟
			__HAL_RCC_USART1_CLK_ENABLE();						//使能USART1时钟
			__HAL_RCC_AFIO_CLK_ENABLE();

			GPIO_Initure.Pin=GPIO_PIN_9;							//PA9
			GPIO_Initure.Mode=GPIO_MODE_AF_PP;				//复用推挽输出
			GPIO_Initure.Pull=GPIO_PULLUP;						//上拉
			GPIO_Initure.Speed=GPIO_SPEED_FREQ_HIGH;	//高速
			HAL_GPIO_Init(GPIOA,&GPIO_Initure);	   		//初始化PA9

			GPIO_Initure.Pin=GPIO_PIN_10;							//PA10
			GPIO_Initure.Mode=GPIO_MODE_AF_INPUT;			//模式要设置为复用输入模式！	
			HAL_GPIO_Init(GPIOA,&GPIO_Initure);	   		//初始化PA10
			
	#if EN_USART1_RX
			HAL_NVIC_EnableIRQ(USART1_IRQn);					//使能USART1中断通道
			HAL_NVIC_SetPriority(USART1_IRQn,1,1);		//抢占优先级1，子优先级1
	#endif	
	}
  else if(huart->Instance==USART2)							//如果是串口2，进行串口2 MSP初始化
	{
				__HAL_RCC_GPIOA_CLK_ENABLE();						//使能GPIOA时钟
				__HAL_RCC_USART2_CLK_ENABLE();					//使能USART2时钟
				
			 // __HAL_RCC_AFIO_CLK_ENABLE();

				GPIO_Initure.Pin=GPIO_PIN_2;						//PA2
				GPIO_Initure.Mode=GPIO_MODE_AF_PP;			//复用推挽输出
				GPIO_Initure.Pull=GPIO_PULLUP;					//上拉
				GPIO_Initure.Speed=GPIO_SPEED_FREQ_HIGH;//高速
				HAL_GPIO_Init(GPIOA,&GPIO_Initure);	   	//初始化PA2

				GPIO_Initure.Pin=GPIO_PIN_3;						//PA3
				GPIO_Initure.Mode=GPIO_MODE_AF_INPUT;		//模式要设置为复用输入模式！	
				HAL_GPIO_Init(GPIOA,&GPIO_Initure);	   	//初始化PA3
				
		#if EN_USART2_RX
				HAL_NVIC_EnableIRQ(USART2_IRQn);				//使能USART2中断通道
				HAL_NVIC_SetPriority(USART2_IRQn,0,2);	//抢占优先级0，子优先级2
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
	while((USART1->SR&0X40)==0);//循环发送,直到发送完毕   
    USART1->DR = (unsigned char) ch;
	return ch;
}
#endif

//==========================================================
//	函数名称：	DataRep()
//
//	函数功能：	显示数据装换
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
uint8_t SendBuf[40];
uint8_t SendData[10];
uint8_t RFID_Date[20];
uint8_t ucArray_ID[10];
void DataRep(uint8_t data,uint8_t num,uint8_t flag,uint8_t flg)
{
  if(flg)
  {
    switch(data)
    {
      case 0x0A:
        SendData[num] = 65;
        break;
      case 0x0B:
        SendData[num] = 66;
        break;
      case 0x0C:
        SendData[num] = 67;
        break;
      case 0x0D:
        SendData[num] = 68;
        break;
      case 0x0E:
        SendData[num] = 69;
        break; 
      case 0x0F:
        SendData[num] = 70;
        break; 
      default:
        if(flag)
        {
          SendData[num] = (ucArray_ID[(num/2)]>>4)+0x30;
        }
        else
        {
          SendData[num] = (ucArray_ID[(num/2)]&0x0f)+0x30;
        }     
      break;
    } 
  }
  else
  {
    switch(data)
    {
      case 0x0A:
        SendBuf[num] = 65;
        break;
      case 0x0B:
        SendBuf[num] = 66;
        break;
      case 0x0C:
        SendBuf[num] = 67;
        break;
      case 0x0D:
        SendBuf[num] = 68;
        break;
      case 0x0E:
        SendBuf[num] = 69;
        break; 
      case 0x0F:
        SendBuf[num] = 70;
        break; 
      default:
        if(flag)
        {
          SendBuf[num] = (RFID_Date[(num/2)]>>4)+0x30;
        }
        else
        {
          SendBuf[num] = (RFID_Date[(num/2)]&0x0f)+0x30;
        }     
      break;
    }
  }
}

//==========================================================
//	函数名称：	USART1_IRQHand()
//
//	函数功能：	处理串口1数据
//
//	入口参数：	huart:串口句柄
//              
//	返回参数：	无
//
//	说明：			 
//==========================================================
void USART1_IRQHand(void)
{
	static uint16_t i = 0;
	
	if(!DataHandling_485(Addr_NB))					//处理485中传输给NB模块的数据
	{
		switch(Rx_Stack.Src_Adr)
		{
			case Addr_TFT:			//处理TFT屏反馈数据
				Command_Relay = Rx_Stack.Command;	//保存值
				break;
			case Addr_Matrixkey://处理矩阵键盘数据
				Command_KEY = Rx_Stack.Command;		//保存键值
				break;
			case Addr_RFID:			//处理RFID数据
				for(i=0;i<20;i++)
				{
					RFID_Data[i] = Rx_Stack.Data[i];//保存值
				}
				for(i=0;i<4;i++)
				{
					ucArray_ID[i] = Rx_Stack.Data[i];
				}
				
				if(!(!ucArray_ID[0] && !ucArray_ID[1] && !ucArray_ID[2] && !ucArray_ID[3]))
				{
					for(i = 0;i < 8;i ++)
					{
						if(i%2==0)
						{
							 DataRep((ucArray_ID[(i/2)]>>4),i,1,1);
						}
						else
						{
							DataRep((ucArray_ID[(i/2)]&0x0f),i,0,1);
						}
					}
				}
				break;
			default: break;
		}
	}
}

//==========================================================
//	函数名称：	USART2_IRQHand()
//
//	函数功能：	处理串口2数据
//
//	入口参数：	huart:串口句柄
//              
//	返回参数：	无
//
//	说明：				
//==========================================================
void USART2_IRQHand(void)
{
	
//	
//	if(msgcode == COAP_WRITE)
//	{

//	}

}




