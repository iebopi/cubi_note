#!/bin/bash
### usage: mypack + [app name/dir] + [dest dir] ###


set -e
scriptVersion=1.0.0
mypackDIR=/home/CQA20Linux_Qt4.7.4_bv2_zhongdian/lichee/mypack
licheeDIR=$mypackDIR/../
fexDIR=$licheeDIR/tools/pack/chips/sun7i/configs/dragonboard/wing-k8x4
rootfsDIR=$licheeDIR/buildroot/target/dragonboard/rootfs
autorunDIR=$rootfsDIR/../extra
appVersionFile=$rootfsDIR/opt/Release/version
imgDIR=$licheeDIR/tools/pack

if [[ $1 == -v ]]
then
	echo "version=$scriptVersion";exit 0
# app path
elif [[ $1 == /* ]] || [[ $1 == ~/* ]]
then
	APP=$1
else
	APP=$(pwd)/$1
fi

function listFile()
{
	echo -e "\033[47;30m All Valid Items: \033[0m"
	i=1
	for file in *
	do
		if [ -f $file ] && [[ $file != *~ ]]
		then
			
			echo -e "$i. \c"
			echo "$file"
			arry[i]=$file
			let "i+=1"
		fi
	done
	
	read -p "Please Type Your Choice:" Val
	ret=${arry[$Val]}
}

function Info()
{
	echo -e "\033[47;30m $1 \033[0m"
}

function Warn()
{
	echo -e "\033[33m $1 \033[0m"
}

# select config from mypack folder
function selectConfig()
{
	if [ ! -d $1 ]
	then
		mkdir -p $mypackDIR/$1
	fi

	cd $mypackDIR/$1
	Info "$1--\c"
	listFile
	if [ "$ret" = "" ];
	then
		Warn "not select,use last config!"
	else
		cp $ret $2
	fi
}

#########################################
# creat opt link
if [ ! -d $mypackDIR/opt ]
then
	ln -s $rootfsDIR/opt $mypackDIR/opt
fi

# creat a link to this script
if [ ! -f /usr/bin/mypack ]
then
	ln $0 /usr/bin/mypack
fi

read -p "open mypack window?(Y/n):" Val
if [[ $Val == Y ]] || [[ $Val == y ]]
then
	nautilus $mypackDIR
fi
# fex
selectConfig fex $fexDIR/sys_config.fex

# autorun
selectConfig autorun $autorunDIR/autorun.sh

# cp app to opt dir
appVersion=$(cat $appVersionFile) || read -p "Please Type app version:" appVersion
if [[ $2 != "" ]] && [ ! -d $rootfsDIR/opt/$2 ]
then
	Warn "cannot find folder: $rootfsDIR/opt/$2"
	exit 0
fi

if [[ $1 != "" ]]
then
	mkdir -p $rootfsDIR/opt
	cp -R $APP $rootfsDIR/opt/$2
fi

# pack
cd $licheeDIR
rm $licheeDIR/tools/pack/*.img || echo "img has removed."
./build_dragonboard.sh
./build_pack.sh <<EOF
0
0
2
EOF
sync

# rename image
cd $imgDIR
mv *.img sun7i_linux_qt4.7-$appVersion.img
nautilus $imgDIR
echo -e "Final Image: $imgDIR/sun7i_linux_qt4.7-$appVersion.img"  
Info "Done!"


