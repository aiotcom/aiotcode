#include "stdlib.h"
#include "Rs485.h"
#include "delay.h"
#include "TFT.h"
																			//***因触摸屏批次不同等原因，默认的校准参数值可能会引起触摸识别不准，建议校准后再使用，不建议使用固定的默认校准参数
u16 vx=15242,vy=11131;  							//比例因子，此值除以1000之后表示多少个AD值代表一个像素点
u16 chx=3898,chy=145;									//默认像素点坐标为0时的AD起始值
																			//***因触摸屏批次不同等原因，默认的校准参数值可能会引起触摸识别不准，建议校准后再使用，不建议使用固定的默认校准参数

struct tp_pix_  tp_pixad,tp_pixlcd;	 	//当前触控坐标的AD值,前触控坐标的像素值   

uint8_t touch_fig = 0;								//接触完成标志位
uint8_t ffiigg = 0;										//校准完成标志位
uint32_t px = 0,py = 0;								//存放获取到的坐标信息		

u16 BACK_COLOR, POINT_COLOR;   				//背景色，画笔色	  

//==========================================================
//	函数名称：	TFT_Init
//
//	函数功能：	TFT显示器端口初始化
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void TFT_Init(void)
{
		GPIO_InitTypeDef GPIO_Initure;

		__HAL_RCC_GPIOA_CLK_ENABLE();           	//开启GPIOA时钟
		__HAL_RCC_GPIOG_CLK_ENABLE();           	//开启GPIOG时钟	

		GPIO_Initure.Pin=GPIO_PIN_12;    					//PG12
		GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW;	//低速
		GPIO_Initure.Mode =  GPIO_MODE_OUTPUT_PP;	//推挽输出
		GPIO_Initure.Pull = GPIO_PULLDOWN;
		HAL_GPIO_Init(GPIOG,&GPIO_Initure);
	
		//TFT显示器模块
		GPIO_Initure.Pin = GPIO_PIN_6|GPIO_PIN_8|GPIO_PIN_0;   //TFT_CS,TFT_RST,TFT_CLK,
		GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW;	//低速
		GPIO_Initure.Mode =  GPIO_MODE_OUTPUT_PP;	//推挽输出
		GPIO_Initure.Pull = GPIO_PULLDOWN;
		HAL_GPIO_Init(GPIOA,&GPIO_Initure);

		GPIO_Initure.Pin=GPIO_PIN_3;    					//PA3
		GPIO_Initure.Mode=GPIO_MODE_INPUT;      	//输入
		GPIO_Initure.Pull=GPIO_NOPULL;         		//浮空
		GPIO_Initure.Speed=GPIO_SPEED_HIGH;     	//高速
		HAL_GPIO_Init(GPIOA,&GPIO_Initure);

		GPIO_Initure.Pin = GPIO_PIN_10;  //TFT_DC
		GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW;
		GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;
		GPIO_Initure.Pull = GPIO_PULLDOWN;
		HAL_GPIO_Init(GPIOG,&GPIO_Initure);

		GPIO_Initure.Pin = GPIO_PIN_11;  //T_CS
		GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW;
		GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;
		GPIO_Initure.Pull = GPIO_PULLDOWN;
		HAL_GPIO_Init(GPIOA,&GPIO_Initure);

		GPIO_Initure.Pin=GPIO_PIN_12;    				//PA12
		GPIO_Initure.Mode=GPIO_MODE_INPUT;      //输入
		GPIO_Initure.Pull=GPIO_PULLDOWN;        //上拉
		GPIO_Initure.Speed=GPIO_SPEED_HIGH;     //高速
		HAL_GPIO_Init(GPIOA,&GPIO_Initure);
}

//==========================================================
//	函数名称：	LCD_Writ_Bus
//
//	函数功能：	串行数据写入
//
//	入口参数：	da:需要写入的数据
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void  LCD_Writ_Bus(char da)
{
	 static char i;
	 for(i=0;i<8;i++)
	 {
		 if(da &0x80)
		 {
			 LCD_SDI_H;
		 }
		 else LCD_SDI_L;
		 LCD_SCK_L;
		 LCD_SCK_H;
		 da <<=1;
	 }	
}

