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
#include <RC522/RC522.h>
#define msleep(n) usleep(n*1000)

int main(void)
{

	int i;
	unsigned char id[5];
	unsigned char IRQ_RegValue;
	int key_value=0;
	int temp,humi;
	int contrl = 0;

	RC522_Init();
	for (;;) 
	{
		msleep(1000);
		if(IC_Card_Search(id)){
			printf("ID=%02X,%02X,%02X,%02X\r\n",id[0],id[1],id[2],id[3]);
		}
	}
	/*关闭设备文件句柄*/
	rc522_close();
	return 0;
}
