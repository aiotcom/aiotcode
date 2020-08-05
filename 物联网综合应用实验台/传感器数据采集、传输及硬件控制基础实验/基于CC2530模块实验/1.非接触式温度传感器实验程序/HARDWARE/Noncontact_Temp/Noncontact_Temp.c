#include "Noncontact_Temp.h"	
#include "delay.h"

//==========================================================
//	函数名称：	MLX90615_init()
//
//	函数功能：	初始化MLX90615
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void MLX90615_init(void)
{
    mlx_gpio_init();  //IO口初始化
    mlx_SDA_OUT();    //设置为输出模式
    mlx_SCL_HIGH();
    mlx_SDA_HIGH();
}

//==========================================================
//	函数名称：	mlx_gpio_init()
//
//	函数功能：	初始化IO口
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void mlx_gpio_init(void)
{
    P0SEL &= ~0x03;     //设置P0.0、P0.1为普通IO口  
    P0DIR |= 0x03;      //P0.0、P0.1定义为输出
}

//==========================================================
//	函数名称：	mlx_SCL_OUTPUT()
//
//	函数功能：	IIC时钟线输出模式
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void mlx_SCL_OUTPUT(void)
{
    P0SEL &= ~0x01;     //设置P0.0为普通IO口  
    P0DIR |= 0x01;      //P0.0定义为输出
}

//==========================================================
//	函数名称：	mlx_SCL_INPUT()
//
//	函数功能：	IIC时钟线输入模式
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void mlx_SCL_INPUT(void)
{
    P0SEL &= ~0x01;     //设置P0.0为普通IO口  
    P0DIR &= ~0x01;     //按键接在P0.0口上，设P0.7为输入模式 
    P0INP &= ~0x01;     //打开P0.0上拉电阻
}

//==========================================================
//	函数名称：	mlx_SDA_OUT()
//
//	函数功能：	IIC数据线输出模式 
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void mlx_SDA_OUT(void)
{
    P0SEL &= ~0x02;     //设置P0.1为普通IO口  
    P0DIR |= 0x02;      //P0.1定义为输出
}

//==========================================================
//	函数名称：	mlx_SDA_IN()
//
//	函数功能：	IIC数据线输入模式
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void mlx_SDA_IN(void)
{
    P0SEL &= ~0x02;     //设置P0.1为普通IO口  
    P0DIR &= ~0x02;     //按键接在P0.6口上，设P0.6为输入模式 
    P0INP &= ~0x02;     //打开P0.1上拉电阻
}

//==========================================================
//	函数名称：	start_bit()
//
//	函数功能：	IIC  开始时序
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void START_bit(void)
{	
    mlx_SDA_OUT();
    mlx_SDA_HIGH();
    delay_us(5);
    mlx_SCL_HIGH();
    delay_us(5);
    
    mlx_SDA_LOW();
    delay_us(4);
    mlx_SCL_LOW();
    delay_us(5);
}

//==========================================================
//	函数名称：	stop_bit()
//
//	函数功能：	IIC  停止时序
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void STOP_bit(void)
{	
    mlx_SDA_OUT();
    mlx_SCL_LOW();
    delay_us(5);
    mlx_SDA_LOW();
    delay_us(5);
    mlx_SCL_HIGH();
    delay_us(5);
    mlx_SDA_HIGH();
}

//==========================================================
//	函数名称：	TX_byte()
//
//	函数功能：	IIC发送数据
//
//	入口参数：	Tx_buffer：数据
//
//	返回参数：	无
//
//	说明：			
//==========================================================
unsigned char TX_byte(unsigned char Tx_buffer)
{
    unsigned char	Bit_counter;
    unsigned char	Ack_bit;
    unsigned char	bit_out;

    for(Bit_counter=8; Bit_counter; Bit_counter--)
    {
      if(Tx_buffer&0x80) 
        bit_out=1; // If the current bit of Tx_buffer is 1 set bit_out
      else			   
        bit_out=0; // else clear bit_out
            
      send_bit(bit_out);	// Send the current bit on SDA
      Tx_buffer<<=1;	// Get next bit for checking
    }

    Ack_bit=Receive_bit();// Get acknowledgment bit

    return	
      Ack_bit;
}// End of TX_bite()

