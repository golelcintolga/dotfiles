#!/usr/bin/env bash
NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg

UPDATES_CHECK=$(checkupdates 2>/dev/null);

if [ -z "$UPDATES_CHECK" ]; then
	notify-send -i $NOTIFY_ICON "Güncelleme Yokturdur"
else
	notify-send -i $NOTIFY_ICON "$UPDATES_CHECK"
fi


