#include "Atmosphere.h"
#include "stdlib.h"
#include "string.h"
#include "stdio.h"
#include "RS485.h"
#include "delay.h"

unsigned  int hum_raw,temp_raw,pres_raw;
signed  int t_fine;

uint16_t dig_T1;
int16_t dig_T2;
int16_t dig_T3;
uint16_t dig_P1;
int16_t dig_P2;
int16_t dig_P3;
int16_t dig_P4;
int16_t dig_P5;
int16_t dig_P6;
int16_t dig_P7;
int16_t dig_P8;
int16_t dig_P9;
int8_t  dig_H1;
int16_t dig_H2;
int8_t  dig_H3;
int16_t dig_H4;
int16_t dig_H5;
int8_t  dig_H6;
//==========================================================
//	函数名称：	IIC_Init
//
//	函数功能：	IIC初始化
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
static void IIC_Init(void)
{					     
	GPIO_InitTypeDef GPIO_Initure;    

	ATMOS_IIC_GPIO_RCC_EN();           				          //IIC时钟

	GPIO_Initure.Pin    = ATMOS_IIC_SDA_GPIO_PIN;				
	GPIO_Initure.Mode   = GPIO_MODE_OUTPUT_PP;				  //推挽输出
	GPIO_Initure.Speed  = GPIO_SPEED_FREQ_LOW; 					//低速
	GPIO_Initure.Pull   = GPIO_PULLUP;
	HAL_GPIO_Init(ATMOS_IIC_SDA_GPIO_PORT, &GPIO_Initure);
	
	GPIO_Initure.Pin    = ATMOS_IIC_SCL_GPIO_PIN;				
	GPIO_Initure.Mode   = GPIO_MODE_OUTPUT_PP;				  //推挽输出
	GPIO_Initure.Speed  = GPIO_SPEED_FREQ_LOW; 					//低速
	GPIO_Initure.Pull   = GPIO_PULLUP;
	HAL_GPIO_Init(ATMOS_IIC_SCL_GPIO_PORT, &GPIO_Initure);
    
	IIC_SDA(1);	  	  
	IIC_SCL(1);    
}
//==========================================================
//	函数名称：	IIC_Start
//
//	函数功能：	IIC 启动
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：	
//产生IIC起始信号
//==========================================================
void IIC_Start(void)
{
	SDA_OUT();     //sda线输出
	IIC_SDA(1);	  	  
	IIC_SCL(1);
	delay_us(4);
 	IIC_SDA(0);//START:when CLK is high,DATA change form high to low 
	delay_us(4);
	IIC_SCL(0);//钳住I2C总线，准备发送或接收数据 
}
//==========================================================
//	函数名称：	IIC_Stop
//
//	函数功能：	IIC 停止
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//产生IIC停止信号
//==========================================================
void IIC_Stop(void)
{
	SDA_OUT();//sda线输出
	IIC_SCL(0);
	IIC_SDA(0);
 	delay_us(4); 
	IIC_SCL(1);//STOP:when CLK is high DATA change form low to high
 	delay_us(4); 
	IIC_SDA(1);//发送I2C总线结束信号 						   	
}

//==========================================================
//	函数名称：	IIC_Wait_Ack
//
//	函数功能：	等待ACK
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：
//等待应答信号到来
//返回值：1，接收应答失败
//        0，接收应答成功
//==========================================================
uint8_t IIC_Wait_Ack(void)
{
	uint8_t ucErrTime=0;
	SDA_IN();      //SDA设置为输入  
	IIC_SDA(1);delay_us(1);	   
	IIC_SCL(1);delay_us(1);	 
	while(READ_SDA)
	{
		ucErrTime++;
		if(ucErrTime>250)
		{
			IIC_Stop();
			return 1;
		}
	}
	IIC_SCL(0);//时钟输出0 	   
	return 0;  
}

//==========================================================
//	函数名称：	IIC_Ack
//
//	函数功能：	ACK
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：	
//产生ACK应答
//==========================================================
void IIC_Ack(void)
{
	IIC_SCL(0);
	SDA_OUT();
	IIC_SDA(0);
	delay_us(2);
	IIC_SCL(1);
	delay_us(2);
	IIC_SCL(0);
}

