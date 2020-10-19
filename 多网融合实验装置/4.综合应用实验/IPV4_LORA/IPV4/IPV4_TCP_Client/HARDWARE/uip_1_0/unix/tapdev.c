#include "Tapdev.h"
#include "uip.h"
#include "ENC28J60.h"

/*---------------------------------------------------------------------------*/
/*tapdev_init（）：网卡初始化函数，初始化网卡的工作模式。
tapdev_read(void)：读包函数。将网卡收到的数据放入全局缓存区uip_buf 中，返回包的长度，赋给uip_len。
void tapdev_send(void)：发包函数。将全局缓存区uip_buf 里的数据（长度放在uip_len 中）发送出去。
*/

/* 配置网卡硬件，设置IP地址 */
void tapdev_init(void)
{
  etherdev_init();
}

/*---------------------------------------------------------------------------*/
/* 读取一包数据 */
uint16_t tapdev_read(void)
{	
  return enc28j60PacketReceive(UIP_CONF_BUFFER_SIZE,uip_buf); 
}
/*---------------------------------------------------------------------------*/
/* 发送一包数据 */
void tapdev_send(void)
{
  enc28j60PacketSend(uip_len,uip_buf);  
}

/*-------------------------------------------------------------------*/
