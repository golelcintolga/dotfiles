#!/usr/bin/env sh
arka_resim=0188.jpg
sessiz=$(pamixer --get-mute)
greenclip daemon &
/usr/bin/numlockx on &
feh --bg-fill /home/tolga/Resimler/Wallpaper/$arka_resim
sleep 10

if [ $sessiz == true ]
then
	pamixer --unmute & pamixer --set-volume 90
else 
	pamixer --set-volume 90
fi
