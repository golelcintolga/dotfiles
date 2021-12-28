#!/bin/bash

#~ get_focused_desktop() { bspc query -D -d 'focused' --names; }
getDesk=$(bspc query -D -d 'focused' --names)


cat <<EOF | xmenu | sh &
Tall	bsp-layout set tall $getDesk
rTall	bsp-layout set rtall $getDesk
Wide	bsp-layout set wide $getDesk
rWide	bsp-layout set rwide $getDesk
全 Grid	bsp-layout set grid $getDesk
rGrid	bsp-layout set rgrid $getDesk
Even	bsp-layout set even $getDesk
侀 Tiled	bsp-layout set tiled $getDesk
Monocle	bsp-layout set monocle $getDesk
Remove	bsp-layout remove $getDesk
Reload	bsp-layout reload
EOF


#~ declare -a destination=( "tall" "rtall" "wide" "rwide" "grid" "rgrid" "even" "tiled" "monocle" "remove" "reload" "ex" )
#~ dest=$(printf '%s\n' "${destination[@]}" | rofi -dmenu -i -l 20 -font 'LiterationMono Nerd Font 16' -p '') || exit 1
#~ case "$dest" in
  #~ tall)
    #~ bsp-layout set tall $getDesk;;
  #~ rtall)
    #~ bsp-layout set rtall $getDesk;;
  #~ wide)
    #~ bsp-layout set wide $getDesk;;
  #~ rwide)
    #~ bsp-layout set rwide $getDesk;;
  #~ grid)
    #~ bsp-layout set grid $getDesk;;
  #~ rgrid)
    #~ bsp-layout set rgrid $getDesk;;
  #~ even)
    #~ bsp-layout set even $getDesk;;
  #~ tiled)
    #~ bsp-layout set tiled $getDesk;;
  #~ monocle)
    #~ bsp-layout set monocle $getDesk;;
  #~ remove)
    #~ bsp-layout remove $getDesk;;
  #~ reload)
    #~ bsp-layout reload;;
  #~ ex)
    #~ exit 1;;
#~ esac
