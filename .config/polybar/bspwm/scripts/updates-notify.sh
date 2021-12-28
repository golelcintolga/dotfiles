#!/usr/bin/env bash
NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg

UPDATES_CHECK=$(cat $HOME/.cache/updates_names);

if [ -z "$UPDATES_CHECK" ]; then
	notify-send -i $NOTIFY_ICON "Güncelleme Yokturdur"
else
	notify-send -i $NOTIFY_ICON "$UPDATES_CHECK"
fi


