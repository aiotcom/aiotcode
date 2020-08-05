/*********************************************************************************************
#####         上海嵌入式家园-开发板商城         #####
#####                    www.embedclub.com                        #####
#####             http://embedclub.taobao.com               #####

* File：		poll_key_drv.c
* Author:		Hanson
* Desc：	one key scan (with polling method) device driver 
* History:	May 16th 2011
*********************************************************************************************/

#include <linux/errno.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/input.h>
#include <linux/init.h>
#include <linux/serio.h>
#include <linux/delay.h>
#include <linux/clk.h>
#include <linux/wait.h>
#include <linux/sched.h>
#include <asm/io.h>
#include <asm/irq.h>
#include <asm-generic/io.h>
#include <asm/uaccess.h>
#include <linux/cdev.h>
#include <linux/miscdevice.h>
#include <linux/gpio.h>
#include <asm-generic/poll.h>
#include <linux/poll.h>
#include <../arch/arm/mach-imx/iomux-v3.h>
#include <../arch/arm/mach-imx/hardware.h>
#include <../arch/arm/mach-imx/mx6.h>
#include <linux/platform_device.h>
#include <linux/input.h>
#include <linux/gpio_keys.h>
#include <linux/workqueue.h>
#include <linux/gpio.h>
#include <linux/of.h>
#include <linux/of_platform.h>
#include <linux/of_gpio.h>
#include <linux/of_irq.h>
#include <linux/spinlock.h>

static volatile int spi_value;//按键值
static int drv_major = 0;     //
static int drv_minor = 0; 

#define MOSI_GPIO_NBR                  23
unsigned int *MOSI_MUX;
unsigned int *MOSI_GPIO_GDIR;
unsigned int *MOSI_GPIO_DR;

#define MISO_GPIO_NBR                  24
unsigned int *MISO_MUX;
unsigned int *MISO_GPIO_GDIR;
unsigned int *MISO_GPIO_DR;
unsigned int *MISO_PAD_CTRL;

#define SCK_GPIO_NBR                  27
/*
#define SCK_MUX                       (unsigned int*)ioremap(0x20e01D4,4)
#define SCK_GPIO_GDIR                 (unsigned int*)ioremap(0x20a0004,4)
#define SCK_GPIO_DR                   (unsigned int*)ioremap(0x20a0000,4)
*/
unsigned int *SCK_MUX;
unsigned int *SCK_GPIO_GDIR;
unsigned int *SCK_GPIO_DR;

#define CS_GPIO_NBR                  25
/*
#define CS_MUX                       (unsigned int*)ioremap(0x20e01D8,4)
#define CS_GPIO_GDIR                 (unsigned int*)ioremap(0x20A0004,4)
#define CS_GPIO_DR                   (unsigned int*)ioremap(0x20A0000,4)
*/

unsigned int *CS_MUX;
unsigned int *CS_GPIO_GDIR;
unsigned int *CS_GPIO_DR;

#define RST_GPIO_NBR                  12
/*
#define RST_MUX                       (unsigned int*)ioremap(0x20e0250,4)
#define RST_GPIO_GDIR                 (unsigned int*)ioremap(0x20a8004,4)
#define RST_GPIO_DR                   (unsigned int*)ioremap(0x20a8000,4)
*/
unsigned int *RST_MUX;
unsigned int *RST_GPIO_GDIR;
unsigned int *RST_GPIO_DR;

#define SX1278_MAGIC 'k'
#define IOCTRL_CMD_CS _IOW(SX1278_MAGIC, 1, int)
#define IOCTRL_CMD_RST _IOW(SX1278_MAGIC, 2, int)

