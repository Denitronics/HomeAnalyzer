#ifndef SERIAL_HPP
#define SERIAL_HPP

#include <array>
#include "stm32f2xx.h"
#include "stm32f2xx_hal.h"

namespace bsp {

class Serial {

public:
    static constexpr uint32_t maxBytesPerSingleTransaction{100};

    /**
     * @brief Class constructor
     * @param speed - baudrate (bps) 
     */
    explicit Serial(uint32_t speed);

    /**
     * @brief Write bytes via UART (currently only pooling mode is supported)
     * @param data
     * @param size number of bytes to be written
     * @return true if the data is written, otherwise false
     */
    bool write(char* pData, uint32_t size);

    /**
     * @brief Read bytes via UART (currently only pooling mode is supported)
     * @param data
     * @param size number of bytes to be read
     * @return true if the data is read, otherwise false
     */
    bool read(char* pData, uint32_t size);

private:
    UART_HandleTypeDef huart3;
    static constexpr uint32_t timeout{1000};
    

}; // class Serial

} // namespace bsp

#endif // SERIAL_HPP