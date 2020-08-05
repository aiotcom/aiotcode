/*********************************************************************************************
#####         上海嵌入式家园-开发板商城         #####
#####                    www.embedclub.com                        #####
#####             http://embedclub.taobao.com               #####

* File：		poll_key_drv.c
* Author:		Hanson
* Desc：	one key scan (with polling method) device driver 
* History:	May 16th 2011
*********************************************************************************************/

#include <linux/errno.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/input.h>
#include <linux/init.h>
#include <linux/serio.h>
#include <linux/delay.h>
#include <linux/clk.h>
#include <linux/wait.h>
#include <linux/sched.h>
#include <asm/io.h>
#include <asm/irq.h>
#include <asm-generic/io.h>
#include <asm/uaccess.h>
#include <linux/cdev.h>
#include <linux/miscdevice.h>
#include <linux/gpio.h>
#include <asm-generic/poll.h>
#include <linux/poll.h>
#include <../arch/arm/mach-imx/iomux-v3.h>
#include <../arch/arm/mach-imx/hardware.h>
#include <../arch/arm/mach-imx/mx6.h>
#include <linux/platform_device.h>
#include <linux/input.h>
#include <linux/gpio_keys.h>
#include <linux/workqueue.h>
#include <linux/gpio.h>
#include <linux/of.h>
#include <linux/of_platform.h>
#include <linux/of_gpio.h>
#include <linux/of_irq.h>
#include <linux/spinlock.h>

enum{Bit_RESET,Bit_SET};
typedef enum {
    TRIG_TEMP_MEASUREMENT_HM   = 0xE3, //主机模式相对温度
    TRIG_HUMI_MEASUREMENT_HM   = 0xE5, //主机模式相对湿度
    TRIG_TEMP_MEASUREMENT_POLL = 0xF3, //非主机模式相对温度
    TRIG_HUMI_MEASUREMENT_POLL = 0xF5, //非主机模式相对湿度
    USER_REG_W                 = 0xE6, //写用户寄存器
    USER_REG_R                 = 0xE7, //读用户寄存器
    SOFT_RESET                 = 0xFE  //软复位
} SHT2xCommand;

typedef enum {
    SHT2x_RES_12_14BIT         = 0x00, //RH=12bit, T=14bit
    SHT2x_RES_8_12BIT          = 0x01, //RH= 8bit, T=12bit
    SHT2x_RES_10_13BIT         = 0x80, //RH=10bit, T=13bit
    SHT2x_RES_11_11BIT         = 0x81, //RH=11bit, T=11bit
    SHT2x_RES_MASK             = 0x81  //Mask for res. bits (7,0) in user reg.
} SHT2xResolution;

typedef enum {
    SHT2x_EOB_ON               = 0x40, //end of battery
    SHT2x_EOB_MASK             = 0x40  //Mask for EOB bit(6) in user reg.
} SHT2xEob;

typedef enum {
    SHT2x_HEATER_ON            = 0x04, //heater on
    SHT2x_HEATER_OFF           = 0x00, //heater off
    SHT2x_HEATER_MASK          = 0x04  //Mask for Heater bit(2) in user reg.
} SHT2xHeater;

typedef enum {
    TEMP,  
    HUMI 
} SHT2xMeasureType;

typedef enum {
    I2C_ADR_W                  = 0x80, //sensor I2C address + write bit
    I2C_ADR_R                  = 0x81  //sensor I2C address + read bit
} SHT2xI2cHeader;

typedef enum {
    ACK                        = 0,
    NO_ACK                     = 1
} SHT2xI2cAck;

typedef enum {
    ACK_OK                     = 0x00,  
    ACK_ERROR                  = 0x01
} SHT2xI2cAckState;

typedef struct _sht2x_param_ {
    float TEMP_HM;
    float HUMI_HM;
    float TEMP_POLL;
    float HUMI_POLL;    
    unsigned char SerialNumber[8];
} SHT2x_PARAM, *P_SHT2x_PARAM;

#define SET_DATA_ORDER	0X40 //数据命令设置 普通模式
#define SET_DISPLAY 0X8c	//显示命令控制，脉冲宽度 
/*
#define  IOMUXC_SW_MUX_CTL_PAD_GPIO05  (unsigned int*)ioremap(0x20e0230,4)
#define  GPIO1_DR                      (unsigned int*)ioremap(0x209c000,4)
#define  GPIO1_GDIR                    (unsigned int*)ioremap(0x209c004,4)

#define IOMUXC_SW_PAD_CTL_PAD_EIM_DATA23 (unsigned int*)ioremap(0x20e0530,4)
#define IOMUXC_SW_PAD_CTL_PAD_EIM_DATA31 (unsigned int*)ioremap(0x20e0550,4)
#define IOMUXC_SW_MUX_CTL_PAD_DATA23   (unsigned int*)ioremap(0x20e0160,4)
#define IOMUXC_SW_MUX_CTL_PAD_DATA31   (unsigned int*)ioremap(0x20e0180,4)
#define GPIO5_GDIR                     (unsigned int*)ioremap(0x20a4004,4)
#define GPIO5_DR                       (unsigned int*)ioremap(0x20a4000,4)
*/
unsigned int *IOMUXC_SW_MUX_CTL_PAD_GPIO05;//  (unsigned int*)ioremap(0x20e0230,4)
unsigned int *GPIO1_DR                      ;//(unsigned int*)ioremap(0x209c000,4)
unsigned int *GPIO1_GDIR                    ;//(unsigned int*)ioremap(0x209c004,4)

