#!/bin/bash
# ref url: http://blog.csdn.net/u013625961/article/details/53892821

WORK_DIR=$(pwd)
# install iperf to PC as server
tar -xvf iperf-3.0.3.tar.gz
cd iperf-3.0.3
./configure
make && make install
ln -s /usr/local/lib/libiperf.so.0.0.0 /usr/lib/libiperf.so.0

# make iperf to arm as client
mkdir -p ${WORK_DIR}/_install 
make clean 
./configure --host=arm-linux-gnueabi --prefix=${WORK_DIR}/_install
make && make install

# tar bin & lib for arm
cd ${WORK_DIR}/_install
arm-linux-gnueabi-strip bin/iperf3
arm-linux-gnueabi-strip lib/libiperf.so.0.0.0
rm lib/libiperf.a lib/libiperf.la
tar -zcvf iperf3.tar bin lib

echo -e "\n---Notice---"
echo "iperf3.tar in _install need to un-tar to /usr/ for arm."
echo -e "Run 'iperf3 -s -i 1' as server in PC.\n"
