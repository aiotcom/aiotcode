#ifndef __ESP8266_H__
#define __ESP8266_H__
int esp8266_init(unsigned char *s1,unsigned char *s2,unsigned char *s3);
int esp8266_receive(unsigned char *buf);
void esp8266_send(unsigned char *buf,int len);
#endif


