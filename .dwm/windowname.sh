#!/bin/bash

wname=$(xdotool getactivewindow getwindowname)

charcount=$(echo $wname | wc -m)

if [[ $charcount -gt $1 ]]; then
  wcut1=$(echo $wname | cut -b -$1)
  wcount=$(echo $wcut1 | wc -w)
  wcut2=$(echo $wcut1 | cut -f -$((wcount-1)) -d " ")
  echo $wcut2...
else
  echo $wname
fi
