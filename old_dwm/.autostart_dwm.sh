#!/bin/sh
# Fonts ..
xsetroot -cursor_name left_ptr
xset +fp /usr/share/fonts/local
xset +fp $HOME/.fonts
xset fp rehash

feh --bg-fill '/home/tolga/Resimler/Wallpaper/wallpaper45.jpg' &
sleep 1s && conky -c ~/.conkyrc_dzen | dzen2 -x '225' -e '' -fg '#408075' -bg '#282A2E' -h '16' -ta r -fn 'monospace:size=9','fontAwesome:size=10' &
conky -c ~/.dwm/conky/ben_conky &
conky -c ~/.dwm/conky/gmail_conky &
conky -c ~/.dwm/conky/disk &
conky -c ~/.dwm/conky/disk_1 &
compton --config .compton.conf &
exec dwm
