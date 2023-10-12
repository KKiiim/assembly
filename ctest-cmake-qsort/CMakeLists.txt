cmake_minimum_required(VERSION 3.15)
project(ctest-qsort)

set(HOME ${PROJECT_SOURCE_DIR})
set(EXECUTABLE_OUTPUT_PATH ${HOME}/bin/)
include_directories(${PROJECT_SOURCE_DIR}/include)

# 设置交叉编译工具链和编译选项
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# 设置交叉编译工具链路径
set(CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)

# 设置编译选项
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

# 设置汇编文件和C文件的路径
set(ASM_SOURCE ${HOME}/src/asmQsort.s)
set(C_SOURCE ${HOME}/src/qsort.c)

# 将汇编文件和C文件编译为对象文件
enable_language(ASM)
add_library(asm_objects OBJECT ${ASM_SOURCE})
add_library(c_objects OBJECT ${C_SOURCE})

# 链接对象文件生成可执行文件
add_executable(ctestQsort $<TARGET_OBJECTS:asm_objects> $<TARGET_OBJECTS:c_objects>)