//==========================================================
//	函数名称：	LCD_WR_DATA8
//
//	函数功能：	发送数据-8位参数
//
//	入口参数：	da:需要写入的数据
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_WR_DATA8(char da) //发送数据-8位参数
{
  LCD_DC_H;
	LCD_Writ_Bus(da);
}  

//==========================================================
//	函数名称：	LCD_WR_DATA
//
//	函数功能：	发送数据参数
//
//	入口参数：	da:需要写入的数据
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_WR_DATA(int da)
{
  LCD_DC_H;
	LCD_Writ_Bus(da>>8);
	LCD_Writ_Bus(da);
}	  

//==========================================================
//	函数名称：	LCD_WR_REG
//
//	函数功能：	REG参数写入
//
//	入口参数：	da:需要写入的数据
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_WR_REG(char da)	 
{
  LCD_DC_L;
	LCD_Writ_Bus(da);
}

//==========================================================
//	函数名称：	LCD_WR_REG_DATA
//
//	函数功能：	REG参数写入
//
//	入口参数：	da:需要写入的数据
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
 void LCD_WR_REG_DATA(int reg,int da)
{
  LCD_WR_REG(reg);
	LCD_WR_DATA(da);
}

//==========================================================
//	函数名称：	Address_set
//
//	函数功能：	REG参数写入
//
//	入口参数：	x1,y1,x2,y2为坐标点
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void Address_set(unsigned int x1,unsigned int y1,unsigned int x2,unsigned int y2)
{  
   LCD_WR_REG(0x2a);
   LCD_WR_DATA8(x1>>8);
   LCD_WR_DATA8(x1);
   LCD_WR_DATA8(x2>>8);
   LCD_WR_DATA8(x2);
  
   LCD_WR_REG(0x2b);
   LCD_WR_DATA8(y1>>8);
   LCD_WR_DATA8(y1);
   LCD_WR_DATA8(y2>>8);
   LCD_WR_DATA8(y2);

   LCD_WR_REG(0x2C);

}

