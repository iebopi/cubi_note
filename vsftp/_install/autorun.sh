ipEth0=$(xmllint --xpath "//Root/InIP/text()" /opt/SeedingController/config/bootConfig.xml)
ipEth1=$(xmllint --xpath "//Root/OutIP/text()" /opt/SeedingController/config/bootConfig.xml)
macEth1=$(xmllint --xpath "//Root/OutMac/text()" /opt/SeedingController/config/bootConfig.xml)
if [[ $ipEth0 = "" ]]; then ipEth0=192.168.1.99; fi
if [[ $ipEth1 = "" ]]; then ipEth1=192.168.2.99; fi

ifconfig eth1 down
if [[ $macEth1 = "" ]]; then macEth1=D6:53:5D:EE:EE:EE; fi
ifconfig eth1 hw ether ${macEth1}
ifconfig eth1 up

ifconfig eth0 $ipEth0
ifconfig eth1 $ipEth1

route add default gw ${ipEth0%.*}.1 dev eth0
route add default gw ${ipEth1%.*}.1 dev eth1

passwd << EOF
root
root
EOF

# vsftp
chmod 777 /autorun_vsftp.sh
/autorun_vsftp.sh

# ssh
chmod 777 /autorun_ssh.sh
/autorun_ssh.sh

# rs485 enable
rm /var/lock/* -r
echo 130 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio130/direction
echo 0 > /sys/class/gpio/gpio130/value
#/opt/uart/uart_app /dev/ttySAC2 -b 19200 -l -r -hex

# update system patch
if [ -f /opt/SeedingController/*_patch.tar* ]
then
	tar -xvf /opt/SeedingController/*_patch.tar* -C /
	rm /opt/SeedingController/*_patch.tar*
	chmod 777 /*.sh
	chmod 777 /etc/init.d/*
fi

# update seedingCtrl
if [ -f /opt/SeedingController/ts_*.zip ]
then
	unzip -o /opt/SeedingController/ts_*.zip -d /opt/SeedingController/
	rm /opt/SeedingController/ts_*.zip
fi

mkdir -p /opt/SeedingController/config
mkdir -p /opt/SeedingController/media
chmod 777 -R /opt/SeedingController/*
cd /opt/SeedingController/
./ts_deamon > /dev/null &

sync
echo "done!"

