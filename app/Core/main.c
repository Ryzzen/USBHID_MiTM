#include "debug.h"

/* Global define */

/* Global Variable */

/*********************************************************************
 * @fn      GPIO_Toggle_init
 *
 * @brief   Initializes GPIOA.0
 *
 * @return  none
 */
void GPIO_Toggle_init(void) {
  GPIO_InitTypeDef GPIO_InitStructure = {0};

  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
}

/**
 * @brief Main function
 *
 * @return none
 */
int main(void) {
  u8 i = 0;
  RCC_ClocksTypeDef RCC_ClocksStatus = {0};

  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
  Delay_Init();
  Delay_Ms(100);
  USART_Printf_Init(115200);
  printf("SystemClk:%d\r\n", SystemCoreClock);

  SystemCoreClockUpdate();
  printf("SystemClk:%d\r\n", SystemCoreClock);

  RCC_GetClocksFreq(&RCC_ClocksStatus);
  printf("SYSCLK_Frequency-%d\r\n", RCC_ClocksStatus.SYSCLK_Frequency);
  printf("HCLK_Frequency-%d\r\n", RCC_ClocksStatus.HCLK_Frequency);
  printf("PCLK1_Frequency-%d\r\n", RCC_ClocksStatus.PCLK1_Frequency);
  printf("PCLK2_Frequency-%d\r\n", RCC_ClocksStatus.PCLK2_Frequency);

  printf("GPIO Toggle TEST\r\n");
  GPIO_Toggle_init();

  while (1) {
    printf("test\r\n");
    Delay_Ms(100);
    GPIO_WriteBit(GPIOA, GPIO_Pin_15,
                  (i == 0) ? (i = Bit_SET) : (i = Bit_RESET));
  }
}
