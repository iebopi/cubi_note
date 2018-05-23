#!/bin/bash
./make-image-header.sh my.png POKY
aclocal
autoheader
automake --add-missing
autoconf
./configure --host=arm-linux CC=arm-linux-gnueabihf-gcc
make

