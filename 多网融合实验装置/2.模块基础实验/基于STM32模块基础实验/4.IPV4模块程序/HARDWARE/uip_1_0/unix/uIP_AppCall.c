#include "uIP_AppCall.h"
#include "stm32f1xx.h"
#include "enc28j60.h"
#include "uip.h"

/*uIP初始化部分*/
#include "httpd.h"//httpd_appcall();
#include "uIP_AppCall.h"//tcp_test_appcall(); 
#include "uip_arch.h"
#include "uip-conf.h"
#include "uIP_App.h"
//用于固定IP地址开关打开后的IP设置，本例程没有用这个
#define UIP_DRIPADDR0   192
#define UIP_DRIPADDR1   168
#define UIP_DRIPADDR2   1
#define UIP_DRIPADDR3   15

#define ETH_ADDR_LEN	6
static unsigned char mymac[6] = {0x04,0x02,0x35,0x00,0x00,0x01};  //MAC地址	   
/*uIP初始化部分完毕*/

#include <string.h>
#include <stdio.h>
extern short CRC16_now( unsigned char *pBuffer, int length );
static uint8_t test_data[2048];   /* 1K测试数据 */
static uint8_t DataFromServerBuf[200];
static void aborted(void);
static void timedout(void);
static void closed(void);
static void connected(void);
static void newdata(void);
static void acked(void);
static void senddata(void);
static uint16_t CRCValue;
static uint8_t  OpenGateCmdFromPC = 0x01;
uip_tcp_appstate_t *pxDataFromServer;
/*******************************************************************************
*	函数名: tcp_test_appcall
*	输  入: 无
*	输  出: 无
*	功能说明：这是一个回调函数。在h文件中，我们定义 UIP_APPCALL的宏等于 tcp_server_appcall
*	而tcp_test_appcall包含在tcp_server_appcall中 
*	当uip事件发生时，UIP_APPCALL 函数会被调用。
*	例如 : 当一个TCP连接被创建时、有新的数据到达、数据已经被应答、数据需要重发等事件
*
***************************************************************************/
void tcp_test_appcall(void)
{
	if (uip_aborted())
	{
		printf("uip_aborted!\r\n");
		aborted();
	}

	else if (uip_timedout())
	{
		printf("uip_timedout!\r\n");
		timedout();
	}

	else if (uip_closed())//服务器断开
	{
		printf("uip_closed!\r\n");
		closed();
	}

	else if (uip_connected())
	{
		printf("uip_connected!\r\n");//连接上服务器
		//connected();
	}

	else if (uip_acked())//收到数据回复了ACK
	{
        printf("uip_acked!\r\n");
		acked();
	}

	/* 接收到一个新的TCP数据包，准备需要发送数据 */
	else if (uip_newdata())
	{
		pxDataFromServer = (struct tcp_test_appstate *)&uip_conn->appstate;		
		pxDataFromServer->textptr = uip_appdata;   	
		pxDataFromServer->textlen = uip_len;
		memcpy((void*)DataFromServerBuf,(const void*)uip_appdata,uip_len);
	}
	/* 当需要重发、新数据到达、数据包送达、连接建立时，通知uip发送数据 */
	if (uip_rexmit() ||	uip_newdata() || uip_acked() ||	uip_connected() || uip_poll())
	{
		//senddata();
	}
}

/*******************************************************************************
*	函数名: aborted
*	输  入: 无
*	输  出: 无
*	功能说明：当TCP连接异常终止时，调用此函数。
***************************************************************************/
static void aborted(void)
{
	;
}

static void timedout(void)
{
	;
}

static void closed(void)
{
	;
}

/*******************************************************************************
*	函数名: connected
*	输  入: 无
*	输  出: 无
*	功能说明：当TCP连接建立时，调用此函数。
***************************************************************************/
static void connected(void)
{  
	/*
		uip_conn结构体有一个"appstate"字段指向应用程序自定义的结构体。
		声明一个s指针，是为了便于使用。

		不需要再单独为每个uip_conn分配内存，这个已经在uip中分配好了。
		在uip.c 中 的相关代码如下：
		struct uip_conn *uip_conn;
		struct uip_conn uip_conns[UIP_CONNS]; //UIP_CONNS缺省=10
		定义了1个连接的数组，支持同时创建几个连接。
		uip_conn是一个全局的指针，指向当前的tcp或udp连接。
	*/
	struct tcp_test_appstate *s = (struct tcp_test_appstate *)&uip_conn->appstate;

	memset(test_data, 0x45, 2048);
	//memset(void *s,int c,size_t n) :
	//将s所指向的某一块内存中的每个字节的内容全部设置为ch指定的ASCII值
	s->state = STATE_CMD;  //命令状态
	s->textlen = 0;

	s->textptr = "Connect STM32-RC Board Success!";
	s->textlen = strlen((char *)s->textptr);
}