#define IOCTRL_CMD_SHOW_HUMI _IOW(SX1278_MAGIC, 3, int)
#define IOCTRL_CMD_SHOW_TEMP _IOW(SX1278_MAGIC, 4, int)
/*
设置PIN为GPIO模式
*/
void imx6_gpio_mode(unsigned int* padd)
{
	writel(0x05,padd);		
}
/*
设置PIN为GPIO 输出模式
*/
void imx6_gpio_out(unsigned int *padd,unsigned int pos)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg |= 1<<pos;
	writel(tempreg,padd);
}
/*
设置PIN为GPIO 输入模式
*/
void imx6_gpio_in(unsigned int *padd,unsigned int pos)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg &= ~(1<<pos);
	writel(tempreg,padd);
}
/*
设置PIN为GPIO 的上下拉模式
*/
void imx6_gpio_pupd(unsigned int *padd,uint8_t mode)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg &= ~(0x3<<14);
	tempreg |= mode<<14;
	//printk("tempreg=%d\r\n",tempreg);
	writel(tempreg,padd);
	tempreg  = readl(padd); 
	//printk("=%x",tempreg);
}
/*
写GPIO PIN 
*/
void imx6_gpio_write(unsigned int *padd,unsigned int pos,unsigned int val)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg &= ~(1<<pos);
	if(val){
		tempreg |= 1<<pos;
	}
	writel(tempreg,padd);	
}
/*
从GPIO PIN读数据
*/
int imx6_gpio_read(unsigned int *padd,unsigned int pos)
{
	int tempreg;
	tempreg  = readl(padd);
	return (tempreg &(1<<pos))?1:0;
}
/*
初始化驱动GPIO
*/
static void spi_init(void)
{
	MOSI_MUX        =   (unsigned int*)ioremap(0x20e013c,4);
	MOSI_GPIO_GDIR  =   (unsigned int*)ioremap(0x20a0004,4);
	MOSI_GPIO_DR    =   (unsigned int*)ioremap(0x20a0000,4);
	
	MISO_MUX        =   (unsigned int*)ioremap(0x20e0140,4);
	MISO_GPIO_GDIR  =   (unsigned int*)ioremap(0x20a0004,4);
	MISO_GPIO_DR    =   (unsigned int*)ioremap(0x20a0000,4);
	MISO_PAD_CTRL   =   (unsigned int*)ioremap(0x20e0510,4);

	SCK_MUX         =	(unsigned int*)ioremap(0x20e01D4,4);
	SCK_GPIO_GDIR   =	(unsigned int*)ioremap(0x20a0004,4);
	SCK_GPIO_DR     =	(unsigned int*)ioremap(0x20a0000,4);

	CS_MUX          =  (unsigned int*)ioremap(0x20e01D8,4);
	CS_GPIO_GDIR    =  (unsigned int*)ioremap(0x20A0004,4);
	CS_GPIO_DR      =  (unsigned int*)ioremap(0x20A0000,4);

	RST_MUX         =  (unsigned int*)ioremap(0x20e0250,4);
	RST_GPIO_GDIR   =  (unsigned int*)ioremap(0x20a8004,4);
	RST_GPIO_DR     =  (unsigned int*)ioremap(0x20a8000,4);	
	
	imx6_gpio_mode(MISO_MUX);
	imx6_gpio_mode(MOSI_MUX);
	imx6_gpio_mode(SCK_MUX);
	imx6_gpio_mode(CS_MUX);
	imx6_gpio_mode(RST_MUX);	
	
	imx6_gpio_in(MISO_GPIO_GDIR,MISO_GPIO_NBR);//MISO
	//imx6_gpio_out(MISO_GPIO_GDIR,MISO_GPIO_NBR);//MISO
	//imx6_gpio_pupd(MISO_PAD_CTRL,0xB0B1);
	writel(0xB0B1,MISO_PAD_CTRL);
	//printk("==%x\r\n",readl(MISO_PAD_CTRL));
	imx6_gpio_out(MOSI_GPIO_GDIR,MOSI_GPIO_NBR);//MOSI
	imx6_gpio_out(SCK_GPIO_GDIR,SCK_GPIO_NBR);//SCK
	imx6_gpio_out(RST_GPIO_GDIR,RST_GPIO_NBR);//RST
	imx6_gpio_out(CS_GPIO_GDIR,CS_GPIO_NBR);//CS	

	imx6_gpio_write(MOSI_GPIO_DR,MOSI_GPIO_NBR,1);
	imx6_gpio_write(CS_GPIO_DR,CS_GPIO_NBR,1);
	imx6_gpio_write(SCK_GPIO_DR,SCK_GPIO_NBR,0);
	imx6_gpio_write(RST_GPIO_DR,RST_GPIO_NBR,1);	
}
/*************************************************/

/* 
应用程序对设备文件/dev/key执行open(...)时，
就会调用key_open函数
 */
static int key_open(struct inode *inode, struct file *file)
{	
	return 0;
}

/* 
应用程序对设备文件/dev/key执行close(...)时，
就会调用key_close函数
 */
