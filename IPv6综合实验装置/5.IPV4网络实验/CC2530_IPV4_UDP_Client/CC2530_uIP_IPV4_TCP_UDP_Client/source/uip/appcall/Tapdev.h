#ifndef TAPDEV_H
#define TAPDEV_H
#include "type.h"
void tapdev_init(void);
uint16_t tapdev_read(void);//返回包的长度，赋给uip_len
void tapdev_send(void);

#endif