/*******************************************************************************
*	函数名: TCPCmd
*	输  入: 无
*	输  出: 无
*	功能说明：分析PC机网络软件发送的命令，并进行相应的处理。
*	s->state 由命令来改变
***************************************************************************/
uint8_t TestBuf[50];
void TCP_Cmd(struct tcp_test_appstate *s)
{
	uint8_t led;
	
	/* 点亮LED
		语法：ledon n  (n : 1 - 3) 
		例如 ： 
		ledon 2 表示点亮LED2
		接收到的信息为ledon 1 则uip_len长度为7		
	*/
  memcpy((void*)TestBuf,(const void*)uip_appdata,uip_len);
	if ((uip_len == 7) && (memcmp("ledon ", uip_appdata, 6) == 0))
	{
		led = ((uint8_t *)uip_appdata)[6]; /* 操作的LED序号 */
		if (led == '1')
		{
			//LED1_ON();
			s->textptr = "MyLed 1 On!";
		}
		else if (led == '2')
		{
			//LED2_ON();
			s->textptr = "Led 2 On!";			
		}
		else if (led == '3')
		{
			//LED3_ON();
			s->textptr = "Led 3 On!";
		}
	
		s->textlen = strlen((char *)s->textptr);
	}
	/* 关闭LED
		语法：ledoff n  (n : 1 - 4) 
		例如 ： 
		ledon 2 表示点亮LED2	
	*/
	else if ((uip_len == 8) && (memcmp("ledoff ", uip_appdata, 7) == 0))
	{
		led = ((uint8_t *)uip_appdata)[7]; /* 操作的LED序号 */
		if (led == '1')
		{
			//LED1_OFF();
			s->textptr = "Led 1 off!";
		}
		else if (led == '2')
		{
			//LED2_OFF();
			s->textptr = "Led 2 Off!";				
		}
		else if (led == '3')
		{
			//LED3_OFF();
			s->textptr = "Led 3 Off!";
		}
		
		s->textlen = strlen((char *)s->textptr);
	}
	/* 发送数据测试 txtest
		语法：txtest
		例如 ： 
		
	*/
	else if ((uip_len == 6) && (memcmp("txtest", uip_appdata, 6) == 0))
	{
		s->state = STATE_TX_TEST;

		s->textptr = test_data;
		s->textlen = 1400;
	}
	/* 接收数据测试 rxtest
		语法：rxtest
		例如 ： 
		
	*/
	else if ((uip_len == 6) && (memcmp("rxtest", uip_appdata, 6) == 0))
	{
		s->state = STATE_RX_TEST;
		s->textptr = "Ok";
		s->textlen = 2;
	}
	else
	{
		s->textptr = "Unknow Command!\r\n";
		s->textlen = strlen((char *)s->textptr);
	}
}

/*******************************************************************************
*	函数名: newdata
*	输  入: 无
*	输  出: 无
*	功能说明：当收到新的TCP包时，调用此函数。准备数据，但是暂时不发送。
***************************************************************************/
static void newdata(void)
{
//	struct tcp_test_appstate *s = (struct tcp_test_appstate *)&uip_conn->appstate;
//				
//	s->textptr = uip_appdata;   	
//	s->textlen = uip_len;

}

/*******************************************************************************
*	函数名: acked
*	输  入: 无
*	输  出: 无
*	功能说明：当发送的TCP包成功送达时，调用此函数。
***************************************************************************/
static void acked(void)
{
	struct tcp_test_appstate *s = (struct tcp_test_appstate *)&uip_conn->appstate;

	switch(s->state)
	{
		case STATE_CMD:		 /* 在命令状态 */
			s->textlen = 0;

			/* 
				只在命令状态打印调试信息 
				避免发送测试时，影响通信速度		
			*/
			//USART_OUT(USART1,"uip_acked!\r\n");
			break;

		case STATE_TX_TEST:
			s->textptr = test_data;	/* 连续发送 */
			s->textlen = 1400;
			break;

		case STATE_RX_TEST:
			s->textlen = 0;
			break;
	}
}

