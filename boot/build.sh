#!/bin/bash

UBOOT=/home/hui/u-boot/u-boot-sunxi-with-spl.bin

ROOTFS=/home/hui/ubuntu-base-16.04.2-base-armhf.tar.gz

umount /media/hui/rootfs

umount /media/hui/boot

echo "Ensure As Root"

read -p "Please Type dev name(sdx/mmcblkx):" Val

#sudo dd if=/dev/zero of=/dev/%Val bs=1M count=2

fdisk /dev/$Val <<EOF
d

d

d

n
p


+16M
n
p


+1G
w

EOF

mkfs.vfat -n boot /dev/${Val}1

mkfs.ext4 -L rootfs /dev/${Val}2

mkdir /media/hui/boot /media/hui/rootfs

mount -t vfat /dev/${Val}1 /media/hui/boot

mount -t ext4 /dev/${Val}2 /media/hui/rootfs

dd if=${UBOOT} of=/dev/$Val bs=1k seek=8

mkimage -C none -A arm -T script -d boot.cmd boot.scr

rm -rf /media/hui/rootfs/* /media/hui/boot/*

cp boot.scr zImage sun7i-a20-cubieboard2.dtb /media/hui/boot

tar -xvf ${ROOTFS} -C /media/hui/rootfs

sync

sync

umount /media/hui/rootfs

umount /media/hui/boot

rm -r /media/hui/rootfs /media/hui/boot

echo "Done!!"



