#!/bin/bash

# ifconfig
InIP = $(xmllint --xpath "//Root/OutIP/text()" /opt/SeedingController/config/bootConfig.xml)
OutIP = $(xmllint --xpath "//Root/InIP/text()" /opt/SeedingController/config/bootConfig.xml)
ifconfig eth0 $InIP
ifconfig eth1 $OutIP
sed -i '/ifconfig eth0/c\ifconfig eth0 $InIP' /autorun.sh
sed -i '/ifconfig eth1/c\ifconfig eth1 $OutIP' /autorun.sh

# tsmux
cd /opt/SeedingController/
pkill ts_deamon
pkill tsmuxer-arm
./ts_deamon &
