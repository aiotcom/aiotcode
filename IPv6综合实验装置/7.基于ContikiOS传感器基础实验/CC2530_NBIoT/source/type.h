#ifndef TYPE_H
#define TYPE_H

#include "uip.h"
#define   u8    unsigned char
#define   u16   unsigned int
#define   u32   unsigned long int

#define   uint8_t     u8
#define   uint16_t    u16
#define   uint32_t    u32

#define   uint8       uint8_t
#define   uint16      uint16_t
#define   uint32      uint32_t

typedef unsigned char u8_t;
typedef unsigned short u16_t;
typedef unsigned short uip_stats_t;


extern struct _uip_udp_conn *uip_udp_conn;
extern struct _uip_udp_conn uip_udp_conns[ ];
#endif