unsigned int *IOMUXC_SW_PAD_CTL_PAD_EIM_DATA23 ;//(unsigned int*)ioremap(0x20e0530,4)
unsigned int *IOMUXC_SW_PAD_CTL_PAD_EIM_DATA31 ;//(unsigned int*)ioremap(0x20e0550,4)
unsigned int *IOMUXC_SW_MUX_CTL_PAD_DATA23   ;//(unsigned int*)ioremap(0x20e0160,4)
unsigned int *IOMUXC_SW_MUX_CTL_PAD_DATA31   ;//(unsigned int*)ioremap(0x20e0180,4)
unsigned int *GPIO5_GDIR                     ;//(unsigned int*)ioremap(0x20a4004,4)
unsigned int *GPIO5_DR                       ;//(unsigned int*)ioremap(0x20a4000,4)
unsigned int *TIM1640_SCLK_MUX               ;//(unsigned int*)ioremap(0x20e01D8,4)
unsigned int *TIM1640_DIN_MUX                ;//(unsigned int*)ioremap(0x20e01D4,4)
unsigned int *TIM1640_SCL_GPIO_DR            ;//(unsigned int*)ioremap(0x20A0000,4)
unsigned int *TIM1640_SCL_GPIO_GDIR          ;//(unsigned int*)ioremap(0x20A0004,4)

unsigned int *TIM1640_SDA_GPIO_DR            ;//(unsigned int*)ioremap(0x20A0000,4)
unsigned int *TIM1640_SDA_GPIO_GDIR          ;//(unsigned int*)ioremap(0x20A0004,4)
void imx6_gpio_mode(unsigned int* padd)
{
	writel(0x05,padd);		
}
void imx6_gpio_out(unsigned int *padd,unsigned int pos)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg |= 1<<pos;
	writel(tempreg,padd);
}
void imx6_gpio_write(unsigned int *padd,unsigned int pos,unsigned int val)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg &= ~(1<<pos);
	if(val){
		tempreg |= 1<<pos;
	}
	writel(tempreg,padd);	
}
void TM1640_Init(void)
{
	imx6_gpio_mode(TIM1640_SCLK_MUX);//GPIO 模式
	imx6_gpio_mode(TIM1640_DIN_MUX);//GPIO 模式
	imx6_gpio_out(TIM1640_SCL_GPIO_GDIR,25);//输出模式
	imx6_gpio_out(TIM1640_SDA_GPIO_GDIR,27);//输出模式
	
	imx6_gpio_write(TIM1640_SCL_GPIO_DR,25,1);
	imx6_gpio_write(TIM1640_SDA_GPIO_DR,27,1);
}
#define sda_H imx6_gpio_write(TIM1640_SDA_GPIO_DR,27,1); 
#define  scl_H imx6_gpio_write(TIM1640_SCL_GPIO_DR,25,1);
#define sda_L imx6_gpio_write(TIM1640_SDA_GPIO_DR,27,0); 
#define  scl_L imx6_gpio_write(TIM1640_SCL_GPIO_DR,25,0);
/******	TM1640******/

unsigned char TM164_DATA[14] = {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x00,0X39,0X76,0X80};//0~9,空白，C,H,点;
unsigned char TM164_SIG[4] = {0x01,0x02,0x04,0x08};
void HAL_Delay(int n)
{
	udelay(200*n);
}
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
		HAL_Delay(2);
		sda_L;
		HAL_Delay(2);
		scl_L;
		HAL_Delay(2);
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
	HAL_Delay(2);
	sda_H;
	HAL_Delay(2);
	scl_L;
	HAL_Delay(2);
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
void tim1640_write(unsigned char date)
{
	unsigned char i,aa;
	aa=date;
	sda_L;
	scl_L;
	for(i=0;i<8;i++){
		scl_L;
		if(aa&0x01){
			sda_H;
			HAL_Delay(2);
		}
		else{
			sda_L
			HAL_Delay(2);
		}
		scl_H;
		HAL_Delay(2);
		aa=aa>>1;
	}
	scl_L;
	sda_L;
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
	tim1640_write(SET_DATA_ORDER);	//设置数据，0x40,0x44分别对应地址自动加一和固定地址模式
	stop();

	start();
	tim1640_write(0x00);					//设置地址
	for(i=0;i<4;i++)
		{
			tim1640_write(TM164_DATA[i]);
		}
	stop();

	start();
	tim1640_write(SET_DISPLAY);	//控制显示，开显示0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f分别对应脉冲宽度
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
		unsigned char SEG_1 = 0,SEG_2 = 0,SEG_3 = 0,SEG_4 = 0;
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
		tim1640_write(SET_DATA_ORDER);	//设置数据，0x40,0x44分别对应地址自动加一和固定地址模式
		stop();
		
		start();
		tim1640_write(address);	//设置起始地址
		tim1640_write(TM164_DATA[SEG_1]);
		tim1640_write(TM164_DATA[SEG_2]);
		tim1640_write(TM164_DATA[SEG_3]);
		tim1640_write(TM164_DATA[SEG_4]);
		
		stop();
		
				start();
		tim1640_write(SET_DISPLAY);	//控制显示，开显示0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f分别对应脉冲宽度
		//------------------1/16, 2/16, 4/16, 10/16, 11/16, 12/16, 13/16, 14/16
		//0x80关显示
		stop();
}