/*******************************************************************************
*	函数名: senddata
*	输  入: 无
*	输  出: 无
*	功能说明：发送tcp数据。
***************************************************************************/
static void senddata(void)
{
	struct tcp_test_appstate *s = (struct tcp_test_appstate *)&uip_conn->appstate;

	if (s->textlen > 0)
	{
		/*
			这个函数将向网络发送TCP数据包,
				s->textptr : 发送的数据包缓冲区指针
				s->textlen ：数据包的大小（单位字节）
		*/
		uip_send(s->textptr, s->textlen);
	}
}


/*************UDP部分****************************/

/*******************************************************************************
*	函数名: void myudp_appcall(void) ) 
*	参  数: 
*	返  回: 无
*	功  能: UDP回调 函数
*	存在#define UIP_UDP_APPCALL  myudp_appcall
**************************************************************************/
extern uint8_t uip_udp_client_send_buf[50];
extern uint8_t uip_udp_client_send_len;
void myudp_appcall(void) 
{ 
    /*
    uip 会轮询当前UDP连接，uip_udp_conn指向当前轮询到的连接
    */
    //printf("udp get data\r\n");
    if(uip_udp_conn == pxUDP_Conn)//udp主动发送数据参考
    {
        if(uip_udp_client_send_len > 0)
        {
            memcpy((void*)uip_appdata,(const void*)&uip_udp_client_send_buf[0],uip_udp_client_send_len);
            uip_send((char *)uip_appdata, uip_udp_client_send_len);
            uip_udp_client_send_len = 0;
        }
    }
   if(uip_newdata()/*有新数据*/&&(uip_udp_conn->lport == pxUDP_Conn->lport))//pxUDP_Conn udp接收数据参考,可能会存在多个应用。						
   { 
        memcpy((void*)&uip_udp_client_send_buf[0],(const void*)uip_appdata,uip_len);//复制数据
        uip_udp_client_send_len = uip_len;
        uip_send((char *)uip_udp_client_send_buf,uip_udp_client_send_len); 
        uip_udp_client_send_len = 0;
       
   } 
} 

/*******************************************************************************
*	函数名: void myudp_send(char *str,short n) 
*	参  数: 
*	返  回: 无
*	功  能: UDP 数据包发送
**************************************************************************/
void myudp_send(char *str,short n) 
{ 
   char   *nptr;   
   nptr = (char *)uip_appdata;       
   memcpy(nptr, str, n); 
   uip_udp_send(n);   				//发送n个数据 
} 

/*******************************************************************************
*	函数名: void UDP_newdata(void) 
*	参  数: 
*	返  回: 无
*	功  能: UDP 数据包发送
**************************************************************************/
void UDP_newdata(void) 
{ 
} 

/*******************************************************************************
*	函数名: etherdev_init
*	参  数: 无
*	返  回: 无
*	功  能: uIP 接口函数,初始化网卡
********************************************************************************/
void etherdev_init(void)
{	 
    uint8_t i;	 
	/*初始化 enc28j60*/
	enc28j60Init(mymac);					  
	//把IP地址和MAC地址写入各自的缓存区	ipaddr[] macaddr[]
	//init_ip_arp_udp_tcp(mymac,myip,mywwwport);
	for (i = 0; i < 6; i++)
	{
		uip_ethaddr.addr[i] = mymac[i];
	}
    //指示灯状态:0x476 is PHLCON LEDA(绿)=links status, LEDB(红)=receive/transmit
    //enc28j60PhyWrite(PHLCON,0x7a4);
	//PHLCON：PHY 模块LED 控制寄存器	
	enc28j60PhyWrite(PHLCON,0x0476);	
	enc28j60clkout(2); // change clkout from 6.25MHz to 12.5MHz
}

