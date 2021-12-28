#!/bin/bash

declare -a destination=( "history" "killall" "ex" )
dest=$(printf '%s\n' "${destination[@]}" | rofi -dmenu -theme '~/.config/polybar/bspwm/scripts/themes/dunst-menu.rasi' -i -l 20 -font 'LiterationMono Nerd Font 16' -p '') || exit 1

case "$dest" in
	 history)
		 dunstctl history-pop;;
	 killall)
		 killall dunst;;
	 ex)
		 exit 1;;
esac
