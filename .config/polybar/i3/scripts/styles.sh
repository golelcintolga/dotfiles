#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

## Dirs
polybar_path="$HOME/.config/polybar/i3/bar_double"
#rofi_path="$HOME/.config/polybar/scripts/themes"

## Dark Mode #############################################
if  [[ $1 = "--Dark" ]]; then

# wallpaper ---------------------------------
#nitrogen --save --set-zoom-fill $polybar_path/wallpapers/bg_1.jpg

# polybar ---------------------------------
sed -i -e 's/background = .*/background = ${self.bg0_h}/g' $polybar_path/colors.ini
sed -i -e 's/background-alt = .*/background-alt = ${self.bg3}/g' $polybar_path/colors.ini
sed -i -e 's/foreground = .*/foreground = ${self.fg4}/g' $polybar_path/colors.ini
sed -i -e 's/foreground-alt = .*/foreground-alt = ${self.fg}/g' $polybar_path/colors.ini

# relaunch polybar
polybar-msg cmd restart

# rofi ---------------------------------
#sed -i -e 's/background: .*/background:    #1D2021;/g' $rofi_path/colors.rasi
#sed -i -e 's/background-alt: .*/background-alt:    #282828;/g' $rofi_path/colors.rasi
#sed -i -e 's/foreground: .*/foreground:    #C4C7C5ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/border: .*/border:    #4DD0E1ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/selected: .*/selected:    #4DD0E1ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/urgent: .*/urgent:    #EC407Aff;/g' $rofi_path/colors.rasi
#sed -i -e 's/logo: .*/logo:    #EC407Aff;/g' $rofi_path/colors.rasi
#sed -i -e 's/on: .*/on:    #61C766ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/off: .*/off:    #EC7875ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/gtk-theme-name=.*/gtk-theme-name="NumixSolarizedDarkCyan"/g' /home/tolga/.gtkrc-2.0
sed -i -e 's/@import .*/@import "colors\/gruvbox-dark-hard.rasi"/g' /home/tolga/.config/rofi/themes/sticky-top.rasi

## Light Mode #############################################
elif  [[ $1 = "--Light" ]]; then

# wallpaper ---------------------------------
#nitrogen --save --set-zoom-fill $polybar_path/wallpapers/bg_2.jpg

# polybar ---------------------------------
sed -i -e 's/background = .*/background = ${self.fg1}/g' $polybar_path/colors.ini
sed -i -e 's/background-alt = .*/background-alt = ${self.fg4}/g' $polybar_path/colors.ini
sed -i -e 's/foreground = .*/foreground = ${self.bg}/g' $polybar_path/colors.ini
sed -i -e 's/foreground-alt = .*/foreground-alt = ${self.bg1}/g' $polybar_path/colors.ini

# relaunch polybar
polybar-msg cmd restart

# rofi ---------------------------------
#sed -i -e 's/background: .*/background:    #ffffffff;/g' $rofi_path/colors.rasi
#sed -i -e 's/background-alt: .*/background-alt:    #e1e1e1ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/foreground: .*/foreground:    #555555ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/border: .*/border:    #4DA8B9ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/selected: .*/selected:    #4DA8B9ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/urgent: .*/urgent:    #EC1850ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/logo: .*/logo:    #EC1850ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/on: .*/on:    #F06A6Aff;/g' $rofi_path/colors.rasi
#sed -i -e 's/off: .*/off:    #5CAC30ff;/g' $rofi_path/colors.rasi
#sed -i -e 's/gtk-theme-name=.*/gtk-theme-name="NumixSolarizedLightCyan"/g' /home/tolga/.gtkrc-2.0
sed -i -e 's/@import .*/@import "colors\/gruvbox-light-hard.rasi"/g' /home/tolga/.config/rofi/themes/sticky-top.rasi
## Help Menu #############################################
else
echo "
Style Switcher
Developed By - Aditya Shakya (@adi1090x)

Available options:
--Dark	--Light
"
fi
