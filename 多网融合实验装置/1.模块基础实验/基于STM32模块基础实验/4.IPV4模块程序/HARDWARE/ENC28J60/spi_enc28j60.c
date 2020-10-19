#include  "spi_enc28j60.h"
#include  "stm32f1xx.h"
#include "delay.h"
SPI_HandleTypeDef hspi1;
static void MX_SPI1_Init(void);
//ENC28J60 SPI 接口初始化
void SPI_Enc28j60_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;    

    __HAL_RCC_GPIOA_CLK_ENABLE();           				    //开启GPIOA时钟
    __HAL_RCC_GPIOB_CLK_ENABLE();                               //开启GPIOB时钟
    
    GPIO_Initure.Pin = GPIO_PIN_4;							    //PA4 片选
    GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;				    //推挽输出
    GPIO_Initure.Pull = GPIO_PULLUP;
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW; 					//低速
    HAL_GPIO_Init(GPIOA, &GPIO_Initure);

    GPIO_Initure.Pin = GPIO_PIN_7;							    //复位管脚RESET
    GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;				    //推挽输出
    GPIO_Initure.Pull = GPIO_PULLUP;    
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW; 					//低速
    HAL_GPIO_Init(GPIOB, &GPIO_Initure);
    GPIOB->BRR = GPIO_PIN_7;
    delay_ms(100);
    GPIOB->BSRR = GPIO_PIN_7;

    GPIO_Initure.Pin = GPIO_PIN_6;							    //INT
    GPIO_Initure.Mode = GPIO_MODE_INPUT;				    //推挽输出
    GPIO_Initure.Pull = GPIO_PULLUP;    
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW; 					//低速
    HAL_GPIO_Init(GPIOB, &GPIO_Initure);    

    MX_SPI1_Init();
}


//SPI1读写一字节数据
uint8_t	SPI1_ReadWrite(uint8_t writedat)
{
    uint8_t Rxdata;
    HAL_SPI_TransmitReceive(&hspi1,&writedat,&Rxdata,1, 100);       
 	return Rxdata;         
}

static void MX_SPI1_Init(void)
{
  /* SPI1 parameter configuration*/
  hspi1.Instance               = SPI1;
  hspi1.Init.Mode              = SPI_MODE_MASTER;
  hspi1.Init.Direction         = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize          = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity       = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase          = SPI_PHASE_1EDGE;
  hspi1.Init.NSS               = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_32;
  hspi1.Init.FirstBit          = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode            = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation    = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial     = 10;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    while(1);
  }

}
void HAL_SPI_MspInit(SPI_HandleTypeDef* hspi)
{

  GPIO_InitTypeDef GPIO_InitStruct;
  if(hspi->Instance==SPI1)
  {
  /* USER CODE BEGIN SPI1_MspInit 0 */

  /* USER CODE END SPI1_MspInit 0 */
    /* Peripheral clock enable */
    __HAL_RCC_SPI1_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE();
    /**SPI1 GPIO Configuration    
    PA5     ------> SPI1_SCK
    PA6     ------> SPI1_MISO
    PA7     ------> SPI1_MOSI 
    */
    GPIO_InitStruct.Pin = GPIO_PIN_5|GPIO_PIN_7;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = GPIO_PIN_6;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /* USER CODE BEGIN SPI1_MspInit 1 */

  /* USER CODE END SPI1_MspInit 1 */
  }

}



















