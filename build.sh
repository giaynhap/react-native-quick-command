#!/bin/bash

SOURCE="`pwd`/"
if [ ! -f "$SOURCE$1/android/local.properties" ] ; then
	echo  "sdk.dir = $ANDROID_HOME">"$SOURCE$1/android/local.properties"
fi

cd $SOURCE$1/android
./gradlew assembleRelease