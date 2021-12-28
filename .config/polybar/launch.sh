#!/usr/bin/env sh
bspoly=bar_double
## Add this to your wm startup file.
#WIRELESS=$(ls /sys/class/net/ | grep wl | awk 'NR==1{print $1}')
#MONITOR=$(polybar --list-monitors | cut -d":" -f1)
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

getWM=$(echo $GDMSESSION)

	if [[ $getWM == dwm ]]; then
		polybar main -c ~/.config/polybar/configDWM.ini >> ~/.config/polybar/polybar1_dwm.log 2>&1 &
		polybar bottom -c ~/.config/polybar/configDWM.ini >> ~/.config/polybar/polybar2_dwm.log 2>&1 &
	elif [[ $getWM == i3 ]]; then
		polybar top -c ~/.config/polybar/i3/$bspoly/config.ini >> ~/.config/polybar/i3/$bspoly/polybar1.log 2>&1 &
		polybar bottom -c ~/.config/polybar/i3/$bspoly/config.ini >> ~/.config/polybar/i3/$bspoly/polybar2.log 2>&1 &
	elif [[ $getWM == bspwm ]]; then
		polybar top -c ~/.config/polybar/bspwm/$bspoly/config.ini >> ~/.config/polybar/bspwm/$bspoly/polybar1_bspwm.log 2>&1 &
		polybar bottom -c ~/.config/polybar/bspwm/$bspoly/config.ini >> ~/.config/polybar/bspwm/$bspoly/polybar2_bspwm.log 2>&1 &
	fi
#for m in $(polybar --list-monitors | cut -d":" -f1); do
#WIRELESS=$(ls /sys/class/net/ | grep wl | awk 'NR==1{print $1}')
#MONITOR=$m
#polybar  main -c ~/.config/polybar/config.ini >>~/polybar1.log 2>&1 &
#polybar  bottom -c ~/.config/polybar/config.ini >>~/polybar2.log 2>&1 &
#done

#echo "Bars launched..."

notify-send "Polybar $getWM üzerinde başlatıldı..."

