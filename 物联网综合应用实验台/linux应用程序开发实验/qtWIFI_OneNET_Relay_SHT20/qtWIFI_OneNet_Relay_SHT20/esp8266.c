#include <termios.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <semaphore.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <signal.h>
#include "esp8266.h"
#define msleep(n) usleep(n*1000)
extern volatile	int fd;
unsigned char cmdindex = 0;
unsigned char receive_buffer[100];
/*
static void send_at_cmd(unsigned char* cmd,unsigned char len)
{
}
int esp8266_init(void)
{     
}
int esp8266_receive(unsigned char *buf)
{
}
void esp8266_send(unsigned char *buf,int len)
{
}*/
//==========================================================
//	函数名称：	static speed_t getBaudrate(int baudrate)
//
//	函数功能：	获取波特率设置的值
//
//	入口参数：	@ int baudrate:期望的波特率
//
//	返回参数：	无
//
//	说明：
//==========================================================
static speed_t getBaudrate(int baudrate)
{
    switch(baudrate) {
    case 0: return B0;
    case 50: return B50;
    case 75: return B75;
    case 110: return B110;
    case 134: return B134;
    case 150: return B150;
    case 200: return B200;
    case 300: return B300;
    case 600: return B600;
    case 1200: return B1200;
    case 1800: return B1800;
    case 2400: return B2400;
    case 4800: return B4800;
    case 9600: return B9600;
    case 19200: return B19200;
    case 38400: return B38400;
    case 57600: return B57600;
    case 115200: return B115200;
    case 230400: return B230400;
    case 460800: return B460800;
    case 500000: return B500000;
    case 576000: return B576000;
    case 921600: return B921600;
    case 1000000: return B1000000;
    case 1152000: return B1152000;
    case 1500000: return B1500000;
    case 2000000: return B2000000;
    case 2500000: return B2500000;
    case 3000000: return B3000000;
    case 3500000: return B3500000;
    case 4000000: return B4000000;
    default: return -1;
    }
}
//==========================================================
//	函数名称：	int OpenDev(char *Dev)
//
//	函数功能：	打开串口设备并设备相关的参数
//
//	入口参数：	@char *Dev:串口设备的路径（如：/dev/ttymxc3）
//
//	返回参数：	无
//
//	说明：
//==========================================================
int esp8266_open(char *Dev,int *fd,int baud)
{
    speed_t speed;

    int i=0;
    int fdt,c=0,num;
    struct termios oldtio,newtio;

    speed = getBaudrate(baud);
    fdt=open(Dev,O_RDWR | O_NONBLOCK| O_NOCTTY | O_NDELAY);
    if(fdt<0){
        printf("error open usart2\r\n");
        perror(Dev);
        exit(1);
    }
    *fd = fdt;
    tcgetattr(fdt,&oldtio);
    bzero(&newtio,sizeof(newtio));
    newtio.c_cflag = speed|CS8|CLOCAL|CREAD;
    newtio.c_iflag = IGNPAR;
    newtio.c_oflag = 0;
    tcflush(fdt,TCIFLUSH);
    tcsetattr(fdt,TCSANOW,&newtio);
    tcgetattr(fdt,&oldtio);
    return fdt;
}


