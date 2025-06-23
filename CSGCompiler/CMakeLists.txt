cmake_minimum_required(VERSION 3.15...4.0)
project(CSGCompiler VERSION 1.0 LANGUAGES CXX)

include_directories(. glm)
set(SOURCES CSG/common.cpp CSG/mesh.cpp main.cpp)

add_executable(CSGCompiler ${SOURCES})
