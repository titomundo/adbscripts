#!/bin/bash

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
#   "com.android.vending" //// PLAYSTORE 
    "com.motorola.ccc.notification"
    "com.motorola.securityhub"
    "com.google.android.apps.nbu.files"
    "com.motorola.help"
    "com.android.wallpaper.livepicker"
    "com.motorola.demo"
    "com.motorola.timeweatherwidget"
    "com.motorola.securevault"
    "com.google.android.as"
    "com.google.android.projection.gearhead"
    "com.google.android.safetycore"
    "com.blackout.word"
    "com.LoopGames.Domino"
    "com.soulcompany.bubbleshooter.relaxing"
    "com.einnovation.temu"
    "com.zhiliaoapp.musically"
    "com.block.juggle"
    "com.dti.motorola"
    "com.facebook.katana"
    "com.google.android.apps.restore"
    "com.google.android.as.oss"
    "com.google.android.partnersetup"
    "com.taboola.ody"
)

print_menu() {
    echo 
    echo "[1] Enable apps"
    echo "[2] Disable apps"
    echo "[3] Install apps"
    echo "[4] Uninstall apps"
    echo "[5] Exit"
    echo
}

print_apps() {
    for i in "${arr[@]}"
    do
        echo "$i"
    done
}

enable_apps() {
    echo "This will ENABLE the following apps: "
    print_apps
    echo  "Do you want to continue? (y, n)"

    in=""
    read in

    if [ "$in" = "y" ]
    then
        for i in "${arr[@]}"
        do
            adb shell pm enable "$i"
        done
    fi
}

disable_apps() {
    echo "This will DISABLE the following apps: "
    print_apps
    echo  "Do you want to continue? (y, n)"

    in=""
    read in

    if [ "$in" = "y" ]
    then
        for i in "${arr[@]}"
        do
            adb shell pm disable-user --user 0 "$i"
        done
    fi
}

install_apps() {
    echo "This will INSTALL the following apps: "
    print_apps
    echo  "Do you want to continue? (y, n)"

    in=""
    read in

    if [ "$in" = "y" ]
    then
        for i in "${arr[@]}"
        do
            echo "Installing: "$i""
            adb shell pm install-existing "$i"
        done
    fi
}

uninstall_apps() {
    echo "This will UNINSTALL the following apps: "
    print_apps
    echo  "Do you want to continue? (y, n)"

    in=""
    read in

    if [ "$in" = "y" ]
    then
        for i in "${arr[@]}"
        do
            echo "Uninstalling: "$i""
            adb shell pm uninstall -k --user 0 "$i"
        done
    fi
}

echo "-> ADB SCRIPT TOOL"
user_input=""

while :
do
    print_menu
    read user_input
    case $user_input in
        1)
            enable_apps
            ;;
        2)
            disable_apps
            ;;
        3)
            install_apps
            ;;
        4) 
            uninstall_apps
            ;;
        5)
            echo "bye"
            break
            ;;
        *)
            echo "select another option"
            ;;
    esac
done
