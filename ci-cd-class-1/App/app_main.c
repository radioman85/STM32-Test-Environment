#include "app_main.h"
#include "BoardNamings.h"
#include "stm32f3xx_hal.h"



void app_main(void)
{
	if (HAL_GPIO_ReadPin(ButtonB1_GPIO_Port, ButtonB1_Pin) == GPIO_PIN_SET)
		HAL_GPIO_WritePin(LedGreen_GPIO_Port, LedGreen_Pin, GPIO_PIN_RESET);
	else
		HAL_GPIO_WritePin(LedGreen_GPIO_Port, LedGreen_Pin, GPIO_PIN_SET);
}
