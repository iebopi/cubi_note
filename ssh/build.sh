#!/bin/bash

set -e

sudo mv /usr/bin/pod2man /usr/bin/pod2man_bak || echo "ignore."
WORK_DIR=$(pwd)
CROSS=arm-linux-gnueabihf-

mkdir -p ./_install/openssh
mkdir -p ./_install/openssl
mkdir -p ./_install/zlib

tar -xvf *openssh*.tar*
tar -xvf *openssl*.tar*
tar -xvf *zlib*.tar*

cd ${WORK_DIR}/*zlib*
sed -i 's/CC=cc/CC='$CROSS'gcc/g' Makefile
sed -i 's/AR=ar/AR='$CROSS'ar/g'  Makefile
sed -i 's/prefix = \/usr\/local/prefix = ..\/_install\/zlib/g'  Makefile
make && make install

cd ${WORK_DIR}/*openssl*
./Configure --prefix=${WORK_DIR}/_install/openssl os/compiler:${CROSS}gcc
make && make install || echo "continue..."

cd ${WORK_DIR}/*openssh*
./configure --host=arm-linux --with-libs --with-zlib=${WORK_DIR}/_install/zlib/ --with-ssl-dir=${WORK_DIR}/_install/openssl/ --disable-etc-default-login CC=${CROSS}gcc AR=${CROSS}ar
make

mkdir -p ${WORK_DIR}/_install/openssh/usr/local/
mkdir -p ${WORK_DIR}/_install/openssh/usr/local/etc/
mkdir -p ${WORK_DIR}/_install/openssh/usr/libexec/
mkdir -p ${WORK_DIR}/_install/openssh/usr/sbin/
mkdir -p ${WORK_DIR}/_install/openssh/usr/local/bin/
cp scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan ${WORK_DIR}/_install/openssh/usr/local/bin/
cp moduli ssh_config sshd_config ${WORK_DIR}/_install/openssh/usr/local/
cp moduli ssh_config sshd_config ${WORK_DIR}/_install/openssh/usr/local/etc/
cp sftp-server ssh-keysign ${WORK_DIR}/_install/openssh/usr/libexec/
cp sshd ${WORK_DIR}/_install/openssh/usr/sbin/
chmod 777 ${WORK_DIR}/_install/openssh/usr/local/bin/*
chmod 777 ${WORK_DIR}/_install/openssh/usr/sbin/*

ssh-keygen -t rsa -f ssh_host_rsa_key -N ""
ssh-keygen -t dsa -f ssh_host_dsa_key -N ""
ssh-keygen -t ecdsa -f ssh_host_ecdsa_key -N ""
ssh-keygen -t dsa -f ssh_host_ed25519_key -N ""
chmod 600 ssh_host_ed25519_key
cp ssh_host_* ${WORK_DIR}/_install/openssh/usr/local/etc/

echo "openssh_install is at _install/openssh/"
echo "Please append 'sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin' to /etc/passwd"
echo "Please enable PermitRootLogin yes at /usr/local/sshd_config"
echo "Please add root password"
echo "exe sshd: /usr/sbin/sshd"
echo -e "Done!\n"
sudo mv /usr/bin/pod2man_bak /usr/bin/pod2man || echo "ignore."