/******自动加一模式*****/

void send_z(unsigned char address,unsigned char date)
{
		unsigned char i;
		start();
		tim1640_write(address);	//设置起始地址
		for(i=0;i<4;i++)
		{
			tim1640_write(TM164_DATA[i]);
		}
		stop();
}

/******固定地址模式*****/

void send(unsigned char address, unsigned char date)
{
	start();
	tim1640_write(address);	//传显示数据对应地址
	tim1640_write(date);	//传BYTE显示数据
	stop();
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
	tim1640_write(SET_DATA_ORDER);		//设置数据，0x40,0x44分别对应地址自动加一和固定地址模式
	stop();
	start();
	tim1640_write(SET_DISPLAY);				//控制显示，开显示0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f分别对应脉冲宽度														//------------------1/16, 2/16, 4/16, 10/16, 11/16, 12/16, 13/16, 14/16
	//0x80关显示
	stop();	
}


/*   								TM1604结束   								*/
void  SDA_OUT(int val)
{
	int tempreg;
	tempreg  = readl(GPIO5_DR);
	tempreg &= ~(1<<23);
	if(val){
		tempreg |= (1<<23);
	}
	writel(tempreg,GPIO5_DR);
}	

void SCL_OUT(int val)
{
	int tempreg;
	tempreg  = readl(GPIO5_DR);
	tempreg &= ~(1<<31);
	if(val){
		tempreg |= (1<<31);
	}
	writel(tempreg,GPIO5_DR);	
}

unsigned char SDA_Read(void)
{
	return (readl(GPIO5_DR)&(1<<23))?1:0;
}
unsigned char SCL_Read(void)
{
	return (readl(GPIO5_DR)&(1<<31))?1:0;	
}
static void sda_input_mode(void)
{
	int result;
	writel(0x05,IOMUXC_SW_MUX_CTL_PAD_DATA23);//设置IO口 为GPIO1_IO05	
	result = readl(GPIO5_GDIR);	
	//修改后写入	
	result &= ~(1<<23);
	writel(result,GPIO5_GDIR); //IO口 为GPIO3_IO23 为输入模式		
}
static void sda_output_mode(void)
{
	int tmpreg;
	writel(0x05,IOMUXC_SW_MUX_CTL_PAD_DATA23);//设置IO口 为GPIO1_IO05	
	tmpreg = readl(GPIO5_GDIR);	
	//修改后写入	
	tmpreg |= (1<<23);
	writel(tmpreg,GPIO5_GDIR); //IO口 为GPIO3_IO23 为输入模式	
	
	//设置成开漏
	tmpreg  = readl(IOMUXC_SW_PAD_CTL_PAD_EIM_DATA23);
	tmpreg |= 1<<11; 
	writel(tmpreg,IOMUXC_SW_PAD_CTL_PAD_EIM_DATA23);
}

static void scl_input_mode(void)
{
	int result;
	writel(0x05,IOMUXC_SW_MUX_CTL_PAD_DATA31);//设置为GPIO口	
	result = readl(GPIO5_GDIR);	
	//修改后写入	
	result &= ~(1<<31);
	writel(result,GPIO5_GDIR); //IO口 为GPIO3_IO23 为输入模式		
}
static void scl_output_mode(void)
{
	int tmpreg;
	writel(0x05,IOMUXC_SW_MUX_CTL_PAD_DATA31);//设置为GPIO口
	tmpreg = readl(GPIO5_GDIR);	
	//修改后写入	
	tmpreg |= (1<<31);
	writel(tmpreg,GPIO5_GDIR); //IO口 为GPIO3_IO23 为输入模式	

	tmpreg  = readl(IOMUXC_SW_PAD_CTL_PAD_EIM_DATA31);
	tmpreg |= 1<<11; 
	writel(tmpreg,IOMUXC_SW_PAD_CTL_PAD_EIM_DATA31);	
}
/*************************************************/


SHT2x_PARAM g_sht2x_param;

//==========================================================
//	函数名称：	SHT2x_Delay
//
//	函数功能：	延时函数
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_Delay(unsigned int n)
{
	udelay(n); 
}
//==========================================================
//	函数名称：	SHT2x_SCL_OUTPUT
//
//	函数功能：	IIC时钟线输出模式
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_SCL_OUTPUT(void)
{
	scl_output_mode();
}

//==========================================================
//	函数名称：	SHT2x_SCL_INPUT
//
//	函数功能：	IIC时钟线输入模式
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_SCL_INPUT(void)
{
	scl_input_mode();
}

