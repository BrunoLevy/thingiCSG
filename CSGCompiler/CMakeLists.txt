cmake_minimum_required(VERSION 3.15...4.0)
project(CSGCompiler VERSION 1.0 LANGUAGES CXX)

include_directories(. glm)

set(SOURCES
    geogram.psm.Delaunay/Delaunay_psm.cpp
    CSG/common.cpp CSG/mesh.cpp CSG/mesh_io.cpp CSG/builder.cpp CSG/compiler.cpp
    CSG/line_stream.cpp CSG/b_stream.cpp
    main.cpp
)

add_executable(CSGCompiler ${SOURCES})
