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

#define LED_MAGIC 'k'
#define IOCTL_LED_ON _IOW(LED_MAGIC, 1, int)
int main(void)
{
	int i;
	int fd;
	int key_value[1];
	int contrl = 0;
	
	/*打开LED设备文件*/
	fd = open("/dev/one_led", 0);
	if (fd < 0) {
		perror("open device key");
		exit(1);
	}
	for (;;) 
	{
		contrl=1;
		ioctl(fd, IOCTL_LED_ON, &contrl);    // 点亮
		sleep(1);
		
		contrl = 0;
		ioctl(fd, IOCTL_LED_ON, &contrl);    // 熄灭
		sleep(1);	
	}
	/*关闭设备文件句柄*/
	close(fd);
	return 0;
}
