# LED library name
set(LIBRARY_NAME lwip-app)

set(LWIP_APP_INC_PATH ${PROJECT_SOURCE_DIR}/include/lwip/app)
set(LWIP_TARGET_INC_PATH ${PROJECT_SOURCE_DIR}/include/lwip/target)

add_library(${LIBRARY_NAME}
  app/lwip.c
  target/ethernetif.c
)

target_link_libraries(${LIBRARY_NAME}
  PUBLIC
    hal
    cmsis_os
    lwip-core
)

target_include_directories(${LIBRARY_NAME}
  PUBLIC
    ${LWIP_APP_INC_PATH}
    ${LWIP_TARGET_INC_PATH}
)