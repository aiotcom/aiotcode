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
unsigned char wifi_cmd[][64]={
	{"AT\r\n"},
	{"AT+CWMODE=3\r\n"},//设置模式为AP+STA
	{"AT+CIFSR\r\n"},	//查询IP地址
	{"AT+CWJAP=\"bacheng\",\"f0f0f0f0f0\"\r\n"},//设置SID和PWD连接网络
	{"AT+CIPSTART=\"TCP\",\"183.230.40.40\",1811\r\n"},//设置为TCP协议传输并指定IP和端口号
	{"AT+CIPMODE=1\r\n"},//透传
	{"AT+CIPSEND\r\n"},
	{"*238724#0001#sample*"}		
};
static void send_at_cmd(unsigned char* cmd,unsigned char len)
{
	write(fd,cmd,len);	
}
int esp8266_init(unsigned char *s1,unsigned char *s2,unsigned char *s3)
{     
	static int state = 0;	
	if(state == 0){
		lseek(fd,0,SEEK_SET);
		cmdindex = 0;
		printf("here\r\n");
		sprintf((void*)&wifi_cmd[3][0],"AT+CWJAP=\"%s\",\"%s\"\r\n",s1,s2);
		sprintf((void*)&wifi_cmd[7][0],"%s",s3);
		printf("=%s,=%s\r\n",wifi_cmd[3],wifi_cmd[7]);
		while(1){
			send_at_cmd(&wifi_cmd[cmdindex][0],strlen(wifi_cmd[cmdindex]));
			printf("send %s\r\n",wifi_cmd[cmdindex]);
			msleep(2000);
			memset(receive_buffer,0,200);
			read(fd,receive_buffer,200);
			receive_buffer[199] = 0;
			if(strstr(receive_buffer,"OK")){
				cmdindex++;
			}
			else if(cmdindex == 7){
				cmdindex++;
				break;
			}
		}
		lseek(fd,0,SEEK_SET);
		state = 1;
	}
	return state;	
}

int esp8266_receive(unsigned char *buf)
{
	int nread;
	nread = read(fd,buf,200);
	return nread;
}

void esp8266_send(unsigned char *buf,int len)
{
	send_at_cmd(buf,len);	
}




