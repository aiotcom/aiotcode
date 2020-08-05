#include "mpu6050.h"
#include "delay.h"

//初始化MPU6050
//返回值: 0,成功
//        其他,错误代码
u8 MPU_Init(void)
{
    u8 res;
    MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X80);//复位MPU6050
    delay_ms(100);
    MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X00);//唤醒MPU6050
    MPU_Set_Gyro_Fsr(3); //陀螺仪传感器,±2000dps
    MPU_Set_Accel_Fsr(0); //加速度传感器 ±2g
    MPU_Set_Rate(200); //设置采样率50HZ
    MPU_Write_Byte(MPU_INT_EN_REG,0X00); //关闭所有中断
    MPU_Write_Byte(MPU_USER_CTRL_REG,0X00);//I2C主模式关闭
    MPU_Write_Byte(MPU_FIFO_EN_REG,0X00);//关闭FIFO
    MPU_Write_Byte(MPU_INTBP_CFG_REG,0X80);//INT引脚低电平有效
    res=MPU_Read_Byte(MPU_DEVICE_ID_REG);
    if(res==MPU_ADDR)//器件ID正确
    {
        MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X02);//设置CLKSEL,PLL X 轴为参考
        MPU_Write_Byte(MPU_PWR_MGMT2_REG,0X00);//加速度陀螺仪都工作
        MPU_Set_Rate(200); //设置采样率为50HZ
    }else return 1;
    return 0;
}

//设置MPU6050陀螺仪传感器满量程范围
//fsr:0,±250dps;1,±500dps;2,±1000dps;3,±2000dps
//返回值:0,设置成功
//    其他,设置失败 
u8 MPU_Set_Gyro_Fsr(u8 fsr)
{
    return MPU_Write_Byte(MPU_GYRO_CFG_REG,fsr<<3);//设置陀螺仪满量程范围
}

//设置MPU6050加速度传感器满量程范围
//fsr:0,±2g;1,±4g;2,±8g;3,±16g
//返回值:0,设置成功
//    其他,设置失败 
u8 MPU_Set_Accel_Fsr(u8 fsr)
{
    return MPU_Write_Byte(MPU_ACCEL_CFG_REG,fsr<<3);//设置加速度传感器满量程范围
}

//设置MPU6050的数字低通滤波器
//lpf:数字低通滤波频率(Hz)
//返回值:0,设置成功
//    其他,设置失败 
u8 MPU_Set_LPF(u16 lpf)
{
    u8 data=0;
    if(lpf>=188) data=1;
    else if(lpf>=98) data=2;
    else if(lpf>=42) data=2;
    else if(lpf>=42) data=3;
    else if(lpf>=20) data=4;
    else if(lpf>=10) data=5;
    else data=6; 
    return MPU_Write_Byte(MPU_CFG_REG,data);//设置数字低通滤波器  
}

//设置MPU6050的采样率(假定Fs=1KHz)
//rate:4~1000(Hz)
//返回值:0,设置成功
//    其他,设置失败 
u8 MPU_Set_Rate(u16 rate)
{
    u8 data;
    if(rate>1000)rate=1000;
    if(rate<4)rate=4;
    data=1000/rate-1;
    data=MPU_Write_Byte(MPU_SAMPLE_RATE_REG,data);	//设置数字低通滤波器
    return MPU_Set_LPF(rate/2);	//自动设置LPF为采样率的一半
}

//得到温度值
//返回值:温度值(扩大了100倍)
short MPU_Get_Temperature(void)
{
    u8 buf[2]; 
    short raw;
    float temp;
    MPU_Read_Len(MPU_ADDR,MPU_TEMP_OUTH_REG,2,buf); 
    raw=((u16)buf[0]<<8)|buf[1];  
    temp=36.53+((double)raw)/340;  
    return temp*100;;
}
//得到陀螺仪值(原始值)
//gx,gy,gz:陀螺仪x,y,z轴的原始读数(带符号)
//返回值:0,成功
//    其他,错误代码
u8 MPU_Get_Gyroscope(short *gx,short *gy,short *gz)
{
    u8 buf[6],res;
    res=MPU_Read_Len(MPU_ADDR,MPU_GYRO_XOUTH_REG,6,buf);
    if(res==0)
    {
        *gx=((u16)buf[0]<<8)|buf[1];  
        *gy=((u16)buf[2]<<8)|buf[3];  
        *gz=((u16)buf[4]<<8)|buf[5];
    } 	
    return res;
}

