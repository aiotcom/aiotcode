#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "Rs485.h"
#include "TFT.h"
#include "timer.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2018-01-01
*
*	版本： 		V1.0
*
*	说明： 		TFT操作实验-HAL库版本
*
*	修改记录：	
************************************************************

************************************************************
************************************************************
**/
enum{
    KEY_0,
    KEY_1,
    KEY_2,
    KEY_3,
    KEY_4,
    KEY_5,
    KEY_6,
    KEY_7,
    KEY_8,
    KEY_9,
    KEY_ENTER,
    KEY_CANNCEL,
    KEY_UP,
    KEY_DOWN,
    KEY_RIGHT,
    KEY_LEFT,
    KEY_NULL //没有按键按下
};
#define BOX_W      144
#define BOX_H      32
#define BOX_X_START     ((240-BOX_W)*0.5)

#define BOX_1_X_START   BOX_X_START
#define BOX_1_Y_START   60
#define BOX_1_Y_String  BOX_1_Y_START + (BOX_H*0.5)-8//8是字体的一半

#define BOX_2_X_START   BOX_X_START
#define BOX_2_Y_START   (BOX_1_Y_START+32+32)
#define BOX_2_Y_String   (BOX_2_Y_START+(BOX_H*0.5)-8)//8是字体的一半

