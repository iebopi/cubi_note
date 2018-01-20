#!/bin/bash

set -e

scriptVersion=1.0.3
mypackDIR=/home/CQA20Android4.4_bv2_v1.2/lichee/mypack
fexDIR=/home/CQA20Android4.4_bv2_v1.2/lichee/tools/pack/chips/sun7i/configs/android/wing-k8x4
imgVersionFile=$mypackDIR/version

if [[ $1 == -v ]]
then
	echo -e "version=$scriptVersion"
	exit 0
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

###################################
# link
if [[ $0 == *.sh ]]
then
	rm /usr/bin/mypack_android
	ln $0 /usr/bin/mypack_android
	echo "create hard link done!"
fi

read -p "open mypack window?(Y/n):" Val
if [[ $Val == Y ]] || [[ $Val == y ]]
then
	nautilus $mypackDIR
fi
# fex
selectConfig fex $fexDIR/sys_config.fex

#if [ ! -f $imgVersionFile ]
#then
	read -p "please type image version:" imgVersion
	echo $imgVersion > $imgVersionFile
#else
#	imgVersion=$(cat $imgVersionFile)
#fi

Info "build option (default:0)"
echo -e "0. not build\n1. build linux only\n2. build android only\n3. build all"
read -p "Please Type Your Choice:" ValBuild

cd $mypackDIR/../
if [[ $ValBuild == 1 ]] || [[ $ValBuild == 3 ]]
then
	./build_android.sh
fi
cd ../android
source build/envsetup.sh
lunch <<EOF
9
EOF
extract-bsp
rm ../lichee/tools/pack/*.img || echo "img has been removed!"
if [[ $ValBuild == 2 ]] || [[ $ValBuild == 3 ]]
then
make -j4
fi
pack
sync
cd ../lichee/tools/pack
mv *.img android4.4-$imgVersion-$(date +%Y%m%d-%H%M).img
echo -e "Final Image: android4.4-$imgVersion-$(date +%Y%m%d-%H%M).img"
nautilus .

echo -e "Done!"
