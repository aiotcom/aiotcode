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
#define msleep(n) usleep(n*1000)
#define LED_MAGIC 'k'
#define IOCTRL_CMD_READ_TEMP _IOW(LED_MAGIC, 1, int)
#define IOCTRL_CMD_READ_HUMI _IOW(LED_MAGIC, 2, int)
#define IOCTRL_CMD_SHOW_HUMI _IOW(LED_MAGIC, 3, int)
#define IOCTRL_CMD_SHOW_TEMP _IOW(LED_MAGIC, 4, int)
int main(void)
{

	int i;
	int sht20_fd;
	int key_value=0;
	int temp,humi;
	int contrl = 0;
	/*打开键盘设备文件*/
	sht20_fd = open("/dev/sht20", 0);
	if (sht20_fd < 0) {
		perror("**/dev/sht20\r\n");
		exit(1);
	}
	for (;;) 
	{
		msleep(1000);
		ioctl(sht20_fd, IOCTRL_CMD_READ_TEMP, &contrl); 
		/*能够读取到数据*/
		if(read(sht20_fd, (void*)&key_value, sizeof(key_value)))
		{
			temp = ((key_value) * 0.00268127) - 46.85;  //转换所得到的数据		
			printf("temp=%d\r\n",temp);
			contrl = temp;
			ioctl(sht20_fd, IOCTRL_CMD_SHOW_TEMP, &contrl); //数据写到数码管
		}
		msleep(1000);
		ioctl(sht20_fd, IOCTRL_CMD_READ_HUMI, &contrl); 		
		if(read(sht20_fd, (void*)&key_value, sizeof(key_value)))
		{
			//printf("humi raw=%x\r\n",key_value);
			humi = ((float)key_value * 0.00190735) - 6;  //转换所得到的数据		
			printf("humi=%d\r\n",humi);
			contrl = humi;
			ioctl(sht20_fd, IOCTRL_CMD_SHOW_HUMI, &contrl); //数据写到数码管
		}		
	}
	/*关闭设备文件句柄*/
	close(sht20_fd);
	return 0;
}
