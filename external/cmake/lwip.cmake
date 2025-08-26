set(LIBRARY_NAME lwip-core)
set(LWIP_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lwip)
set(LWIP_INCLUDE_DIRS
    "${LWIP_DIR}/src/include"
    "${CMAKE_SOURCE_DIR}/config/lwip"
    "${CMAKE_SOURCE_DIR}/config/lwip/system"
)

include (${LWIP_DIR}/src/Filelists.cmake)

add_library(${LIBRARY_NAME}
    ${CMAKE_SOURCE_DIR}/config/lwip/system/OS/sys_arch.c
)

target_link_libraries(${LIBRARY_NAME}
    PUBLIC
        lwipallapps
        lwipcore
        freertos_config
        freertos_kernel
)

target_include_directories(${LIBRARY_NAME}
    PUBLIC
        ${LWIP_INCLUDE_DIRS}
)