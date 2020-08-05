#include "timer.h"
#include "Rs485.h"	
#include "delay.h"
#include "Usart.h"
#include "M5310.h"
#include "nbiot.h"
#include "stm32f1xx.h"

uint8_t RFID_Data[30],Realy_State[10]={0x30};
uint16_t Command_Relay,Command_KEY,Command;	//控制继电器命令码、接收按键值命令码、接收RFID数据命令码
uint32_t Task_Count = 0,Task_Count2 = 0;		//分时任务计数值
TIM_HandleTypeDef TIM2_Handler; 		//定时器句柄 

//==========================================================
//	函数名称：	TIM2_Init
//
//	函数功能：	通用定时器3中断初始化
//
//	入口参数：	arr：自动重装值。
//              psc：时钟预分频数
//
//	返回参数：	无
//
//	说明：		定时器溢出时间计算方法:Tout=((arr+1)*(psc+1))/Ft us.   Ft=定时器工作频率,单位:Mhz
//==========================================================
void TIM2_Init(unsigned int arr,unsigned int psc)
{  
    TIM2_Handler.Instance=TIM2;                          //通用定时器2
    TIM2_Handler.Init.Prescaler=psc;                     //分频系数
    TIM2_Handler.Init.CounterMode=TIM_COUNTERMODE_UP;    //向上计数器
    TIM2_Handler.Init.Period=arr;                        //自动装载值
    TIM2_Handler.Init.ClockDivision=TIM_CLOCKDIVISION_DIV1;//时钟分频因子
    HAL_TIM_Base_Init(&TIM2_Handler);
    
    HAL_TIM_Base_Start_IT(&TIM2_Handler); //使能定时器2和定时器2更新中断：TIM_IT_UPDATE   
}

//==========================================================
//	函数名称：	HAL_TIM_Base_MspInit
//
//	函数功能：	使能定时器
//
//	入口参数：	htim：定时器
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void HAL_TIM_Base_MspInit(TIM_HandleTypeDef *htim)
{
  if(htim->Instance==TIM2)
	{
		__HAL_RCC_TIM2_CLK_ENABLE();            //使能TIM2时钟
		HAL_NVIC_SetPriority(TIM2_IRQn,1,1);    //设置中断优先级，抢占优先级1，子优先级3
		HAL_NVIC_EnableIRQ(TIM2_IRQn);          //开启ITM2中断   
	}
}

//==========================================================
//	函数名称：	TIM2_IRQHandler
//
//	函数功能：	定时器2中断服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			 
//==========================================================
void TIM2_IRQHandler(void)
{
	Task_Count++;
	Task_Count2++;
	switch(Task_Count)
	{
		case 10:	//100ms 	获取矩阵键盘按键值
			Rs485_Send(Addr_NB,Addr_Matrixkey,NB_QueryMatrixkey,0,"");
			break;
		case 20:	//200ms 	获取RFID值
			Rs485_Send(Addr_NB,Addr_RFID,NB_RFID,0,"");
			break;
		case 30:	//300ms 	发送数据到TFT屏显示
			if(Command_KEY)
			{
				Rs485_Send(Addr_NB,Addr_TFT,Command_KEY,0,"");
				Command_KEY = 0;
			}
			break;
		case 40:	//400ms 	发送数据到TFT屏显示
			if(RFID_Data[0])
			{
				Rs485_Send(Addr_NB,Addr_TFT,RFID_All,20,RFID_Data);
				memset(RFID_Data,0,20);
			}
			break;
		case 50:	//500ms 	发送控制命令到TFT屏
			Rs485_Send(Addr_NB,Addr_TFT,Command_Relay,0,"");
			break;
		case 60:	//600ms 	控制继电器
			Rs485_Send(Addr_NB,Addr_Relay,Command_Relay,0,"");
			switch(Command_Relay)
			{
				case Relay1_ON:	//发送LOCK状态到云平台
					Realy_State[0] = 0x31;
					break;
				case Relay2_ON:	//发送LOCK状态到云平台
					Realy_State[0] = 0x30;
					break;
				default: break;
			}
			Command_Relay = 0;
			Task_Count = 0;
			break;
		default: break;
	}
	
	switch(Task_Count2)
	{
		case 85:	//850ms 
			m5310_notify_upload(&Lock_uri,NBIOT_STRING,(char*)Realy_State,1,0);	//上传LOCK状态
			break;
		case 155:	//1550ms 
			m5310_notify_upload(&RFID_uri,NBIOT_STRING,(char*)&SendData[0],1,0);	//上传RFID数据
			Task_Count2 = 0;
			break;
		default: break;
	}
	
	HAL_TIM_IRQHandler(&TIM2_Handler);
}