//==========================================================
//	函数名称：	Lcd_Init
//
//	函数功能：	TFT寄存器初始化
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void Lcd_Init(void)
{

//调用一次这些函数，免得编译的时候提示警告
//   	LCD_CS_H;
// 	if(LCD_CS==0)
// 	{
// 	   LCD_WR_REG_DATA(0,0);
// 	   LCD_ShowString(0,0," ");
// 	   LCD_ShowNum(0,0,0,0);
// 	   LCD_Show2Num(0,0,0,0);
// 	   LCD_DrawPoint_big(0,0);
// 	   LCD_DrawRectangle(0,0,0,0);
// 	   Draw_Circle(0,0,0);
//  	 }    
	LCD_REST_L;
	delay_ms(10);
	LCD_REST_H;
	delay_ms(10);
	LCD_CS_L;  //打开片选使能

	LCD_WR_REG(0xCB);  
	LCD_WR_DATA8(0x39); 
	LCD_WR_DATA8(0x2C); 
	LCD_WR_DATA8(0x00); 
	LCD_WR_DATA8(0x34); 
	LCD_WR_DATA8(0x02); 

	LCD_WR_REG(0xCF);  
	LCD_WR_DATA8(0x00); 
	LCD_WR_DATA8(0XC1); 
	LCD_WR_DATA8(0X30); 
 	
	LCD_WR_REG(0xE8);  
	LCD_WR_DATA8(0x85); 
	LCD_WR_DATA8(0x00); 
	LCD_WR_DATA8(0x78); 

	LCD_WR_REG(0xEA);  
	LCD_WR_DATA8(0x00); 
	LCD_WR_DATA8(0x00); 
 	
	LCD_WR_REG(0xED);  
	LCD_WR_DATA8(0x64); 
	LCD_WR_DATA8(0x03); 
	LCD_WR_DATA8(0X12); 
	LCD_WR_DATA8(0X81); 

	LCD_WR_REG(0xF7);  
	LCD_WR_DATA8(0x20); 
 
	LCD_WR_REG(0xC0);    	//Power control 
	LCD_WR_DATA8(0x23);   //VRH[5:0] 
 
	LCD_WR_REG(0xC1);    	//Power control 
	LCD_WR_DATA8(0x10);   //SAP[2:0];BT[3:0] 

	LCD_WR_REG(0xC5);    	//VCM control 
	LCD_WR_DATA8(0x3e); 	//对比度调节
	LCD_WR_DATA8(0x28); 

	LCD_WR_REG(0xC7);    	//VCM control2 
	LCD_WR_DATA8(0x86); 	//--

	LCD_WR_REG(0x36);    	// Memory Access Control 
	LCD_WR_DATA8(0x48); 	//	   //48 68竖屏//28 E8 横屏

	LCD_WR_REG(0x3A);    
	LCD_WR_DATA8(0x55); 

	LCD_WR_REG(0xB1);    
	LCD_WR_DATA8(0x00);  
	LCD_WR_DATA8(0x18); 

	LCD_WR_REG(0xB6);    // Display Function Control 
	LCD_WR_DATA8(0x08); 
	LCD_WR_DATA8(0x82);
	LCD_WR_DATA8(0x27);  
 	
	LCD_WR_REG(0xF2);    // 3Gamma Function Disable 
	LCD_WR_DATA8(0x00); 
 	
	LCD_WR_REG(0x26);    //Gamma curve selected 
	LCD_WR_DATA8(0x01); 
 
 	LCD_WR_REG(0xE0);    //Set Gamma 
	LCD_WR_DATA8(0x0F); 
	LCD_WR_DATA8(0x31); 
	LCD_WR_DATA8(0x2B); 
	LCD_WR_DATA8(0x0C); 
	LCD_WR_DATA8(0x0E); 
	LCD_WR_DATA8(0x08); 
	LCD_WR_DATA8(0x4E); 
	LCD_WR_DATA8(0xF1); 
	LCD_WR_DATA8(0x37); 
	LCD_WR_DATA8(0x07); 
	LCD_WR_DATA8(0x10); 
	LCD_WR_DATA8(0x03); 
	LCD_WR_DATA8(0x0E); 
	LCD_WR_DATA8(0x09); 
	LCD_WR_DATA8(0x00); 

	LCD_WR_REG(0XE1);    //Set Gamma 
	LCD_WR_DATA8(0x00); 
	LCD_WR_DATA8(0x0E); 
	LCD_WR_DATA8(0x14); 
	LCD_WR_DATA8(0x03); 
	LCD_WR_DATA8(0x11); 
	LCD_WR_DATA8(0x07); 
	LCD_WR_DATA8(0x31); 
	LCD_WR_DATA8(0xC1); 
	LCD_WR_DATA8(0x48); 
	LCD_WR_DATA8(0x08); 
	LCD_WR_DATA8(0x0F); 
	LCD_WR_DATA8(0x0C); 
	LCD_WR_DATA8(0x31); 
	LCD_WR_DATA8(0x36); 
	LCD_WR_DATA8(0x0F); 
 
	LCD_WR_REG(0x2A);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0xEF);

	LCD_WR_REG(0x2B);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x01);
	LCD_WR_DATA8(0x3F);
	LCD_WR_REG(0x11);    	//Exit Sleep 
	delay_ms(60); 
			
  LCD_WR_REG(0x29);    	//Display on 
  LCD_WR_REG(0x2c); 
  BACK_COLOR=WHITE; 		//设置TFT液晶背景色
  POINT_COLOR=RED;  		//设置TFT液晶前景色
}

//==========================================================
//	函数名称：	LCD_Clear
//
//	函数功能：	清屏函数
//
//	入口参数：	Color:要清屏的填充色
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_Clear(u16 Color)
{
	u8 VH,VL;
	u16 i,j;
	VH=Color>>8;
	VL=Color;	
	Address_set(0,0,LCD_W-1,LCD_H-1);
	for(i=0;i<LCD_W;i++)
	 {
		for (j=0;j<LCD_H;j++)
			{
					LCD_WR_DATA8(VH);
					LCD_WR_DATA8(VL);	
			}
		}
}