//==========================================================
//	函数名称：	SHT2x_SDA_OUTPUT
//
//	函数功能：	IIC数据线输出模式 
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_SDA_OUTPUT(void)
{
	sda_output_mode();
}

//==========================================================
//	函数名称：	SHT2x_SDA_INPUT
//
//	函数功能：	IIC数据线输入模式
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_SDA_INPUT(void)
{
	sda_input_mode();
}

void SHT2x_SDA_HIGH(void)
{
	SDA_OUT(1);
	//udelay(2000);
	SHT2x_Delay(100);
}
void SHT2x_SDA_LOW(void)
{
	SDA_OUT(0);
	//udelay(2000);
	SHT2x_Delay(100);
}
void SHT2x_SCL_HIGH(void)
{
	SCL_OUT(1);
	//udelay(2000);
	SHT2x_Delay(100);
}
void SHT2x_SCL_LOW(void)
{
	SCL_OUT(0);
	//udelay(2000);
	SHT2x_Delay(100);
}
unsigned char SHT2x_SDA_STATE(void)
{
	return  SDA_Read();
}
unsigned char SHT2x_SCL_STATE(void)
{
	return  SCL_Read();
}
//==========================================================
//	函数名称：	SHT2x_I2cStartCondition
//
//	函数功能：	IIC启动时序
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_I2cStartCondition(void)
{
    SHT2x_SCL_OUTPUT();			//时钟线输出模式
    SHT2x_SDA_OUTPUT();			//数据线输出模式
    
    SHT2x_SDA_HIGH();				//拉高数据线
    SHT2x_SCL_HIGH();				//拉高时钟线
    SHT2x_SDA_LOW();				//拉低数据线
    SHT2x_Delay(30);
    SHT2x_SCL_LOW();				//拉低时钟线
    SHT2x_Delay(30);
//	printk("start\r\n");
}

//==========================================================
//	函数名称：	SHT2x_I2cStopCondition
//
//	函数功能：	IIC停止时序 
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_I2cStopCondition(void)
{
    SHT2x_SCL_OUTPUT();
    SHT2x_SDA_OUTPUT();
    
    SHT2x_SDA_LOW();
    SHT2x_SCL_LOW();
    SHT2x_SCL_HIGH();
    SHT2x_Delay(30);
    SHT2x_SDA_HIGH();
    SHT2x_Delay(30);
}

//==========================================================
//	函数名称：	SHT2x_I2cAcknowledge
//
//	函数功能：	IIC ACK应答
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_I2cAcknowledge(void)
{
    SHT2x_SCL_OUTPUT();
    SHT2x_SDA_OUTPUT();

    SHT2x_SDA_LOW();
    SHT2x_Delay(80);
    SHT2x_SCL_HIGH();
    SHT2x_Delay(80);
    SHT2x_SCL_LOW();   
    SHT2x_Delay(80);
}

//==========================================================
//	函数名称：	SHT2x_I2cNoAcknowledge
//
//	函数功能：	IIC 无ACK应答
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_I2cNoAcknowledge(void)
{
    SHT2x_SCL_OUTPUT();
    SHT2x_SDA_OUTPUT();

    SHT2x_SDA_HIGH();
    
    SHT2x_SCL_HIGH();
    SHT2x_Delay(80);
    SHT2x_SCL_LOW();   
    SHT2x_Delay(80);
}

//==========================================================
//	函数名称：	SHT2x_I2cReadByte
//
//	函数功能：	IIC 读取数据
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
unsigned char SHT2x_I2cReadByte(void)
{
    unsigned char i, val = 0;

    SHT2x_SCL_OUTPUT();  //设置为输出模式
    SHT2x_SDA_OUTPUT();

	SDA_OUT(1);
    //SHT2x_SDA_HIGH();					//数据线拉高
    udelay(1000);
    SHT2x_SDA_INPUT();				//数据线设置为输入模式
        
    for(i = 0; i < 8; i++){
        val <<= 1; 
        
		SCL_OUT(1);
       // SHT2x_SCL_HIGH();  	 	//拉高时钟线
		udelay(100);
		//SHT2x_Delay(300);
        if(1 == SHT2x_SDA_STATE()){   //如果数据线被拉高
            val |= 0x01;			//读取数据线中的数据
        }
		udelay(100);
		//SHT2x_Delay(10);
        SCL_OUT(0);//SHT2x_SCL_LOW();      //拉低时钟线
		//SHT2x_Delay(300);
		udelay(100);
    }

    SHT2x_SDA_OUTPUT();  			//数据线输出模式

	SDA_OUT(1);
    //SHT2x_SDA_HIGH();					//数据线拉高
	udelay(10);
    return (val);							//返回读取到的数据
}

