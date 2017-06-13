#!/bin/bash
# builds c projects

gcc -o $1.exe $1.c
./$1.exe
exit 0
