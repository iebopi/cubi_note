# !/bin/bash
read -p "apt update?" Val
case $Val in
Y/y)
apt-get update
;;
esac

read -p "bsp install?" Val
case $Val in
Y|y)
apt-get install -y vim
apt-get install -y libncurses5-dev
apt-get install -y g++
apt-get install -y git
apt-get install -y nfs-kenrel-server
apt-get install -y nfs-kernel-server

apt-get install -y git-core
apt-get install -y gnupg
apt-get install -y flex
apt-get install -y bison
apt-get install -y gperf
apt-get install -y build-essential
apt-get install -y zip
apt-get install -y curl
apt-get install -y zlib1g-dev
apt-get install -y gcc-multilib
apt-get install -y g++-multilib
apt-get install -y libc6-dev-i386
apt-get install -y lib32ncurses5-dev
apt-get install -y ia32-libs

apt-get install -y x11proto-core-dev
apt-get install -y libx11-dev
apt-get install -y lib32readline5-dev
apt-get install -y lib32readline5-gplv2-dev
apt-get install -y lib32readline-gplv2-dev
apt-get install -y lib32z-dev

apt-get install -y mkimage*
apt-get install -y sun-java6-jdk
apt-get install -y sun-java6-jdk

apt-get update deb http://us.archive.ubuntu.com/ubuntu/ hardy multiverse
apt-get install -y openjdk-6-jdk
apt-get install -y xsltproc
apt-get install -y picocom
apt-get install -y ccache


sudo apt-get install -y ia32-libs
sudo apt-get install -y ncurses-dev
sudo apt-get install -y build-essential git u-boot-tools
sudo apt-get install -y texinfo texlive ccache zlib1g-dev gawk bison flex gettext uuid-dev
sudo apt-get install -y build-essential u-boot-tools uboot-mkimage
sudo apt-get install -y binutils-arm-linux-gnueabihf gcc-arm-linux-gnueabi
sudo apt-get install -y gcc-arm-linux-gnueabihf cpp-arm-linux-gnueabihf
sudo apt-get install -y libusb-1.0-0 libusb-1.0-0-dev
sudo apt-get install -y git wget fakeroot kernel-package zlib1g-dev libncurses5-dev
;;
esac

#修改默认gcc为gcc-4.8
read -p "ubuntu 16.04 or later?(Y/n):" Val
case $Val in
Y|y)
sudo apt-get install gcc-4.8
sudo apt-get install gcc-4.8-arm-linux-gnueabihf
sudo apt-get install gcc-4.7-arm-linux-gnueabi
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100
sudo update-alternatives --config gcc
sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-4.8 100
sudo update-alternatives --config arm-linux-gnueabihf-gcc
sudo update-alternatives --install /usr/bin/arm-linux-gnueabi-gcc arm-linux-gnueabi-gcc /usr/bin/arm-linux-gnueabi-gcc-4.7 100
sudo update-alternatives --config arm-linux-gnueabi-gcc
;;
esac

ls /usr/bin/*gcc*
gcc -v
arm-linux-gnueabihf-gcc -v
arm-linux-gnueabi-gcc -v

read -p "update windows time?(Y/n):" Val
case $Val in
Y|y)
sudo apt-get install -y ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc
;;
esac

read -p "useful tools install?" Val
case $Val in
Y|y)
sudo add-apt-repository ppa:notepadqq-team/notepadqq
sudo apt-get update
sudo apt-get install notepadqq
;;
esac

echo "DONE!"