//==========================================================
//	函数名称：	SHT2x_I2cWriteByte
//
//	函数功能：	IIC 写入数据
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
unsigned char SHT2x_I2cWriteByte(unsigned char byte)
{
    unsigned char i, ack;

    SHT2x_SCL_OUTPUT();
    SHT2x_SDA_OUTPUT();		//设置为输出模式
    
    for(i = 0; i < 8; i++){
        if(byte & 0x80){   //一次读取最高位 发送数据
            SHT2x_SDA_HIGH();
        }
        else{ 
            SHT2x_SDA_LOW();
        }
        
        SHT2x_SCL_HIGH();  //时钟线拉高
        SHT2x_Delay(80);
        SHT2x_SCL_LOW();   //时钟线拉低
        SHT2x_Delay(80);
        
        byte <<= 1;
    }

    SHT2x_SDA_INPUT();  //数据线输入模式
    
    SHT2x_SCL_HIGH();		//时钟线拉高
    
    if(Bit_SET == SHT2x_SDA_STATE())   //如果接受到数据线高信号  ACK错误
    {
        ack = ACK_ERROR;
    }
    else
    {
        ack = ACK_OK;
    }
    
    SHT2x_SCL_LOW();    //拉低时钟线

    SHT2x_SDA_OUTPUT();	

    SHT2x_SDA_HIGH();		//拉高数据线
    
    return (ack);
}

//==========================================================
//	函数名称：	SHT2x_MeasureTempHM
//
//	函数功能：	主机模式温度读取
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
unsigned short temp_raw_data;
float SHT2x_MeasureTempHM(void)
{
    float TEMP=0.0;
    unsigned char tmp1, tmp2;
    unsigned short ST;
    unsigned short count;

    SHT2x_SCL_OUTPUT();  													//时钟线设置为输出模式
     
    SHT2x_I2cStartCondition();    								//开启IIC传输状态  
	udelay(1000);	
	SHT2x_I2cWriteByte(I2C_ADR_W);								//写入0x80 表示开始写数据
	udelay(1000);
	SHT2x_I2cWriteByte(TRIG_TEMP_MEASUREMENT_HM); //主机模式相对温度
    udelay(1000);
	SHT2x_I2cStartCondition();	//开启IIC传输状态    
    udelay(1000);
	SHT2x_I2cWriteByte(I2C_ADR_R);								//写入0x81 表示开始读数据
    udelay(1000);
	SHT2x_SCL_HIGH();   													//拉高时钟线

    SHT2x_SCL_INPUT();														//设置为输入模式
	count = 0;
	udelay(1000);
    while((Bit_RESET == SHT2x_SCL_STATE()&&(count<(0x43)))){  				//如果该时钟线被置低
		count++;
		udelay(1000);
    }
	//printk("count=%d\r\n",count);		
    tmp1 = SHT2x_I2cReadByte(); //读取数据
    SHT2x_I2cAcknowledge();			//ACK应答
	//printk("==1=%02x\r\n",tmp1);
	
    tmp2 = SHT2x_I2cReadByte();	//读取数据	
	//printk("==2=%02x\r\n",tmp2);
    SHT2x_I2cNoAcknowledge();		//不应答
		
    SHT2x_I2cStopCondition();		//关闭IIC
    
    ST = (tmp1 << 8) | (tmp2 << 0);
	//printk("::%02x,%02x\r\n",tmp1,tmp2);
    ST &= ~0x0003;
	temp_raw_data = ST;
    SHT2x_SCL_OUTPUT();  	//时钟线输出
//	send_LED_Display(0xC0,55 ,2); 
    return (TEMP);	    	//返回温度值
}

//==========================================================
//	函数名称：	SHT2x_MeasureHumiHM
//
//	函数功能：	主机模式湿度读取
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
float SHT2x_MeasureHumiHM(void)
{
    float HUMI = 0.0;
    unsigned char tmp1, tmp2;    
    unsigned short SRH;
	int count = 0;

    SHT2x_SCL_OUTPUT();
    
    SHT2x_I2cStartCondition();                               
    SHT2x_I2cWriteByte(I2C_ADR_W);
    SHT2x_I2cWriteByte(TRIG_HUMI_MEASUREMENT_HM);

    SHT2x_I2cStartCondition();
    SHT2x_I2cWriteByte(I2C_ADR_R);

    SHT2x_SCL_HIGH();

    SHT2x_SCL_INPUT();
	
    while((Bit_RESET == SHT2x_SCL_STATE())&&(count<100))
    {
		udelay(1000);
		count++;
        //SHT2x_Delay(20);
    }
    //printk("humie:count=%d\r\n",count);
    tmp1 = SHT2x_I2cReadByte();
    SHT2x_I2cAcknowledge();
    tmp2 = SHT2x_I2cReadByte();
    SHT2x_I2cNoAcknowledge();
    SHT2x_I2cStopCondition();
    
    SRH = (tmp1 << 8) | (tmp2 << 0);
    SRH &= ~0x0003;
	temp_raw_data = SRH;
    SHT2x_SCL_OUTPUT();

    return (HUMI);
}

