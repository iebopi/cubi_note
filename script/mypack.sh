#!/bin/bash
### usage: mypack + [app name/dir + dest dir] ###


set -e

if [[ $1 == -m0 ]]
then
	mypackDIR=/home/CQA20Linux_Qt4.7.4_bv2_zhongdian_m0/lichee/mypack
else
	mypackDIR=/home/CQA20Linux_Qt4.7.4_bv2_zhongdian/lichee/mypack
fi

scriptVersion=1.0.5
licheeDIR=$mypackDIR/../
fexDIR=$licheeDIR/tools/pack/chips/sun7i/configs/dragonboard/wing-k8x4
rootfsDIR=$licheeDIR/buildroot/target/dragonboard/rootfs
autorunDIR=$rootfsDIR/../extra
appVersionFile=$rootfsDIR/opt/Release/version
uiVersionFile=$rootfsDIR/opt/Release/UI/versionUI
imgDIR=$licheeDIR/tools/pack
currentDIR=$(pwd)
ReleaseNotZip=true

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
		if [ -f $file ] && [[ $file != *~ ]] && [[ $file != *.md ]]
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
mkdir -p $mypackDIR

# creat opt link
if [ ! -d $mypackDIR/opt ]
then
	ln -s $rootfsDIR/opt $mypackDIR/opt
fi

# creat a link to this script
if [[ $0 == *.sh ]]
then
	echo "creat hard link done!"
	rm /usr/bin/mypack || echo "continue.."
	ln $0 /usr/bin/mypack
fi

appVersion=$(cat $appVersionFile) || echo "app version file not exist!"
uiVersion=$(cat $uiVersionFile) || echo "ui version file not exist!"
Warn "app version=$appVersion"
Warn "ui version=$uiVersion"
# Upate App
if [ -d $APP ] && [[ $2 == "" ]] && [[ -f $currentDIR/SHScreen ]]
then
	Info "Update App?"
	echo -e "0. not Update\n1. Upate App to Image\n2. Upate App to Relsease.zip\n3. Upate to All\n4. Exit"
	read -p "Please Type Your choice(default:0):" updateVal
	if [[ $updateVal == 4 ]]
	then
		exit 0
	elif [[ $updateVal == 0 ]] || [[ $updateVal == "" ]] 
	then
		echo "not Update App."
	else
		read -p "Please Type appVersion:" appVersion
		read -p "Please Type uiVersion:" uiVersion
		rm -rf $currentDIR/Release*
		rm -rf $currentDIR/UI.zip
		sync
		mkdir -p $currentDIR/Release
		cp -R $currentDIR/UI/ $currentDIR/Release
		cp $currentDIR/SHScreen $currentDIR/Release
		echo $appVersion > $currentDIR/Release/version
		echo $uiVersion > $currentDIR/Release/UI/versionUI
		
		if [[ $updateVal == 1 ]] || [[ $updateVal == 3 ]]
		then
			rm -rf $rootfsDIR/opt/Release/*
			cp -R $currentDIR/Release $rootfsDIR/opt
		fi
		
		if [[ $updateVal == 2 ]] || [[ $updateVal == 3 ]]
		then
			if [[ $ReleaseNotZip == false ]]
			then
				cd $currentDIR/
				zip -r $currentDIR/UI.zip UI/
				mkdir -p $mypackDIR/UI
				cp $currentDIR/UI.zip $mypackDIR/UI/UI-$uiVersion-$(date +%Y%m%d).zip
				zip -r $currentDIR/Release.zip Release/
				mkdir -p $mypackDIR/Release
				cp $currentDIR/Release.zip $mypackDIR/Release/Release-$appVersion-$(date +%Y%m%d).zip
			else
				cd $currentDIR
				zip -r $currentDIR/Release-$appVersion-$(date +%Y%m%d).zip Release/
				mkdir -p $mypackDIR/Release/Release-$appVersion-$(date +%Y%m%d)/
				cp -R $currentDIR/Release* $mypackDIR/Release/Release-$appVersion-$(date +%Y%m%d)/
			fi
			
			Warn "Release.zip is generated at $mypackDIR/Release"
		fi

		if [[ $updateVal == 2 ]]
		then
			nautilus $mypackDIR/Release
			exit 0
		fi
		
	fi
elif [[ $2 != "" ]]
then
	read -p "Copy files to rootfs/opt?(Y/n):" Val
	if [[ $Val == Y ]] || [[ $Val == y ]] || [[ $Val == "" ]]
	then
		if [[ $2 != "" ]] && [ ! -d $rootfsDIR/opt/$2 ]
		then
			Warn "cannot find folder: $rootfsDIR/opt/$2"
			exit 0
		fi

		if [[ $1 != "" ]]
		then
			mkdir -p $rootfsDIR/opt
			cp -R $APP $rootfsDIR/opt/$2
			echo "$APP has been copied!"
		fi
	fi
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

# image
cd $imgDIR
mv *.img linux-$appVersion-$(date +%Y%m%d).img
nautilus $imgDIR
echo -e "Final Image: $imgDIR/linux-$appVersion-$(date +%Y%m%d).img"  
Info "Done!"