//==========================================================
//	函数名称：	LCD_DrawPoint
//
//	函数功能：	画点
//
//	入口参数：	位置光标
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_DrawPoint(u16 x,u16 y)
{
	Address_set(x,y,x,y);//设置光标位置 
	LCD_WR_DATA(POINT_COLOR); 	    
} 	 

//==========================================================
//	函数名称：	LCD_DrawPoint_big
//
//	函数功能：	画一个大点
//
//	入口参数：	位置光标
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_DrawPoint_big(u16 x,u16 y)
{
	LCD_Fill(x-1,y-1,x+1,y+1,POINT_COLOR);
} 

//  (xend-xsta)*(yend-ysta)
//==========================================================
//	函数名称：	LCD_Fill
//
//	函数功能：	在指定区域内填充指定颜色
//
//	入口参数：	区域大小: (xend-xsta)*(yend-ysta)
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_Fill(u16 xsta,u16 ysta,u16 xend,u16 yend,u16 color)
{          
	u16 i,j; 
	Address_set(xsta,ysta,xend,yend);      //设置光标位置 
	for(i=ysta;i<=yend;i++)
	{													   	 	
		for(j=xsta;j<=xend;j++)LCD_WR_DATA(color);//设置光标位置 	    
	} 					  	    
}  

//==========================================================
//	函数名称：	LCD_DrawLine
//
//	函数功能：	画线
//
//	入口参数：	x1,y1:起点坐标
//              x2,y2:终点坐标  
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2)
{
	u16 t; 
	int xerr=0,yerr=0,delta_x,delta_y,distance; 
	int incx,incy,uRow,uCol; 

	delta_x=x2-x1; //计算坐标增量 
	delta_y=y2-y1; 
	uRow=x1; 
	uCol=y1; 
	if(delta_x>0)incx=1; //设置单步方向 
	else if(delta_x==0)incx=0;//垂直线 
	else {incx=-1;delta_x=-delta_x;} 
	if(delta_y>0)incy=1; 
	else if(delta_y==0)incy=0;//水平线 
	else{incy=-1;delta_y=-delta_y;} 
	if( delta_x>delta_y)distance=delta_x; //选取基本增量坐标轴 
	else distance=delta_y; 
	for(t=0;t<=distance+1;t++ )//画线输出 
	{  
		LCD_DrawPoint(uRow,uCol);//画点 
		xerr+=delta_x ; 
		yerr+=delta_y ; 
		if(xerr>distance) 
		{ 
			xerr-=distance; 
			uRow+=incx; 
		} 
		if(yerr>distance) 
		{ 
			yerr-=distance; 
			uCol+=incy; 
		} 
	}  
}    

//==========================================================
//	函数名称：	LCD_DrawRectangle
//
//	函数功能：	画矩形
//
//	入口参数：	区域大小: (x2-x1)*(y2-y1)
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2)
{
	LCD_DrawLine(x1,y1,x2,y1);
	LCD_DrawLine(x1,y1,x1,y2);
	LCD_DrawLine(x1,y2,x2,y2);
	LCD_DrawLine(x2,y1,x2,y2);
}

//==========================================================
//	函数名称：	Draw_Circle
//
//	函数功能：	在指定位置画一个指定大小的圆
//
//	入口参数：	(x,y):中心点
//              r    :半径
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void Draw_Circle(u16 x0,u16 y0,u8 r)
{
	int a,b;
	int di;
	a=0;b=r;	  
	di=3-(r<<1);             //判断下个点位置的标志
	while(a<=b)
	{
		LCD_DrawPoint(x0-b,y0-a);             //3           
		LCD_DrawPoint(x0+b,y0-a);             //0           
		LCD_DrawPoint(x0-a,y0+b);             //1       
		LCD_DrawPoint(x0-b,y0-a);             //7           
		LCD_DrawPoint(x0-a,y0-b);             //2             
		LCD_DrawPoint(x0+b,y0+a);             //4               
		LCD_DrawPoint(x0+a,y0-b);             //5
		LCD_DrawPoint(x0+a,y0+b);             //6 
		LCD_DrawPoint(x0-b,y0+a);             
		a++;
		//使用Bresenham算法画圆     
		if(di<0)di +=4*a+6;	  
		else
		{
			di+=10+4*(a-b);   
			b--;
		} 
		LCD_DrawPoint(x0+a,y0+b);
	}
} 