//==========================================================
//	函数名称：	SHT2x_MeasureTempPoll
//
//	函数功能：	非主机模式温度读取 
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
float SHT2x_MeasureTempPoll(void)
{
    float TEMP = 0.0;
    unsigned char ack, tmp1, tmp2;
    unsigned short ST;
    
    SHT2x_I2cStartCondition();                            
    SHT2x_I2cWriteByte(I2C_ADR_W);
    SHT2x_I2cWriteByte(TRIG_TEMP_MEASUREMENT_POLL);

    do {
        SHT2x_Delay(20);               
        SHT2x_I2cStartCondition();
        ack = SHT2x_I2cWriteByte(I2C_ADR_R);
    } while(ACK_ERROR == ack);
    
    tmp1 = SHT2x_I2cReadByte();
    SHT2x_I2cAcknowledge();
    tmp2 = SHT2x_I2cReadByte();
    SHT2x_I2cNoAcknowledge();
    SHT2x_I2cStopCondition();
    
    ST = (tmp1 << 8) | (tmp2 << 0);
    ST &= ~0x0003;
   // TEMP = ((float)ST * 0.00268127) - 46.85;

    return (TEMP);	  
}

//==========================================================
//	函数名称：	SHT2x_MeasureHumiPoll
//
//	函数功能：	非主机模式湿度读取 
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
float SHT2x_MeasureHumiPoll(void)
{
    float HUMI=0.0;
    unsigned char ack, tmp1, tmp2;    
    unsigned short SRH;
    
    SHT2x_I2cStartCondition();                               
    SHT2x_I2cWriteByte(I2C_ADR_W);
    SHT2x_I2cWriteByte(TRIG_HUMI_MEASUREMENT_POLL);
    
    do {
        SHT2x_Delay(20);
        SHT2x_I2cStartCondition();
        ack = SHT2x_I2cWriteByte(I2C_ADR_R);
    } while(ACK_ERROR == ack);
    
    tmp1 = SHT2x_I2cReadByte();
    SHT2x_I2cAcknowledge();
    tmp2 = SHT2x_I2cReadByte();
    SHT2x_I2cNoAcknowledge();
    SHT2x_I2cStopCondition();
    
    SRH = (tmp1 << 8) | (tmp2 << 0);
    SRH &= ~0x0003;
   // HUMI = ((float)SRH * 0.00190735) - 6;

    return (HUMI);
}

//==========================================================
//	函数名称：	SHT2x_ReadUserReg
//
//	函数功能：	读取数据
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
unsigned char SHT2x_ReadUserReg(void)    
{
    unsigned char reg;
  
    SHT2x_I2cStartCondition();                 
    SHT2x_I2cWriteByte(I2C_ADR_W);
    SHT2x_I2cWriteByte(USER_REG_R);
    SHT2x_I2cStartCondition(); 
    SHT2x_I2cWriteByte(I2C_ADR_R);
    reg = SHT2x_I2cReadByte();
    SHT2x_I2cNoAcknowledge();
    SHT2x_I2cStopCondition();
    
    return (reg); 
}

//==========================================================
//	函数名称：	SHT2x_WriteUserReg
//
//	函数功能：	发送ACK数据
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
unsigned char SHT2x_WriteUserReg(unsigned char reg)
{
    unsigned char ack;
    
    SHT2x_I2cStartCondition();
    SHT2x_I2cWriteByte(I2C_ADR_W);
    SHT2x_I2cWriteByte(USER_REG_W);
    ack = SHT2x_I2cWriteByte(reg);
    SHT2x_I2cStopCondition();  
    
    return (ack);
}

//==========================================================
//	函数名称：	SHT2x_SoftReset
//
//	函数功能：	软复位
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_SoftReset(void)
{
    SHT2x_I2cStartCondition();
    SHT2x_I2cWriteByte(I2C_ADR_W);
    SHT2x_I2cWriteByte(SOFT_RESET);
    SHT2x_I2cStopCondition();

    SHT2x_Delay(80);
}

