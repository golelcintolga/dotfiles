#!/bin/bash

#rofi_command="rofi -theme themes/scrotmenu.rasi"
rofi_command="rofi -theme /home/tolga/.config/rofi/themes/dt-center.rasi"

### Options ###
screen=" Ekranı Yakala"
area=" Bölge Seç"
window=" Pencereyi Yakala"
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; scrot
        ;;
    $area)
        scrot --line style=dash,width=3,color="red" --select
        ;;
    $window)
        sleep 1; scrot -u
        ;;
esac

