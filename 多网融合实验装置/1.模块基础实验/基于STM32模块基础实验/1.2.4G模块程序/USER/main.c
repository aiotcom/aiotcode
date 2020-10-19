#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "string.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "timer.h"
#include "main.h"
#include "24l01.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-03-18
*
*	版本： 		V1.2
*
*	说明： 		2.4G模块程序
*
*	修改记录：
************************************************************
************************************************************
************************************************************
**/

#define NRF24L01_CH  0x50  //取值范围0~0x70
enum{
    NRF24L01_TX,//发送模式
    NRF24L01_RX //接收模式
};

uint8_t NRF24L01_MODE = NRF24L01_RX;//NRF24L01_TX->发送模式,NRF24L01_RX->接收模式
uint8_t NRF_TxBuffer[32]={"on"},NRF_RxBuffer[32];//NRF24L01 每次发送最大字节数 是32个字节

void Platform_RGB_LED_Init(void);
int main(void)
{
    uint8_t cmdsel=1;
    HAL_Init();             	    //初始化HAL库  
	Rs485_Init();				    //初始化485
	UART1_Init(115200);				//初始化串口1
    USART3_Init(115200);            //printf 打印信息，PB10->TX,PB11->RX,通常只使用，TX功能
    NRF24L01_Init(NRF24L01_CH);                //初始化NRF24L01无线芯片
    Platform_RGB_LED_Init();        //初始化底座RGB灯
    if(NRF24L01_MODE == NRF24L01_RX){
        printf("我是接送端\r\n");
    }
    else{
        printf("我是发送端\r\n");    
    }
    while(NRF24L01_Check())
    {//nrf24l01硬件连接提示错误
        printf("nrf24l01 check  error\r\n");
        HAL_Delay(1000);
    }
    printf("nrf24l01 check  ok\r\n");
    
    if (NRF24L01_MODE == NRF24L01_TX) 
    { //发送模式   
        while(1)
        {
            NRF24L01_TX_Mode();
            if(NRF24L01_TxPacket(NRF_TxBuffer)==TX_OK)
            {//发送成功	

            }
            cmdsel = 1 - cmdsel;
            NRF_TxBuffer[0] = cmdsel?0x55:0xAA;
            HAL_Delay(500);	//每500ms 发送一次数据
        }        
    }    
    
    if (NRF24L01_MODE == NRF24L01_RX) 
    {//接收模式
        NRF24L01_RX_Mode();
        while(1)
        {        
            if(NRF24L01_RxPacket(NRF_RxBuffer)==0)
            {//接收到数据
                if(NRF_RxBuffer[0] == 0x55)
                {
                    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4
                                            |GPIO_PIN_3
                                            |GPIO_PIN_15,GPIO_PIN_RESET/*控制状态 输出低*/);//点亮RGB灯
                }
                else if(NRF_RxBuffer[0] == 0xAA)
                {            
                    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4
                                            |GPIO_PIN_3
                                            |GPIO_PIN_15,GPIO_PIN_SET/*控制状态 输出高*/);//关闭RGB灯
                }
            }
            HAL_Delay(5);	        
        }         
    }      
}
//==========================================================
//	函数名称：	void Platform_RGB_LED_Init(void)
//
//	函数功能：	初始化底座的RGB灯
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================	
void Platform_RGB_LED_Init(void)
{    
    GPIO_InitTypeDef GPIO_Initure;
    
    __HAL_RCC_AFIO_CLK_ENABLE();	
    __HAL_AFIO_REMAP_SWJ_NOJTAG(); //GPIO_PIN_3,GPIO_PIN_4 为JTAG管脚的部分
    
    __HAL_RCC_GPIOB_CLK_ENABLE();           	                
    __HAL_RCC_GPIOA_CLK_ENABLE();           	              

    GPIO_Initure.Mode  = GPIO_MODE_OUTPUT_PP;  	                
    GPIO_Initure.Pull  = GPIO_PULLUP;          	                
    GPIO_Initure.Speed = GPIO_SPEED_HIGH;    	 	       
    
    GPIO_Initure.Pin   = GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_15; 	
    HAL_GPIO_Init(GPIOB,&GPIO_Initure);

    GPIO_Initure.Pin   = GPIO_PIN_15; 	                        	 	            
    HAL_GPIO_Init(GPIOA,&GPIO_Initure);
    
    
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_15,GPIO_PIN_SET);	
    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15                      ,GPIO_PIN_SET);        
}


