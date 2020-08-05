#include "_bind.h"

static cId_t needBindCid[10],NbrBindReq; 
/*
启动邦定注要，都输出方去申请绑定
*/
uint8 StartBind(void)
{
  if(!NbrBindReq)
  {
  	return 1;
  }
  if ( AF_DataRequest( &Boardcast_DstAddr,
                       &Coordinator_epDesc,
                       BIND_REQUEST_CMD_ID,
                       NbrBindReq*2,
                       (uint8*)needBindCid,
                       &SampleApp_TransID,
                       AF_DISCV_ROUTE,
                       AF_DEFAULT_RADIUS ) == afStatus_SUCCESS )
  {
    printf("request bind\r\n");//串口打印提示，发送成功
  } 
  
  return 0;
}
/*
设备反馈绑定请求
*/
void ResponeBind(uint16 id,afAddrType_t *dstAddr)
{
  uint16 cid = id;
  if ( AF_DataRequest( dstAddr,
                       &EndDevice_epDesc,
                       BIND_RSP_CMD_ID,
                       2,
                       (uint8*)&cid,
                       &SampleApp_TransID,
                       AF_DISCV_ROUTE,
                       AF_DEFAULT_RADIUS ) == afStatus_SUCCESS )
  {
    printf("response bind\r\n");//串口打印提示，发送成功
  } 
}
/*
设备查找自己是否在邦定请求表中
*/
uint8 inBindList(const cId_t *pId,uint16 len,uint16 cid)
{
  	uint8 ret = 0;
	while(len--)
	{
		if((*pId) == cid)
		{
			ret = 1;
		}
	}
	
	return ret;
}
/*
从绑定列表中清除
*/
void Bind_Clean(uint16 cid)
{
  	uint16 i = NbrBindReq;
	while(i--)
	{
		if(needBindCid[i] == cid)
		{
			while(i<(NbrBindReq-1))
			{
				needBindCid[i] = needBindCid[i+1];
			}
			NbrBindReq--;
		}
	}
}
/*
己绑定列表
*/
void Binded_Init(uint8 NumOfId,const cId_t *pId)
{
	uint16 i = 0;
	for(i=0;i<NumOfId;i++)
	{
		needBindCid[i] = pId[i];
	}
	NbrBindReq = NumOfId;
}