cmake_minimum_required(VERSION 3.16)

project(OBJLoader VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(OBJLoader INTERFACE)
target_include_directories(OBJLoader INTERFACE include/)