#define BOX_3_X_START   BOX_X_START
#define BOX_3_Y_START   (BOX_2_Y_START+32+32)
#define BOX_3_Y_String   (BOX_3_Y_START+(BOX_H*0.5)-8)//8是字体的一半
enum{
    GUI_PATH_MainWin,
    GUI_PATH_Use,
    GUI_PATH_Recurit
};
void RS485_HandlerCb(void);
uint8_t LCD_ReceiveID[5],LCD_ReceiveRFIDFlg=0;
uint8_t LCD_DisplayIdBuffer[32]={""};
uint8_t LCD_NFC_Blockmem[34];
uint8_t BlockmemInputBuffer[32],InputIndex = 0;
uint32_t CardId;
uint8_t GUI_Message = KEY_NULL;
uint8_t SetNFC_Blockmem = 0;
uint8_t SetNFC_BlockBuffer[32];
uint8_t GetKeyMessage = 0;
uint8_t GUI_Path = GUI_PATH_MainWin;
uint8_t NumbOfItem = 0;
uint8_t Set_MP3_Display_AlarmVoice = 0;
extern unsigned char chinese_font_H16_W16[][32];
uint8_t RecruitTable[5][13]={
    "--.--.--.--","--.--.--.--",
    "--.--.--.--","--.--.--.--",
    "--.--.--.--"
};
void GUI_SelectFunction(uint8_t index)
{
    uint8_t tmp = POINT_COLOR;   
    if(index == 0)
    {
        POINT_COLOR = BLUE;
        LCD_DrawRectangle(BOX_3_X_START-3,BOX_3_Y_START-3,BOX_3_X_START+BOX_W+3,BOX_3_Y_START+BOX_H+3);	        
        LCD_DrawRectangle(BOX_3_X_START-2,BOX_3_Y_START-2,BOX_3_X_START+BOX_W+2,BOX_3_Y_START+BOX_H+2);	                
        LCD_DrawRectangle(BOX_3_X_START-1,BOX_3_Y_START-1,BOX_3_X_START+BOX_W+1,BOX_3_Y_START+BOX_H+1);
        
        POINT_COLOR = RED;
        LCD_DrawRectangle(BOX_1_X_START-3,BOX_1_Y_START-3,BOX_1_X_START+BOX_W+3,BOX_1_Y_START+BOX_H+3);        
        LCD_DrawRectangle(BOX_1_X_START-2,BOX_1_Y_START-2,BOX_1_X_START+BOX_W+2,BOX_1_Y_START+BOX_H+2);	                
        LCD_DrawRectangle(BOX_1_X_START-1,BOX_1_Y_START-1,BOX_1_X_START+BOX_W+1,BOX_1_Y_START+BOX_H+1);
    }
    else if(index == 1)
    {
        POINT_COLOR = RED;
        LCD_DrawRectangle(BOX_3_X_START-3,BOX_3_Y_START-3,BOX_3_X_START+BOX_W+3,BOX_3_Y_START+BOX_H+3);	          
        LCD_DrawRectangle(BOX_3_X_START-2,BOX_3_Y_START-2,BOX_3_X_START+BOX_W+2,BOX_3_Y_START+BOX_H+2);	                
        LCD_DrawRectangle(BOX_3_X_START-1,BOX_3_Y_START-1,BOX_3_X_START+BOX_W+1,BOX_3_Y_START+BOX_H+1);
        
        POINT_COLOR = BLUE;
        LCD_DrawRectangle(BOX_1_X_START-3,BOX_1_Y_START-3,BOX_1_X_START+BOX_W+3,BOX_1_Y_START+BOX_H+3);	                        
        LCD_DrawRectangle(BOX_1_X_START-2,BOX_1_Y_START-2,BOX_1_X_START+BOX_W+2,BOX_1_Y_START+BOX_H+2);	                
        LCD_DrawRectangle(BOX_1_X_START-1,BOX_1_Y_START-1,BOX_1_X_START+BOX_W+1,BOX_1_Y_START+BOX_H+1);    
    }
    
    POINT_COLOR = tmp;
}
void GUI_MainWin(void)
{
	uint16_t tmp_back_colour,tmp_point_colour;
    LCD_Clear(BLUE);       //屏幕清成蓝色		

    tmp_point_colour = POINT_COLOR;
    tmp_back_colour  = BACK_COLOR; 
    
    POINT_COLOR = RED;
    BACK_COLOR  = YELLOW;
    LCD_Fill(BOX_1_X_START,BOX_1_Y_START,BOX_1_X_START+BOX_W,BOX_1_Y_START+BOX_H,YELLOW);
    GUI_DrawSymbol(LCD_W/2-16,BOX_1_Y_String,16,16,&chinese_font_H16_W16[21][0]); 
    GUI_DrawSymbol(LCD_W/2,BOX_1_Y_String,16,16,&chinese_font_H16_W16[22][0]); 
    
    LCD_Fill(BOX_3_X_START,BOX_3_Y_START,BOX_3_X_START+BOX_W,BOX_3_Y_START+BOX_H,YELLOW);
    GUI_DrawSymbol(LCD_W/2-16,BOX_3_Y_String,16,16,&chinese_font_H16_W16[23][0]); 
    GUI_DrawSymbol(LCD_W/2,   BOX_3_Y_String,16,16,&chinese_font_H16_W16[24][0]); 
    POINT_COLOR = tmp_point_colour;
    BACK_COLOR  = tmp_back_colour;    
}
uint8_t MatchId(uint8_t *id)
{
    uint8_t i = 0,ret = 0;
    for(i=0;i<NumbOfItem;i++){
        if(memcmp((const char*)&RecruitTable[i][0],(const char*)id,12) == 0){
            ret = 1;
            break;
        }
    }
    
    return ret;
}
int main(void)
{
    uint8_t tmpbuf[13];
    uint8_t i = 0,selectindex=0;
    uint8_t *pbm;           //接收到NFC block memory 内存指针
    HAL_Init();             //初始化HAL库
    TFT_Init();             //初始化TFT显示器端口
    Rs485_Init();			//初始化485
    UART1_Init(115200);		//初始化串口
    USART3_Init(115200);		//初始化串口
    
    Lcd_Init();				//初始化LCD

    TIM3_Init(20000-1,64-1,RS485_HandlerCb);					//初始化定时器中断周期 50 HZ 
    
    GUI_MainWin();   
    GUI_SelectFunction(0);
    BACK_COLOR  = WHITE;     //字体背景色蓝色
	POINT_COLOR = BLACK;   //字体白色	 
    printf("this is usart3 print\r\n");     
    while(1)
    {           
        if(GUI_Path == GUI_PATH_MainWin){
            if(GUI_Message == KEY_UP){
                GUI_Message =  KEY_NULL;                 
                GUI_SelectFunction(0);
                selectindex = 0;
            }
            else if(GUI_Message == KEY_DOWN){
                GUI_Message =  KEY_NULL;                 
                GUI_SelectFunction(1);
                selectindex = 1;
            } 
            else if(GUI_Message == KEY_ENTER){
                GUI_Message =  KEY_NULL; 
                GUI_Path = (selectindex==0)?GUI_PATH_Use:GUI_PATH_Recurit;
                    if(GUI_Path == GUI_PATH_Recurit){
                        LCD_Clear(BLUE);  
                        GUI_DrawSymbol(LCD_W/2-16,30,16,16,&chinese_font_H16_W16[23][0]);//字体"录"
                        GUI_DrawSymbol(LCD_W/2,   30,16,16,&chinese_font_H16_W16[24][0]);//字体"入"                         
                        LCD_Fill(30,60,30+180,60+240,WHITE);                            
                }
                else if(GUI_Path == GUI_PATH_Use){                    
                    LCD_Clear(BLUE);    
                    GUI_DrawSymbol(LCD_W/2-16,30,16,16,&chinese_font_H16_W16[21][0]);//字体"使" 
                    GUI_DrawSymbol(LCD_W/2,   30,16,16,&chinese_font_H16_W16[22][0]);//字体"用"                      
                    LCD_Fill(30,60,30+180,60+240,WHITE);                            
                }
            }                            
        }
        else if(GUI_Path == GUI_PATH_Recurit){
            if(LCD_ReceiveRFIDFlg){
                LCD_ReceiveRFIDFlg = 0;
                sprintf((void*)&tmpbuf[0], \
                       "%02X.%02X.%02X.%02X", \
                        LCD_ReceiveID[0],LCD_ReceiveID[1],LCD_ReceiveID[2],LCD_ReceiveID[3]);
                printf("=%s\r\n",tmpbuf);
                
                if(NumbOfItem>=5){
                    GUI_Tips_MaxInput();
                }
                else if(!MatchId(tmpbuf)){
                    memcpy((void*)&RecruitTable[NumbOfItem][0],(const void*)tmpbuf,13);
                    NumbOfItem++;
                    for(i=0;i < NumbOfItem;i++){
                       LCD_ShowString(30+8,60+8+i*16,&RecruitTable[i][0],1); 
                    }
                }
                else
                {
                    GUI_Tips_AlreadDone();
                }
            }   
            else if(GUI_Message == KEY_CANNCEL){////返回上一级 
                GUI_Message =  KEY_NULL;                 
                GUI_MainWin();   
                GUI_SelectFunction(0);
                GUI_Path = GUI_PATH_MainWin;
                selectindex = 0;
            }                
        }
        else if(GUI_Path == GUI_PATH_Use){
            if(LCD_ReceiveRFIDFlg){
                LCD_ReceiveRFIDFlg = 0;
                sprintf((void*)&tmpbuf[0], \
                       "%02X.%02X.%02X.%02X", \
                        LCD_ReceiveID[0],LCD_ReceiveID[1],LCD_ReceiveID[2],LCD_ReceiveID[3]);
                printf("=%s\r\n",tmpbuf);
                
                LCD_ShowString(30+8,60+8+16,&tmpbuf[0],0);
                if(MatchId(tmpbuf)){
                   GUI_Tips_AllowTo();
                   Set_MP3_Display_AlarmVoice = 1;     
                }
                else{
                    GUI_Tips_forbidTo();
                    Set_MP3_Display_AlarmVoice = 2;
                }
            }
            else if(GUI_Message == KEY_CANNCEL){//返回上一级
                GUI_Message =  KEY_NULL; 
                GUI_MainWin();   
                GUI_SelectFunction(0);
                GUI_Path = GUI_PATH_MainWin;
                selectindex = 1;
            }    
        }                                   
    }
}
//==========================================================
//	函数名称：	void RS485_HandlerCb(void)
//
//	函数功能：	通过485总线获取数据处理函数
//
//	入口参数：	void
//
//	返回参数：	无
//
//	说明：		定时器3中断，回调函数，每100ms调用一次
//==========================================================
uint8_t last_id[5];
void RS485_HandlerCb(void)
{  
    static uint8_t state = 0,nextstate = 0,_10Hz_Count=0;
    switch(state)
    {
        case 0:
            Rs485_Send(Addr_LCD,Addr_Matrixkey,Matrixkey_Get_value,0,(void*)0);//485总线请求按键值
            state     = 1;
            break;
        case 1:
            if(!DataHandling_485(Addr_LCD))
            {
                if(Rx_Stack.Command == MatrixkeyKeyValue)//
                {                                       
                    if( Rx_Stack.Data[0] != KEY_NULL)
                    {
                        GUI_Message = Rx_Stack.Data[0];
                    }
                }
            } 
            state = 2;           
            break;           
        case 2:
            Rs485_Send(Addr_LCD,Addr_LF_RFID,LF_RFID_Get_ID,0,(void*)0);//485总线请求NFC卡片ID
            state     = 3;      
            break;
        case 3:
            if(!DataHandling_485(Addr_LCD))
            {
                printf("<>");
                if(Rx_Stack.Command == LF_RFID_ID)
                {
                    memcpy((void*)LCD_ReceiveID,(const void*)Rx_Stack.Data,4);
                    if(    LCD_ReceiveID[0] || LCD_ReceiveID[1] 
                        || LCD_ReceiveID[2] || LCD_ReceiveID[3]){
                        
                        if(memcmp((const void*)last_id,(const void*)LCD_ReceiveID,4)){
                            memcpy((void*)last_id,(const void*)LCD_ReceiveID,4);
                            LCD_ReceiveRFIDFlg = 1;
                        }
                    }
                    else
                    {
                        last_id[0] = 0;
                        last_id[1] = 0;
                        last_id[2] = 0;
                        last_id[3] = 0;
                    }
                }
            } 
            state = 4;           
            break; 
        case 4:
            if(Set_MP3_Display_AlarmVoice){
                Rs485_Send(Addr_LCD,Addr_MP3,MP3_Target,1,(void*)&Set_MP3_Display_AlarmVoice);
                Set_MP3_Display_AlarmVoice = 0;
                printf("mp3 dispaly alarm voice\r\n");    
            }
            state = 0;
            break;            
    }
}



