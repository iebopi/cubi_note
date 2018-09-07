#!/bin/bash

set -e

./configure --host=arm-linux-gnueabihf CC=arm-linux-gnueabihf-gcc --prefix=$PWD/_install --exec-prefix=$PWD/_install --with-yielding-select=yes
make && make install
echo "done!"

