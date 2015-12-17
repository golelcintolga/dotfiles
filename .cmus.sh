#!/bin/sh

font2="^fn(fontAwesome:size=6)"
font3="^fn()"
play=$(echo -e "\uf04b")
stop=$(echo -e "\uf04c")

if [ ! -x /usr/bin/cmus-remote ];
then
echo "cmus kurulu değil."
exit
fi

sinir=50
PLAYING=$(cmus-remote -Q | grep status | cut -d " " -f 2-)
ARTIST=$(cmus-remote -Q | grep -m 1 artist | cut -d " " -f 3-)
TITLE=$( cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3- )
STREAM=$(cmus-remote -Q | grep stream | cut -d " " -f 2-)
FILENAME=$(cmus-remote -Q | grep file | cut -d '/' -f2- --output-delimiter=$'\n' | tail -1)

baslik="$ARTIST - $TITLE"
say=$(echo $baslik | wc -m)
say2=$(echo $STREAM | wc -m)
say3=$(echo $FILENAME | wc -m)

if [ -z "$PLAYING" ];
then
echo "Oynatıcı Kapalı"
else
	if [ "$PLAYING" == "playing" ];
	then
		if [ -n "$STREAM" ];
		then
			if [ $say2 -gt $sinir ];
			then
			kes=$(echo $STREAM | cut -b -$sinir)
			echo "$font2$play$font3 $kes..."
			else
			echo  "$font2$play$font3 $STREAM"
			fi
		else
			if [ -z "$ARTIST" ] && [ -z "$TITLE" ];
			then
				if [ $say3 -gt $sinir ];
				then
				kisabaslik2=$(echo $FILENAME | cut -b -$sinir)
				echo "$font2$play$font3 $kisabaslik2... "
				else
				echo "$font2$play$font3 $FILENAME"
				fi		
			else
				if [ $say -gt $sinir ];
				then
				kisabaslik=$(echo $baslik | cut -b -$sinir)
				echo "$font2$play$font3 $kisabaslik... "
				else
				echo "$font2$play$font3 $baslik"
				fi
			fi
		fi
	else
	echo "$font2$stop$font3 Müzik çalmıyor"
	fi
fi
