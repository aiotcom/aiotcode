#include "Martix_Key.h"	
#include "Rs485.h"
#include "delay.h"

//==========================================================
//	函数名称：	KEY_Init
//
//	函数功能：	初始化按键
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void KEY_Init(void)
{
	  GPIO_InitTypeDef GPIO_Initure;
	
		/* GPIO Ports Clock Enable */
		__HAL_RCC_GPIOA_CLK_ENABLE();			//开启GPIOA时钟
		__HAL_RCC_GPIOB_CLK_ENABLE();			//开启GPIOB时钟
	
		GPIO_Initure.Pin = GPIO_PIN_0|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7;		//PA0、PA4、PA5、PA6、PA7
		GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;//推挽输出
		GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW; //低速
		HAL_GPIO_Init(GPIOA, &GPIO_Initure);
	
	  /*Configure GPIO pins : PB0 PB1 PB13 PB14 */
		GPIO_Initure.Pin = GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_13|GPIO_PIN_14;
		GPIO_Initure.Mode = GPIO_MODE_INPUT;   	//上拉输入
		GPIO_Initure.Pull = GPIO_PULLUP;				//上拉
		HAL_GPIO_Init(GPIOB, &GPIO_Initure);
	
		HAL_GPIO_WritePin(GPIOA,GPIO_PIN_0,GPIO_PIN_SET);	//PA0
		HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_PIN_RESET);	//PA4、5、6、7置0
}

//==========================================================
//	函数名称：	KEY_ConFig
//
//	函数功能：	接收按键输入
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
uint16_t Key_value;	//存放按键值