//==========================================================
//	函数名称：	SHT2x_GetSerialNumber
//
//	函数功能：	序列号
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_GetSerialNumber(unsigned char *buf)
{
    /* Read from memory location 1 */
    SHT2x_I2cStartCondition();
    SHT2x_I2cWriteByte(I2C_ADR_W);//I2C address
    SHT2x_I2cWriteByte(0xFA); 		//Command for readout on-chip memory
    SHT2x_I2cWriteByte(0x0F); 		//on-chip memory address
    SHT2x_I2cStartCondition();
    SHT2x_I2cWriteByte(I2C_ADR_R);//I2C address
    buf[5] = SHT2x_I2cReadByte(); //Read SNB_3
    SHT2x_I2cAcknowledge();
    SHT2x_I2cReadByte(); 					//Read CRC SNB_3 (CRC is not analyzed)
    SHT2x_I2cAcknowledge();
    buf[4] = SHT2x_I2cReadByte(); //Read SNB_2
    SHT2x_I2cAcknowledge();
    SHT2x_I2cReadByte(); 					//Read CRC SNB_2 (CRC is not analyzed)
    SHT2x_I2cAcknowledge();
    buf[3] = SHT2x_I2cReadByte(); //Read SNB_1
    SHT2x_I2cAcknowledge();
    SHT2x_I2cReadByte(); 					//Read CRC SNB_1 (CRC is not analyzed)
    SHT2x_I2cAcknowledge();
    buf[2] = SHT2x_I2cReadByte(); //Read SNB_0
    SHT2x_I2cAcknowledge();
    SHT2x_I2cReadByte(); 					//Read CRC SNB_0 (CRC is not analyzed)
    SHT2x_I2cNoAcknowledge();
    SHT2x_I2cStopCondition();

    /* Read from memory location 2 */
    SHT2x_I2cStartCondition();
    SHT2x_I2cWriteByte(I2C_ADR_W); 	//I2C address
    SHT2x_I2cWriteByte(0xFC); 			//Command for readout on-chip memory
    SHT2x_I2cWriteByte(0xC9); 			//on-chip memory address
    SHT2x_I2cStartCondition();
    SHT2x_I2cWriteByte(I2C_ADR_R); 	//I2C address
    buf[1] = SHT2x_I2cReadByte(); 	//Read SNC_1
    SHT2x_I2cAcknowledge();
    buf[0] = SHT2x_I2cReadByte(); 	//Read SNC_0
    SHT2x_I2cAcknowledge();
    SHT2x_I2cReadByte(); 						//Read CRC SNC0/1 (CRC is not analyzed)
    SHT2x_I2cAcknowledge();
    buf[7] = SHT2x_I2cReadByte(); 	//Read SNA_1
    SHT2x_I2cAcknowledge();
    buf[6] = SHT2x_I2cReadByte(); 	//Read SNA_0
    SHT2x_I2cAcknowledge();
    SHT2x_I2cReadByte(); 						//Read CRC SNA0/1 (CRC is not analyzed)
    SHT2x_I2cNoAcknowledge();
    SHT2x_I2cStopCondition();
}

//==========================================================
//	函数名称：	SHT2x_GetTempHumi
//
//	函数功能：	得到的数据 
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SHT2x_GetTempHumi(void)
{   
    g_sht2x_param.TEMP_HM = SHT2x_MeasureTempHM();			//主机模式下的温度数据
    g_sht2x_param.HUMI_HM = SHT2x_MeasureHumiHM(); 			//主机模式下的湿度数据

    g_sht2x_param.TEMP_POLL = SHT2x_MeasureTempPoll();  //非主机模式下的温度数据
    g_sht2x_param.HUMI_POLL = SHT2x_MeasureHumiPoll();	//非主机模式下的湿度数据
    
   // SHT2x_GetSerialNumber(g_sht2x_param.SerialNumber);	//序列号
}
/*************************************************/
static volatile int key_value;//按键值
static int key_major = 0;     //
static int key_minor = 0; 
/* 等待队列: 
 * 当没有按键被按下时，如果有进程调用key_read函数，
 * 它将休眠
 */
static DECLARE_WAIT_QUEUE_HEAD(key_waitq);

#define KEY_TIMER_DELAY    HZ/50   /*20ms*/

/* 事件标志, 有键按下时将它置1，key_read将它清0 */
static volatile int ev_press = 0;

/* 应用程序对设备文件/dev/key执行open(...)时，
 * 就会调用key_open函数
 */
static int key_open(struct inode *inode, struct file *file)
{	
	return 0;
}

/* 应用程序对设备文件/dev/key执行close(...)时，
 * 就会调用key_close函数
 */
static int key_close(struct inode *inode, struct file *file)
{
    return 0;
}
#define LED_MAGIC 'k'
#define IOCTRL_CMD_READ_TEMP _IOW(LED_MAGIC, 1, int)
#define IOCTRL_CMD_READ_HUMI _IOW(LED_MAGIC, 2, int)
#define IOCTRL_CMD_SHOW_HUMI _IOW(LED_MAGIC, 3, int)
#define IOCTRL_CMD_SHOW_TEMP _IOW(LED_MAGIC, 4, int)
int sel_cmd;
static long cmd_ioctl( struct file *file, 
					unsigned int cmd, 
					unsigned long arg)
{
	unsigned int data;

    if (__get_user(data, (unsigned int __user *)arg))
        return -EFAULT;
		
		
	switch(cmd){
		case IOCTRL_CMD_READ_TEMP:
			sel_cmd = 1;
			break;
		case IOCTRL_CMD_READ_HUMI:
			sel_cmd = 2;
			break;
		case IOCTRL_CMD_SHOW_HUMI:
			send_LED_Display(0xC0,data,2); 
			break;
		case IOCTRL_CMD_SHOW_TEMP:
			send_LED_Display(0xC0,data,1); 
			break;
	}
	//printk("cmd=%d\r\n",sel_cmd);
	return 0;
}
/* 应用程序对设备文件/dev/key执行read(...)时，会造成阻塞
 * 就会调用key_read函数
 */