//得到加速度值(原始值)
//ax,ay,az:陀螺仪x,y,z轴的原始读数(带符号)
//返回值:0,成功
//    其他,错误代码
u8 MPU_Get_Accelerometer(short *ax,short *ay,short *az)
{
    u8 buf[6],res;  
    res=MPU_Read_Len(MPU_ADDR,MPU_ACCEL_XOUTH_REG,6,buf);
    if(res==0)
    {
        *ax=((u16)buf[0]<<8)|buf[1];  
        *ay=((u16)buf[2]<<8)|buf[3];  
        *az=((u16)buf[4]<<8)|buf[5];
    } 	
    return res;;
}

//IIC写一个字节 
//reg:		寄存器地址
//data:		数据
//返回值:	0,正常
//    		其他,错误代码
u8 MPU_Write_Byte(u8 reg,u8 data)
{
    MPU_IIC_Start();
    MPU_IIC_Send_Byte((MPU_ADDR<<1)|0);//发送器件地址+写命令	
    if(MPU_IIC_Wait_Ack())	//等待应答
    {
        MPU_IIC_Stop();	
        return 1;		
    }
    MPU_IIC_Send_Byte(reg);	//写寄存器地址
    MPU_IIC_Wait_Ack();	//等待应答 
    MPU_IIC_Send_Byte(data);//发送数据
    if(MPU_IIC_Wait_Ack())	//等待ACK
    {
        MPU_IIC_Stop();	 
        return 1;		 
    }		 
    MPU_IIC_Stop();	 
    
    return 0;
}

//IIC读一个字节 
//reg:寄存器地址 
//返回值:读到的数据

u8 MPU_Read_Byte(u8 reg)
{
    u8 res;
    MPU_IIC_Start();
    MPU_IIC_Send_Byte((MPU_ADDR<<1)|0);//发送器件地址+写命令	
    MPU_IIC_Wait_Ack();       //等待应答
    MPU_IIC_Send_Byte(reg);   //写寄存器地址
    MPU_IIC_Wait_Ack();       //等待应答
    MPU_IIC_Start();
    MPU_IIC_Send_Byte((MPU_ADDR<<1)|1);//发送期间地址+读命令
    MPU_IIC_Wait_Ack();       //等待应答
    res=MPU_IIC_Read_Byte(0); //读取数据，发送nACK
    MPU_IIC_Stop();           //产生一个停止条件
    return res;
}

//IIC连续写
//addr:器件地址
//reg: 寄存器地址
//len: 写入长度
//buf: 数据区
//返回值: 0,正常
//  			其他，错误代码
u8 MPU_Write_Len(u8 addr,u8 reg,u8 len,u8 *buf)
{
    u8 i;
    MPU_IIC_Start();
    MPU_IIC_Send_Byte((addr<<1)|0); //发送器件地址+写命令
    if(MPU_IIC_Wait_Ack())              //等待应答
    {
        MPU_IIC_Stop();
        return 1;
    }
    MPU_IIC_Send_Byte(reg);         //写寄存器地址
    MPU_IIC_Wait_Ack();             //等待应答
    for(i=0;i<len;i++)
    {
        MPU_IIC_Send_Byte(buf[i]);  //发送数据
        if(MPU_IIC_Wait_Ack())      //等待ACK
        {
            MPU_IIC_Stop();
            return 1;
        }
    }
    MPU_IIC_Stop();
    return 0;
}
//IIC连续读
//addr:器件地址
//reg:要读取的寄存器地址
//len:要读取得长度
//buf:读取到的数据存储区
//返回值: 0,正常
//				其他，错误代码
u8 MPU_Read_Len(u8 addr,u8 reg,u8 len,u8 *buf)
{
    MPU_IIC_Start();
    MPU_IIC_Send_Byte((addr<<1)|0);//发送器件地址+写命令
    if(MPU_IIC_Wait_Ack())  //等待应答
    {
        MPU_IIC_Stop();
        return 1;
    }
    MPU_IIC_Send_Byte(reg); //写寄存器地址
    MPU_IIC_Wait_Ack();     //等待应答
    MPU_IIC_Start();
    MPU_IIC_Send_Byte((addr<<1)|1);//发送器件地址+读命令
    MPU_IIC_Wait_Ack();     //等待应答
    while(len)
    {
        if(len==1) *buf=MPU_IIC_Read_Byte(0);//读数据，发送nACK
        else *buf=MPU_IIC_Read_Byte(1);//读数据，发送ACK
        len--;
        buf++;
    }
    MPU_IIC_Stop();//产生一个停止条件
    return 0;
}


	
//==========================================================
//	函数名称：	IIC_Delay
//
//	函数功能：	IIC延时函数
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_Delay(u32 n)
{
  
}

