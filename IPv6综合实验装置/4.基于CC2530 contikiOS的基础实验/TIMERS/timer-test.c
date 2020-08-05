#include <stdio.h>
#include "contiki.h"
#include "sys/clock.h"
#include "sys/rtimer.h"
#include "SHT20/SHT20.h"
#include "SHT20/TM1640.h"
/*---------------------------------------------------------------------------*/
static struct etimer et;
static struct rtimer rt;
rtimer_clock_t rt_now, rt_for;
static clock_time_t ct;
unsigned char take_turn=0;
static uint8_t i;
/*---------------------------------------------------------------------------*/
//声明一个线程PROCESS，线程名为：clock_test_process，
PROCESS(clock_test_process, "Clock test process");

//contiki初始化完成后将自动运行该线程
AUTOSTART_PROCESSES(&clock_test_process);
/*---------------------------------------------------------------------------*/
void rt_callback(struct rtimer *t, void *ptr)
{
	rt_now = RTIMER_NOW();
	ct = clock_time();
	printf("Task called at %u (clock = %u)\r\n", rt_now, ct);
	if((*(unsigned char*)ptr) == 0)
	{
		SHT2x_ReadHumi();	//读取湿度数据
		printf("show humi\r\n");
	}
	else
	{
		SHT2x_ReadTemp();	//读取温度数据
		printf("show temp\r\n");
	}
}

/*---------------------------------------------------------------------------*/
PROCESS_THREAD(clock_test_process, ev, data)
{
	//所有线程以PROCESS_BEGIN()开始
	PROCESS_BEGIN();

	//设置定时器定时为2s
	etimer_set(&et, 2 * CLOCK_SECOND);
	printf("Rtimer Test, 1 sec (%u rtimer ticks):\r\n", RTIMER_SECOND);
	PROCESS_YIELD();	//底座的亮黄色
	while(1)
	{
		//设置定时器定时为2s
		etimer_set(&et, 2 * CLOCK_SECOND);
		printf("=======================\r\n");
		ct = clock_time();
		rt_now = RTIMER_NOW();
		rt_for = rt_now + RTIMER_SECOND;
		printf("Now=%u (clock = %u) - For=%u\r\n", rt_now, ct, rt_for);
		if(rtimer_set(&rt, rt_for, 1,(void (*)(struct rtimer *, void *))rt_callback, &take_turn) != RTIMER_OK) 
		{
			printf("Error setting\r\n");
		}
        take_turn = 1 - take_turn;
		PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));
	}
	//所有线程必须以PROCESS_END()结束
	PROCESS_END();
}
/*---------------------------------------------------------------------------*/




