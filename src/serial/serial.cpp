#include "serial.hpp"

namespace bsp {

Serial::Serial(uint32_t speed) {
    // Initialize GPIO pins
    /** 
     * USART1 GPIO Configuration
     *  PD8     ------> USART3_TX
     *  PD9     ------> USART3_RX
     */
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_PIN_8|GPIO_PIN_9;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
    GPIO_InitStruct.Alternate = GPIO_AF7_USART3;
    HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

    // Initialize UART
    huart3.Instance = USART3;
    huart3.Init.BaudRate = 115200;
    huart3.Init.WordLength = UART_WORDLENGTH_8B;
    huart3.Init.StopBits = UART_STOPBITS_1;
    huart3.Init.Parity = UART_PARITY_NONE;
    huart3.Init.Mode = UART_MODE_TX_RX;
    huart3.Init.HwFlowCtl = UART_HWCONTROL_NONE;
    huart3.Init.OverSampling = UART_OVERSAMPLING_16;

    HAL_UART_Init(&huart3);
}

bool Serial::write(char* pData, uint32_t size) {
    bool res{false};

    if (HAL_UART_Transmit(&huart3, reinterpret_cast<uint8_t*>(pData), size, timeout) == HAL_OK) {
        res = true;
    }

    return res;
}

bool Serial::read(char* pData, uint32_t size) {
    bool res{false};

    if (HAL_UART_Receive(&huart3, reinterpret_cast<uint8_t*>(pData), size, timeout) == HAL_OK) {
        res = true;
    }

    return res;
}

} // namespace bsp