/* This is a very simple hello_world program.
 * It aims to demonstrate the co-existence of two processes:
 * One of them prints a hello world message and the other blinks the LEDs
 *
 * It is largely based on hello_world in $(CONTIKI)/examples/sensinode  
 *dsdfsssssasdsadasdfsddd
 * Author: George Oikonomou - <oikonomou@users.sourceforge.net> sdjfldfadsdfsd
 */

#include "contiki.h"
#include "bottom_led.h"

#include <stdio.h> /* For printf() */
/*---------------------------------------------------------------------------*/
static struct etimer et_hello;
static struct etimer et_blink;
static uint16_t count;
static uint16_t blinks;
const unsigned char oled_show_buf1[10]="Count:";
unsigned char oled_show_buf2[4]="xxx";
/*---------------------------------------------------------------------------*/
//声明一个线程PROCESS，线程名为：hello_world_process，
PROCESS(hello_world_process, "Hello world process");

//声明一个线程PROCESS，线程名为：blink_process，
PROCESS(blink_process, "LED blink process");

//contiki初始化完成后将自动运行该线程
AUTOSTART_PROCESSES(&hello_world_process, &blink_process);
/*---------------------------------------------------------------------------*/
//线程定义、参数分别为：参数名、事件ev、事件附带的数据data 
PROCESS_THREAD(hello_world_process, ev, data)
{
	//所有线程以PROCESS_BEGIN()开始
	PROCESS_BEGIN();

	etimer_set(&et_hello, CLOCK_SECOND /2);//500ms
	count = 0;

	while(1)
	{
		//线程等待事件发生
		PROCESS_WAIT_EVENT();

		//运行到这里表示已经等待到事件，下面判断是不是超时事件
		if(ev == PROCESS_EVENT_TIMER) {
			printf("Sensor says #%u\r\n", count);
			count++;
			
			//复位定时器，将在500ms后再次产生一个事件
			etimer_reset(&et_hello);
		}
	}
	//所有线程必须以PROCESS_END()结束
	PROCESS_END();
}

/*---------------------------------------------------------------------------*/
//线程定义、参数分别为：参数名、事件ev、事件附带的数据data 
PROCESS_THREAD(blink_process, ev, data)
{
	//所有线程以PROCESS_BEGIN()开始
	PROCESS_BEGIN();
	
	//初始化底座LED灯
    bottom_led_init();
	blinks = 0;
	
	//设置定时器定时为1s
	etimer_set(&et_blink, CLOCK_SECOND);

	while(1)
	{
		PROCESS_WAIT_EVENT_UNTIL(ev == PROCESS_EVENT_TIMER);

		blinks++;
		if(blinks%2)
		{
			Bottom_Green();		//底座灯亮绿色
			printf("Blink... led on\r\n");
		}
		else
		{
			Bottom_BlackOut();	//底座灯关闭
			printf("Blink... led off\r\n");
		}
		//复位定时器，将在1s后再次产生一个事件
		etimer_reset(&et_blink);
	}
	//所有线程必须以PROCESS_END()结束
 	PROCESS_END();
}
/*---------------------------------------------------------------------------*/