//==========================================================
//	函数名称：	IIC_NAck
//
//	函数功能：	NACK
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：	
//不产生ACK应答	
//==========================================================	    
void IIC_NAck(void)
{
	IIC_SCL(0);
	SDA_OUT();
	IIC_SDA(1);
	delay_us(2);
	IIC_SCL(1);
	delay_us(2);
	IIC_SCL(0);
}

//==========================================================
//	函数名称：	IIC_Send_Byte
//
//	函数功能：	IIC发送数据
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：	
//IIC发送一个字节
//返回从机有无应答
//1，有应答
//0，无应答
//==========================================================			  
void IIC_Send_Byte(uint8_t txd)
{                        
    uint8_t t;   
	SDA_OUT(); 	    
    IIC_SCL(0);//拉低时钟开始数据传输
    for(t=0;t<8;t++)
    {              
        IIC_SDA((txd&0x80)>>7);
        txd<<=1; 	  
		delay_us(2);   //对TEA5767这三个延时都是必须的
		IIC_SCL(1);
		delay_us(2); 
		IIC_SCL(0);	
		delay_us(2);
    }	 
}

//==========================================================
//	函数名称：	IIC_Read_Byte
//
//	函数功能：	IIC读数据
//
//	入口参数：	ack=1时，发送ACK，ack=0，发送nACK 
//
//	返回参数：	无
//
//	说明：	 
//==========================================================	
uint8_t IIC_Read_Byte(unsigned char ack)
{
	unsigned char i,receive=0;
	SDA_IN();//SDA设置为输入
	
  for(i=0;i<8;i++ )
	{
    IIC_SCL(0); 
    delay_us(2);
		IIC_SCL(1);
    receive<<=1;
		if(READ_SDA)
		{
				receive++;
		}
		delay_us(1); 
    }					 
    if (!ack)
    {
        IIC_NAck();//发送nACK
    }
    else
    {
        IIC_Ack(); //发送ACK   
    }
    return receive;
}


//==========================================================
//	函数名称：	AT24CXX_ReadNumBytes
//
//	函数功能：	IIC读数据
//
//	入口参数：	uint8_t DevAddr 设备地址
//              uint8_t MemAddr 内存地址
//              uint8_t *pDst   指向保存读出数据指针
//              uint8_t len     数据长度
//
//返回值  :读到的数据 
//
//	说明：	
//==========================================================	
void AT24CXX_ReadNumBytes(uint8_t DevAddr,uint8_t MemAddr,uint8_t *pDst,uint8_t len)
{				  		  	    																 
    IIC_Start(); 
    IIC_Send_Byte(DevAddr|0);   //发送器件地址0XA0,写数据 	   
    if(!IIC_Wait_Ack())
    {
        IIC_Send_Byte(MemAddr);
        IIC_Wait_Ack();        
        IIC_Start(); 
        IIC_Send_Byte(DevAddr|1);           //进入接收模式			   
        if(!IIC_Wait_Ack())
        {            
            while(len)
            {
                *pDst = IIC_Read_Byte((len>1)?1:0);
                pDst++;
                len--;
            }
        }            
    }       
 
    IIC_Stop();//产生一个停止条件	       
}

//==========================================================
//	函数名称：	AT24CXX_WriteSingleBytes
//
//	函数功能：	IIC读数据
//
//	入口参数：	uint8_t DevAddr 设备地址
//              uint8_t MemAddr 内存地址
//              uint8_t *pDst   指向等待写入的数据指针
//
//  返回值  :读到的数据 
//
//	说明：	
//==========================================================
void AT24CXX_WriteSingleBytes(uint8_t DevAddr,uint8_t MemAddr,uint8_t *pDst)
{				    	    																 
    IIC_Start(); 
    IIC_Send_Byte(DevAddr|0);   //发送器件地址0XA0,写数据 	   
    if(!IIC_Wait_Ack())
    {
        IIC_Send_Byte(MemAddr);	   
        if(!IIC_Wait_Ack())
        {
            IIC_Send_Byte(*pDst);
            IIC_Wait_Ack();
        }             
    }          
    IIC_Stop();//产生一个停止条件	       
}

