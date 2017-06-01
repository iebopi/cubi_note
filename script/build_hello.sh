#!/bin/bash

TOP_DIR=$(pwd)/
TOP_DIR_TMP=${TOP_DIR}
cd ${TOP_DIR_TMP}

if [ $1 == 'make' ]; then
make helloword
elif [ $1 == clean ]; then
rm -f helloword
else
echo 'args error'
fi

echo arg_num=$#
echo cmd=$1
echo test=$2
echo 
