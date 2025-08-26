set(EXECUTABLE ${PROJECT_NAME}.elf)

set(STARTUP_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/startup_stm32f207zgtx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32f2xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/syscalls.c
    ${CMAKE_CURRENT_SOURCE_DIR}/sysmem.c)

add_executable(${EXECUTABLE} 
    main.cpp
    ${STARTUP_FILES} 
)

target_link_libraries(${EXECUTABLE}
  PUBLIC
    hal
    led
    logger
    serial
    freertos_config
    freertos_kernel
    lwip-app
)

target_compile_definitions(${EXECUTABLE}
  PRIVATE
    -DUSE_HAL_DRIVER
)

# Print executable size
add_custom_command(TARGET ${EXECUTABLE}
        POST_BUILD
        COMMAND arm-none-eabi-size ${EXECUTABLE})

# Create hex file
add_custom_command(TARGET ${EXECUTABLE}
        POST_BUILD
        COMMAND arm-none-eabi-objcopy -O ihex ${EXECUTABLE} ${PROJECT_NAME}.hex
        COMMAND arm-none-eabi-objcopy -O binary ${EXECUTABLE} ${PROJECT_NAME}.bin)

add_custom_target(flash
    COMMAND source ~/.bash_profile
    COMMAND STM32_Programmer_CLI --connect port=SWD --write ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.hex --go
    COMMENT "Flashing the device with STM32_Programmer_CLI"
)