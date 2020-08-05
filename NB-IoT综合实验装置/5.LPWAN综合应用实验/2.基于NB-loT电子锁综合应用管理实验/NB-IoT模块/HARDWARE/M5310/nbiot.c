#include "MsgHandler.h"
#include "stm32f1xx.h"
#include "stdio.h"
#include "M5310.h"
#include "nbiot.h"
#include "utils.h"
#include "usart.h"
#include "delay.h"
#include "timer.h"
#include "coap.h"

char coap_uri[] = "coap://183.230.40.40:5683"; //
char *serv_addr="183.230.40.40";
//****************************IMEI码;IMSI码应与创建的应用的IMEI码，IMSI码一致
//const char endpoint_name[] = "865820031095552;460042437101012"; 
const char endpoint_name[] = "885820030998475;460042437101013";

uint8_t msgcode;
uint8_t AppStart = 0;
uint8_t light_control = 1;
uint8_t MemCpyEndComma(uint8_t *pdst,uint8_t *psrc,uint8_t maxlen);

uint8_t ReadRspLock[]={"+MIPLREAD:0,62551,3300,1,5701,1,\"123\",1\r\n"};
uint8_t ReadRspRFID[]={"+MIPLREAD:0,62551,3300,0,5701,1,\"456\",1\r\n"};

nbiot_uri_t Lock_uri;
nbiot_uri_t RFID_uri;

//==========================================================
//	函数名称：	Subscription_esources()
//
//	函数功能：	订阅 Object 组配置
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void Subscription_esources(void)
{
//***************************Lock**********************************************<<< 
    m5310_addobj(OBJ_Lock_ID,INST_ID_Lock);                 //添加对象object Lock
		Lock_uri.objid  = OBJ_Lock_ID;
		Lock_uri.instid = INST_ID_Lock;
		Lock_uri.resid  = RES_ID_Lock;
		Lock_uri.flag  |= NBIOT_SET_OBJID;
		Lock_uri.flag  |= NBIOT_SET_INSTID;
    m5310_notify_upload(&Lock_uri,NBIOT_STRING,"1",0,0); 		//订阅资源    
//***************************Lock**********************************************>>>  
   delay_ms(1000);
//***************************RFID**********************************************<<< 
    m5310_addobj(OBJ_RFID_ID,INST_ID_RFID);                 //添加对象object RFID
		RFID_uri.objid  = OBJ_RFID_ID;
		RFID_uri.instid = INST_ID_RFID;
		RFID_uri.resid  = RES_ID_RFID;
		RFID_uri.flag  |= NBIOT_SET_OBJID;
		RFID_uri.flag  |= NBIOT_SET_INSTID;
    m5310_notify_upload(&RFID_uri,NBIOT_STRING,"2",0,0); 		//订阅资源    
//***************************RFID**********************************************>>>  
		delay_ms(1000);
}
//==========================================================
//	函数名称：	MemCpyEndComma()
//
//	函数功能：	
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			
//==========================================================
uint8_t MemCpyEndComma(uint8_t *pdst,uint8_t *psrc,uint8_t maxlen)
{
    uint8_t j=0;
    while(maxlen--)
    {
        pdst[j] = psrc[j];
        if(psrc[++j] == ',')
        {
            break;
        }
    }
    return j;
}

static void handle_read( nbiot_device_t *dev,nbiot_uri_t *uri,uint8_t *buffer,size_t buffer_len,uint16_t ackid)
{
    uint8_t ret = 0;
    nbiot_send_buffer(uri,buffer,ret,ackid,false);//false 是回复平台下发的写操作。
}

static void handle_write( nbiot_device_t *dev,nbiot_uri_t *uri,uint16_t ackid,uint8_t *buffer,size_t buffer_len)
{
    m5310_write_rsp(1,ackid);
}

static void handle_execute( nbiot_device_t *dev,nbiot_uri_t *uri,uint16_t ackid,uint8_t *buffer,size_t buffer_len)
{
	  m5310_execute_rsp(1,ackid);
}

