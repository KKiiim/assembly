cmake_minimum_required(VERSION 3.15)
project(ctest-qsort)
set(HOME .github/workspaces)
set(EXECUTABLE_OUTPUT_PATH ${HOME}/assembly/qsort/final-qsort/bin/)
include_directories(${PROJECT_SOURCE_DIR}/include)

set(SOURCES
    asmQsort.s
    qsort.c
)

link_directories(${PROJECT_SOURCE_DIR}/lib)

add_executable(ctestQsort ${SOURCES})

# 链接CTest库
find_package(Threads REQUIRED)
target_link_libraries(ctestQsort PRIVATE Threads::Threads)

# 添加CTest测试
enable_testing()
add_test(NAME MyTest COMMAND ctestQsort)