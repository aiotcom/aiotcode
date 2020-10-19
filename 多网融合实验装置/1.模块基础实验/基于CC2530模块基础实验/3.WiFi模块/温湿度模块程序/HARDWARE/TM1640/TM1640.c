#include "TM1640.h"
#include "delay.h"
#include "TM1640.h"
#include "Usart.h"	
#include "delay.h"
#include "Rs485.h"
#include "SHT20.h"
#include "Time.h"
#include "ADC.h"
void init_tm1640(void);
void TM1640_Init(void)
{
    P1SEL &= ~0x30;     //设置P1.4、P1.5为普通IO口  
    P1DIR |= 0x30;      //P1.4、P1.5定义为输出
}

/******			TM1640			******/

unsigned char TM164_DATA[14] = {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x00,0X39,0X76,0X80};//0~9,空白，C,H,点;
unsigned char TM164_SIG[4] = {0x01,0x02,0x04,0x08};

//==========================================================
//	函数名称：	start
//
//	函数功能：	TM1640开始
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void start(void)
{
    sda_H;
    scl_H;
    delay_ms(2);
    sda_L;
    delay_ms(2);
    scl_L;
    delay_ms(2);
}

//==========================================================
//	函数名称：	stop
//
//	函数功能：	TM1640停止
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void stop(void)
{
    sda_L;
    scl_H;
    delay_ms(2);
    sda_H;
    delay_ms(2);
    scl_L;
    delay_ms(2);
}


//==========================================================
//	函数名称：	write
//
//	函数功能：	设置数据
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void write(unsigned char date)
{
    unsigned char i,aa;
    aa=date;
    sda_L;
    scl_L;
    for(i=0;i<8;i++)
    {
        scl_L;
        if(aa&0x01)
        {
            sda_H;
            delay_ms(2);
        }
        else
        {
            sda_L
            delay_ms(2);
        }
        scl_H;
        aa=aa>>1;
    }
    scl_L;

    sda_L;

}

//==========================================================
//	函数名称：	init_tm1640
//
//	函数功能：	初始化TM1640
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void init_tm1640(void)
{
    sda_H;
    scl_H;
    start();
    write(SET_DATA_ORDER);//设置数据，0x40,0x44分别对应地址自动加一和固定地址模式
    stop();
    start();
    write(SET_DISPLAY);	  //控制显示，开显示0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f分别对应脉冲宽度
                          //------------------1/16, 2/16, 4/16, 10/16, 11/16, 12/16, 13/16, 14/16
    //0x80关显示
    stop();

}

//==========================================================
//	函数名称：	init_tm1640_NEW
//
//	函数功能：	设置TM1640
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void init_tm1640_NEW(void)
{
    unsigned char i;
    sda_H;
    scl_H;

    start();
    write(SET_DATA_ORDER);	//设置数据，0x40,0x44分别对应地址自动加一和固定地址模式
    stop();

    start();
    write(0x00);		//设置地址
    for(i=0;i<4;i++)
    {
        write(TM164_DATA[i]);
    }
    stop();

    start();
    write(SET_DISPLAY);	       //控制显示，开显示0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f分别对应脉冲宽度
                               //------------------1/16, 2/16, 4/16, 10/16, 11/16, 12/16, 13/16, 14/16
    //0x80关显示
    stop();

}

//==========================================================
//	函数名称：	send_LED_Display
//
//	函数功能：	显示
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void send_LED_Display(unsigned char address,uint16_t data,unsigned char type)  
{
  unsigned char SEG_1,SEG_2,SEG_3,SEG_4;
  if(type == 1)//显示温度的数据
  {
       SEG_4 = 11;
  }
  else if(type == 2)//显示湿度的数据
  {
      SEG_4 = 12;
  }
  else if(type == 3)//显示光强的数据
  {
      SEG_4 = data%10;
  }
  else if(type == 4)//配合其他模块显示
  {
      SEG_1 =  data/1000;
      SEG_2 = (data/100)%10;
      SEG_3 = (data/10)%10;
      SEG_4 = data%10;
  }
  if(data > 1000)
  {
      SEG_1 = data/1000;
      SEG_2 = (data/100)%10;
      SEG_3 = (data/10)%10;
  }
  else if(data > 9)
  {
      SEG_1 = data/10; 
      SEG_2 = data%10;
      SEG_3 = 10;
  }
  else
  {
      SEG_1 = 0x00;
      SEG_2 = data;
      SEG_3 = 10;
  }
  
  sda_H;
  scl_H;

  start();
  write(SET_DATA_ORDER);	//设置数据，0x40,0x44分别对应地址自动加一和固定地址模式
  stop();
  
  start();
  write(address);	//设置起始地址
  write(TM164_DATA[SEG_1]);
  write(TM164_DATA[SEG_2]);
  write(TM164_DATA[SEG_3]);
  write(TM164_DATA[SEG_4]);
  
  stop();
  
  start();
  write(SET_DISPLAY);	//控制显示，开显示0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f分别对应脉冲宽度
  //------------------1/16, 2/16, 4/16, 10/16, 11/16, 12/16, 13/16, 14/16
  //0x80关显示
  stop();
}

/******自动加一模式*****/

void send_z(uint8_t address,uint8_t date)
{
    unsigned char i;
    start();
    write(address);	//设置起始地址
    for(i=0;i<4;i++)
    {
        write(TM164_DATA[i]);
    }
    stop();
}

/******固定地址模式*****/

void send(uint8_t address, uint8_t date)

{
    start();
    write(address);	//传显示数据对应地址
    write(date);	//传BYTE显示数据
    stop();
}

//==========================================================
//	函数名称：	Display_Data
//
//	函数功能：	获取温湿度数据并显示到数码管
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void Display_Data(void)
{
  static uint8_t Display_Flag = 0;		//显示标志位

  Get_ADC_Value();                              //获取光强数据
  SHT2x_GetTempHumi(); 				//获取温湿度值
  Temp[0] = (uint8_t)g_sht2x_param.TEMP_HM;	//温度数据
  Humi[0] = (uint8_t)g_sht2x_param.HUMI_HM;	//湿度数据
  Sum_Data[0] = (uint8_t)g_sht2x_param.TEMP_HM; //温度数据
  Sum_Data[1] = (uint8_t)g_sht2x_param.HUMI_HM; //湿度数据
  Sum_Data[2] = (uint8_t)ADC_Data; //湿度数据
  Sum_Data[3] = (uint8_t)(ADC_Data>>8); //湿度数据
  if(Display_Count>=80 && Display_Flag == 0)	//1600ms 显示温度
  {
    Display_Flag = 1;
    send_LED_Display(0xC0,(uint16_t)g_sht2x_param.TEMP_HM,1);
  }
  else if(Display_Count>=160 && Display_Flag == 1)//3200ms 显示湿度
  {
    Display_Flag = 2;
    send_LED_Display(0xC0,(uint16_t)g_sht2x_param.HUMI_HM,2);
  }
  else if(Display_Count>=240 && Display_Flag == 2)//4800ms 显示光强
  {
    send_LED_Display(0xC0,ADC_Data,3);
    Display_Count = 0;
    Display_Flag = 0;
  }
}

/*   								TM1604结束   								*/