uint8_t *pMsgHeader;
uint8_t  RspMsgID[10],MsgID_Index=0; 
nbiot_uri_t uri;
void handle_request( nbiot_device_t *dev,uint16_t code, uint8_t *buffer,size_t buffer_len,size_t max_buffer_len )
{
	uint16_t  ackid;
	
	char tmp[10],i=0;
	/* initialize response */
	char *msg=NULL;
	msg=strstr((char*)buffer,":0,");
	if(msg==NULL)
	{
			return ;
	}
	msg=msg+3;
	pMsgHeader = (uint8_t*)msg;
	while(*msg!=',')
	{
			RspMsgID[MsgID_Index++] = *(msg);
			tmp[i++]=*(msg++);	
	}
	tmp[i]='\0';
	i=0;
	msg=msg+1;
	ackid=nbiot_atoi(tmp,strlen(tmp));

	while(*msg!=',')
	{
	 tmp[i++]=*(msg++);
	}
	tmp[i]='\0';
	i=0;
	msg=msg+1;
	uri.objid=nbiot_atoi(tmp,strlen(tmp));
    
	while(*msg!=',')
	{
			tmp[i++]=*(msg++);
	}
	tmp[i]='\0';
	i=0;
	msg=msg+1;
	uri.instid=nbiot_atoi(tmp,strlen(tmp));

	while((*msg!=',')&&(*msg!=0x0D))
	{
			tmp[i++]=*(msg++);
	}
	tmp[i]='\0';
	i=0;
	msg=msg+1;
	uri.resid=nbiot_atoi(tmp,strlen(tmp));

	Command = (USART2_RecvBuffer[31]-0x30)*1000+(USART2_RecvBuffer[32]-0x30)*100
		+(USART2_RecvBuffer[33]-0x30)*10+(USART2_RecvBuffer[34]-0x30);

	if(Command>=0x1410 && Command<=0x1421)
	{
		Command_Relay = Command;
	}
	
	if(uri.objid !=1)
	{
		uri.flag|= NBIOT_SET_OBJID;
	}

	if(uri.instid !=1)
	{
		uri.flag|= NBIOT_SET_INSTID;
	}

	if(uri.resid !=1)
	{
		uri.flag|= NBIOT_SET_RESID;
	}

	if( COAP_READ == code )
	{
		delay_ms(10);
		memcpy((void*)&ReadRspLock[12],(const void*)&RspMsgID[0],5);
		AT_SendCmd((char*)ReadRspLock, "OK",0,500);
		memcpy((void*)&ReadRspRFID[12],(const void*)&RspMsgID[0],5);
		AT_SendCmd((char*)ReadRspRFID, "OK",0,500);
	//    	handle_read(dev,&uri,(uint8_t*) pMsgHeader,strlen(msg),ackid);
	}
	if( COAP_WRITE == code )
	{
		 light_control = (*msg)  - 0x30;
		 handle_write(  dev,&uri,ackid,(uint8_t*) msg,strlen(msg) );
	}

	if( COAP_EXECUTE == code )
	{
		 handle_execute( dev,&uri,ackid,(uint8_t*)msg,strlen(msg));
	}
}

uint8_t buf[1024];
char *pp;
int nbiot_send_buffer(const nbiot_uri_t* uri,uint8_t *buffer,size_t buffer_len,uint16_t ackid,bool updated )
{
  char tmp[8];
	
	size_t  len=0;
	uint8_t type=0;
	uint8_t trigger=0;
	nbiot_uri_t uri1;
	uri1.objid=uri->objid;
	pp=strstr((void*)USART2_RecvBuffer,":0,") + 3;
	while(1)
	{
		if(pp!=NULL)
	  {
			while(*pp!=',')
			{
				tmp[len++]=*pp++;
			}
			tmp[len]='\0';
			pp = pp + 1;
			len=0;
			uri1.instid=nbiot_atoi(tmp,strlen(tmp));
			pp=pp;
			while(*pp!=',')
			{
				tmp[len++]=*pp++;
			}
			tmp[len]='\0';
			pp=pp+1;
			len=0;
			uri1.resid=nbiot_atoi(tmp,strlen(tmp));
			while(*pp!=',')
				tmp[len++]=*pp++;
			tmp[len]='\0';
			pp=pp+1;
			len=0;
			type=nbiot_atoi(tmp,strlen(tmp));
			while(*pp!=';')
				 buf[len++]=*pp++;
			buf[len]='\0';
			pp=pp+1;
			len=0;
			if(*pp=='\0')
				 trigger=1;
			if(updated==true)
			{
					m5310_notify_upload(&uri1,type,(char*)buf,trigger,ackid);
			}
			else
					m5310_read_upload(&uri1,type,(char*)buf,trigger,ackid);
			if(1==trigger)
					break;
		 }
		 else
		 {
				 break;
		 }
	}
  return NBIOT_ERR_OK;
}

int nbiot_recv_buffer( uint8_t *buffer,size_t buffer_len )
{
    return 0;
}



