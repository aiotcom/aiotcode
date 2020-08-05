/*forlinx serial port test*/
#include <termios.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <sys/stat.h>  
  

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <RS485/RS485.h>
#include <signal.h>
#define msleep(n) usleep(n*1000)
typedef struct{
	int cmd;
	char arg;
}_cmd;
_cmd send_mp3_cmd,send_lcd_cmd;
volatile	int fd;
char* dev   = NULL;
enum{ID_EQ,ID_NQ};
pthread_mutex_t mut;
int nread,retval;
unsigned char msg[14];
struct timeval timeout={0,100};
int piped[2];
volatile	pthread_t thread,input_thread; 
unsigned char id_storage[21]={0,0,0,0},num_id=0;

FILE *fp=NULL;
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
		if(send_mp3_cmd.cmd){			
			Rs485_Send(fd,Addr_Linux,Addr_MP3,send_mp3_cmd.cmd,1,&send_mp3_cmd.arg);
			send_mp3_cmd.cmd = 0;			
		}
		if(send_lcd_cmd.cmd){			
			Rs485_Send(fd,Addr_Linux,Addr_LCD,send_lcd_cmd.cmd,1,&send_lcd_cmd.arg);
			send_lcd_cmd.cmd = 0;			
		}		
		else{
			Rs485_Send(fd,Addr_Linux,Addr_LF_RFID,LF_RFID_All,0,(void*)0);		
			state = 1;
		}
		msleep(200);//延时10ms	
	}
	else{
		/*最多读两百个字节，nread是实验返回的字节数据，多数情况下通信字节数不会超过200*/
		if((nread=read(fd,msg,200))>0){
			ptr = msg;
			while(nread--){
				Rs485_Receive(*(ptr++));
			}
		}
		
		if((!DataHandling_485(Addr_Linux))&&(Rx_Stack.Command==LF_RFID_ID)){
			write(piped[1],&Rx_Stack.Data[0],4);
			//printf("get sht20 data \r\n");
			//printf("%d,%d,%d,%d\r\n",Rx_Stack.Data[0],Rx_Stack.Data[1],Rx_Stack.Data[2],Rx_Stack.Data[3]);
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
	while(1)
	{
		read_485();
	}
    pthread_exit(NULL);
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
void* input_cmd(void* pdata)  
{
	int i,tmp;
	pdata = pdata;
	unsigned char buf[32];
	while(1)
	{
		scanf("%s",buf);
		if(!num_id){
			printf("please recruit card ID\r\n");
		}
		if(strstr((const char*)buf,(const char*)"REQ")){
			for(i=0;i<num_id;i++){
				printf("[%d],%02X-%02X-%02X-%02X\r\n",i, \
				id_storage[i*4+1],id_storage[i*4+2],id_storage[i*4+3],id_storage[i*4+4]);
			}
		}
		if(strstr((const char*)buf,(const char*)"del")){
			tmp = buf[3] - 0x30;
			if(num_id){
				if(tmp == num_id){
					num_id--;
				}
				else{
					for(i=tmp;i<(num_id-1);i++){
						id_storage[i*4+1]  = id_storage[(i+1)*4+1];
						id_storage[i*4+2]  = id_storage[(i+1)*4+2];
						id_storage[i*4+3]  = id_storage[(i+1)*4+3];
						id_storage[i*4+4]  = id_storage[(i+1)*4+4];						
					}
					num_id--;
					for(i=0;i<num_id;i++){
						printf("[%d],%02X-%02X-%02X-%02X\r\n",i, \
						id_storage[i*4+1],id_storage[i*4+2],id_storage[i*4+3],id_storage[i*4+4]);
					}
				}
			}
		}			
	}
    pthread_exit(NULL);
}
//==========================================================
//	函数名称：	void write_num_id(uint8_t n)
//
//	函数功能：	主函数
//
//	入口参数：	@int argc,参数个数，@char *argv[]，参数的指针数据
//
//	返回参数：	无
//
//	说明：		
//========================================================== 
void write_num_id(uint8_t n)
{
	id_storage[0] = n;
	num_id = n;	
}
//==========================================================
//	函数名称：	uint8_t MatchId(uint8_t *id)
//
//	函数功能：	通过485总线读数据
//
//	入口参数：	延时的毫秒数
//
//	返回参数：	无
//
//	说明：		
//==========================================================
uint8_t has_this_id(uint8_t *id)
{
    uint8_t i = 0,j = 1,ret = ID_NQ;
	if(!num_id){
		return ID_NQ;
	}
    for(i=0;i<num_id;i++){
        if(memcmp((const char*)&id_storage[j],(const char*)id,4)==0){
            ret = ID_EQ;
            break;
        }
		j += 4;
    }   
    return ret;
} 
//==========================================================
//	函数名称：	void write_id(uint8_t *id)
//
//	函数功能：	主函数
//
//	入口参数：	@int argc,参数个数，@char *argv[]，参数的指针数据
//
//	返回参数：	无
//
//	说明：		
//========================================================== 
unsigned long get_file_size(const char *path)  
{  
    unsigned long filesize = -1;      
    struct stat statbuff;  
    if(stat(path, &statbuff) < 0){  
        return filesize;  
    }else{  
        filesize = statbuff.st_size;  
    }  
    return filesize;  
}
//==========================================================
//	函数名称：	void write_id(uint8_t *id)
//
//	函数功能：	主函数
//
//	入口参数：	@int argc,参数个数，@char *argv[]，参数的指针数据
//
//	返回参数：	无
//
//	说明：		
//========================================================== 
void write_id(uint8_t *id)
{
	unsigned int num,i;
	num    = id_storage[0]+1;	
	write_num_id(num);
	fp=fopen("recruit.txt","w+");
	memcpy((void*)&id_storage[1+(num-1)*4],(const void*)id,4);
	fwrite(id_storage,num*4+1,1,fp);
	fclose(fp);	
	
	fp=fopen("recruit.txt","r");
	if(fp==NULL){
		printf("open recruit.txt error\r\n");
		exit(0);
	}	
#if	0 //调试使用
	fread(&num_id,1,1,fp);//读出有多少个ID在保存中
	printf("num_id=%d\r\n",num_id);
	
	fread(&id_storage[1],num_id*4,1,fp);//读出ID及ID数量
	printf("**len = %d,id=0x%02x %02x %02x %02x\r\n",id_storage[0],id_storage[1],id_storage[2],id_storage[3],id_storage[4]);
	fclose(fp);	
#endif
	for(i=0;i<(num_id*4+1);i++){
		printf("%02X ",id_storage[i]);
	}	
	printf("\r\n");
}
 //==========================================================
//	函数名称：	int main(int argc,char *argv[])
//
//	函数功能：	主函数
//
//	入口参数：	@int argc,参数个数，@char *argv[]，参数的指针数据
//
//	返回参数：	无
//
//	说明：		
//========================================================== 
int main(int argc,char *argv[])
{
	char *dev ="/dev/ttymxc1"; 
	char pre_id[32],temp_buf[32];
	char recruit_id[10][5],nbr_of_id;
	char *cptr;
	int recruit = 0,rsize,allow = 0;
	int i=0;

	Rs485_Init();	
	cptr = argv[1];
	if(cptr != NULL){
		if(!memcmp((const void*)cptr,(const void*)"recruit",strlen("recruit"))){
			recruit = 1;		
			fp=fopen("recruit.txt","w");
			if(fp == NULL){
				printf("create recruit.txt error\r\n");
				exit(0);
			}

			num_id = 0;
			fread(&num_id,1,1,fp);
			if(num_id){
				fread(&id_storage[0],num_id*4+1,1,fp);//读出ID及ID数量
				printf("recruit:len = %d,id=0x%02x %02x %02x %02x\r\n",id_storage[0],id_storage[1],id_storage[2],id_storage[3],id_storage[4]);
				fclose(fp);	
			}
		}
		else if(!memcmp((const void*)cptr,(const void*)"run",strlen("run"))){
			printf("run\r\n");
			fp=fopen("recruit.txt","r");
			if(fp == NULL){
				printf("open recruit.txt error\r\n");
				exit(0);
			}	
			
			num_id = 0;
			fread(&num_id,1,1,fp);
			id_storage[0] = num_id;
			if(num_id){
				fread(&id_storage[1],num_id*4+1,1,fp);//读出ID及ID数量
				fclose(fp);	
				for(char i=0;i<(num_id*4+1);i++){
					printf("%02X ",id_storage[i]);
				}
			}		
		}		
	}
	else{
		printf("please input right argment!!!\r\n");
		exit(0);
	}
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
	
	printf("\nWelcome to ,Ctrl + 'c' to stop.\n\n");
 
	if(pthread_create((pthread_t*)&thread, NULL, read_via_rs485, (void*)0) != 0){
		printf("creat thread failure\r\n");
	}
	if(pthread_create((pthread_t*)&input_thread, NULL, input_cmd, (void*)0) != 0){
		printf("creat input_thread failure\r\n");
	}	
  	while(1)
  	{ 
		read(piped[0],temp_buf,4);		
		if(recruit){//录入
			if(memcmp((const void*)pre_id,(const void*)temp_buf,4)){//不相同的打印出来						
				if(temp_buf[0]||temp_buf[1]||temp_buf[2]||temp_buf[3]){//不能全是0
					printf("ID=0x%02x %02x %02x %02x\r\n",temp_buf[0],temp_buf[1],temp_buf[2],temp_buf[3]);
					if(has_this_id(temp_buf) == ID_NQ){						
						write_id(temp_buf);
					}
					else{
						printf("already have\r\n");
					}	
				}
				memcpy((void*)pre_id,(const void*)temp_buf,4);
			};
		}
		else{//正常工作
			if(memcmp((const void*)pre_id,(const void*)temp_buf,4)){//避免警告信息、警告指令重复执行
				if(temp_buf[0]||temp_buf[1]||temp_buf[2]||temp_buf[3]){//不能全是0
					if(has_this_id(temp_buf) == ID_NQ){
						printf("bad man\r\n");
						send_mp3_cmd.cmd = MP3_Target;
						send_mp3_cmd.arg = 2;				
					}
					else{
						printf("good man\r\n");
						send_mp3_cmd.cmd = MP3_Target;
						send_mp3_cmd.arg = 1;						
					}
				}				
				memcpy((void*)pre_id,(const void*)temp_buf,4);
			}
		}		
	}
}