/*******************************************************************************
*	函数名: void tcp_server_appcall(void)
*	参  数: 
*	返  回: 无
*	功  能: 应用接口函数--完成TCP服务器和HTTP服务器
**************************************************************************/
extern uint8_t uip_tcp_client_send_buf[50];
extern uint8_t uip_tcp_client_send_len;
struct uip_conn *client_link_uip_conn[2];
uint8_t client_sel = 0;
uint8_t count=0; 
void tcp_appcall(void)
{//定时轮询，每个conn
    if(((uip_conn->lport) == pxConnectServerConn->lport)&&(pxConnectServerConn))
    {
        if (uip_aborted())
        {
            printf("uip_aborted!\r\n");
            //aborted();
        }

        else if (uip_timedout())
        {
            printf("uip_timedout!\r\n");
            //timedout();
        }

        else if (uip_closed())//服务器断开
        {
            printf("uip_closed!\r\n");
           // closed();
        }

        else if (uip_connected())
        {
            printf("uip_connected!\r\n");//连接上服务器
            //connected();
        }

        else if (uip_acked())//收到数据回复了ACK
        {
            printf("uip_acked!\r\n");
            acked();
        }

        /* 接收到一个新的TCP数据包*/
        else if (uip_newdata())
        {//接收到的数据返回
            memcpy((void*)uip_tcp_client_send_buf,(const void*)uip_appdata,uip_len);
            uip_tcp_client_send_len = uip_len;
            uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
            uip_tcp_client_send_len = 0;
        }
        /* 当需要重发、新数据到达、数据包送达、连接建立时，通知uip发送数据 */
        if (uip_rexmit() ||	uip_newdata() || uip_acked() ||	uip_connected() || uip_poll())
        {
            
        }
        
        if(uip_tcp_client_send_len)
        {
            uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
            uip_tcp_client_send_len = 0;
        }
    }
    switch(uip_conn->lport) //本地端口
    {
        case HTONS(1200):
            if(uip_connected())
            {//如果有客户端接入，走到这里。client_link_uip_conn 保存客户端的连接
                client_link_uip_conn[count++] = uip_conn;
            }
            if(uip_newdata())
            {
                memcpy((void*)uip_tcp_client_send_buf,(const void*)"server return this\r\n",uip_len);
                uip_tcp_client_send_len = uip_len;
                uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
                uip_tcp_client_send_len = 0;  
            } 
            if(uip_tcp_client_send_len)
            {
                if(uip_conn == client_link_uip_conn[client_sel])
                {
                    uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
                    uip_tcp_client_send_len = 0;
                }
                if(uip_conn == client_link_uip_conn[client_sel])
                {
                    uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
                    uip_tcp_client_send_len = 0;
                }                
            }            
            break;
    }
}
void tcp_server_appcall(void)
{
    /*
    UIP 会轮询当的TCP连接，
    */
/*  MCU端做为TCP服务器时候使用，监听端口*/
	switch(uip_conn->lport) //本地端口
	{
		case HTONS(80):			           //http服务器
			httpd_appcall(); //在uip/app/httpd.c文件中定义
			break;
		case HTONS(1200):				   //TCP服务器 
            printf("port 1200 get message\r\n");
		    httpd_appcall();
            //tcp_test_appcall(); 
		case HTONS(1500):				   //TCP服务器
		    tcp_test_appcall(); 		
			break;
	}
	
    /*MCU端作为TCP客户端时候使用，uip_conn->lport接收到消息的目标端口，pxConnectServerConn->lport，我们建立的一个
    连接本地端口，原因我们可以在MUC端建立多个TCP客户端连接，需要区分本次消息是发送给那个连接*/   
    if(((uip_conn->lport) == pxConnectServerConn->lport)&&(pxConnectServerConn))
    {
        tcp_test_appcall();
    }
    
    //appstate 用户自己加的
    if((uip_conn->appstate.state == STATE_CMD) && (uip_conn == pxConnectServerConn))
    {//如当前轮询到的TCP连接己经建立，且是我们期望的那个连接
        uip_send("tcp client send data\r\n",sizeof("tcp client send data\r\n"));
    }
}

/* uip_log
uIP的调试打印语句。
可以通过注释 #define UIP_CONF_LOGGING     而关闭调试输出

void uip_log(char *m)
{
	//USART_OUT(USART1,"uIP log message: %s\r\n", m);
}*/
