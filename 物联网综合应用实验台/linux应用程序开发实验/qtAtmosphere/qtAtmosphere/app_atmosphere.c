#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/select.h>
#include <sys/time.h>
#include <errno.h>
#define msleep(n) usleep(n*1000)

#define DRV_MAGIC 'k'
#define IOCTRL_CMD_READ_ADD _IOW(DRV_MAGIC, 1, int)
#define IOCTRL_CMD_READ_LEN _IOW(DRV_MAGIC, 3, int)

#define ATMOS_DEVICE_ADDR (0x76<<1)
int bme280_fd;
const unsigned char arg_0 = 0,arg_1 = 1;
unsigned  int hum_raw,temp_raw,pres_raw;
signed  int t_fine;
unsigned short dig_T1;
short dig_T2;
short dig_T3;
unsigned short dig_P1;
short dig_P2;
short dig_P3;
short dig_P4;
short dig_P5;
short dig_P6;
short dig_P7;
short dig_P8;
short dig_P9;
char  dig_H1;
short dig_H2;
char  dig_H3;
short dig_H4;
short dig_H5;
char  dig_H6;
unsigned char tmp_read;
void iic_read_num_bytes(unsigned char add,unsigned char *pbuf,unsigned char len)
{
	
	tmp_read = add;
	ioctl(bme280_fd, IOCTRL_CMD_READ_ADD, &tmp_read);
	tmp_read = len;
	ioctl(bme280_fd, IOCTRL_CMD_READ_LEN, &tmp_read);
	read(bme280_fd,pbuf,len);	
}
unsigned char tmp_write[2];
void iic_write_byte(unsigned char add,unsigned char *dst)
{
	int err = 0;
	tmp_write[0] = add;
	tmp_write[1] = *dst;	
	err = write(bme280_fd,&tmp_write[0],2);
	//printf("err=%d\r\n",err);
}
//==========================================================
//	函数名称：	readTrim
//
//	函数功能：	读修正数据
//
//	入口参数：  无
//  返回值  :   无 
//
//	说明：	
//==========================================================
void readTrim(void)
{
    unsigned char data[32];

	iic_read_num_bytes(0X88,&data[0],24);
    iic_read_num_bytes(0xA1,&data[24],1);  
    iic_read_num_bytes(0xE1,&data[25],7);
    
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
//	函数功能：	读出温度、温度、压力
//
//	入口参数：  无
//  返回值  :   无 
//
//	说明：	
//==========================================================
unsigned char data[8];
void readData(unsigned int *pPress,unsigned int *pTemp,unsigned int *pHumi)
{
    
    iic_read_num_bytes(0xF7,&data[0],8);
    
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
//  返回值  :   无 
//
//	说明：	
//==========================================================    
signed  int var1, var2;
unsigned  int P;
unsigned  int calibration_P(signed  int adc_P)
{

    var1 = (((signed  int)t_fine)>>1) - (signed  int)64000;
    var2 = (((var1>>2) * (var1>>2)) >> 11) * ((signed  int)dig_P6);
    var2 = var2 + ((var1*((signed  int)dig_P5))<<1);
    var2 = (var2>>2)+(((signed  int)dig_P4)<<16);
    var1 = (((dig_P3 * (((var1>>2)*(var1>>2)) >> 13)) >>3) + ((((signed  int)dig_P2) * var1)>>1))>>18;
    var1 = ((((32768+var1))*((signed  int)dig_P1))>>15);//8BEE
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
    P = (unsigned  int)((signed  int)P + ((var1 + var2 + dig_P7) >> 4));//17BDC
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
//  返回值  :   无 
//
//	说明：	
//==========================================================
void Atmosphere_Init(int fd)
{
    unsigned char osrs_t = 1;             //Temperature oversampling x 1
    unsigned char osrs_p = 1;             //Pressure oversampling x 1
    unsigned char osrs_h = 1;             //Humidity oversampling x 1
    unsigned char mode = 3;               //Normal mode
    unsigned char t_sb = 5;               //Tstandby 1000ms
    unsigned char filter = 0;             //Filter off 
    unsigned char spi3w_en = 0;           //3-wire SPI Disable

    unsigned char ctrl_meas_reg = (osrs_t << 5) | (osrs_p << 2) | mode;
    unsigned char config_reg    = (t_sb << 5) | (filter << 2) | spi3w_en;
    unsigned char ctrl_hum_reg  = osrs_h; 
   
    bme280_fd = fd;
    iic_write_byte(0xF2,&ctrl_hum_reg);
    iic_write_byte(0xF4,&ctrl_meas_reg);
    iic_write_byte(0xF5,&config_reg);    
    
    readTrim(); //获取修正值
       
}
