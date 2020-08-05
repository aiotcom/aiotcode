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
#include <asm/ioctl.h>
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

#define LED_MAGIC 'k'
#define IOCTL_LED_ON _IOW(LED_MAGIC, 1, int)

#define  IOMUXC_SW_MUX_CTL_PAD_GPIO04  ioremap(0x020e022c,4)
#define  GPIO1_DR                      ioremap(0x0209c000,4)
#define  GPIO1_GDIR                    ioremap(0x0209c004,4)

unsigned int tempreg;
#define  LED_ON()         {tempreg = readl(GPIO1_DR);tempreg &= ~(1<<4);writel(tempreg,GPIO1_DR);}	
#define  LED_OFF()          {tempreg = readl(GPIO1_DR);tempreg |= (1<<4);writel(tempreg,GPIO1_DR);}	
static int led_major = 0;
static int led_minor = 0;
static struct cdev led_cdev;
//add your code
#define MAX_KEYS    1

/* 等待队列: 
 * 当没有按键被按下时，如果有进程调用key_read函数，
 * 它将休眠
 */
static DECLARE_WAIT_QUEUE_HEAD(key_waitq);

#define KEY_TIMER_DELAY    HZ/50   /*20ms*/

/* 事件标志, 有键按下时将它置1，key_read将它清0 */
static volatile int ev_press = 0;

/* 应用程序对设备文件/dev/key执行open(...)时，
 * 就会调用led_open函数
 */
static int led_open(struct inode *inode, struct file *file)
{	
	printk("led_open\r\n");
	return 0;
}
/* 应用程序对设备文件/dev/key执行close(...)时，
 * 就会调用led_close函数
 */
static int led_close(struct inode *inode, struct file *file)
{
    return 0;
}
/* 应用程序对设备文件/dev/leds执行ioctl(...)时，
 * 就会调用s3c24xx_leds_ioctl函数
 */
static long led_ioctl( struct file *file, 
					unsigned int cmd, 
					unsigned long arg)
{
	unsigned int data;

    if (__get_user(data, (unsigned int __user *)arg))
        return -EFAULT;
		
	switch(cmd){
		case IOCTL_LED_ON:
			if(data){		
				LED_ON();					
			}
			else{	
				LED_OFF();					
			}
		break;
	}
	
	return 0;
}
/* 这个结构是字符设备驱动程序的核心
 * 当应用程序操作设备文件时所调用的open、read、write等函数，
 * 最终会调用这个结构中的对应函数
 */
static struct file_operations led_fops = {
    .owner   =   THIS_MODULE,    /* 这是一个宏，指向编译模块时自动创建的__this_module变量 */
    .open    =   led_open,
    .release =   led_close, 
	.unlocked_ioctl   =   led_ioctl,
};

/*
 * 建立一个cdev结构体
 */
static void led_setup_cdev(struct cdev *dev, int minor,
                struct file_operations *fops)
{
        int err, devno = MKDEV(led_major, minor);

        cdev_init(dev, fops);
        dev->owner = THIS_MODULE;
        dev->ops = fops;
        err = cdev_add (dev, devno, 1);
        /* Fail gracefully if need be */
        if (err)
                printk (KERN_NOTICE "Error %d adding key%d", err, minor);
}
/*
 * 执行“insmod key_drv.ko”命令时就会调用这个函数
 */
static int __init led_init(void)
{
	int result;
	dev_t devno ;
	 
	/* Figure out our device number. */
	result = alloc_chrdev_region(&devno, 0, 1, "one_led");
	led_major = MAJOR(devno);
	led_minor = MINOR(devno);
	//devno = MKDEV(led_major, led_minor);
	printk("led device installed, with major %d minor %d\r\n", led_major,led_minor);	
	if (result < 0) {
		printk(KERN_WARNING "led: unable to get major %d\n", led_major);
		return result;
	}
	if (led_major == 0){
		led_major = result;
	}																								 
	/* Now set up cdev. */
	//led_setup_cdev(&led_cdev, 0, &led_fops);
	cdev_init(&led_cdev, &led_fops);
	led_cdev.owner = THIS_MODULE;
	led_cdev.ops   = &led_fops;
	
	/* Fail gracefully if need be */
	if (cdev_add (&led_cdev, devno, 1))
		printk (KERN_NOTICE "Error add\r\n");
	
	writel(0x05,IOMUXC_SW_MUX_CTL_PAD_GPIO04);//设置为GPIO模式

	 //读出
	result = readl(GPIO1_GDIR);	
	result |= (1<<4);//设置成输出
	writel(result,GPIO1_GDIR);//再次写入，设置该IO为输出模式

	LED_OFF();	//关闭LED灯
    return 0;
}

/*
 * 执行rmmod one_led”命令时就会调用这个函数 
 */
static void __exit led_cleanup(void)
{
	cdev_del(&led_cdev);
	unregister_chrdev_region(MKDEV(led_major, 0), 1);
	printk("one led device uninstalled\n");
}

/* 这两行指定驱动程序的初始化函数和卸载函数 */
module_init(led_init);
module_exit(led_cleanup);

/* 描述驱动程序的一些信息，不是必须的 */
MODULE_AUTHOR("bacheng");             // 驱动程序的作者
MODULE_DESCRIPTION("one led Driver");   // 一些描述信息
MODULE_LICENSE("GPL");                              // 遵循的协议

