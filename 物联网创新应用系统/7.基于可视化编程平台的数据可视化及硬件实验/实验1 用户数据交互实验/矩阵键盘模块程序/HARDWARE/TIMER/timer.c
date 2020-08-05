#include "Martix_Key.h"
#include "stm32f1xx.h"
#include "timer.h"
#include "Usart.h"
#include "delay.h"
#include "Rs485.h"

TIM_HandleTypeDef TIM3_Handler;      	//定时器句柄 
	
//==========================================================
//	函数名称：	TIM3_Init
//
//	函数功能：	通用定时器3中断初始化
//
//	入口参数：	
//							arr：自动重装值。
//							psc：时钟预分频数
//							定时器溢出时间计算方法:Tout=((arr+1)*(psc+1))/Ft us.
//							Ft=定时器工作频率,单位:Mhz
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void TIM3_Init(uint16_t arr,uint16_t psc)
{  
    TIM3_Handler.Instance=TIM3;                          //通用定时器3
    TIM3_Handler.Init.Prescaler=psc;                     //分频系数
    TIM3_Handler.Init.CounterMode=TIM_COUNTERMODE_UP;    //向上计数器
    TIM3_Handler.Init.Period=arr;                        //自动装载值
    TIM3_Handler.Init.ClockDivision=TIM_CLOCKDIVISION_DIV1;//时钟分频因子
    HAL_TIM_Base_Init(&TIM3_Handler);
    
    HAL_TIM_Base_Start_IT(&TIM3_Handler); //使能定时器3和定时器3更新中断：TIM_IT_UPDATE   
}

//==========================================================
//	函数名称：	HAL_TIM_Base_MspInit
//
//	函数功能：	定时器底册驱动，开启时钟，设置中断优先级
//
//	入口参数：	
//
//	返回参数：	无
//
//	说明：			此函数会被HAL_TIM_Base_Init()函数调用
//==========================================================
void HAL_TIM_Base_MspInit(TIM_HandleTypeDef *htim)
{
  if(htim->Instance==TIM3)
	{
		__HAL_RCC_TIM3_CLK_ENABLE();            //使能TIM3时钟
		HAL_NVIC_SetPriority(TIM3_IRQn,1,3);    //设置中断优先级，抢占优先级1，子优先级3
		HAL_NVIC_EnableIRQ(TIM3_IRQn);          //开启ITM3中断   
	}
}

//==========================================================
//	函数名称：	TIM3_IRQHandler
//
//	函数功能：	定时器3中断服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void TIM3_IRQHandler(void)
{
	if(!DataHandling_485(Addr_Matrixkey)) //接收到命令后返回按键值
	{
		if(Key_value)
		{
			Rs485_Send(Addr_Matrixkey,Rx_Stack.Src_Adr,Key_value,0,0);
			Key_value = 0;
		}
	}
	
//	if(Key_value)
//	{
//		switch(Key_value)
//		{
//			case Matrixkey0:
//				printf("KEY-Value:0\r\n");
//			break;
//			case Matrixkey1:
//				printf("KEY-Value:1\r\n");
//			break;
//			case Matrixkey2:
//				printf("KEY-Value:2\r\n");
//			break;
//			case Matrixkey3:
//				printf("KEY-Value:3\r\n");
//			break;
//			case Matrixkey4:
//				printf("KEY-Value:4\r\n");
//			break;
//			case Matrixkey5:
//				printf("KEY-Value:5\r\n");
//			break;
//			case Matrixkey6:
//				printf("KEY-Value:6\r\n");
//			break;
//			case Matrixkey7:
//				printf("KEY-Value:7\r\n");
//			break;
//			case Matrixkey8:
//				printf("KEY-Value:8\r\n");
//			break;
//			case Matrixkey9:
//				printf("KEY-Value:9\r\n");
//			break;
//			case MatrixkeyEnter:
//				printf("KEY-Value:Enter\r\n");
//			break;
//			case MatrixkeyCanel:
//				printf("KEY-Value:Canel\r\n");
//			break;
//			case MatrixkeyUP:
//				printf("KEY-Value:UP\r\n");
//			break;
//			case MatrixkeyDown:
//				printf("KEY-Value:Down\r\n");
//			break;
//			case MatrixkeyLeft:
//				printf("KEY-Value:Left\r\n");
//			break;
//			case MatrixkeyRight:
//				printf("KEY-Value:Right\r\n");
//			break;
//			default:break;
//		}
//		Key_value = 0;
//	}
	
  HAL_TIM_IRQHandler(&TIM3_Handler);
}