static int key_read(struct file *filp, char __user *buff, 
                        size_t count, loff_t *offp)
{
    unsigned long err;
	
	//printk("*cmd=%d\r\n",sel_cmd);
	if(sel_cmd == 1){
		//printk("read temp\r\n");
		SHT2x_MeasureTempHM();
	}
	else if(sel_cmd == 2){
		//printk("read humi\r\n");
		SHT2x_MeasureHumiHM();				
	}

	sel_cmd = 0;
	//printk("temp_raw_data=%d\r\n",temp_raw_data);
    err = copy_to_user(buff, (const void *)&temp_raw_data, 4);
    memset((void *)&temp_raw_data, 0, sizeof(temp_raw_data));
    return err ? -EFAULT : 1;
}
/**************************************************
* 当用户程序调用select函数时，本函数被调用
* 如果有按键数据，则select函数会立刻返回
* 如果没有按键数据，本函数使用poll_wait等待
**************************************************/
static unsigned int key_poll(struct file *file,
        			 struct poll_table_struct *wait)
{
	unsigned int mask = 0;
    	poll_wait(file, &key_waitq, wait);
    	if (ev_press)
        	mask |= POLLIN | POLLRDNORM;
    	return mask;
}


/* 这个结构是字符设备驱动程序的核心
 * 当应用程序操作设备文件时所调用的open、read、write等函数，
 * 最终会调用这个结构中的对应函数
 */
static struct file_operations key_fops = {
    .owner   =   THIS_MODULE,    /* 这是一个宏，指向编译模块时自动创建的__this_module变量 */
    .open    =   key_open,
    .release =   key_close, 
    .read    =   key_read,
    .poll    =   key_poll,
	.unlocked_ioctl   =   cmd_ioctl,
};
/*
 * We export one key device.  There's no need for us to maintain any
 * special housekeeping info, so we just deal with raw cdev.
 */
static struct cdev key_cdev;

/*
 * 执行“insmod key_drv.ko”命令时就会调用这个函数
 */
#define SPI_BASE_REG_ADDR    0x020A4000

static int __init sht20_init(void)
{
	int result;
	dev_t devno;
	 
	/* Figure out our device number. */
	result    = alloc_chrdev_region(&devno, 0, 1, "sht20");
	key_major = MAJOR(devno);
	key_minor = MINOR(devno);
	printk("SHT20 device installed, with major %d minor %d\r\n", key_major,key_minor);	
	if (devno < 0) {
		printk(KERN_WARNING "SHT20: unable to get major %d\n", key_major);
		return result;
	}
																									 
	/* Now set up cdev. */

	cdev_init(&key_cdev, &key_fops);
	key_cdev.owner = THIS_MODULE;
	key_cdev.ops   = &key_fops;
	
	/* Fail gracefully if need be */
	if (cdev_add (&key_cdev, devno, 1)){
		printk (KERN_NOTICE "Error add\r\n");
	}

	IOMUXC_SW_MUX_CTL_PAD_GPIO05 =  (unsigned int*)ioremap(0x20e0230,4);
	GPIO1_DR                     = (unsigned int*)ioremap(0x209c000,4);
	GPIO1_GDIR                   = (unsigned int*)ioremap(0x209c004,4);

	IOMUXC_SW_PAD_CTL_PAD_EIM_DATA23 = (unsigned int*)ioremap(0x20e0530,4);
	IOMUXC_SW_PAD_CTL_PAD_EIM_DATA31 = (unsigned int*)ioremap(0x20e0550,4);
	IOMUXC_SW_MUX_CTL_PAD_DATA23     = (unsigned int*)ioremap(0x20e0160,4);
	IOMUXC_SW_MUX_CTL_PAD_DATA31     =  (unsigned int*)ioremap(0x20e0180,4);
	GPIO5_GDIR                       = (unsigned int*)ioremap(0x20a4004,4);
	GPIO5_DR                         = (unsigned int*)ioremap(0x20a4000,4);
	TIM1640_SCLK_MUX                 = (unsigned int*)ioremap(0x20e01D8,4);
	TIM1640_DIN_MUX                  = (unsigned int*)ioremap(0x20e01D4,4);
	TIM1640_SCL_GPIO_DR              = (unsigned int*)ioremap(0x20A0000,4);
	TIM1640_SCL_GPIO_GDIR            = (unsigned int*)ioremap(0x20A0004,4);

	TIM1640_SDA_GPIO_DR               = (unsigned int*)ioremap(0x20A0000,4);
	TIM1640_SDA_GPIO_GDIR            = (unsigned int*)ioremap(0x20A0004,4);	
	
	scl_output_mode();
	sda_output_mode();
	SDA_OUT(1);
	SCL_OUT(1);
	
	TM1640_Init();
	init_tm1640();
    return 0;
}
/*
 * 执行rmmod key_drv.ko”命令时就会调用这个函数 
 */
static void __exit sht20_cleanup(void)
{
	cdev_del(&key_cdev);
	unregister_chrdev_region(MKDEV(key_major, 0), 1);
	//del_timer_sync(&key_timer);
	printk("SHT20 device uninstalled\n");
}

/* 这两行指定驱动程序的初始化函数和卸载函数 */
module_init(sht20_init);
module_exit(sht20_cleanup);

/* 描述驱动程序的一些信息，不是必须的 */
MODULE_AUTHOR("Hanson he");             // 驱动程序的作者
MODULE_DESCRIPTION("SHT20 Device Driver");   // 一些描述信息
MODULE_LICENSE("GPL");                              // 遵循的协议

