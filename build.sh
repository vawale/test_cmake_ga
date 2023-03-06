#!/bin/bash

SRC_DIR="src/"
BUILD_DIR="build/"

cmake -GNinja -S $SRC_DIR -B $BUILD_DIR -DCMAKE_EXPORT_COMPILE_COMMANDS=ON || exit

cmake --build $BUILD_DIR || exit
