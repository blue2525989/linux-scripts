#!/bin/bash

# start up project

DIRNAME=$1

cd $DIRNAME
gradle build
gradle bootrun
exit 0