//==========================================================
//	函数名称：	MPU_IIC_Init
//
//	函数功能：	初始化IIC
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_Init(void)
{
    P0SEL &= ~0x03;     //设置P0.0、P0.1为普通IO口  
    P0DIR |= 0x03;      //P0.0、P0.1定义为输出
}

//==========================================================
//	函数名称：	MPU_IIC_SCL_OUTPUT
//
//	函数功能：	MPU_IIC时钟线输出模式
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_SCL_OUTPUT(void)
{
    P0SEL &= ~0x02;     //设置P0.1为普通IO口  
    P0DIR |= 0x02;      //P0.1定义为输出
}

//==========================================================
//	函数名称：	MPU_IIC_SCL_INPUT
//
//	函数功能：	MPU_IIC时钟线输入模式
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_SCL_INPUT(void)
{
    P0SEL &= ~0x02;     //设置P0.1为普通IO口  
    P0DIR &= ~0x02;     //按键接在P0.1口上，设P0.1为输入模式 
    P0INP &= ~0x02;     //打开P0.1上拉电阻
}

//==========================================================
//	函数名称：	MPU_IIC_SDA_OUTPUT
//
//	函数功能：	MPU_IIC数据线输出模式 
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_SDA_OUTPUT(void)
{
    P0SEL &= ~0x01;     //设置P0.0为普通IO口  
    P0DIR |= 0x01;      //P0.0定义为输出
}

//==========================================================
//	函数名称：	MPU_IIC_SDA_INPUT
//
//	函数功能：	MPU_IIC数据线输入模式
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_SDA_INPUT(void)
{
    P0SEL &= ~0x01;     //设置P0.0为普通IO口  
    P0DIR &= ~0x01;     //按键接在P0.0口上，设P0.0为输入模式 
    P0INP &= ~0x01;     //打开P0.0上拉电阻
}

//==========================================================
//	函数名称：	MPU_IIC_Start
//
//	函数功能：	MPU_IIC启动时序
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_Start(void)
{
    MPU_IIC_SDA_OUTPUT();	//时钟线输出模式
    MPU_IIC_SCL_OUTPUT();	//数据线输出模式
    MPU_SDA_HIGH();		//拉高数据线
    MPU_SCL_HIGH();		//拉高时钟线
    MPU_SDA_LOW();		//拉低数据线			
    MPU_SCL_LOW();		//拉低时钟线
}

//==========================================================
//	函数名称：	MPU_IIC_Stop
//
//	函数功能：	MPU_IIC停止时序 
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_Stop(void)
{
    MPU_IIC_SDA_OUTPUT();
    MPU_IIC_SCL_OUTPUT();
    MPU_SCL_LOW();
    MPU_SDA_LOW();
    MPU_SCL_HIGH();
    MPU_SDA_HIGH();
}

