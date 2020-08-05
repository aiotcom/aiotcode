/*forlinx serial port test*/
#include <termios.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <RS485/RS485.h>
#include <signal.h>
#define msleep(n) usleep(n*1000)

char test[100]="forlinx uart test.....bz";
volatile	int fd;
char* dev   = NULL;

pthread_mutex_t mut;
int nread,retval;
unsigned char msg[14];
struct timeval timeout={0,100};
int piped[2];
volatile	pthread_t thread; 
enum{
    KEY_0,
    KEY_1,
    KEY_2,
    KEY_3,
    KEY_4,
    KEY_5,
    KEY_6,
    KEY_7,
    KEY_8,
    KEY_9,
    KEY_ENTER,
    KEY_CANNCEL,
    KEY_UP,
    KEY_DOWN,
    KEY_RIGHT,
    KEY_LEFT,
    KEY_NULL=0xff //没有按键按下
};
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
int OpenDev(char *Dev)
{
	speed_t speed;

    int i=0;
    int fdt,c=0,num;
    struct termios oldtio,newtio;

    speed = getBaudrate(115200);
    fdt=open(Dev,O_RDWR | O_NONBLOCK| O_NOCTTY | O_NDELAY);
    if(fdt<0){
        perror(Dev);
        exit(1);
    }
    //save to oldtio
    tcgetattr(fdt,&oldtio);
    //clear newtio
    bzero(&newtio,sizeof(newtio));
    //newtio.c_cflag = speed|CS8|CLOCAL|CREAD|CRTSCTS;
    newtio.c_cflag = speed|CS8|CLOCAL|CREAD;
    newtio.c_iflag = IGNPAR;  
    newtio.c_oflag = 0;
    //printf("newtio.c_cflag=%x\n",newtio.c_cflag);
    tcflush(fdt,TCIFLUSH);  
    tcsetattr(fdt,TCSANOW,&newtio);  
    tcgetattr(fdt,&oldtio);
    //printf("oldtio.c_cflag=%x\n",oldtio.c_cflag);
    return fdt;
}
//==========================================================
//	函数名称：	void read_485(void)  
//
//	函数功能：	读485总线上的数据
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void read_485(void)
{   
	unsigned char *ptr;
	static unsigned int state=0;
	static unsigned int count;
		
	if(state == 0){
		Rs485_Send(fd,Addr_Linux,Addr_Matrixkey,Matrixkey_Get_value,0,(void*)0);		
		state = 1;
		msleep(50);//延时10ms		
	}
	else{
		/*最多读两百个字节，nread是实验返回的字节数据，多数情况下通信字节数不会超过200*/
		if((nread=read(fd,msg,200))>0){
			ptr = msg;
			while(nread--){
				Rs485_Receive(*(ptr++));
			}
		}
		
		if(!DataHandling_485(Addr_Linux)){
			write(piped[1],&Rx_Stack.Command,1);
			//printf("%d\r\n",Rx_Stack.Command);
		}
		state = 0;
	}
}
//==========================================================
//	函数名称：	void* com_read(void* pstatu)  
//
//	函数功能：	通过485总线读数据
//
//	入口参数：	延时的毫秒数
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void* read_via_rs485(void* pdata)  
{
	pdata = pdata;
	while(1){
		read_485();
	}
    pthread_exit(NULL);
}
 //==========================================================
//	函数名称：	vint main(void) 
//
//	函数功能：	主函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//========================================================== 
int main(void)
{
	char *dev ="/dev/ttymxc1"; 
	char buf[12];
	Rs485_Init();
	if(dev==NULL){
		printf("Please input serial device name ,for exmaple /dev/ttymxc1.\n");
		exit(1);
	}
	pipe(piped);
	
	fd = OpenDev(dev);

	if (fd<=0){
		printf("Can't Open Serial Port %s \n",dev);
		exit(0);
	}
	
	printf("\nWelcome to TTYtest! Press Ctrl + 'c' to stop.\n\n");
 
	/*创建485总线数据接收进程*/
	if(pthread_create((pthread_t*)&thread, NULL, read_via_rs485, (void*)0) != 0){
		 printf("creat thread failure\r\n");
	}
	memset((void*)buf,0,12);
  	while(1)
  	{ 
		read(piped[0],buf,1);//阻塞等待
		switch(buf[0])
		{
			case KEY_0:
				printf("key 0 pressed\r\n");
			break;
			case KEY_1:
				printf("key 1 pressed\r\n");
			break;				
			case KEY_2:
				printf("key 2 pressed\r\n");
			break;				
			case KEY_3:
				printf("key 3 pressed\r\n");
			break;
			case KEY_4:
				printf("key 4 pressed\r\n");
			break;				
			case KEY_5:
				printf("key 5 pressed\r\n");
			break;
			case KEY_6:
				printf("key 6 pressed\r\n");
			break;
			case KEY_7:
				printf("key 7 pressed\r\n");
			break;
			case KEY_8:
				printf("key 8 pressed\r\n");
			break;
			case KEY_9:
				printf("key 9 pressed\r\n");
			break;				
			case KEY_ENTER:
				printf("key enter pressed\r\n");
			break;
			case KEY_CANNCEL:
				printf("key canncel pressed\r\n");
			break;
			case KEY_UP:
				printf("key up pressed\r\n");
			break;
			case KEY_DOWN:
				printf("key down pressed\r\n");
			break;
			case KEY_RIGHT:
				printf("key right pressed\r\n");
			break;
			case KEY_LEFT:
				printf("key left pressed\r\n");
			break;			
		}			
	}
}






