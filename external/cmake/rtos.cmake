# add interface library for FreeRTOS kernel config file

set(FREERTOS_HEAP "4" CACHE STRING "" FORCE)
set(FREERTOS_PORT "GCC_ARM_CM3" CACHE STRING "" FORCE)

add_library(freertos_config INTERFACE)
target_include_directories(freertos_config
    INTERFACE
        ${CMAKE_SOURCE_DIR}/config/rtos
)

add_library(cmsis_os
    ${CMAKE_SOURCE_DIR}/config/cmsis_os/cmsis_os2.c
)

target_include_directories(cmsis_os
    PUBLIC
        ${CMAKE_SOURCE_DIR}/config/cmsis_os
)

target_link_libraries(cmsis_os
    PUBLIC
        freertos_config
        freertos_kernel
        hal
)