#ifndef __ESP8266_H__
#define __ESP8266_H__
int esp8266_init(void);
int esp8266_receive(unsigned char *buf);
void esp8266_send(unsigned char *buf,int len);
#endif


