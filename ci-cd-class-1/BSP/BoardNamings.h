/*
 * BoardNamings.h
 *
 *  Created on: Oct 26, 2023
 *      Author: niklas.roth
 */

#ifndef BOARDNAMINGS_H_
#define BOARDNAMINGS_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "stm32f3xx_hal.h"

#define ButtonB1_Pin GPIO_PIN_13
#define ButtonB1_GPIO_Port GPIOC
#define LedGreen_Pin GPIO_PIN_13
#define LedGreen_GPIO_Port GPIOB

#ifdef __cplusplus
}
#endif

#endif /* BOARDNAMINGS_H_ */
