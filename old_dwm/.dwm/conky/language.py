#!/usr/bin/env python2
# -*- coding: utf-8 -*-
f = open('/home/tolga/.cache/weathereng.xml','r')
filedata = f.read()
f.close()

newdata = filedata.replace("Fair","Açık").replace("Sunny","Güneşli").replace("Partly","Parçalı").replace("Cloudy","Bulutlu").replace("Wind","Rüzgarlı").replace("Light","Hafif").replace("Rain","Yağmur").replace("with","ve").replace("Thunder","Şimşek").replace("Mostly","Genelde").replace("Smoke","Sisli").replace("Fog","Sisli").replace("Mist","Sisli").replace("Shower","Sağanak").replace("Sun","PZR").replace("Mon","PZT").replace("Tue","SAL").replace("Wed","ÇRŞ").replace("Thu","PRŞ").replace("Fri","CUM").replace("Sat","CMT").replace("Fri","CUM")

f = open('/home/tolga/.cache/weather.xml','w')
f.write(newdata)
f.close()