//==========================================================
//	函数名称：	MPU_IIC_Wait_Ack
//
//	函数功能：	等待应答信号到来
//
//	入口参数：	无
//
//	返回参数：	返回值：1，接收应答失败
//        			0，接收应答成功
//
//	说明：		
//==========================================================
u8 MPU_IIC_Wait_Ack(void)
{
    u8 Time=0;
    MPU_IIC_SCL_OUTPUT();
    MPU_IIC_SDA_OUTPUT();
    MPU_SDA_HIGH();
    MPU_SCL_HIGH();
    MPU_IIC_SDA_INPUT();
    while(MPU_SDA_STATE())
    {
      Time++;
      if(Time>250)
      {
        MPU_IIC_Stop();
        return 1;
      }
    }
    MPU_SCL_LOW();
    return 0;
}



//==========================================================
//	函数名称：	MPU_IIC_Ack
//
//	函数功能：	MPU_IIC ACK应答
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_Ack(void)
{
    MPU_IIC_SCL_OUTPUT();
    MPU_SCL_LOW();
    MPU_IIC_SDA_OUTPUT();
    MPU_SDA_LOW();
    MPU_SCL_HIGH();
    MPU_SCL_LOW();
}

//==========================================================
//	函数名称：	MPU_IIC_NAck
//
//	函数功能：	MPU_IIC 无ACK应答
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_NAck(void)
{
    MPU_IIC_SCL_OUTPUT();
    MPU_SCL_LOW();
    MPU_IIC_SDA_OUTPUT();
    MPU_SDA_HIGH();
    MPU_SCL_HIGH();
    MPU_SCL_LOW();
}

//==========================================================
//	函数名称：	MPU_IIC_Read_Byte
//
//	函数功能：	MPU_IIC 读取数据
//
//	入口参数：	ack:是否发送ACK
//
//	返回参数：	无
//
//	说明：		
//==========================================================
u8 MPU_IIC_Read_Byte(u8 ack)
{
    u8 i,receive=0;
    MPU_IIC_SDA_INPUT();
    MPU_IIC_SCL_OUTPUT();
    for(i=0;i<8;i++)
    {
        MPU_SCL_LOW();
        MPU_SCL_HIGH();
        receive<<=1;
        if(MPU_SDA_STATE())receive++;
    }
    if(!ack) MPU_IIC_NAck();
    else MPU_IIC_Ack();
    return receive;
}


//==========================================================
//	函数名称：	MPU_Write_IIC_Byte
//
//	函数功能：	MPU_IIC 写入数据
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
u8 MPU_Write_IIC_Byte(u8 byte)
{
    u8 i, ack;

    MPU_IIC_SCL_OUTPUT();
    MPU_IIC_SDA_OUTPUT();		//设置为输出模式
    
    for(i = 0; i < 8; i++)
    {
        if(byte & 0x80)         //一次读取最高位 发送数据
        {
            MPU_SDA_HIGH();
        }
        else 
        {
            MPU_SDA_LOW();
        }
        
        MPU_SCL_HIGH();  		//时钟线拉高
        MPU_SCL_LOW();   		//时钟线拉低
        
        byte <<= 1;
    }

    MPU_IIC_SDA_INPUT();  	        //数据线输入模式
    
    MPU_SCL_HIGH();			//时钟线拉高
    
    if(MPU_Bit_SET == MPU_SDA_STATE())  //如果接受到数据线高信号  ACK错误
    {
        ack = MPU_ACK_ERROR;
    }
    else
    {
        ack = MPU_ACK_OK;
    }
    
    MPU_SCL_LOW();          //拉低时钟线

    MPU_IIC_SDA_OUTPUT();	

    MPU_SDA_HIGH();		//拉高数据线
    
    return (ack);
}



//==========================================================
//	函数名称：	MPU_IIC_Send_Byte
//
//	函数功能：	MPU_IIC 写入数据
//
//	入口参数：	txd:写入数据
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void MPU_IIC_Send_Byte(u8 txd)
{
    u8 t;
    MPU_IIC_SCL_OUTPUT();
    MPU_IIC_SDA_OUTPUT();
    MPU_SCL_LOW();
    for(t=0;t<8;t++)
    {
        if(txd & 0x80)
        {
            MPU_SDA_HIGH();
        }
        else 
        {
            MPU_SDA_LOW();
        }
        
        MPU_SCL_HIGH();
        MPU_SCL_LOW();
        txd<<=1;
    }
}