static int key_close(struct inode *inode, struct file *file)
{
    return 0;
}
/*
从应用层写入控制命令，
*/
static long cmd_ioctl( struct file *file, 
					unsigned int cmd, 
					unsigned long arg)
{
	unsigned int data;

    if (__get_user(data, (unsigned int __user *)arg)){
        return -EFAULT;
	}
				
	switch(cmd)
	{
		case IOCTRL_CMD_CS:
			imx6_gpio_write(CS_GPIO_DR,CS_GPIO_NBR,data?1:0);
			//printk("cs=%d\r\n",data);
			break;
		case IOCTRL_CMD_RST:
			imx6_gpio_write(RST_GPIO_DR,RST_GPIO_NBR,data?1:0);
			//printk("rst=%d\r\n",data);
			break;
	}
	return 0;
}
/*
SPI的读写原子操作
*/
unsigned char SPI_RW(unsigned char byte)
{
	unsigned char SPI_TxData,k;
	unsigned char RetData=0;
	SPI_TxData = byte;
	for(k=0;k<8;k++){
		if(SPI_TxData&0x80){
			imx6_gpio_write(MOSI_GPIO_DR,MOSI_GPIO_NBR,1);//NRF_MOSI_SET();
		}	   
		else{
			imx6_gpio_write(MOSI_GPIO_DR,MOSI_GPIO_NBR,0);//NRF_MOSI_CLR();
		}
		udelay(100); 				 
		imx6_gpio_write(SCK_GPIO_DR,SCK_GPIO_NBR,1);//NRF_SCK_SET();	   //clk=1
		udelay(100);
		RetData = RetData <<1;	
		if(imx6_gpio_read(MISO_GPIO_DR,MISO_GPIO_NBR)){
			RetData=RetData+0x01;
		}
		imx6_gpio_write(SCK_GPIO_DR,SCK_GPIO_NBR,0);//NRF_SCK_CLR(); 	   //clk=0
		SPI_TxData = SPI_TxData <<1;
	}
	return(RetData);           		  // return read byte
}
/* 
应用程序对设备文件/dev/sx1278执行read(...)时，会造成阻塞
就会调用drv_read函数
 */
static int drv_read(struct file *filp, char __user *buff,size_t count, loff_t *offp)
{
    unsigned long err;
	unsigned char byte;
	//printk("read\r\n");
	//copy_from_user(&byte,buff,1);
	byte = SPI_RW(0xff);
	err = copy_to_user(buff, (const void *)&byte, 1);
    return err ? -EFAULT : 1;
}
/* 
应用程序对设备文件/dev/sx1278执行write(...)时，会造成阻塞
就会调用drv_read函数
 */
static int drv_write(struct file *filp, const char __user *buff, size_t count, loff_t *offp)
{
    unsigned long err;
	unsigned char byte;
	//printk("write\r\n");
	err = copy_from_user(&byte,buff,1);
	//printk("write:byte=%d\r\n",byte);
	SPI_RW(byte);
    return err ? -EFAULT : 1;	
}
/**************************************************
* 当用户程序调用select函数时，本函数被调用
* 如果有按键数据，则select函数会立刻返回
* 如果没有按键数据，本函数使用poll_wait等待
**************************************************/
static unsigned int key_poll(struct file *file,
        			 struct poll_table_struct *wait)
{
	return 1;
}
/* 
这个结构是字符设备驱动程序的核心
当应用程序操作设备文件时所调用的open、read、write等函数，
最终会调用这个结构中的对应函数
 */
static struct file_operations key_fops = {
    .owner   =   THIS_MODULE,    /* 这是一个宏，指向编译模块时自动创建的__this_module变量 */
    .open    =   key_open,
    .release =   key_close, 
    .read    =   drv_read,
	.write   =   drv_write,
    .poll    =   key_poll,
	.unlocked_ioctl   =   cmd_ioctl,
};
/*
 * We export one key device.  There's no need for us to maintain any
 * special housekeeping info, so we just deal with raw cdev.
 */
static struct cdev key_cdev;

/*
 * 执行“insmod key_drv.ko”命令时就会调用这个函数
 */
static int __init rc522_drv_init(void)
{
	int result;
	dev_t devno;
	 
	/* Figure out our device number. */
	result    = alloc_chrdev_region(&devno, 0, 1, "rc522");
	drv_major = MAJOR(devno);
	drv_minor = MINOR(devno);
	printk("device installed, with major %d minor %d\r\n", drv_major,drv_minor);	
	if (devno < 0) {
		printk(KERN_WARNING "unable to get major %d\n", drv_major);
		return result;
	}
																									 
	/* Now set up cdev. */

	cdev_init(&key_cdev, &key_fops);
	key_cdev.owner = THIS_MODULE;
	key_cdev.ops   = &key_fops;
	
	/* Fail gracefully if need be */
	if (cdev_add (&key_cdev, devno, 1)){
		printk (KERN_NOTICE "Error add\r\n");
	}
	spi_init();
    return 0;
}
/*
 * 执行rmmod key_drv.ko”命令时就会调用这个函数 
 */
static void __exit rc522_drv_cleanup(void)
{
	cdev_del(&key_cdev);
	unregister_chrdev_region(MKDEV(drv_major, 0), 1);
	printk("SHT20 device uninstalled\n");
}

/* 这两行指定驱动程序的初始化函数和卸载函数 */
module_init(rc522_drv_init);
module_exit(rc522_drv_cleanup);

/* 描述驱动程序的一些信息，不是必须的 */
MODULE_AUTHOR("Hanson he");             // 驱动程序的作者
MODULE_DESCRIPTION("SHT20 Device Driver");   // 一些描述信息
MODULE_LICENSE("GPL");                              // 遵循的协议

