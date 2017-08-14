#!/bin/sh
# post-build.sh for Cubieboard2
# 2013, Carlo Caione <carlo.caione@gmail.com>

BOARD_DIR="$(dirname $0)"
MKIMAGE=$HOST_DIR/usr/bin/mkimage
BOOT_CMD=$BOARD_DIR/boot.cmd
BOOT_CMD_H=$BINARIES_DIR/boot.scr

# cp qt demo app
cp $BUILD_DIR/qt-4.8.7/demos/mainwindow/mainwindow $TARGET_DIR/root/

# add startup item
sed -i '/rcqt/d' $TARGET_DIR/etc/profile
echo "/etc/init.d/rcqt" >> $TARGET_DIR/etc/profile
echo "/root/mainwindow -qws &" > $TARGET_DIR/etc/init.d/rcqt
fakeroot chmod +x $TARGET_DIR/etc/init.d/rcqt

# setup network dhcp
#echo "auto eth0\niface eth0 inet static\naddress 192.168.0.4\ngateway 192.168.0.1\nnetmask 255.255.255.0\ndns-nameservers 192.168.0.1\n" >> $TARGET_DIR/etc/network/interfaces
echo "auto eth0\niface eth0 inet dhcp" >> $TARGET_DIR/etc/network/interfaces

# delete getty line to auto login
sed -i '/getty/a\::respawn:-/bin/sh' $TARGET_DIR/etc/inittab
sed -i '/getty/d' $TARGET_DIR/etc/inittab

# U-Boot script
$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
