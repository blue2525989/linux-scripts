#!/bin/bash

# start up project

read -p "Enter the directory: " DIRNAME

cd ${DIRNAME}
gradle build
gradle bootrun
exit 0
