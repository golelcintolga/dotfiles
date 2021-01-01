#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar main -c ~/.config/polybar/config.ini >>~/polybar1.log 2>&1 &
#polybar bottom -c ~/.config/polybar/config.ini >>~/polybar2.log 2>&1 &

for m in $(polybar --list-monitors | cut -d":" -f1); do
WIRELESS=$(ls /sys/class/net/ | grep wl | awk 'NR==1{print $1}')
MONITOR=$m
polybar --reload main -c ~/.config/polybar/config.ini >>~/polybar1.log 2>&1 &
polybar --reload bottom -c ~/.config/polybar/config.ini >>~/polybar2.log 2>&1 &
done

echo "Bars launched..."

