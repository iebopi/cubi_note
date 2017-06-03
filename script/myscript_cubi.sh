#!/bin/bash
# 0 目录设置
WORK_DIR=$(pwd)
ROOTFS_DIR=${WORK_DIR}/chroot-armhf

# 1.1 工作软件
#apt-get install build-essential libncurses5-dev u-boot-tools \
#qemu-user-static debootstrap git binfmt-support libusb-1.0-0-dev pkg-config
#apt-get install gcc-arm-linux-gnueabihf

# 1.2 源码下载（uboot，sunxi-tools，sunxi-board，linux-sunxi）
#cd ${WORK_DIR}
#git clone https://github.com/cubieboard/u-boot-sunxi.git -b cubie/sunxi
#git clone https://github.com/cubieboard/sunxi-tools.git
#git clone https://github.com/cubieboard/sunxi-boards.git
#git clone https://github.com/cubieboard/linux-sunxi.git -b cubie/sunxi-3.4

# 1.3 Debian 基础系统下载
#mkdir ${ROOTFS_DIR}
#cd ${ROOTFS_DIR}
#debootstrap --foreign --arch armhf wheezy .
#cp /usr/bin/qemu-arm-static usr/bin/
#LC_ALL=C LANGUAGE=C LANG=C chroot . /debootstrap/debootstrap --second-stage
#LC_ALL=C LANGUAGE=C LANG=C chroot . dpkg --configure -a

# ROOTFS压缩备用
#cd ${ROOTFS_DIR}
#tar jcpvf ../debian-rootfs-armhf-clean.tar.bz2 *

# 2 编译组件
# 2.1编译U-BOOT
read -p "make u-boot?(y/n):" Val
case $Val in
y|Y|$NULL)
cd ${WORK_DIR}/u-boot-sunxi
make distclean CROSS_COMPILE="ccache arm-linux-gnueabihf-"
make cubieboard2 CROSS_COMPILE="ccache arm-linux-gnueabihf-"
;;
esac

# 2.2 编译 sunxi-tools（fexc,nand-part等工具）
# cd ${WORK_DIR}/sunxi-tools
# make

# 2.3 配置、编译内核
read -p "make uImage & modules_install ?(y/n):" Val
case $Val in
y|Y|$NULL)
cd ${WORK_DIR}/linux-sunxi
# cp arch/arm/configs/sun7i_defconfig .config
make ARCH=arm menuconfig
make -j5 ARCH=arm CROSS_COMPILE="ccache arm-linux-gnueabihf-" uImage modules
;;
esac

# 3. 建立ROOTFS
echo -e "\033[34m make ROOTFS .. \033[0m"
cd ${ROOTFS_DIR}
# chroot . passwd

# 3.1 重要步骤
# echo "Cubieboard" > ${ROOTFS_DIR}/etc/hostname
# echo "127.0.0.1    Cubieboard" >> ${ROOTFS_DIR}/etc/hosts

# 内核模块安装
case $Val in
y|Y|$NULL)
cd ${ROOTFS_DIR}
echo -e "\033[34m copy uimage .. \033[0m"
cp ${WORK_DIR}/linux-sunxi/arch/arm/boot/uImage ${ROOTFS_DIR}/boot/
echo -e "\033[34m kernel modules_install .. \033[0m"
make -C ${WORK_DIR}/linux-sunxi INSTALL_MOD_PATH=${ROOTFS_DIR} ARCH=arm \
CROSS_COMPILE="ccache arm-linux-gnueabihf-" modules_install
;;
esac

# echo T0:2345:respawn:/sbin/getty -L ttyS0 115200 vt100 >> etc/inittab

# echo -e "\033[34m update source .. \033[0m"
# echo deb http://http.debian.net/debian/ wheezy main contrib non-free > etc/apt/sources.list
# echo deb http://security.debian.org/ wheezy/updates main contrib non-free >> etc/apt/sources.list
# chroot . apt-get update
# chroot . apt-get upgrade


