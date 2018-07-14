#!/bin/bash

version=1.0.1

# partition size in MB
BOOTLOAD_RESERVE=8
BOOT_ROM_SIZE=50
PATCH_SIZE=$(du -m ./patch --max-depth=0 | awk '{print int($1)}')
SYSTEM_ROM_SIZE=`expr 512 + ${PATCH_SIZE}`
CACHE_SIZE=512
RECOVERY_ROM_SIZE=8
VENDER_SIZE=8
MISC_SIZE=8

boot_partition=2
images_partition=1
WORK_DIR=`pwd`

help() {

bn=`basename $0`
cat << EOF
usage $bn <option> device_node

options:
  -h        displays this help message
  -s        only get partition size
  -np         not partition.
  -f        flash android image.
EOF

}

# check the if root?
userid=`id -u`
if [ $userid -ne "0" ]; then
  echo "you're not root?"
  exit
fi

echo -e "version=${version}"
echo -e "patch size: ${PATCH_SIZE}"

# parse command line
moreoptions=1
node="na"
cal_only=0
flash_images=1
not_partition=0
cp_images=0
not_format_fs=0
while [ "$moreoptions" = 1 -a $# -gt 0 ]; do
  case $1 in
      -h) help; exit ;;
      -s) cal_only=1 ;;
      -f) flash_images=1 ;;
      -c) cp_images=1 ;;
      -np) not_partition=1 ;;
      -nf) not_format_fs=1 ;;
      *)  moreoptions=0; node=/dev/loop0 ;;
  esac
  [ "$moreoptions" = 0 ] && [ $# -gt 1 ] && help && exit
  [ "$moreoptions" = 1 ] && shift
done

if [ ! -e ${node} ]; then
  node=/dev/loop0
fi


# call sfdisk to create partition table
# get total card size
seprate=40
total_size=`expr ${SYSTEM_ROM_SIZE}`
image_rom_sizeb=`expr ${total_size} - ${BOOT_ROM_SIZE} - ${BOOTLOAD_RESERVE}`
image_rom_sizeb_byte=`expr ${image_rom_sizeb} \* 1024 \* 1024`
image_rom_sizeb_byte_offset=`expr ${image_rom_sizeb_byte} + 1048576`

# create partitions
if [ "${cal_only}" -eq "1" ]; then
cat << EOF
total :          ${total_size}MB
image_rom_sizeb: ${image_rom_sizeb}MB
EOF
exit
fi

function format_android
{
    echo "formating android images"
    #umount ${node}${images_partition}
    #umount ${node}${boot_partition}
    losetup -o 1048576 /dev/loop1 /dev/loop0
    losetup -o ${image_rom_sizeb_byte_offset} /dev/loop2 /dev/loop0
    mkfs.vfat /dev/loop1
    mkfs.vfat /dev/loop2
}
function copy_images
{
    echo "cp images..."
    mkdir -p mountpoint
    umount mountpoint
#    dd if=/dev/zero of=${node}${boot_partition} bs=512 count=2
#	sync
    mount -t vfat /dev/loop2 mountpoint || exit 
    rm -rf mountpoint/*
    sync
    cp imx6q-sabresd.dtb mountpoint/. ||  exit 
    cp download.img mountpoint/. ||  exit 
#    cp u-boot.bin mountpoint/.
#    cp boot.img mountpoint/.
#    cp system.img mountpoint/.
#    cp recovery.img mountpoint/.
    sync
    umount mountpoint
    rm -rf mountpoint/*
}

function flash_android
{
if [ "${flash_images}" -eq "1" ]; then
    echo "flashing android images..."    
    #dd if=/dev/zero of=${node} bs=512 seek=1536 count=16
    dd if=/dev/zero of=${node} bs=512 seek=1024 count=16
    dd if=u-boot_for_download.bin of=${node} bs=512 seek=2
#    dd if=imx6q-sabresd.dtb of=${node}${boot_partition} bs=512 seek=2
#    dd if=download.img of=${node}${boot_partition} bs=512 seek=2048
#    dd if=download.img of=${node}${boot_partition}
    sync
fi
}

if [ "${cp_images}" -eq "1" ]; then
	umount ${node}${images_partition}
    umount ${node}${boot_partition}
	copy_images
	exit
fi

if [[ "${not_partition}" -eq "1" && "${flash_images}" -eq "1" ]] ; then
    flash_android
    exit
fi

# creat loop img
umount /dev/loop1
umount /dev/loop2
losetup -d /dev/loop1
losetup -d /dev/loop2
losetup -d /dev/loop0
dd if=/dev/zero of=imx_disk.img bs=1k count=`expr ${SYSTEM_ROM_SIZE} \* 1024`
sync
losetup /dev/loop0 imx_disk.img || exit

# destroy the partition table
dd if=/dev/zero of=${node} bs=512 count=2
sync
partprobe
fdisk ${node} << EOF
n
p
1

+${image_rom_sizeb}M
n
p
2


w
EOF

# adjust the partition reserve for bootloader.
# if you don't put the uboot on same device, you can remove the BOOTLOADER_ERSERVE
# to have 8M space.
# the minimal sylinder for some card is 4M, maybe some was 8M
# just 8M for some big eMMC 's sylinder

# format the SDCARD/DATA/CACHE partition
part=""
echo ${node} | grep mmcblk > /dev/null
if [ "$?" -eq "0" ]; then
  part="p"
fi

format_android
copy_images
flash_android

#backup rootfs.tar
cp ${WORK_DIR}/images/rootfs.tgz ${WORK_DIR}/

# update imx update files
echo "update imx update files"
sync
rm -rf ${WORK_DIR}/rootfs
if [ -d ${WORK_DIR}/patch ]
then
	mkdir -p ${WORK_DIR}/rootfs
	tar -xvf ${WORK_DIR}/images/rootfs.tgz -C ${WORK_DIR}/rootfs || exit
	#cp ${WORK_DIR}/patch/autorun.sh ${WORK_DIR}/rootfs
	#tar -xvf ${WORK_DIR}/patch/vsftp_install.tar -C ${WORK_DIR}/rootfs
	#tar -xvf ${WORK_DIR}/patch/ssh_install.tar -C ${WORK_DIR}/rootfs
	cp -r ${WORK_DIR}/patch/* ${WORK_DIR}/rootfs/

	chmod 777 ${WORK_DIR}/rootfs/*.sh
	chmod 777 ${WORK_DIR}/rootfs/etc/init.d/*
	rm ${WORK_DIR}/images/rootfs.tgz
	tar -zcvf ${WORK_DIR}/images/rootfs.tgz -C ${WORK_DIR}/rootfs/ .
	sync
	#rm -rf ${WORK_DIR}/rootfs/
fi

# cp imx update files
echo "copy imx update files"
mkdir -p mountpoint
mount -t vfat /dev/loop1 mountpoint || exit
cp -r images/ mountpoint/
sync
umount mountpoint
rm -rf mountpoint

# restore rootfs
mv ${WORK_DIR}/rootfs.tgz ${WORK_DIR}/images/rootfs.tgz

# umount & losetup release
sync
#umount /dev/loop1
#umount /dev/loop2
losetup -d /dev/loop1
losetup -d /dev/loop2
losetup -d /dev/loop0
echo -e "success!"
# For MFGTool Notes:
# MFGTool use mksdcard-android.tar store this script
# if you want change it.
# do following:
#   tar xf mksdcard-android.sh.tar
#   vi mksdcard-android.sh 
#   [ edit want you want to change ]
#   rm mksdcard-android.sh.tar; tar cf mksdcard-android.sh.tar mksdcard-android.sh

