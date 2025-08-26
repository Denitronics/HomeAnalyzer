# HAL library name
set(LIBRARY_NAME hal)

# Path to HAL configuration files
set(HAL_SUBMODULE_PATH ${PROJECT_SOURCE_DIR}/external/stm32f2)
set(HAL_CONFIG_PATH ${PROJECT_SOURCE_DIR}/config/hal)
set(HAL_SRC_PATH ${HAL_SUBMODULE_PATH}/Drivers/STM32F2xx_HAL_Driver/Src)
set(HAL_INC_PATH ${HAL_SUBMODULE_PATH}/Drivers/STM32F2xx_HAL_Driver/Inc)
set(CMSIS_INC_PATH ${HAL_SUBMODULE_PATH}/Drivers/CMSIS)

# Path to HAL sources
set(HAL_SOURCES
    ${HAL_SRC_PATH}/stm32f2xx_hal_cortex.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_dma_ex.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_dma.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_exti.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_flash_ex.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_flash.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_gpio.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_pwr_ex.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_pwr.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_rcc_ex.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_rcc.c
    ${HAL_SRC_PATH}/stm32f2xx_hal.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_gpio.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_exti.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_uart.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_usart.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_tim.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_tim_ex.c
    ${HAL_SRC_PATH}/stm32f2xx_hal_eth.c
    ${HAL_CONFIG_PATH}/system_stm32f2xx.c
  )

add_library(${LIBRARY_NAME}
  ${HAL_SOURCES}
)

target_compile_definitions(${LIBRARY_NAME}
  PUBLIC
  -DSTM32F207xx)

target_include_directories(${LIBRARY_NAME}
  PUBLIC
    ${HAL_INC_PATH}
    ${HAL_CONFIG_PATH}
    ${CMSIS_INC_PATH}/Device/ST/STM32F2xx/Include
    ${CMSIS_INC_PATH}/Core/Include
    ${CMSIS_INC_PATH}/Include
)