//==========================================================
//	函数名称：	LCD_ShowChar
//
//	函数功能：	在指定位置显示一个字符
//
//	入口参数：	(x,y):显示坐标
//              num:要显示的字符:" "--->"~"
//              mode:叠加方式(1)还是非叠加方式(0)
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_ShowChar(u16 x,u16 y,u8 num,u8 mode)
{
    u8 temp;
    u8 pos,t;
	u16 x0=x;
	u16 colortemp=POINT_COLOR;      
    if(x>LCD_W-16||y>LCD_H-16)return;	    
	//设置窗口		   
	num=num-' ';//得到偏移后的值
	Address_set(x,y,x+8-1,y+16-1);      //设置光标位置 
	if(!mode) //非叠加方式
	{
		for(pos=0;pos<16;pos++)
		{ 
			temp=asc2_1608[(u16)num*16+pos];		 //调用1608字体
			for(t=0;t<8;t++)
		    {                 
		        if(temp&0x01)POINT_COLOR=colortemp;
				else POINT_COLOR=BACK_COLOR;
				LCD_WR_DATA(POINT_COLOR);	
				temp>>=1; 
				x++;
		    }
			x=x0;
			y++;
		}	
	}else//叠加方式
	{
		for(pos=0;pos<16;pos++)
		{
		    temp=asc2_1608[(u16)num*16+pos];		 //调用1608字体
			for(t=0;t<8;t++)
		    {                 
		        if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//画一个点     
		        temp>>=1; 
		    }
		}
	}
	POINT_COLOR=colortemp;	    	   	 	  
}   
//m^n函数
u32 mypow(u8 m,u8 n)
{
	u32 result=1;	 
	while(n--)result*=m;    
	return result;
}			 

//==========================================================
//	函数名称：	LCD_ShowNum
//
//	函数功能：	显示多个数字
//
//	入口参数：	x,y :起点坐标	 
//              len :数字的位数
//              num:数值(0~4294967295);
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_ShowNum(u16 x,u16 y,u32 num,u8 len)
{         	
	u8 t,temp;
	u8 enshow=0;
	num=(u32)num;
	for(t=0;t<len;t++)
	{
		temp=(num/mypow(10,len-t-1))%10;
		if(enshow==0&&t<(len-1))
		{
			if(temp==0)
			{
				LCD_ShowChar(x+8*t,y,' ',0);
				continue;
			}else enshow=1; 
		 	 
		}
	 	LCD_ShowChar(x+8*t,y,temp+48,0); 
	}
} 

//==========================================================
//	函数名称：	LCD_Show2Num
//
//	函数功能：	显示2个数字
//
//	入口参数：	x,y :起点坐标	 
//              len :数字的位数
//              num:数值(0~99);
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void LCD_Show2Num(u16 x,u16 y,u16 num,u8 len)
{         	
	u8 t,temp;						   
	for(t=0;t<len;t++)
	{
		temp=(num/mypow(10,len-t-1))%10;
	 	LCD_ShowChar(x+8*t,y,temp+'0',0); 
	}
} 

//==========================================================
//	函数名称：	LCD_ShowString
//
//	函数功能：	显示字符串
//
//	入口参数：	x,y:起点坐标  
//              *p:字符串起始地址
//							mode:叠加方式(1)还是非叠加方式(0)
//              
//	返回参数：	无
//
//	说明：	    用16字体	
//==========================================================
void LCD_ShowString(u16 x,u16 y,const u8 *p,u8 mode)
{
    while(*p!='\0')
    {       
        if(x>LCD_W-16){x=0;y+=16;}
        if(y>LCD_H-16){y=x=0;}
        LCD_ShowChar(x,y,*p,mode);
        x+=8;
        p++;
    } 
}

