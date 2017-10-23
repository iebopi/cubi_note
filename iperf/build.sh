#!/bin/bash
# compile iperf to stress test network
# ref url: http://blog.csdn.net/u013625961/article/details/53892821

set -e
read -p "Ensure Login As Root(Y/n):" Val
case $Val in
Y|y)
;;
*)
exit 0
;;
esac

WORK_DIR=$(pwd)
CC=arm-linux-gnueabihf

# install iperf to PC as server
tar -xvf iperf-3.0.3.tar.gz
cd iperf-3.0.3
./configure
make && make install
ln -s /usr/local/lib/libiperf.so.0.0.0 /usr/lib/libiperf.so.0 || echo "continu..."

# make iperf to arm as client
mkdir -p ${WORK_DIR}/_install 
make clean 
./configure --host=$CC --prefix=${WORK_DIR}/_install
make && make install

# tar bin & lib for arm
cd ${WORK_DIR}/_install
$CC-strip bin/iperf3
$CC-strip lib/libiperf.so.0.0.0
rm lib/libiperf.a lib/libiperf.la
tar -zcvf iperf3.tar bin lib

echo -e "\n---Notice---"
echo -e "iperf3.tar in _install need to un-tar to /usr/ for arm"
echo -e "arm client cmd: 'iperf3 -c 192.168.1.100 -i 1 -w 448k -t 10'"
echo -e "PC server cmd: 'iperf3 -s -i 1'\n"
