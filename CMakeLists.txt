cmake_minimum_required(VERSION 3.20)

project(HomeAnalyzer
    VERSION 0.1.0
    DESCRIPTION "Home Analyzer - A tool for analyzing environmental data in your home"
    LANGUAGES C CXX ASM)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 23)

add_subdirectory(external)
add_subdirectory(src)