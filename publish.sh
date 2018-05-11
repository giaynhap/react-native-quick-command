#!/bin/bash
# Author: Giay Nhap [BASH SIGN + ZIPALIGN APK FILE]
AUTHOR="\e[1;32m[giaynhap]\e[0m"
SOURCE="`pwd`/"
## Yeu cau cai dat ANDROID SDK ( config ANDROID_HOME)
##                 SDK 8 co chua jarsigner 
##
##################################################################
#############               CONFIG O DAY             #############
##################################################################
### Phien ban sdk su dung3
	SDK_VERSION="23.0.1"
### Duong dan den file Key
	KEYSTORE="./giaynhapcommandtools/my-release-key.keystore"
### Mat khau cua key
	KEYPASS="password"
### Neu bao chua khai bao ANDROID HOME THI bao vao day
#	ANDROID_HOME=
### Thu muc chua file output
	OUTFOLDER="$SOURCE/output"
###################################################################
##########
##########
####################### TOOL CONFIG ###############################

jarsigner="jarsigner"
zipalign="$ANDROID_HOME/build-tools/$SDK_VERSION/zipalign"

###################### BODY SCRIPT #################################
FILE="${1//[\/\\\.]/}"
ANDOIRD_APK_OUT="$SOURCE$FILE/android/app/build/outputs/apk/app-release-unsigned.apk"
OUTFILE="$OUTFOLDER/$FILE.apk"

if [ -z "$ANDROID_HOME" ]; then
	 echo -e "\n$AUTHOR \e[1;31m ANDROID_HOME\e[0m chua duoc khai bao"
	 exit 1
fi

if [ ! -f "$ANDOIRD_APK_OUT" ]; then
    echo -e "\n$AUTHOR Khong tim thay file apk trong project \e[1;31m$FILE\e[0m. \n \e[0;33m> Ban co go dung ten project ??? \n > Ban da build project ??? \n"
    exit 1
fi

mkdir $OUTFOLDER;

echo -e "\n$AUTHOR Sign file: \e[1;31m$ANDOIRD_APK_OUT\e[0m"
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $KEYSTORE  $ANDOIRD_APK_OUT alias_name -storepass $KEYPASS
echo -e "\n$AUTHOR Zipalign:   \e[1;31m$ANDOIRD_APK_OUT\e[0m"

$zipalign -f -v 4 "$ANDOIRD_APK_OUT" "$OUTFILE"

if [ ! -f "$OUTFILE" ]; then
    echo -e "\n$AUTHOR Khong output \e[1;31m$OUTFILE\e[0m. \n \e[0;33m> /!\ TIEN TRINH THAT BAI \e[0;m\n"
    exit 1
fi
echo -e "\n$AUTHOR  TIEN TRINH HOAN THANH \n \t \e[1;31m$OUTFILE\e[0m"
