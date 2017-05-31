#!/bin/bash
# builds c++ projects

g++ $1.cpp -o $1.exe
./$1.exe
exit 0