//==========================================================
//	函数名称：	Drow_Touch_Point
//
//	函数功能：	与LCD部分有关的函数  
//
//	入口参数：	x,y:起点坐标  
//              
//	返回参数：	无
//
//	说明：	   	用来校准用的
//==========================================================
void Drow_Touch_Point(u16 x,u16 y)
{
	LCD_DrawLine(x-12,y,x+13,y);//横线
	LCD_DrawLine(x,y-12,x,y+13);//竖线
	LCD_DrawPoint(x+1,y+1);
	LCD_DrawPoint(x-1,y+1);
	LCD_DrawPoint(x+1,y-1);
	LCD_DrawPoint(x-1,y-1);
	Draw_Circle(x,y,6);//画中心圈
}	
u16 ReadFromCharFrom7843()             //SPI 读数据
{
	u8 count=0;
	u16 Num=0;
	for(count=0;count<12;count++)
	{
		Num<<=1;		
		LCD_SCK_H;               //下降沿有效
		LCD_SCK_L; 
		if(T_OUT)
		{
			Num|=1;
		}
	}

return(Num);
}
//从7846/7843/XPT2046/UH7843/UH7846读取adc值	  0x90=y   0xd0-x
u16 ADS_Read_AD(unsigned char CMD)          
{
    u16 l;
    T_CS_L;     
    LCD_Writ_Bus(CMD);//送控制字即用差分方式读X坐标 详细请见有关资料
    LCD_SCK_H;
    LCD_SCK_L;
    l=ReadFromCharFrom7843();
    T_CS_H;
    return l;
}	

//==========================================================
//	函数名称：	ADS_Read_XY
//
//	函数功能：	读取一个坐标值
//
//	入口参数：	 
//              
//	返回参数：	无
//
//	说明：	   	连续读取READ_TIMES次数据,对这些数据升序排列,
//							然后去掉最低和最高LOST_VAL个数,取平均值 
//==========================================================
#define READ_TIMES 15 //读取次数
#define LOST_VAL 5	  //丢弃值
u16 ADS_Read_XY(u8 xy)
{
	u16 i, j;
	u16 buf[READ_TIMES];
	u16 sum=0;
	u16 temp;
	for(i=0;i<READ_TIMES;i++)
	{				 
		buf[i]=ADS_Read_AD(xy);	    
	}				    
	for(i=0;i<READ_TIMES-1; i++)//排序
	{
		for(j=i+1;j<READ_TIMES;j++)
		{
			if(buf[i]>buf[j])//升序排列
			{
				temp=buf[i];
				buf[i]=buf[j];
				buf[j]=temp;
			}
		}
	}	  
	sum=0;
	for(i=LOST_VAL;i<READ_TIMES-LOST_VAL;i++)sum+=buf[i];
	temp=sum/(READ_TIMES-2*LOST_VAL);
	return temp;   
} 

//==========================================================
//	函数名称：	Read_ADS
//
//	函数功能：	带滤波的坐标读取
//
//	入口参数：	 
//              
//	返回参数：	无
//
//	说明：	   	最小值不能少于100.
//==========================================================
u8 Read_ADS(u16 *x,u16 *y)
{
	u16 xtemp,ytemp;			 	 		  
	xtemp=ADS_Read_XY(CMD_RDX);
	ytemp=ADS_Read_XY(CMD_RDY);	 									   
	if(xtemp<100||ytemp<100)return 0;//读数失败
	*x=xtemp;
	*y=ytemp;
	return 1;//读数成功
}

//==========================================================
//	函数名称：	Read_ADS2
//
//	函数功能：	2次读取ADS7846,连续读取2次有效的AD值,且这两次的偏差不能超过
//
//	入口参数：	 
//              
//	返回参数：	无
//
//	说明：	   	该函数能大大提高准确度
//==========================================================
#define ERR_RANGE 20 //误差范围 
u8 Read_ADS2(u16 *x,u16 *y)
{
	u16 x1,y1;
 	u16 x2,y2;
 	u8 flag;    
    flag=Read_ADS(&x1,&y1);   
    if(flag==0)return(0);
    flag=Read_ADS(&x2,&y2);	
    if(flag==0)return(0);   
    if(((x2<=x1&&x1<x2+ERR_RANGE)||(x1<=x2&&x2<x1+ERR_RANGE))//前后两次采样在+-ERR_RANGE内
    &&((y2<=y1&&y1<y2+ERR_RANGE)||(y1<=y2&&y2<y1+ERR_RANGE)))
    {
        *x=(x1+x2)>>1;
        *y=(y1+y2)>>1;		
        return 1;
    }else return 0;	  
}