void KEY_ConFig(void)
{
	static uint8_t cnt = 0;  				//计数遍历
	
	switch(cnt%4){
    case 0:
      {
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_PIN_SET);
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_RESET);			
/*
*				key 7 push down		
*/
        if(!B0_Read())
				{
					delay_ms(5);  						//延时消抖	
					if(!B0_Read())
					{
						Key_value = Matrixkey7;	//按键7
						while(!B0_Read())
						{
							LED2_ON();						//LED2亮	
						}
					}
/*
*				key 4 push down
*/
        }
				else if(!B1_Read())
				{
					delay_ms(5);  						//延时消抖
					if(!B1_Read())
					{
						Key_value = Matrixkey4;	//按键4	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey4,0,"");	//485发送到TFT模块
						while(!B1_Read())
						{
							LED2_ON();						//LED2亮
						}	
					}				
/*
*				key 1 push down
*/					
        }
				else if(!B13_Read())
				{
					delay_ms(5);  						//延时消抖				
					if(!B13_Read())
					{
						Key_value = Matrixkey1;	//按键1	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey1,0,"");	//485发送到TFT模块
						while(!B13_Read())
						{
							LED2_ON();						//LED2亮
						}	
					}	
/*
*				key Enter push down
*/		
        }
				else if(!B14_Read())
				{  
					delay_ms(5);  						//延时消抖					
					if(!B14_Read())
					{
						Key_value = MatrixkeyEnter;	//按键Enter	Rs485_Send(Addr_Matrixkey,Addr_TFT,MatrixkeyEnter,0,"");	//485发送到TFT模块
						while(!B14_Read())
						{
							LED2_ON();						//LED2亮
						}		
					}
        }
        else
				{
					
				}        
        break;
      }
    case 1:
      {
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_PIN_SET);
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_5,GPIO_PIN_RESET);			
/*
*				key 8 push down
*/	
        if(!B0_Read())
				{        
					delay_ms(5);  						//延时消抖				
					if(!B0_Read())
					{
						Key_value = Matrixkey8;	//按键8	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey8,0,"");	//485发送到TFT模块
						while(!B0_Read())
						{
							LED2_ON();					//LED2亮
						}	
					}					
/*
*				key 5 push down
*/		
        }
				else if(!B1_Read())
				{
					delay_ms(5);  						//延时消抖
					if(!B1_Read())
					{
						Key_value = Matrixkey5;	//按键5	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey5,0,"");	//485发送到TFT模块
						while(!B1_Read())
						{
							LED2_ON();						//LED2亮
						}		
					}			
/*
*				key 2 push down
*/		
        }
        else if(!B13_Read())
        {
					delay_ms(5);  						//延时消抖	
					if(!B13_Read())
					{
						Key_value = Matrixkey2;	//按键2	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey2,0,"");	//485发送到TFT模块
						while(!B13_Read())
						{
							LED2_ON();						//LED2亮
						}	
					}			
 /*
*				key 0 push down
*/	         
        }
				else if(!B14_Read())
				{
					delay_ms(5);  						//延时消抖			
					if(!B14_Read())
					{
						Key_value = Matrixkey0;	//按键0	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey0,0,"");	//485发送到TFT模块
						while(!B14_Read())
						{
							LED2_ON();						//LED2亮
						}	
					}
        }
        else
        {
        }
        break;
      }
    case 2:
      {
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_PIN_SET);
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_6,GPIO_PIN_RESET);			
 /*
*				key 9 push down
*/	    
        if(!B0_Read())
				{ 
					delay_ms(5);  						//延时消抖					
					if(!B0_Read())
					{
						Key_value = Matrixkey9;	//按键9	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey9,0,"");	//485发送到TFT模块
						while(!B0_Read())
						{
							LED2_ON();						//LED2亮
						}	
					}			
 /*
*				key 6 push down
*/	          
        }
				else if(!B1_Read())
				{    
					delay_ms(5);  						//延时消抖		
					if(!B1_Read())
					{
						Key_value = Matrixkey6;	//按键6	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey6,0,"");	//485发送到TFT模块
						while(!B1_Read())
						{
							LED2_ON();						//LED2亮	
						}	
					}				
 /*
*				key 3 push down
*/	 	
        }
				else if(!B13_Read())
				{
					delay_ms(5);  						//延时消抖
					if(!B13_Read())
					{
						Key_value = Matrixkey3;	//按键3	Rs485_Send(Addr_Matrixkey,Addr_TFT,Matrixkey3,0,"");	//485发送到TFT模块
						while(!B13_Read())
						{
							LED2_ON();						//LED2亮
						}	
					}
 /*
*				key Canel push down
*/	           
        }
				else if(!B14_Read())
				{
					delay_ms(5);  						//延时消抖
					if(!B14_Read())
					{
						Key_value = MatrixkeyCanel;	//按键Canel	Rs485_Send(Addr_Matrixkey,Addr_TFT,MatrixkeyCanel,0,"");	//485发送到TFT模块
						while(!B14_Read())
						{
							LED2_ON();						//LED2亮	
						}	
					}
        }
				else
				{
					
        }
        
        break;
      }
    case 3:
      {
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_PIN_SET);
        HAL_GPIO_WritePin(GPIOA,GPIO_PIN_7,GPIO_PIN_RESET);
 /*
*				key up push down
*/	  
        if(!B0_Read())
				{
					delay_ms(5);  						//延时消抖
					if(!B0_Read())
					{
						Key_value = MatrixkeyUP;	//按键up //Rs485_Send(Addr_Matrixkey,Addr_TFT,MatrixkeyUP,0,"");	//485发送到TFT模块
						while(!B0_Read())
						{
							LED2_ON();						//LED2亮
						}	
					}
 /*
*				key down push down
*/	            
        }else if(!B1_Read()){
					delay_ms(5);  						//延时消抖	
					if(!B1_Read())
					{
						Key_value = MatrixkeyDown;	//按键down //Rs485_Send(Addr_Matrixkey,Addr_TFT,MatrixkeyDown,0,"");	//485发送到TFT模块
						while(!B1_Read())
						{
							LED2_ON();						//LED2亮		
						}	
					}	
 /*
*				key left push down
*/	  
        }
				else if(!B13_Read())
				{
					delay_ms(5);  						//延时消抖	
					if(!B13_Read())
					{
						Key_value = MatrixkeyLeft;	//按键left //Rs485_Send(Addr_Matrixkey,Addr_TFT,MatrixkeyLeft,0,"");	//485发送到TFT模块
						while(!B13_Read())
						{
							LED2_ON();						//LED2亮
						}	
					} 
 /*
*				key right push down
*/	  					
        }
				else if(!B14_Read())
				{
					delay_ms(5);  						//延时消抖				
					if(!B14_Read())
					{
						Key_value = MatrixkeyRight;	//按键right //Rs485_Send(Addr_Matrixkey,Addr_TFT,MatrixkeyRight,0,"");	//485发送到TFT模块
						while(!B14_Read())
						{
							LED2_ON();						//LED2亮
						}						
					}					
        }
				else
				{
					
        }
        break;
      }
    }
	
		if(B0_Read() && B1_Read() && B13_Read() && B14_Read())
		{
			LED2_OFF();	//LED2灭
		}
    cnt++;   			//计数累加
}

    