//==========================================================
//	函数名称：	readTrim
//
//	函数功能：	读修正数据
//
//	入口参数：  无
//
//  返回值  :   无 
//
//	说明		：
//==========================================================
void readTrim(void)
{
    uint8_t data[32];

    AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0X88,&data[0],24);
    AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0xA1,&data[24],1);  
    AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0xE1,&data[25],7);

    dig_T1 = (data[1] << 8) | data[0];
    dig_T2 = (data[3] << 8) | data[2];
    dig_T3 = (data[5] << 8) | data[4];
    dig_P1 = (data[7] << 8) | data[6];
    dig_P2 = (data[9] << 8) | data[8];
    dig_P3 = (data[11]<< 8) | data[10];
    dig_P4 = (data[13]<< 8) | data[12];
    dig_P5 = (data[15]<< 8) | data[14];
    dig_P6 = (data[17]<< 8) | data[16];
    dig_P7 = (data[19]<< 8) | data[18];
    dig_P8 = (data[21]<< 8) | data[20];
    dig_P9 = (data[23]<< 8) | data[22];
    dig_H1 = data[24];
    dig_H2 = (data[26]<< 8) | data[25];
    dig_H3 = data[27];
    dig_H4 = (data[28]<< 4) | (0x0F & data[29]);
    dig_H5 = (data[30] << 4) | ((data[29] >> 4) & 0x0F);
    dig_H6 = data[31];   
}

//==========================================================
//	函数名称：	readData
//
//	函数功能：	读出温度、湿度、压力
//
//	入口参数：  无
//
//  返回值  :   无 
//
//	说明：	
//==========================================================
void readData(uint32_t *pPress,uint32_t *pTemp,uint32_t *pHumi)
{
    uint8_t data[8];
    AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0xF7,&data[0],8);
    
    *pPress = (data[0] << 12) | (data[1] << 4) | (data[2] >> 4);
    *pTemp  = (data[3] << 12) | (data[4] << 4) | (data[5] >> 4);
    *pHumi  = (data[6] << 8) | data[7];
}

//==========================================================
//	函数名称：	calibration_T
//
//	函数功能：	从寄存器读出温度值
//
//	入口参数：  无
//
//  返回值  :   无 
//
//	说明：	
//==========================================================
signed  int calibration_T(signed  int adc_T)
{
    signed  int var1, var2, T;
    var1 = ((((adc_T >> 3) - ((signed  int)dig_T1<<1))) * ((signed  int)dig_T2)) >> 11;
    var2 = (((((adc_T >> 4) - ((signed  int)dig_T1)) * ((adc_T>>4) - ((signed  int)dig_T1))) >> 12) * ((signed  int)dig_T3)) >> 14;
    
    t_fine = var1 + var2;
    T = (t_fine * 5 + 128) >> 8;
    return T; 
}

//==========================================================
//	函数名称：	calibration_P
//
//	函数功能：	从寄存器读出的压力值
//
//	入口参数：  无
//
//  返回值  :   无 
//
//	说明：	
//==========================================================
unsigned  int calibration_P(signed  int adc_P)
{
    signed  int var1, var2;
    unsigned  int P;
    var1 = (((signed  int)t_fine)>>1) - (signed  int)64000;
    var2 = (((var1>>2) * (var1>>2)) >> 11) * ((signed  int)dig_P6);
    var2 = var2 + ((var1*((signed  int)dig_P5))<<1);
    var2 = (var2>>2)+(((signed  int)dig_P4)<<16);
    var1 = (((dig_P3 * (((var1>>2)*(var1>>2)) >> 13)) >>3) + ((((signed  int)dig_P2) * var1)>>1))>>18;
    var1 = ((((32768+var1))*((signed  int)dig_P1))>>15);
    if (var1 == 0)
    {
        return 0;
    }    
    P = (((unsigned  int)(((signed  int)1048576)-adc_P)-(var2>>12)))*3125;
    if(P<0x80000000)
    {
       P = (P << 1) / ((unsigned  int) var1);   
    }
    else
    {
        P = (P / (unsigned  int)var1) * 2;    
    }
    var1 = (((signed  int)dig_P9) * ((signed  int)(((P>>3) * (P>>3))>>13)))>>12;
    var2 = (((signed  int)(P>>2)) * ((signed  int)dig_P8))>>13;
    P = (unsigned  int)((signed  int)P + ((var1 + var2 + dig_P7) >> 4));
    return P;
}

