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
    P1SEL &= ~0xF0;     //设置P1.4、P1.5、P1.6、P1.7为普通IO口  
    P1DIR |= 0xF0;      //P1.4、P1.5、P1.6、P1.7定义为输出
    
    P0SEL &= ~0x0D;     //设置P0.0、P0.2、P0.3为普通IO口  
    P0DIR &= ~0x0D;     //按键接在P0.0、P0.2、P0.3口上，设P0.0、P0.2、P0.3为输入模式 
    P0INP &= ~0x0D;     //打开P0.0、P0.2、P0.3上拉电阻
    
    P1SEL &= ~0x04;     //设置P1.2为普通IO口  
    P1DIR &= ~0x04;     //按键接在P1.2口上，设P1.2为输入模式 
    P1INP &= ~0x04;     //打开P1.2上拉电阻
    
    WKEY_All_Low();	//初始化全部置0
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
uint16_t Key_value;	  //存放按键值

void KEY_ConFig(void)
{
  static uint8_t cnt = 0; //计数遍历
	
  switch(cnt%4)
  {
    case 0:
      {
        WKEY_All_Hight(); //输出脚全部拉高
        delay_ms(2);
        WKEY_1_Low();	  //开启第一组（Enter、1、4、7）检测
        delay_ms(2);
/*
*	key 7 push down		
*/
        if(!RKEY_Up_Read())
        {
          delay_ms(5);            //延时消抖	
        if(!RKEY_Up_Read())
        {
          Key_value = Matrixkey7; //按键7
          while(!RKEY_Up_Read());
        }
/*
*	key 4 push down
*/
        }
        else if(!RKEY_Down_Read())
        {
          delay_ms(5);  	  //延时消抖
          if(!RKEY_Down_Read())
          {
            Key_value = Matrixkey4;	//按键4
            while(!RKEY_Down_Read());
          }				
/*
*	key 1 push down
*/					
        }
        else if(!RKEY_Left_Read())
        {
          delay_ms(5);  		//延时消抖				
          if(!RKEY_Left_Read())
          {
            Key_value = Matrixkey1;	//按键1
            while(!RKEY_Left_Read());
          }	
/*
*	key Enter push down
*/		
        }
          else if(!RKEY_Right_Read())
          {  
            delay_ms(5);  		//延时消抖					
            if(!RKEY_Right_Read())
            {
              Key_value = MatrixkeyEnter;	//按键Enter
              while(!RKEY_Right_Read());
            }
        }
        else
        {

        }        
        break;
      }
    case 1:
      {
        WKEY_All_Hight();   //输出脚全部拉高
        delay_ms(2);
        WKEY_2_Low();	    //开启第二组（0、2、5、8）检测
        delay_ms(2);
/*
*	key 8 push down
*/	
        if(!RKEY_Up_Read())
        {        
          delay_ms(5);  		//延时消抖				
          if(!RKEY_Up_Read())
          {
            Key_value = Matrixkey8;	//按键8
            while(!RKEY_Up_Read());
          }					
/*
*	key 5 push down
*/		
        }
        else if(!RKEY_Down_Read())
        {
          delay_ms(5);  		//延时消抖
          if(!RKEY_Down_Read())
          {
            Key_value = Matrixkey5;	//按键5
            while(!RKEY_Down_Read());	
          }			
/*
*	key 2 push down
*/		
        }
        else if(!RKEY_Left_Read())
        {
          delay_ms(5);  		//延时消抖	
          if(!RKEY_Left_Read())
          {
            Key_value = Matrixkey2;	//按键2
            while(!RKEY_Left_Read());
          }			
 /*
*	key 0 push down
*/	         
        }
        else if(!RKEY_Right_Read())
        {
          delay_ms(5);  		//延时消抖			
          if(!RKEY_Right_Read())
          {
            Key_value = Matrixkey0;	//按键0
            while(!RKEY_Right_Read());
          }
        }
        else
        {
        }
        break;
      }
    case 2:
      {
        WKEY_All_Hight();   //输出脚全部拉高
        delay_ms(2);
        WKEY_3_Low();	    //开启第三组（Canel、3、6、9）检测	
        delay_ms(2);
 /*
*	key 9 push down
*/	    
        if(!RKEY_Up_Read())
        { 
          delay_ms(5);  	        //延时消抖					
          if(!RKEY_Up_Read())
          {
              Key_value = Matrixkey9;	//按键9
              while(!RKEY_Up_Read());
          }			
 /*
*	key 6 push down
*/	          
        }
        else if(!RKEY_Down_Read())
        {    
          delay_ms(5);  		//延时消抖		
          if(!RKEY_Down_Read())
          {
            Key_value = Matrixkey6;	//按键6
            while(!RKEY_Down_Read());
          }				
 /*
*	key 3 push down
*/	 	
        }
        else if(!RKEY_Left_Read())
        {
          delay_ms(5);  		//延时消抖
          if(!RKEY_Left_Read())
          {
            Key_value = Matrixkey3;	//按键3
            while(!RKEY_Left_Read());
          }
 /*
*	key Canel push down
*/	           
        }
        else if(!RKEY_Right_Read())
        {
          delay_ms(5);  		//延时消抖
          if(!RKEY_Right_Read())
          {
            Key_value = MatrixkeyCanel;	//按键Canel
            while(!RKEY_Right_Read());
          }
        }
        else
        {
					
        }
        break;
      }
    case 3:
      {
        WKEY_All_Hight();	//输出脚全部拉高
        delay_ms(2);
        WKEY_Right_Low();	//开启第Right组（Right、Left、Down、UP）检测	
        delay_ms(2);
 /*
*	key up push down
*/	  
        if(!RKEY_Up_Read())
        {
          delay_ms(5);  		//延时消抖
          if(!RKEY_Up_Read())
          {
            Key_value = MatrixkeyUP;	//按键up
            while(!RKEY_Up_Read());
          }
 /*
*	key down push down
*/	            
        }else if(!RKEY_Down_Read()){
        delay_ms(5);  			//延时消抖	
        if(!RKEY_Down_Read())
        {
          Key_value = MatrixkeyDown;	//按键down
          while(!RKEY_Down_Read());
        }	
 /*
*	key left push down
*/	  
        }
        else if(!RKEY_Left_Read())
        {
          delay_ms(5);  		//延时消抖	
          if(!RKEY_Left_Read())
          {
            Key_value = MatrixkeyLeft;	//按键left
            while(!RKEY_Left_Read());
          } 
 /*
*	key right push down
*/	  					
        }
        else if(!RKEY_Right_Read())
        {
          delay_ms(5);  		//延时消抖				
          if(!RKEY_Right_Read())
          {
            Key_value = MatrixkeyRight;	//按键right
            while(!RKEY_Right_Read());				
          }					
        }
        else
        {			
        }
        break;
      }
    }
	
    cnt++;   //计数累加
}
    





