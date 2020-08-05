#include <stdio.h>
#include <limits.h>
#include "string.h"
#include "contiki.h"
#include "OLED/OLED.h"
#include "SHT20/SHT20.h"
static struct _post_data
{	
	unsigned char temp;
	unsigned char humidity;
};
static struct _post_data sensor_data;
static uint8_t sensor_temp_buf[14]={"temp:xx"};
static uint8_t sensor_humidity_buf[14]={"humidity:xx"};
static uint8_t readseq = 0;
/* This is our event type */
static process_event_t SENSORS_EVENT;
/*---------------------------------------------------------------------------*/
//声明一个线程PROCESS，线程名为：sensor_process，
PROCESS(sensor_process, "Sensor process");

//声明一个线程PROCESS，线程名为：display_process，
PROCESS(display_process, "Print process");

//contiki初始化完成后将自动运行该线程
AUTOSTART_PROCESSES(&sensor_process, &display_process);
/*---------------------------------------------------------------------------*/
PROCESS_THREAD(sensor_process, ev, data)//线程1
{
	static struct etimer timer;	
	//所有线程以PROCESS_BEGIN()开始
	PROCESS_BEGIN();
		
	//对事件进行初始化，分配相应的数据结构
	SENSORS_EVENT = process_alloc_event();

	printf("Contiki allocated event ID %d.\r\n", SENSORS_EVENT);

	etimer_set(&timer, CLOCK_CONF_SECOND);

	while(1)
	{
		printf("Sensor process: Wait for timer event...\r\n");

		PROCESS_WAIT_EVENT_UNTIL(ev == PROCESS_EVENT_TIMER);
		
		readseq++;
		if(readseq%2)
		{
			printf("humidity read\r\n");
			SHT2x_ReadHumi();
			sensor_data.humidity = (uint8_t)SHT2x_GetHumi();
		}
		else
		{
			printf("temp read\r\n");
			SHT2x_ReadTemp();
			sensor_data.temp = (uint8_t)SHT2x_GetTemp();
		}
		etimer_restart(&timer);
		process_post(&display_process/*目标线程*/, SENSORS_EVENT, (uint8_t*)&sensor_data);
	}
	//所有线程必须以PROCESS_END()结束
	PROCESS_END();
}

/*---------------------------------------------------------------------------*/
/* Implementation of "Print Process" */
PROCESS_THREAD(display_process, ev, data)//线程2
{
	struct _post_data *sd;

	//所有线程以PROCESS_BEGIN()开始  
	PROCESS_BEGIN();
	OLED_P8x16Str(0, 0,sensor_temp_buf);
	OLED_P8x16Str(0, 2,sensor_humidity_buf);
	while(1)
	{
		//等待用户自定义的event_data_ready事件
		PROCESS_WAIT_EVENT_UNTIL(ev == SENSORS_EVENT);
		sd = data;
		printf("Print Process - Data Ready:\r\n");
		
		sensor_temp_buf[5] = sensor_data.temp/10+0x30;
		sensor_temp_buf[6] = sensor_data.temp%10+0x30;
		sensor_temp_buf[7] = 0;
		OLED_P8x16Str(0, 0,sensor_temp_buf);
		
		sensor_humidity_buf[9] = sensor_data.humidity/10+0x30;
		sensor_humidity_buf[10] = sensor_data.humidity%10+0x30;
		sensor_humidity_buf[11] = 0;		
		OLED_P8x16Str(0, 2,sensor_humidity_buf);
	}

	//所有线程必须以PROCESS_END()结束
	PROCESS_END();
}
/*---------------------------------------------------------------------------*/





