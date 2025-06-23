cmake_minimum_required(VERSION 3.15...4.0)
project(CSGCompiler VERSION 1.0 LANGUAGES CXX)

include_directories(. glm)

set(SOURCES
    CSG/common.cpp CSG/mesh.cpp CSG/builder.cpp CSG/compiler.cpp
    main.cpp
)

add_executable(CSGCompiler ${SOURCES})
