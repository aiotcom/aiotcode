/*********************************************************************************************
#####         上海嵌入式家园-开发板商城         #####
#####                    www.embedclub.com                        #####
#####             http://embedclub.taobao.com               #####

* File：		poll_drv_drv.c
* Author:		Hanson
* Desc：	one drv scan (with polling method) device driver 
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
#include <linux/workqueue.h>
#include <linux/gpio.h>
#include <linux/of.h>
#include <linux/of_platform.h>
#include <linux/of_gpio.h>
#include <linux/of_irq.h>
#include <linux/spinlock.h>

/* #define  IOMUXC_SW_MUX_CTL_PAD_GPIO05  (unsigned int*)ioremap(0x20e0230,4)
#define  GPIO1_DR                      (unsigned int*)ioremap(0x209c000,4)
#define  GPIO1_GDIR                    (unsigned int*)ioremap(0x209c004,4) */

unsigned int *IOMUXC_SW_MUX_CTL_PAD_GPIO05;
unsigned int *GPIO1_DR;
unsigned int *GPIO1_GDIR;

#define SDA_GPIO_NBR 23
/* #define SDA_PAD            (unsigned int*)ioremap(0x20e0530,4)
#define SDA_MUX            (unsigned int*)ioremap(0x20e0160,4)
#define SDA_GPIO_GDIR      (unsigned int*)ioremap(0x20a4004,4)
#define SDA_GPIO_DR        (unsigned int*)ioremap(0x20a4000,4) */

unsigned int *SDA_PAD;
unsigned int *SDA_MUX;
unsigned int *SDA_GPIO_GDIR;
unsigned int *SDA_GPIO_DR;

#define SCL_GPIO_NBR 31

/* #define SCL_PAD 		   (unsigned int*)ioremap(0x20e0550,4)
#define SCL_MUX   		   (unsigned int*)ioremap(0x20e0180,4)
#define SCL_GPIO_GDIR      (unsigned int*)ioremap(0x20a4004,4)
#define SCL_GPIO_DR        (unsigned int*)ioremap(0x20a4000,4) */

unsigned int *SCL_PAD;
unsigned int *SCL_MUX;
unsigned int *SCL_GPIO_GDIR;
unsigned int *SCL_GPIO_DR;

#define ATMOS_DEVICE_ADDR (0x76<<1)

