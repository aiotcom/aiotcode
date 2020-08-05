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
int pt333_fd;
int main(void)
{
	unsigned char buf[2];
	/*打开键盘设备文件*/
	pt333_fd = open("/dev/pt333", O_RDWR);
	if (pt333_fd < 0) {
		perror("**/dev/pt333\r\n");
		exit(1);
	}
	msleep(1000);
	for (;;) 
	{
		msleep(1000);
		read(pt333_fd,buf,2);	
		printf(">>>flame_sensor 1=%d\r\n   flame_sensor 2=%d\r\n",buf[0],buf[1]);
	}
	/*关闭设备文件句柄*/
	close(pt333_fd);
	return 0;
}