//==========================================================
//	函数名称：	Read_TP_Once
//
//	函数功能：	精确读取一次坐标,校准的时候用的	 
//
//	入口参数：	
//              
//	返回参数：	无
//
//	说明：	   	
//==========================================================
u8 Read_TP_Once(void)
{
	u8 re=0;
	u16 x1,y1;
	while(re==0)
	{
		while(!Read_ADS2(&tp_pixad.x,&tp_pixad.y));
		delay_us(300);
		while(!Read_ADS2(&x1,&y1));
		if(tp_pixad.x==x1&&tp_pixad.y==y1)
		{
			re=1; 
		}
	}
	return re;
}

//==========================================================
//	函数名称：	Fan_Status_Display
//
//	函数功能：	显示风扇状态图案
//
//	入口参数：	区域大小: (xend-xsta)*(yend-ysta)
//							color:	颜色
//              Gears:	风扇档位
//
//	返回参数：	无
//
//	说明：	  	
//==========================================================
void Fan_Status_Display(u16 xsta,u16 ysta,u16 xend,u16 yend,u16 color,uint8_t Gears)
{
		LCD_Fill(xsta,ysta,xend,yend,color);	//130,158,190,182
		POINT_COLOR = BLACK;									//画笔颜色
		switch(Gears)
		{
			case 0:		//风扇关闭状态
				LCD_ShowString((xsta+(xend-xsta)/3),(ysta+2),"OFF",1);
				break;
			case 1:		//风扇一档状态
				LCD_ShowString((xsta+(xend-xsta)/3),(ysta+2),"One",1); 
				break;
			case 2:		//风扇二档状态
				LCD_ShowString((xsta+(xend-xsta)/3),(ysta+2),"Two",1); 
				break;
			case 3:		//风扇三档状态
				LCD_ShowString((xsta+(xend-xsta)/6),(ysta+2),"Three",1); 
				break;	
			default:	break;
		}
}

//==========================================================
//	函数名称：	Fan_Gears
//
//	函数功能：	风扇档位显示
//
//	入口参数：	Gears：风扇档位参数
//									0: 风扇关闭状态
//									1: 风扇处于一档
//									2: 风扇处于二档
//									3: 风扇处于三档
//              
//	返回参数：	无
//
//	说明：			
//==========================================================
void Fan_Gears(uint8_t Gears)
{
	switch(Gears)
	{
		case 0:		
			Fan_Status_Display(125,78,175,98,RED,0);		//风扇关闭状态
			break;
		case 1:		
			Fan_Status_Display(125,78,175,98,GREEN,1);	//风扇一档状态
			break;
		case 2:		
			Fan_Status_Display(125,78,175,98,GREEN,2);	//风扇二档状态
			break;
		case 3:		
			Fan_Status_Display(125,78,175,98,GREEN,3);	//风扇三档状态
			break;	
		default:	break;
	}
}

//==========================================================
//	函数名称：	TFT_UI
//
//	函数功能：	TFT计算器界面
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：			
//==========================================================
void TFT_UI(void)
{
	LCD_Clear(DARKBLUE);									//清屏
	POINT_COLOR = WHITE;									//画笔颜色
	LCD_ShowString(30,30,"Fan Control Experiment",1); //风扇控制实验
	LCD_ShowString(30,80,"Fan State:",1);	//风扇状态
	Fan_Gears(0);		//初始化显示风扇关闭
	POINT_COLOR = WHITE;									//画笔颜色
	LCD_ShowString(30,130,"Fan Gear Adjustment",1);	//风扇档位调节
	Fan_Status_Display(30,158,80,178,LGRAY,1);			//风扇一档状态
	Fan_Status_Display(90,158,140,178,LGRAY,2);			//风扇二档状态
	Fan_Status_Display(150,158,200,178,LGRAY,3);		//风扇三档状态
	
	LCD_Fill(35,220,95,249,BROWN);				//ON按钮
	LCD_Fill(135,220,195,249,BROWN);			//OFF按钮
	LCD_ShowString(58,226,"ON          OFF",1);			//开关风扇
}

