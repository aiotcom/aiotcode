#include "Noncontact_Temp.h"
#include "Rs485.h"
#include "usart.h"
#include "delay.h"
#include "key.h"
#include "led.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-03-11
*
*	版本： 		V1.0
*
*	说明： 		STM32F767-非接触温度模块
*
*	修改记录：
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
  unsigned char SlaveAddress;	//Contains device address
  unsigned char	command;	  	//Contains the access command
  unsigned int 	data;		  		//Contains data value	
	float temp;
  SlaveAddress=SA<<1;					//Set device address
  command=RAM_Access|RAM_To; 	   

  HAL_Init();             		//初始化HAL库
	Rs485_Init();								//初始化485
	UART7_Init(115200);					//初始化串口七
	mlx_gpio_init();						//初始化非接触温度传感器

	while(1)
	{
		data=MemRead(SlaveAddress,command); //Read memory
		temp=CalcTemp(data);
		//sprintf((char *)buf," tmp:%0.2f      ",temp);

		RS485_TX_EN();		//开启485发送
		Rs485_delay_ms(5);
		printf("tmp:%0.2f\r\n",temp);
		Rs485_delay_ms(5);
		RS485_RX_EN();		//开启485接收
		
		delay_ms(1000);	
	}
}







