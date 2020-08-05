/*********************************************************************************************
#####         上海嵌入式家园-开发板商城         #####
#####                    www.embedclub.com                        #####
#####             http://embedclub.taobao.com               #####

* File：		key_test.c
* Author:		Hanson
* Desc：	a test for one key scan (with polling method) device driver 
* History:	May 16th 2011
*********************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/select.h>
#include <sys/time.h>
#include <errno.h>
#include "string.h"
#define msleep(n) usleep(n*1000)
const int arg_0 = 0,arg_1 = 1;
#define CHB_MAGIC 'k'
#define IOCTRL_CMD_P3A _IOW(CHB_MAGIC, 1, int)
#define IOCTRL_CMD_P4A _IOW(CHB_MAGIC, 2, int)
#define IOCTRL_CMD_P5A _IOW(CHB_MAGIC, 3, int)
#define IOCTRL_CMD_P6  _IOW(CHB_MAGIC, 4, int)
#define IOCTRL_CMD_DISP_P3A _IOW(CHB_MAGIC, 5, int)
#define IOCTRL_CMD_DISP_P4A _IOW(CHB_MAGIC, 6, int)
#define IOCTRL_CMD_DISP_P5A _IOW(CHB_MAGIC, 7, int)
#define IOCTRL_CMD_DISP_P6  _IOW(CHB_MAGIC, 8, int)
int chb_fd;
int main(void)
{
	unsigned int time,distance;
	/*打开键盘设备文件*/
	chb_fd = open("/dev/chao_sheng_bo", O_RDWR);
	if (chb_fd < 0) {
		perror("**/dev/chao_sheng_bo\r\n");
		exit(1);
	}
	
	for (;;) 
	{
		msleep(1000);
		printf("\r\n**********************start************************\r\n");
//*******************************************************************		
		ioctl(chb_fd, IOCTRL_CMD_P3A, &arg_0);
		if(read(chb_fd,(void*)&time,4)>0){
			if(time != 0xffffffff){
				distance = (int)((time/2)*0.340);
				printf(">>>P3:=%d mm\r\n",distance);
				ioctl(chb_fd, IOCTRL_CMD_DISP_P3A, &distance);
			}
			else{
				printf(">>>P3:error\r\n");
			}			
		}
//*******************************************************************	
//*******************************************************************	
		msleep(2000);		
		ioctl(chb_fd, IOCTRL_CMD_P4A, &arg_0);
		if(read(chb_fd,(void*)&time,4)){
			if(time != 0xffffffff){
				distance = (int)((time/2)*0.340);
				printf(">>>P4:=%d mm\r\n",distance);
				ioctl(chb_fd, IOCTRL_CMD_DISP_P4A, &distance);
			}
			else{
				printf(">>>P4:error\r\n");
			}			
		}
//*******************************************************************	
//*******************************************************************			
		msleep(2000);		
		ioctl(chb_fd, IOCTRL_CMD_P5A, &arg_0);
		if(read(chb_fd,(void*)&time,4)){
			if(time != 0xffffffff){
				distance = (int)((time/2)*0.340);
				printf(">>>P5:=%d mm\r\n",distance);
				ioctl(chb_fd, IOCTRL_CMD_DISP_P5A, &distance);
			}
			else{
				printf(">>>P5:error\r\n");
			}
		}
//*******************************************************************	
//*******************************************************************			
		msleep(2000);		
		ioctl(chb_fd, IOCTRL_CMD_P6, &arg_0);
		if(read(chb_fd,(void*)&time,4)){
			if(time != 0xffffffff){
				distance = (int)((time/2)*0.340);
				printf(">>>P6:=%d mm\r\n",distance);
				ioctl(chb_fd, IOCTRL_CMD_DISP_P6, &distance);
			}
			else{
				printf(">>>P6:error\r\n");
			}
		}
//*******************************************************************			
	}
	/*关闭设备文件句柄*/
	close(chb_fd);
	return 0;
}