static volatile int drv_value;//按键值
static int drv_major = 0;     //
static int drv_minor = 0; 

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
void imx6_gpio_op(unsigned int *padd)
{
	int tempreg;
	tempreg  = readl(padd);
	tempreg |= 1<<11; 
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
void imx6_gpio_pupd(unsigned int *padd,unsigned char mode)
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
void SDA_OUT(void)
{
	imx6_gpio_op(SDA_PAD);//设置成开漏		
	imx6_gpio_out(SDA_GPIO_GDIR,SDA_GPIO_NBR);
}
void SDA_IN(void)
{
	imx6_gpio_in(SDA_GPIO_GDIR,SDA_GPIO_NBR);	
}
void SCL_OUT(void)
{
	imx6_gpio_op(SCL_PAD);//设置成开漏
	imx6_gpio_out(SCL_GPIO_GDIR,SCL_GPIO_NBR);
}
void SCL_IN(void)
{
	imx6_gpio_in(SCL_GPIO_GDIR,SCL_GPIO_NBR);	
}
void IIC_SDA(int val)
{
	imx6_gpio_write(SDA_GPIO_DR,SDA_GPIO_NBR,val?1:0);
}
void IIC_SCL(int val)
{
	imx6_gpio_write(SCL_GPIO_DR,SCL_GPIO_NBR,val?1:0);
}
/*
初始化Io口
*/
void iic_init(void)
{

	IOMUXC_SW_MUX_CTL_PAD_GPIO05 = (unsigned int*)ioremap(0x20e0230,4);
	GPIO1_DR                     = (unsigned int*)ioremap(0x209c000,4);
	GPIO1_GDIR                   = (unsigned int*)ioremap(0x209c004,4);	

	SDA_PAD           = (unsigned int*)ioremap(0x20e0530,4);
	SDA_MUX           = (unsigned int*)ioremap(0x20e0160,4);
	SDA_GPIO_GDIR     = (unsigned int*)ioremap(0x20a4004,4);
	SDA_GPIO_DR       = (unsigned int*)ioremap(0x20a4000,4);

	SCL_PAD 		  =  (unsigned int*)ioremap(0x20e0550,4);
	SCL_MUX   	      =	 (unsigned int*)ioremap(0x20e0180,4);
	SCL_GPIO_GDIR     =  (unsigned int*)ioremap(0x20a4004,4);
	SCL_GPIO_DR       =  (unsigned int*)ioremap(0x20a4000,4);	
	
	imx6_gpio_mode(SDA_MUX);
	imx6_gpio_mode(SCL_MUX);

    imx6_gpio_out(SDA_GPIO_GDIR,SDA_GPIO_NBR);
    imx6_gpio_out(SCL_GPIO_GDIR,SCL_GPIO_NBR);
	imx6_gpio_op(SDA_PAD);//设置成开漏
	imx6_gpio_op(SCL_PAD);//设置成开漏

	imx6_gpio_write(SDA_GPIO_DR,SDA_GPIO_NBR,1);///输出1	
	imx6_gpio_write(SCL_GPIO_DR,SCL_GPIO_NBR,1);//输出1		
}
/*
iic start
*/
void IIC_Start(void)
{
	SDA_OUT();     //sda线输出
	IIC_SDA(1);	
	udelay(30);	
	IIC_SCL(1);
	udelay(50);
 	IIC_SDA(0);//START:when CLK is high,DATA change form high to low 
	udelay(50);
	IIC_SCL(0);//钳住I2C总线，准备发送或接收数据 
}

void IIC_Stop(void)
{
	SDA_OUT();//sda线输出
	IIC_SCL(0);
	udelay(30);	
	IIC_SDA(0);
 	udelay(50);	 
	IIC_SCL(1);//STOP:when CLK is high DATA change form low to high
 	udelay(50);	
	IIC_SDA(1);//发送I2C总线结束信号 						   	
}

unsigned char IIC_Wait_Ack(void)
{
	unsigned char ucErrTime=0;
	SDA_IN();      //SDA设置为输入  
	IIC_SDA(1);udelay(50);	   
	IIC_SCL(1);udelay(50);	 
	while(imx6_gpio_read(SDA_GPIO_DR,SDA_GPIO_NBR))
	{
		ucErrTime++;
		if(ucErrTime>250)
		{
			udelay(5);
			return 1;
		}
	}
	IIC_SCL(0);//时钟输出0 	   
	return 0;  
} 

void IIC_Ack(void)
{
	IIC_SCL(0);
	SDA_OUT();
	IIC_SDA(0);
	udelay(50);
	IIC_SCL(1);
	udelay(50);
	IIC_SCL(0);
}

void IIC_NAck(void)
{
	IIC_SCL(0);
	SDA_OUT();
	IIC_SDA(1);
	udelay(50);
	IIC_SCL(1);
	udelay(50);
	IIC_SCL(0);
}

void IIC_Send_Byte(unsigned char txd)
{                        
    unsigned char t;   
	SDA_OUT(); 	    
    IIC_SCL(0);//拉低时钟开始数据传输
	udelay(50);
    for(t=0;t<8;t++){              
        IIC_SDA((txd&0x80)>>7);
        txd<<=1; 	  
		udelay(100);   //对TEA5767这三个延时都是必须的
		IIC_SCL(1);
		udelay(100); 
		IIC_SCL(0);	
		udelay(100);
    }	 
} 

unsigned char IIC_Read_Byte(unsigned char ack)
{
	unsigned char i,receive=0;
	SDA_IN();//SDA设置为输入
    for(i=0;i<8;i++ ){
        IIC_SCL(0); 
        udelay(50);
		IIC_SCL(1);
		udelay(10);
        receive<<=1;
        if(imx6_gpio_read(SDA_GPIO_DR,SDA_GPIO_NBR)){
            receive++;
        }            
		udelay(50); 
    }					 
    if (!ack){
        IIC_NAck();//发送nACK
    }
    else{
        IIC_Ack(); //发送ACK   
    }
    return receive;
}

void AT24CXX_WriteSingleBytes(unsigned char DevAddr,unsigned char MemAddr,unsigned char *pDst)
{				    	    																 
    IIC_Start(); 
    IIC_Send_Byte(DevAddr|0);   //发送器件地址0XA0,写数据 	   
    if(!IIC_Wait_Ack()){
        IIC_Send_Byte(MemAddr);	   
        if(!IIC_Wait_Ack()){
            IIC_Send_Byte(*pDst);
            IIC_Wait_Ack();
        }             
    }          
    IIC_Stop();//产生一个停止条件	       
}

void AT24CXX_ReadNumBytes(unsigned char DevAddr,unsigned char MemAddr,unsigned char *pDst,unsigned char len)
{				  		  	    																 
    IIC_Start(); 
    IIC_Send_Byte(DevAddr|0);   //发送器件地址0XA0,写数据 	   
    if(!IIC_Wait_Ack()){
        IIC_Send_Byte(MemAddr);
        IIC_Wait_Ack();        
        IIC_Start(); 
        IIC_Send_Byte(DevAddr|1);           //进入接收模式			   
        if(!IIC_Wait_Ack()){            
            while(len){
                *pDst = IIC_Read_Byte((len>1)?1:0);
                pDst++;
                len--;
            }
        }            
    }       
    IIC_Stop();//产生一个停止条件	       
}

void iic_write(unsigned char wrdata)
{
	
}
void iic_read(unsigned char rddate)
{
	
}
/*************************************************/

/* 应用程序对设备文件/dev/drv执行open(...)时，
 * 就会调用drv_open函数
 */
static int drv_open(struct inode *inode, struct file *file)
{	
	return 0;
}

/* 应用程序对设备文件/dev/drv执行close(...)时，
 * 就会调用drv_close函数
 */
static int drv_close(struct inode *inode, struct file *file)
{
    return 0;
}
#define DRV_MAGIC 'k'
#define IOCTRL_CMD_READ_ADD _IOW(DRV_MAGIC, 1, int)
#define IOCTRL_CMD_READ_LEN _IOW(DRV_MAGIC, 3, int)
int sel_cmd;
unsigned char read_add,read_len;
static long cmd_ioctl( struct file *file, 
					unsigned int cmd, 
					unsigned long arg)
{
	unsigned int data;

    if (__get_user(data, (unsigned int __user *)arg))
        return -EFAULT;
		
		
	switch(cmd){
		case IOCTRL_CMD_READ_ADD:
			read_add = data;
			//printk("add=%02x\r\n",data);
			break;
		case IOCTRL_CMD_READ_LEN:
			read_len = data;
			//printk("len=%02x\r\n",data);
			break;
	}
	//printk("cmd=%d\r\n",sel_cmd);
	return 0;
}
static int drv_write(struct file *filp, const char __user *buff, size_t count, loff_t *offp)
{
    unsigned long err;
	unsigned char write_add,write_arg,buffer[2]={0,0};
	err = copy_from_user(buffer,buff,count);
	write_add = buffer[0];
	write_arg = buffer[1];
	//printk("add=%d,arg=%d\r\n",write_add,write_arg);
	AT24CXX_WriteSingleBytes(ATMOS_DEVICE_ADDR,write_add,&write_arg);
    return err ? -EFAULT : 1;//err = 0;表示成功	
}

/* 应用程序对设备文件/dev/drv执行read(...)时，会造成阻塞
 * 就会调用drv_read函数
 */
unsigned char atmos_data_buffer[32];
static int drv_read(struct file *filp, char __user *buff, 
                    size_t count, loff_t *offp)
{
    unsigned long err;

	AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,read_add,&atmos_data_buffer[0],read_len);
	//printk("read=%d,%d\r\n",atmos_data_buffer[0],atmos_data_buffer[1]);
    err = copy_to_user(buff, (const void *)&atmos_data_buffer[0], read_len);	
    return err ? -EFAULT : 1;
}
/**************************************************
* 当用户程序调用select函数时，本函数被调用
* 如果有按键数据，则select函数会立刻返回
* 如果没有按键数据，本函数使用poll_wait等待
**************************************************/
static unsigned int drv_poll(struct file *file,
        			 struct poll_table_struct *wait)
{
	unsigned int mask = 0;
    	return mask;
}


