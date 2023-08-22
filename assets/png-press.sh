#!/usr/bin/env sh

# Bash script for batch-compressing PNG files using zopflipng.
 
tmpfile=$(mktemp)
zopflipng -m -y $1 $tmpfile
mv $tmpfile $1
