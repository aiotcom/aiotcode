#include "Martix_Key.h"	
#include "Rs485.h"
#include "delay.h"
typedef struct{
    GPIO_TypeDef* Port;
    uint16_t      Pin; 
}_IOKEY;
typedef struct{
    uint8_t  kr;//原始值
    uint8_t  kv;//按键用户值 
}_KeyMap;
_KeyMap KeyMap[]={
    {0x20,KEY_0},
    {0x11,KEY_1},
    {0x21,KEY_2},
    {0x31,KEY_3},
    {0x12,KEY_4},
    {0x22,KEY_5},
    {0x32,KEY_6},
    {0x13,KEY_7},
    {0x23,KEY_8},
    {0x33,KEY_9},
    {0x10,KEY_ENTER},
    {0x30,KEY_CANNCEL},
    {0x03,KEY_UP},
    {0x02,KEY_DOWN},
    {0x00,KEY_RIGHT},
    {0x01,KEY_LEFT},    
};

#define NUM_KSO_PIN 4
_IOKEY KSO_Table[ ]={
    {GPIOA,GPIO_PIN_7},
    {GPIOA,GPIO_PIN_4},
    {GPIOA,GPIO_PIN_5},
    {GPIOA,GPIO_PIN_6},
};
#define NUM_KSI_PIN 4
_IOKEY KSI_Table[ ]={
    {GPIOA,GPIO_PIN_2},
    {GPIOA,GPIO_PIN_3},
    {GPIOB,GPIO_PIN_1},
    {GPIOB,GPIO_PIN_7},
};
//==========================================================
//	函数名称：	KEY_Init
//
//	函数功能：	初始化按键
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void KEY_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;
    uint8_t i = 0;

    __HAL_RCC_GPIOA_CLK_ENABLE();			//开启GPIOA时钟
    __HAL_RCC_GPIOB_CLK_ENABLE();			//开启GPIOB时钟

//输出功能管脚配置
    GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;   //推挽输出
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW;  //低速
    
    for(i=0;i<4;i++)
    {    
        GPIO_Initure.Pin = KSO_Table[i].Pin;
        HAL_GPIO_Init(KSO_Table[i].Port, &GPIO_Initure);
    }
//输出功能管脚配置
//输入功能管脚配置
    GPIO_Initure.Mode = GPIO_MODE_INPUT;   	//上拉输入
    GPIO_Initure.Pull = GPIO_PULLUP;	    //上拉
    
    for(i=0;i<4;i++)
    {
        GPIO_Initure.Pin = KSI_Table[i].Pin;
        HAL_GPIO_Init(KSI_Table[i].Port, &GPIO_Initure);
    }
//输入功能管脚配置
 //   HAL_GPIO_WritePin(GPIOA,GPIO_PIN_0,GPIO_PIN_SET);	//PA0
 //   HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7,GPIO_PIN_RESET);	//PA4、5、6、7置0
}
//==========================================================
//	函数名称：	FindKeyValue
//
//	函数功能：	接收按键输入
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
uint8_t FindKeyValue(uint8_t r)
{
    uint8_t i=0,ret;
    while(i<16)
    {
        if(r == KeyMap[i].kr)
        {
            ret =  KeyMap[i].kv;
        }
        i++;
    }
    
    return ret;
}
//==========================================================
//	函数名称：	KSO_OutputScanSignal
//
//	函数功能：	接收按键输入
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
static void KSO_OutputScanSignal(uint8_t ki)
{
    uint8_t i=0;
    while(i<NUM_KSO_PIN)
    {
        if(ki == i)
        {
            KSO_Table[i].Port->BRR = KSO_Table[i].Pin;
        }
        else
        {
            KSO_Table[i].Port->BSRR = KSO_Table[i].Pin;
        }
        i++;
    }
}
//==========================================================
//	函数名称：	KEY_Process
//
//	函数功能：	接收按键输入
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
uint16_t Key_value;	//存放按键值

uint8_t KEY_Process(void)
{
    uint8_t i,j;
    uint8_t NbrOfKeyPress = 0;
    static uint8_t state=0;
    
    HAL_Delay(100);
    for(i=0;i<NUM_KSO_PIN;i++)
    {
        KSO_OutputScanSignal(i);
        for(j=0;j<NUM_KSI_PIN;j++)
        {
            if(!(KSI_Table[j].Port->IDR&KSI_Table[j].Pin))
            {
                HAL_Delay(20);
                if(!(KSI_Table[j].Port->IDR&KSI_Table[j].Pin))
                {
                    NbrOfKeyPress = 1;
                    Key_value = FindKeyValue((i<<4)|j);
                    printf("i=%d,j=%d,k=%d\r\n",i,j,Key_value);
                    break;//只要扫描到一个按键就退出
                }
            }
        }
    }
    
    /*当有按键下后，等待按键松开之后，即state = 0,如果有按键按下，即NbrOfKeyPress != 0,就是有按键按下*/
    if((NbrOfKeyPress)&&(state == 0))
    {
        state = 1;
//        printf("k=%d\r\n",Key_value);
        return Key_value;
    }
    else if((state == 1)&&(NbrOfKeyPress == 0))
    {
//        printf("relase\r\n");
        state = 0;
    }
    
    return KEY_NULL;
}

    

