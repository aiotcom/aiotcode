#ifndef _bind_H
#define _bind_H
#include "sampleApp.h"
#include "AF.h"
#include "stdio.h"

uint8 StartBind(void);
uint8 inBindList(const cId_t *pId,uint16 len,uint16 cid);
void Binded_Init(uint8 NumOfId,const cId_t *pId);
void Bind_Clean(uint16 cid);
void ResponeBind(uint16 id,afAddrType_t *dstAddr);
#endif