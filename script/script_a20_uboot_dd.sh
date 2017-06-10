#! /bin/bash

cd u-boot/
make CROSS_CMPILE=arm-linux-gnueabihf- Cubieboard2_defconfig
make CROSS_CMPILE=arm-linux-gnueabihf-

read -p "please type a dev(sdX/mmcblkX):" Val
if [ $Val] ;then
sudo dd if=/dev/zero of=/dev/$Val bs=1024 count=2
sudo dd if=u-boot-sunxi-with-spl.bin of=/dev/$Val bs=1024 seek=8
fi