//==========================================================
//	函数名称：	calibration_H
//
//	函数功能：	signed  int adc_H,从寄存器读出的湿度值
//
//	入口参数：  无
//  返回值  :   无 
//
//	说明：	
//==========================================================
unsigned int calibration_H(signed  int adc_H)
{
    signed  int v_x1;
    
    v_x1 = (t_fine - ((signed  int)76800));
    v_x1 = (((((adc_H << 14) -(((signed  int)dig_H4) << 20) - (((signed  int)dig_H5) * v_x1)) + 
              ((signed  int)16384)) >> 15) * (((((((v_x1 * ((signed  int)dig_H6)) >> 10) * 
              (((v_x1 * ((signed  int)dig_H3)) >> 11) + ((signed  int) 32768))) >> 10) + (( signed  int)2097152)) * 
              ((signed  int) dig_H2) + 8192) >> 14));
   v_x1 = (v_x1 - (((((v_x1 >> 15) * (v_x1 >> 15)) >> 7) * ((signed  int)dig_H1)) >> 4));
   v_x1 = (v_x1 < 0 ? 0 : v_x1);
   v_x1 = (v_x1 > 419430400 ? 419430400 : v_x1);
   return (unsigned  int)(v_x1 >> 12);   
}

//==========================================================
//	函数名称：	Atmosphere_GetPress
//
//	函数功能：	获取压力值
//
//	入口参数：  无
//
//  返回值  :   无 
//
//	说明：	
//==========================================================
float Atmosphere_GetPress(void)
{
    float temp_act = 0.0, press_act = 0.0,hum_act=0.0;
    
    readData(&pres_raw,&temp_raw,&hum_raw);//从寄存器读出温度、湿度、压力
   
    press_act = (float)calibration_P(pres_raw) / 100.0;
    
    return press_act;
}
//==========================================================
//	函数名称：	Atmosphere_Init
//
//	函数功能：	初始化IIC
//
//	入口参数：  无
//
//  返回值  :   无 
//
//	说明：	
//==========================================================
void Atmosphere_Init(void)
{
    uint8_t osrs_t = 1;             //Temperature oversampling x 1
    uint8_t osrs_p = 1;             //Pressure oversampling x 1
    uint8_t osrs_h = 1;             //Humidity oversampling x 1
    uint8_t mode = 3;               //Normal mode
    uint8_t t_sb = 5;               //Tstandby 1000ms
    uint8_t filter = 0;             //Filter off 
    uint8_t spi3w_en = 0;           //3-wire SPI Disable

    uint8_t ctrl_meas_reg = (osrs_t << 5) | (osrs_p << 2) | mode;
    uint8_t config_reg    = (t_sb << 5) | (filter << 2) | spi3w_en;
    uint8_t ctrl_hum_reg  = osrs_h; 

    IIC_Init(); //初始化IIC
    
    AT24CXX_WriteSingleBytes(ATMOS_DEVICE_ADDR,0xF2,&ctrl_hum_reg);
    AT24CXX_WriteSingleBytes(ATMOS_DEVICE_ADDR,0xF4,&ctrl_meas_reg);
    AT24CXX_WriteSingleBytes(ATMOS_DEVICE_ADDR,0xF5,&config_reg);    
    
    readTrim(); //获取修正值 
}

//==========================================================
//	函数名称：	Atmosphere_TestFunc
//
//	函数功能：	测试程序
//
//	入口参数：  无
//
//  返回值  :   无 
//
//	说明：			
//==========================================================
float temp_act = 0.0, press_act = 0.0,hum_act=0.0;
uint8_t Atmosphere_TestFunc(void)
{
		uint8_t A_P[10];//大气压力值

    readData(&pres_raw,&temp_raw,&hum_raw);//从寄存器读出温度、湿度、压力

    temp_act  = (float)calibration_T(temp_raw) / 100.0;
    press_act = (float)calibration_P(pres_raw) / 100.0;
    hum_act   = (float)calibration_H(hum_raw) / 1024.0;

		A_P[0] = (uint16_t)press_act>>8;	//大气压力数据
		A_P[1] = (uint16_t)press_act;			//大气压力数据
	
    printf("TEMP : %fDegC\r\n",temp_act);
    printf("PRESS : %fhPa\r\n",press_act);
    printf(" HUM :%f\r\n ",hum_act);      

		if(!DataHandling_485(Addr_A_P))		//处理485数据
		{
			Rs485_Send(Addr_A_P,Rx_Stack.Src_Adr,A_P_Altitude,2,A_P);		//发送大气压力值
			memset(A_P,0,10);
		}

		return 1;
}




