//==========================================================
//	函数名称：	send_bit()
//
//	函数功能：	IIC 写入数据时序
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void send_bit(unsigned char bit_out)
{       
    mlx_SDA_OUT();
    if(bit_out) 
    {
      mlx_SDA_HIGH();	
    }
    else	
    {
      mlx_SDA_LOW();
    }
    delay_us(1);
    mlx_SCL_HIGH();
    delay_us(5);
    mlx_SCL_LOW();
    delay_us(5);

    return;
}//End of send_bit()

//==========================================================
//	函数名称：	Receive_bit()
//
//	函数功能：	IIC 读取数据时序
//
//	入口参数：	时间
//
//	返回参数：	无
//
//	说明：
//==========================================================
unsigned char Receive_bit(void)
{
    unsigned char Ack_bit;
    
    mlx_SDA_IN();	
    delay_us(3);
    mlx_SCL_HIGH();
    delay_us(1);
    if(mlx_SDA_State())
       Ack_bit=1;
    else
       Ack_bit=0;
    mlx_SCL_LOW();	
    delay_us(1);	
    return	
      Ack_bit;
}//End of Receive_bit

//==========================================================
//	函数名称：	RX_byte()
//
//	函数功能：	IIC 读取数据
//
//	入口参数：	ack_nack: unsigned char ack_nack (acknowledgment bit)
//							0 - Master device sends ACK
//							1 - Master device sends NACK
//
//	返回参数：	无
//
//	说明：			
//==========================================================
unsigned char RX_byte(unsigned char ack_nack)
{
    unsigned char   RX_buffer=0;
    unsigned char   Bit_Counter;
    
    for(Bit_Counter=8; Bit_Counter; Bit_Counter--)
    {
        if(Receive_bit())	// Get a bit from the SDA line
        {
            RX_buffer <<= 1;	// If the bit is HIGH save 1  in RX_buffer
            RX_buffer |=0x01;
        }
        else
        {
            RX_buffer <<= 1;	// If the bit is LOW save 0 in RX_buffer 
            RX_buffer &=0xfe;	
        }
    }
    
    send_bit(ack_nack);		// Sends acknowledgment bit
    
    return RX_buffer;
}

//==========================================================
//	函数名称：	MemRead()
//
//	函数功能：	从框架/EEPROM读取数据
//
//	入口参数：	SlaveAddress：读取地址
//							command:命令
//
//	返回参数：	温度值
//
//	说明：			
//==========================================================
unsigned int MemRead(unsigned char SlaveAddress,unsigned char command)
{
    unsigned int  data;			// Data storage (DataH:DataL)
    unsigned char Pec;			// PEC byte storage
    unsigned char DataL;		// Low data byte storage
    unsigned char DataH;		// High data byte storage
    unsigned char arr[6];		// Buffer for the sent bytes
    unsigned char PecReg;		// Calculated PEC byte storage
    unsigned char ErrorCounter;		// Defines the number of the attempts for communication with MLX90614

    ErrorCounter=0x00;			// Initialising of ErrorCounter

    do{
    repeat:
        STOP_bit();			//If slave send NACK stop comunication	
        --ErrorCounter;			//Pre-decrement ErrorCounter
        if(!ErrorCounter){	        //ErrorCounter=0?
            //printf("break 1\r\n");
            break;			//Yes,go out from do-while{}
        }
        START_bit();			//Start condition

        if(TX_byte(SlaveAddress)){	//Send SlaveAddress
            //printf("repeat 1\r\n");
            goto	repeat;		//Repeat comunication again
        }

        if(TX_byte(command)){		//Send command	
            //printf("repeat 2\r\n");
            goto	repeat;		//Repeat comunication again
        }
        START_bit();			//Repeated Start condition

        if(TX_byte(SlaveAddress)){      //Send SlaveAddress-------------------???
            //printf("repeat 3\r\n");
            goto	repeat;         //Repeat comunication again
        }

        DataL=RX_byte(ACK);		//Read low data,master must send ACK
        DataH=RX_byte(ACK); 		//Read high data,master must send ACK
        Pec=RX_byte(NACK);		//Read PEC byte, master must send NACK
        STOP_bit();			//Stop condition

        arr[5]=SlaveAddress;		//
        arr[4]=command;			//
        arr[3]=SlaveAddress;		//Load array arr 
        arr[2]=DataL;			//
        arr[1]=DataH;			//
        arr[0]=0;			//
        PecReg=PEC_calculation(arr);    //Calculate CRC
        
        //printf("DataL:%d\tDataH:%d\r\n",DataL,DataH);
                
    }while(PecReg != Pec);		//If received and calculated CRC are equal go out from do-while{}
    
    *((unsigned char *)(&data))=DataL;	 // 
    *((unsigned char *)(&data)+1)=DataH ;//data=DataH:DataL
    
    return data;							
}

