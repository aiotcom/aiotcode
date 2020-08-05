#include  "spi_enc28j60.h"
static void SPI_RW_Dly(uint32_t n);
//ENC28J60 SPI 接口初始化
#define BV(a)(1<<a)
void SPI_Enc28j60_Init(void)
{
   P1DIR |= BV(4)|BV(5)|BV(6);  
   
   P1DIR &= ~BV(7);
   P1INP &= ~BV(7);//P1_7 输入上拉
   
   P0DIR |= BV(0);//P0_0 输出 

   P0DIR &= BV(1);//P0_1 输入
   P0INP &= ~BV(1);//P0_1 输入上拉
   
   ENC28J60_RST = 0;
   HAL_Delay(100);
   ENC28J60_RST = 1;
   
   SPI_NSS = 1;
   SPI_SCK = 0;
}

static void SPI_RW_Dly(uint32_t n)
{
	while(n--);
}
//SPI1读写一字节数据
uint8_t	SPI1_ReadWrite(uint8_t byte)
{
	uint8_t SPI_TxData,k;
	uint8_t RetData=0;
	SPI_TxData = byte;
	
 	for(k=0;k<8;k++)
	{
		if(SPI_TxData&0x80)
		{
			//NRF_MOSI_SET();
		  	SPI_MOSI = 1;
		}	   
		else
		{
      		//NRF_MOSI_CLR();
		  	SPI_MOSI = 0;
    	}
		SPI_RW_Dly(15); 		
	  	SPI_TxData = SPI_TxData <<1;
		SPI_RW_Dly(15);
		//NRF_SCK_SET();	   //clk=1
		SPI_SCK = 1;
		RetData = RetData <<1;	
		if(SPI_MISO) 
		{
			RetData=RetData+0x01;
    	}
		//NRF_SCK_CLR(); 	   //clk=0
		SPI_SCK = 0;
  	}
		//NRF_SCK_CLR(); 	   //clk=0
	SPI_SCK = 0;
    return(RetData);       // return read byte        
}


















