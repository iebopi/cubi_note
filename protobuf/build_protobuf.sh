#!/bin/bash
# cross-compile protobuf-2.5.0

set -e

PWD=`pwd`
DIR_INSTALL=${PWD}/_install
CC=arm-linux-gnueabihf-gcc
CXX=arm-linux-gnueabihf-g++

tar -xvf protobuf-*.tar*
cd protobuf-*

./autogen.sh
./configure
make
make check
sudo make install
make distclean

mkdir -p ${DIR_INSTALL}
sudo echo "/usr/local/lib" >> /etc/ld.so.conf
sudo ldconfig
./configure --host=arm-linux --with-protoc=protoc CC=$CC CXX=$CXX --prefix=${DIR_INSTALL}
make
make install
tar -zcvf _install.tar -C ./_install/ .
echo -e "Done!\n"