//==========================================================
//	函数名称：	SendRequest()
//
//	函数功能：	发送复位
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void SendRequest(void)
{
    mlx_SCL_LOW();	//SCL 1 ____________|<-----80ms------->|______________
    delay_ms(80);	// 	  0	            |__________________|
    mlx_SCL_HIGH();
}

//==========================================================
//	函数名称：	DummyCommand()
//
//	函数功能：	发送命令
//
//	入口参数：	byte:命令
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void DummyCommand(unsigned char byte)
{
    START_bit();	//Start condition
    TX_byte(byte);	//Send Slave Address or whatever,no need ACK checking
    STOP_bit();	        //Stop condition
}

//==========================================================
//	函数名称：	CalcTemp()
//
//	函数功能：	温度值换算
//
//	入口参数：	value:值
//
//	返回参数：	无
//
//	说明：		
//==========================================================
float CalcTemp(unsigned int value)
{
    float temp;
    
    temp=(value*0.02)-273.15;
//       _NOP();
    delay_us(1);
    return temp;
}

//==========================================================
//	函数名称：	PEC_calculation()
//
//	函数功能：	计算PEC包
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
unsigned char PEC_calculation(unsigned char pec[])
{
    unsigned char 	crc[6];
    unsigned char	BitPosition=47;
    unsigned char	shift;
    unsigned char	i;
    unsigned char	j;
    unsigned char	temp;

    do{
        crc[5]=0;	/* Load CRC value 0x000000000107 */
        crc[4]=0;
        crc[3]=0;
        crc[2]=0;
        crc[1]=0x01;
        crc[0]=0x07;
        BitPosition=47;	/* Set maximum bit position at 47 */
        shift=0;
                        
        //Find first 1 in the transmited message
        i=5;		/* Set highest index */
        j=0;
        while((pec[i]&(0x80>>j))==0 && i>0){
            BitPosition--;
            if(j<7){
                    j++;
            }
            else{
                    j=0x00;
                    i--;
            }
        }/*End of while */
        
        shift=BitPosition-8;	/*Get shift value for crc value*/
        
        
        //Shift crc value 
        while(shift){
            for(i=5; i<0xFF; i--){
                    if((crc[i-1]&0x80) && (i>0)){
                            temp=1;
                    }
                    else{
                            temp=0;
                    }
                    crc[i]<<=1;
                    crc[i]+=temp;
            }/*End of for*/
            shift--;
        }/*End of while*/
        
        
        //Exclusive OR between pec and crc		
        for(i=0; i<=5; i++){
                pec[i] ^=crc[i];
        }/*End of for*/
    }while(BitPosition>8);/*End of do-while*/
    
    return pec[0];
}/*End of PEC_calculation*/





