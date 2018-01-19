#!/bin/bash

set -e

tar -xvf libxml2*.tar* 
cd libxml2*
./configure CROSS_COMPILE=arm-linux-gnueabihf- --host=arm-linux --prefix=$(pwd)/../_install
make
make install
echo "done!"
