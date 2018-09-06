#!/bin/bash

set -e
WORK_DIR=`pwd`
CC=arm-linux-gnueabihf

echo "=========== prepare to build alsa-lib ========="
cd ${WORK_DIR}
tar -xvf alsa-lib*.tar*
cd ${WORK_DIR}/alsa-lib*
./configure --prefix=${WORK_DIR}/alsa-lib-1.1.6/_install  --host=${CC}
make clean || echo "has been cleaned."
make && make install

echo "=========== prepare to build alsa-utils ========="
cd ${WORK_DIR}
tar -xvf alsa-utils*.tar*
cd ${WORK_DIR}/alsa-utils*
./configure  --with-alsa-inc-prefix=${WORK_DIR}/alsa-lib-1.1.6/_install/include --with-alsa-prefix=${WORK_DIR}/alsa-lib-1.1.6/_install/lib --with-curses=ncurses --prefix=${WORK_DIR}/alsa-utils-1.1.6/_install --disable-alsamixer --host=${CC}
make clean || echo "has been cleaned."
make
sudo make install

echo "done"
