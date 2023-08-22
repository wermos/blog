#!/bin/bash

# Bash script for checking if the PNG is interlaced or not.

for filename in $(find . -name '*.png' -type f); do
	echo $filename;
	echo $(xxd -l1 -s28 $filename);
done
