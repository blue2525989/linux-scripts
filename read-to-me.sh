#!/bin/bash

# REQUIRES ESPEAK TO BE INSTALLED!
# sudo apt install espeak

cat $1 | while read LINE
do
	for WORD in $LINE;
	do
		espeak $WORD
		sleep .075
	done
done
exit 0
