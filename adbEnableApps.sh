#!/bin/bash
#
declare -a arr=(
    "com.google.android.youtube"
    "com.google.android.apps.youtube.music"
    "com.android.chrome"
    "com.google.android.apps.docs"
    "com.google.android.calendar"
    "com.google.android.gm"
    "com.google.android.googlequicksearchbox"
    "com.google.android.apps.subscriptions.red"
    "com.google.android.apps.tachyon"
    "com.google.android.videos"
    "com.motorola.gamemode"
    "com.google.android.apps.googleassistant"
    "com.android.vending"
    "com.motorola.ccc.notification"
    "com.motorola.securityhub"
    "com.google.android.apps.nbu.files"
)

for i in "${arr[@]}"
do
    #echo "$i"
    adb shell pm enable "$i"
done
