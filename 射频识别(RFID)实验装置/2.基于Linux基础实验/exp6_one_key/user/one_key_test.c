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

int main(void)
{

	int i;
	int key_fd;
	int key_value[1]={0};

	/*打开键盘设备文件*/
	key_fd = open("/dev/one_key", 0);
	if (key_fd < 0) {
		perror("**open device key");
		exit(1);
	}
	for (;;) 
	{
		/*能够读取到数据*/
		if(read(key_fd, (void*)&key_value[0], sizeof(key_value)))
		{
			//printf("key_value=0x%x\r\n",key_value[0]);
			printf("key pressed\r\n");
		}
	}
	/*关闭设备文件句柄*/
	close(key_fd);
	return 0;
}
