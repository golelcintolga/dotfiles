BAR_FG="#FB675B"
BAR_BG="#D23E32"
BAR_H=10
BAR_W=67

VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)
if [[ $MUTE == true ]];
then
echo $(echo "0" | gdbar -fg $BAR_FG -bg $BAR_BG -h $BAR_H -w $BAR_W -s o -ss 1 -sw 3 -nonl) '^fg(gray)0%'
else
echo $(echo $VOL | gdbar -fg $BAR_FG -bg $BAR_BG -h $BAR_H -w $BAR_W -s o -ss 1 -sw 3 -nonl) '^fg(gray)'$VOL'%'
fi