/* 这个结构是字符设备驱动程序的核心
 * 当应用程序操作设备文件时所调用的open、read、write等函数，
 * 最终会调用这个结构中的对应函数
 */
static struct file_operations drv_fops = {
    .owner   =   THIS_MODULE,    /* 这是一个宏，指向编译模块时自动创建的__this_module变量 */
    .open    =   drv_open,
    .release =   drv_close, 
    .read    =   drv_read,
	.write   =   drv_write,
    .poll    =   drv_poll,
	.unlocked_ioctl   =   cmd_ioctl,
};
/*
 * We export one drv device.  There's no need for us to maintain any
 * special housekeeping info, so we just deal with raw cdev.
 */
static struct cdev drv_cdev;

/*
 * 执行“insmod drv_drv.ko”命令时就会调用这个函数
 */
#define SPI_BASE_REG_ADDR    0x020A4000

static int __init drv_init(void)
{
	int result;
	dev_t devno;
	 
	/* Figure out our device number. */
	result    = alloc_chrdev_region(&devno, 0, 1, "atmos");
	drv_major = MAJOR(devno);
	drv_minor = MINOR(devno);
	printk("atmos device installed, with major %d minor %d\r\n", drv_major,drv_minor);	
	if (devno < 0) {
		printk(KERN_WARNING "atmos: unable to get major %d\n", drv_major);
		return result;
	}
																									 
	/* Now set up cdev. */

	cdev_init(&drv_cdev, &drv_fops);
	drv_cdev.owner = THIS_MODULE;
	drv_cdev.ops   = &drv_fops;
	
	/* Fail gracefully if need be */
	if (cdev_add (&drv_cdev, devno, 1)){
		printk (KERN_NOTICE "Error add\r\n");
	}
	iic_init();
    return 0;
}
/*
 * 执行rmmod drv_drv.ko”命令时就会调用这个函数 
 */
static void __exit drv_cleanup(void)
{
	cdev_del(&drv_cdev);
	unregister_chrdev_region(MKDEV(drv_major, 0), 1);
	//del_timer_sync(&drv_timer);
	printk("SHT20 device uninstalled\n");
}

/* 这两行指定驱动程序的初始化函数和卸载函数 */
module_init(drv_init);
module_exit(drv_cleanup);

/* 描述驱动程序的一些信息，不是必须的 */
MODULE_AUTHOR("Hanson he");             // 驱动程序的作者
MODULE_DESCRIPTION("SHT20 Device Driver");   // 一些描述信息
MODULE_LICENSE("GPL");                              // 遵循的协议

