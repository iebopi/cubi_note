ifconfig eth0 192.168.1.99
ifconfig eth1 192.168.2.99

#sleep 10
chown root:root /etc/vsftpd.conf
mkdir -p /usr/share/empty
passwd << EOF
root
root
EOF
vsftpd &

mkdir -p /opt/SeedingController/config
mkdir -p /opt/SeedingController/media
chmod 777 -R /opt/SeedingController/*
cd /opt/SeedingController/
./ts_deamon &

echo "done!"