# 3.2 可选步骤
# echo -e "\033[34m install openssh & locales .. \033[0m"
# cd ${ROOTFS_DIR}
# chroot . apt-get install openssh-server
# 安装 locales
# chroot . apt-get install locales
# echo "en_US.UTF-8 UTF-8" > etc/locale.gen
# echo "zh_CN.UTF-8 UTF-8" >> etc/locale.gen
# chroot . locale-gen

# chroot . apt-get install wireless-tools wpasupplicant firmware-ralink

# 3.3 生成内核启动参数文件
echo -e "\033[34m edit uEnv.txt .. \033[0m"
echo "mmcboot=fatload mmc 0 0x43000000 script.bin || fatload mmc 0 0x43000000 evb.bin; \
fatload mmc 0 0x48000000 uImage; if fatload mmc 0 0x43100000 uInitrd; \
then bootm 0x48000000 0x43100000; else bootm 0x48000000; fi
uenvcmd=run mmcboot
bootargs=console=ttyS0,115200 console=tty0 disp.screen0_output_mode=EDID:1280x1024p50 \
hdmi.audio=EDID:0 root=/dev/mmcblk0p1" > $ROOTFS_DIR/boot/uEnv.txt

# 3.4 生成Script.bin
cd ${ROOTFS_DIR}
# 默认fex
# cp ${WORK_DIR}/sunxi-boards/sys_config/a20/cubieboard2.fex boot/script.fex
echo -e "\033[34m fex2bin .. \033[0m"
${WORK_DIR}/sunxi-tools/fex2bin boot/script.fex boot/script.bin

# 3.5 设置网络
echo -e "\033[34m set network config .. \033[0m"
echo "# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto wlan0
iface wlan0 inet dhcp
pre-up ip link set wlan0 up
pre-up iwconfig wlan0 essid your-ap-ssid
wpa-ssid your-ap-ssid
wpa-psk your-ap-passwd" > etc/network/interfaces

# 7.创建系统镜像
read -p "creat & write image?(y/n):" Val
case $Val in
y|Y|$NULL)
cd ${WORK_DIR}
echo -e "\033[34m make image .. \033[0m"
dd if=/dev/zero of=disk.img count=2000000
losetup /dev/loop0 disk.img
dd if=/dev/zero of=/dev/loop0 bs=1k count=1024
cd ${WORK_DIR}/u-boot-sunxi
dd if=u-boot-sunxi-with-spl.bin of=/dev/loop0 bs=1024 seek=8

# 镜像文件分区
echo -e "\033[34m fdisk start .. \033[0m"
fdisk /dev/loop0 << EOF
n
p
1
 
+64M
n
p
2
 
 
w
EOF


# 写入镜像文件
cd ${WORK_DIR}
echo -e "\033[34m write image .. \033[0m"
losetup -d /dev/loop0 && losetup /dev/loop0 disk.img
losetup -o 1048576 /dev/loop1 /dev/loop0
losetup -o 68157440 /dev/loop2 /dev/loop0
mkfs.vfat /dev/loop1
mkfs.ext4 /dev/loop2
mount /dev/loop2 /mnt
mkdir /mnt/boot
mount /dev/loop1 /mnt/boot
cd ${WORK_DIR}/chroot-armhf
tar --exclude=qemu-arm-static -cf - . | tar -C /mnt -xvf -
sync && umount /mnt/boot && umount /mnt

losetup -d /dev/loop2
losetup -d /dev/loop1
losetup -d /dev/loop0
;;
esac

# 完成镜像文件制作
echo -e "\033[34m make image done! \033[0m"

# 镜像写入SD卡
read -p "write sd card?(y/n):" Val
case $Val in
y|Y|$NULL)
read -p "please type dev name(sdb/sdc/..):" Val
CARD=/dev/$Val
cd ${WORK_DIR}
echo -e "\033[34m start writing .. \033[0m"
dd if=disk.img of=$CARD bs=4k
echo -e "\033[34m write sd done! \033[0m"
;;
esac

echo -e "\033[34m Done! \033[0m"

