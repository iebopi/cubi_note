#!/bin/bash

set -e
DIR=$(pwd)
cd $DIR

# check sys_config.fex
read -p "Check fex config or not?(Y/n):" Val1
case $Val1 in
Y|y)
nautilus tools/pack/chips/sun7i/configs/dragonboard/wing-k8x4
read -p "Please Check fex config, All Right?(Y/n):" Val
case $Val in
Y|y)
echo "fex ok!"
;;
*)
exit 0
;;
esac

;;
esac

# check rootfs
read -p "Check rootfs or not?(Y/n):" Val1
case $Val1 in
Y|y)
nautilus buildroot/target/dragonboard/rootfs
read -p "Please Check rootfs, All Right?(Y/n):" Val
case $Val in
Y|y)
echo "rootfs ok!"
;;
*)
exit 0
;;
esac

;;
esac

# pack
cd $DIR
./build_pack.sh <<EOF
0
0
2
EOF
nautilus tools/pack