//==========================================================
//	函数名称：	Key_Handler
//
//	函数功能：	处理触摸屏操作
//
//	入口参数：	无
//              
//	返回参数：	无
//
//	说明：			
//==========================================================
void Key_Handler(void)
{
		static uint8_t Gear_Flag = 0;
	
		/*
		*
		*					数据处理
		*
		*/
		if(touch_fig)
		{
				if(Read_TP_Once())	//得到单次按键值
				{
						px=tp_pixad.x;
						py=tp_pixad.y;
				}
			
				if(px>2751 && px<3486 && py>1937 && py<2153)				//按键"One"
				{
						Gear_Flag = 1;
						Fan_Status_Display(30,158,80,178,GREEN,1);			//风扇一档状态
						Fan_Status_Display(90,158,140,178,LGRAY,2);			//风扇二档状态
						Fan_Status_Display(150,158,200,178,LGRAY,3);		//风扇三档状态
				}
				else if(px>1775 && px<2495 && py>1937 && py<2153)		//按键"Two"
				{
						Gear_Flag = 2;
						Fan_Status_Display(90,158,140,178,GREEN,2);			//风扇二档状态
						Fan_Status_Display(30,158,80,178,LGRAY,1);			//风扇一档状态
						Fan_Status_Display(150,158,200,178,LGRAY,3);		//风扇三档状态
				}
				else if(px>873 && px<1562 && py>1937 && py<2153)		//按键"Three"
				{
						Gear_Flag = 3;
						Fan_Status_Display(150,158,200,178,GREEN,3);		//风扇三档状态
						Fan_Status_Display(30,158,80,178,LGRAY,1);			//风扇一档状态
						Fan_Status_Display(90,158,140,178,LGRAY,2);			//风扇二档状态
				}
				else if(px>2471 && px<3359 && py>2629 && py<2944)		//按键"ON"
				{
						switch(Gear_Flag)
						{
							case 0:
								Fan_Gears(0);																//显示风扇状态关闭
								Rs485_Send(Addr_LCD,Addr_Fan,FAN_OFF,0,0); //关闭风扇
								break;
							case 1:
								Fan_Gears(1);																//显示风扇状态1档
								Rs485_Send(Addr_LCD,Addr_Fan,FAN_ON1,0,0); //打开风扇-1档
								break;
							case 2:
								Fan_Gears(2);																//显示风扇状态2档
								Rs485_Send(Addr_LCD,Addr_Fan,FAN_ON2,0,0); //打开风扇-2档
								break;
							case 3:
								Fan_Gears(3);																//显示风扇状态3档
								Rs485_Send(Addr_LCD,Addr_Fan,FAN_ON3,0,0); //打开风扇-3档
								break;
							default: break;
						}
						Gear_Flag = 0;
						Fan_Status_Display(30,158,80,178,LGRAY,1);			//风扇一档状态
						Fan_Status_Display(90,158,140,178,LGRAY,2);			//风扇二档状态
						Fan_Status_Display(150,158,200,178,LGRAY,3);		//风扇三档状态
						LCD_Fill(35,220,95,249,GREEN);									//ON按钮
						LCD_Fill(135,220,195,249,BROWN);								//OFF按钮
						LCD_ShowString(58,226,"ON          OFF",1);			//开关风扇
				}
				else if(px>905 && px<1800 && py>2629 && py<2944)		//按键"OFF"
				{
						Gear_Flag = 0;
						Fan_Gears(0);																		//显示风扇状态关闭
						Rs485_Send(Addr_LCD,Addr_Fan,FAN_OFF,0,0); 			//关闭风扇
						Fan_Status_Display(30,158,80,178,LGRAY,1);			//风扇一档状态
						Fan_Status_Display(90,158,140,178,LGRAY,2);			//风扇二档状态
						Fan_Status_Display(150,158,200,178,LGRAY,3);		//风扇三档状态
						LCD_Fill(135,220,195,249,GREEN);								//OFF按钮
						LCD_Fill(35,220,95,249,BROWN);									//ON按钮
						LCD_ShowString(58,226,"ON          OFF",1);			//开关风扇
				}
				touch_fig = 0;
		}
}







