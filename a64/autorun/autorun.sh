#!/bin/sh

source script_parser.sh

if [ ! -d /system/vendor/ ]; then
    mkdir -p /system/vendor/
    ln -s /lib/modules/`uname -r`/ /system/vendor/modules

if [ ! -d /system/etc/ ]; then
    mkdir -p /system/etc/
    ln -s /dragonboard/bin/hawkview /system/etc/hawkview
fi
    ln -s /boot/*.hcd /system/vendor/modules/
    ln -s /boot/*.bin /system/vendor/modules/
    ln -s /boot/*.txt /system/vendor/modules/
fi

# mdev
echo "Starting mdev..."
echo /sbin/mdev >/proc/sys/kernel/hotplug
/sbin/mdev -s

#Before insmod disp.ko need to insmod sunxi_tr.ko first
insmod /lib/modules/`uname -r`/sunxi_tr.ko
if [ $? -ne 0 ]; then
	echo "insmod /lib/modules/`uname -r`/sunxi_tr.ko failed"
fi

#camera
insmod /lib/modules/`uname -r`/videobuf2-dma-contig.ko
insmod /lib/modules/`uname -r`/vfe_io.ko
insmod /lib/modules/`uname -r`/ov5640.ko
insmod /lib/modules/`uname -r`/gc0308.ko
insmod /lib/modules/`uname -r`/gc2035.ko
insmod /lib/modules/`uname -r`/vfe_v4l2.ko

#wifi
insmod /lib/modules/`uname -r`/8188eu.ko
insmod /lib/modules/`uname -r`/8723bs.ko

#ethernet
insmod /lib/modules/`uname -r`/usbnet.ko
insmod /lib/modules/`uname -r`/asix.ko

ROOT_DEVICE="/dev/mmcblk0p7"
for parm in $(cat /proc/cmdline); do
    case $parm in
        root=*)
            ROOT_DEVICE=`echo $parm | awk -F\= '{print $2}'`
            ;;
    esac
done

# install nand driver if we boot from sdmmc
nand_activated=`script_fetch "nand" "activated"`
echo "nand activated #$nand_activated"
if [ $nand_activated -eq 1 ]; then
    case $ROOT_DEVICE in
        /dev/mmc*)
      
        nand_module_path=`script_fetch "nand" "module_path"`
        if [ -n "$nand_module_path" ]; then
            insmod "$nand_module_path"
       fi
            ;;
    esac

fi

#insmod sw-key driver
key_module_path=`script_fetch "key" "module_path"`
insmod "$key_module_path"

# insmod ir driver
ir_activated=`script_fetch "ir" "activated"`
if [ $ir_activated -eq 1 ]; then
    ir_module_path=`script_fetch "ir" "module_path"`
    if [ -n "$ir_module_path" ]; then
        insmod "$ir_module_path"
    fi
fi

if [ ! -d /data/misc/dmt/ ]; then
    mkdir -p /data/misc/dmt/
fi

# run wifi
#wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf &
if [ ! -e /etc/wpa.conf ]
then
	wpa_passphrase TP-Jon_Snow 708708708 > /etc/wpa.conf
fi
wpa_supplicant -i wlan0 -B -c /etc/wpa.conf
#ifconfig wlan0 192.168.3.250
udhcpc -i wlan0 -q -t 3 -A 10 &


# eth
ifconfig eth0 up
ifconfig eth0 192.168.1.67

# lo
ifconfig lo 127.0.0.1 up

# run qt
#cd /opt/Trolltech/examples/svg/embedded/fluidlauncher
#./fluidlauncher &

cd /opt
chmod 777 /opt/*
./A20Player.elf &
./clientprocess 30 0 0 1920 1080 1 ./media/ 1 &

# nfs
sleep 30 && mount -t nfs -o nolock 192.168.80.59:/share /mnt &

# run dragonboard core process
#core &
