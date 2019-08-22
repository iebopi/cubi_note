sudo yum -y remove mariadb*
sudo yum -y install autoconf
mkdir -p logs
firewall-cmd --zone=public --add-port=13306/tcp --permanent
# systemctl stop firewalld.service
./scripts/mysql_install_db --defaults-file=my.cnf
./bin/mysqld_safe --defaults-file=my.cnf &
#./bin/mysql -uroot -h127.0.0.1 -P13306
# use mysql;
# update user set password=password('pi1415') where user='root' and host='localhost';
# grant all privileges on *.* to root@"%" identified by 'pi1415' with grant option;
# flush privileges;

