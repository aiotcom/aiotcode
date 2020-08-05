#include "spi.h"
#include "24l01.h"
#define SPI_HARDWARE  0
SPI_HandleTypeDef hspi1;
void SPI1_Init(void)
{
#if SPI_HARDWARE    
    hspi1.Instance = SPI1;
    hspi1.Init.Mode = SPI_MODE_MASTER;
    hspi1.Init.Direction = SPI_DIRECTION_2LINES;
    hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
    hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
    hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
    hspi1.Init.NSS = SPI_NSS_SOFT;
    hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_128;
    hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
    hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
    hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
    hspi1.Init.CRCPolynomial = 7;
    if (HAL_SPI_Init(&hspi1) != HAL_OK)
    {
        while(1);
    }
#else
    GPIO_InitTypeDef GPIO_Initure;
    __HAL_RCC_GPIOA_CLK_ENABLE();           	//开启GPIOA时钟

    GPIO_Initure.Mode  = GPIO_MODE_OUTPUT_PP;	//推挽输出
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW; //低速    
    
    GPIO_Initure.Pin   = NRF_SPI_MOSI_GPIO_PIN;
    HAL_GPIO_Init(NRF_SPI_MOSI_GPIO_PORT, &GPIO_Initure);

    GPIO_Initure.Pin   = NRF_SPI_SCLK_GPIO_PIN;
    HAL_GPIO_Init(NRF_SPI_SCLK_GPIO_PORT, &GPIO_Initure);

    
    GPIO_Initure.Pin   = NRF_SPI_MISO_GPIO_PIN;
    GPIO_Initure.Mode  = GPIO_MODE_INPUT;	//推挽输出
    HAL_GPIO_Init(NRF_SPI_MISO_GPIO_PORT, &GPIO_Initure);  
    NRF_SPI_SCLK_LOW();    
#endif    
} 
#if SPI_HARDWARE  
void HAL_SPI_MspInit(SPI_HandleTypeDef* hspi)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    if(hspi->Instance==SPI1)
    {
        __HAL_RCC_SPI1_CLK_ENABLE(); 
        __HAL_RCC_GPIOA_CLK_ENABLE();
        GPIO_InitStruct.Pin = GPIO_PIN_5|GPIO_PIN_7;
        GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
        HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

        GPIO_InitStruct.Pin = GPIO_PIN_6;
        GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
    }
}

void HAL_SPI_MspDeInit(SPI_HandleTypeDef* hspi)
{
    if(hspi->Instance==SPI1)
    {
        HAL_GPIO_DeInit(GPIOA, GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7);
    }
}
#endif  
static void SPI_RW_Dly(uint32_t n)
{
    while(n--);
}
uint8_t  SPI1_ReadWriteByte(uint8_t reg)
{
    uint8_t SPI_TxData = reg,k;
    uint8_t RetData=0;

    for(k=0;k<8;k++)
    {
        if(SPI_TxData&0x80)
        {
            NRF_SPI_MOSI_HIGHT();
        }	   
        else
        {
            NRF_SPI_MOSI_LOW();
        }
        SPI_RW_Dly(15); 		
        SPI_TxData = SPI_TxData <<1;
        SPI_RW_Dly(15);
        NRF_SPI_SCLK_HIGHT();	   //clk=1
        RetData = RetData <<1;	
        if(NRF_SPI_MISO_GPIO_PORT->IDR & NRF_SPI_MISO_GPIO_PIN) 
        {
            RetData=RetData+0x01;
        }
        NRF_SPI_SCLK_LOW(); 	   //clk=0
    }
    return(RetData);           		  // return read byte
}

































