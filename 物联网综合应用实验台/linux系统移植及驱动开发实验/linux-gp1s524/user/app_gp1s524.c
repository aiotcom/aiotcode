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
int gp1s524_fd;
int main(void)
{
	unsigned char buf[2];
	/*打开键盘设备文件*/
	gp1s524_fd = open("/dev/gp1s524", O_RDWR);
	if (gp1s524_fd < 0) {
		perror("**/dev/gp1s524_fd\r\n");
		exit(1);
	}
	msleep(1000);
	for (;;) 
	{
		msleep(100);
		read(gp1s524_fd,buf,1);	
		printf("signal=%d\r\n",buf[0]);
	}
	/*关闭设备文件句柄*/
	close(gp1s524_fd);
	return 0;
}
