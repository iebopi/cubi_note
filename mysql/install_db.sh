# extend swap
#sudo dd if=/dev/zero of=/2GB_1.swap bs=1G count=2
#sudo mkswap /2GB_1.swap
#sudo swapon /2GB_1.swap

PORT = 13306

sudo yum -y remove mariadb*
sudo yum -y install autoconf
mkdir -p logs
firewall-cmd --zone=public --add-port=$PORT/tcp --permanent
systemctl stop firewalld.service
./scripts/mysql_install_db --defaults-file=my.cnf
./bin/mysqld_safe --defaults-file=my.cnf &
./bin/mysql -uroot -h127.0.0.1 -P$PORT << EOF
 use mysql;
 update user set password=password('pi1415') where user='root' and host='localhost';
 grant all privileges on *.* to root@"%" identified by 'pi1415' with grant option;
 flush privileges;
EOF

./bin/mysql -uroot -h127.0.0.1 -P$PORT -ppi1415 < "creat_db1.sql"

