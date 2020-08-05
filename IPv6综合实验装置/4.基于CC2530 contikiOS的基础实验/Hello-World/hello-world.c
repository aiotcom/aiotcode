/**
 * \file
 *         Basic hello world example
 * \author
 *         Zach Shelby <zach@sensinode.com>
 */

#include "contiki.h"
#include <stdio.h> /* For printf() */
/*---------------------------------------------------------------------------*/
//声明一个线程PROCESS，线程名为：hello_world_process，
PROCESS(hello_world_process, "Hello world process");

//定义一个数组，存放程序中自动运行的线程，并将hello_world_process添加到数组中
//contiki初始化完成后将自动运行该线程
AUTOSTART_PROCESSES(&hello_world_process);
/*---------------------------------------------------------------------------*/

//线程定义、参数分别为：参数名、事件ev、事件附带的数据data 
PROCESS_THREAD(hello_world_process, ev, data)
{
  //所有线程以PROCESS_BEGIN()开始 
  PROCESS_BEGIN();

  //printf是线程执行的内容
  printf("Hello World!\r\n");
  printf("Hello Contiki!\r\n");
  printf("Hello 6Lowpan!\r\n\r\n");
  
  //所有线程必须以PROCESS_END()结束
  PROCESS_END();
}
/*---------------------------------------------------------------------------*/




