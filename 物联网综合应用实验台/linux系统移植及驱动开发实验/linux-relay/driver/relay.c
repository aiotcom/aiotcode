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


#define PA2_GPIO_NBR                  26
unsigned int *PA2_MUX;
unsigned int *PA2_GPIO_GDIR;
unsigned int *PA2_GPIO_DR;

#define PA3_GPIO_NBR                  27
unsigned int *PA3_MUX;
unsigned int *PA3_GPIO_GDIR;
unsigned int *PA3_GPIO_DR;

#define RELAY_MAGIC 'k'
#define IOCTRL_CMD_RELAY_1 _IOW(RELAY_MAGIC, 1, int)
#define IOCTRL_CMD_RELAY_2 _IOW(RELAY_MAGIC, 2, int)

void imx6_gpio_mode(unsigned int* padd)
{
	writel(0x05,padd);		
}
void imx6_gpio_out(unsigned int *padd,unsigned int pos)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg |= 1<<pos;
	writel(tempreg,padd);
}
void imx6_gpio_in(unsigned int *padd,unsigned int pos)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg &= ~(1<<pos);
	writel(tempreg,padd);
}
#define PU_47K_OHM 0x01
void imx6_gpio_pupd(unsigned int *padd,uint8_t mode)
{
	int tempreg;
	tempreg  = readl(padd);
/* */	tempreg &= ~(0x3<<14);
	tempreg |= mode<<14;
	printk("tempreg=%d\r\n",tempreg);
	writel(tempreg,padd);
	tempreg  = readl(padd); 
	printk("=%x",tempreg);
}
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
int imx6_gpio_read(unsigned int *padd,unsigned int pos)
{
	int tempreg;
	tempreg  = readl(padd);
	return (tempreg &(1<<pos))?1:0;
}
static void spi_init(void)
{
	PA2_MUX          =   (unsigned int*)ioremap(0x20e016c,4);
	PA2_GPIO_GDIR    =   (unsigned int*)ioremap(0x20A4004,4);
	PA2_GPIO_DR      =   (unsigned int*)ioremap(0x20A4000,4);

	PA3_MUX         = 	(unsigned int*)ioremap(0x20e0170,4);
	PA3_GPIO_GDIR   = 	(unsigned int*)ioremap(0x20A4004,4);
	PA3_GPIO_DR     = 	(unsigned int*)ioremap(0x20A4000,4);

	imx6_gpio_mode(PA2_MUX);
	imx6_gpio_mode(PA3_MUX);	
	
	imx6_gpio_out(PA2_GPIO_GDIR,PA2_GPIO_NBR);
	imx6_gpio_out(PA3_GPIO_GDIR,PA3_GPIO_NBR);

	imx6_gpio_write(PA2_GPIO_DR,PA2_GPIO_NBR,0);
	imx6_gpio_write(PA3_GPIO_DR,PA3_GPIO_NBR,0);	
}
/*************************************************/
static volatile int key_value;//按键值
static int key_major = 0;     //
static int key_minor = 0; 
/* 等待队列: 
 * 当没有按键被按下时，如果有进程调用key_read函数，
 * 它将休眠
 */
static DECLARE_WAIT_QUEUE_HEAD(key_waitq);

/*内核定时器*/
//static struct timer_list key_timer;

#define KEY_TIMER_DELAY    HZ/50   /*20ms*/

/* 事件标志, 有键按下时将它置1，key_read将它清0 */
static volatile int ev_press = 0;
/* 应用程序对设备文件/dev/key执行open(...)时，
 * 就会调用key_open函数
 */
static int key_open(struct inode *inode, struct file *file)
{	
	return 0;
}

/* 应用程序对设备文件/dev/key执行close(...)时，
 * 就会调用key_close函数
 */
static int key_close(struct inode *inode, struct file *file)
{
    return 0;
}

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
		case IOCTRL_CMD_RELAY_1:
			imx6_gpio_write(PA3_GPIO_DR,PA3_GPIO_NBR,data?1:0);
			//printk("relay 1\r\n");
			break;
		case IOCTRL_CMD_RELAY_2:
			imx6_gpio_write(PA2_GPIO_DR,PA2_GPIO_NBR,data?1:0);
			//printk("relay 2\r\n");
			break;
	}
	return 0;
}
/* 应用程序对设备文件/dev/key执行read(...)时，会造成阻塞
 * 就会调用key_read函数
 */
static int key_read(struct file *filp, char __user *buff,size_t count, loff_t *offp)
{
	return 0;
}
static int key_write(struct file *filp, const char __user *buff, size_t count, loff_t *offp)
{
	return 0;
}
/**************************************************
* 当用户程序调用select函数时，本函数被调用
* 如果有按键数据，则select函数会立刻返回
* 如果没有按键数据，本函数使用poll_wait等待
**************************************************/
static unsigned int key_poll(struct file *file,
        			 struct poll_table_struct *wait)
{
	unsigned int mask = 0;
    	poll_wait(file, &key_waitq, wait);
    	if (ev_press)
        	mask |= POLLIN | POLLRDNORM;
    	return mask;
}


/* 这个结构是字符设备驱动程序的核心
 * 当应用程序操作设备文件时所调用的open、read、write等函数，
 * 最终会调用这个结构中的对应函数
 */
static struct file_operations key_fops = {
    .owner   =   THIS_MODULE,    /* 这是一个宏，指向编译模块时自动创建的__this_module变量 */
    .open    =   key_open,
    .release =   key_close, 
    .read    =   key_read,
	.write   =   key_write,
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
#define SPI_BASE_REG_ADDR    0x020A4000

static int __init button_init(void)
{
	int result;
	dev_t devno;
	 
	/* Figure out our device number. */
	result    = alloc_chrdev_region(&devno, 0, 1, "relay");
	key_major = MAJOR(devno);
	key_minor = MINOR(devno);
	printk("relay device installed, with major %d minor %d\r\n", key_major,key_minor);	
	if (devno < 0) {
		printk(KERN_WARNING "relay: unable to get major %d\n", key_major);
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
static void __exit button_cleanup(void)
{
	cdev_del(&key_cdev);
	unregister_chrdev_region(MKDEV(key_major, 0), 1);
	//del_timer_sync(&key_timer);
	printk("SHT20 device uninstalled\n");
}

/* 这两行指定驱动程序的初始化函数和卸载函数 */
module_init(button_init);
module_exit(button_cleanup);

/* 描述驱动程序的一些信息，不是必须的 */
MODULE_AUTHOR("Hanson he");             // 驱动程序的作者
MODULE_DESCRIPTION("SHT20 Device Driver");   // 一些描述信息
MODULE_LICENSE("GPL");                              // 遵循的协议

