#!/usr/bin/env bash
# author: unknown
# sentby: MoreChannelNoise (https://www.youtube.com/user/MoreChannelNoise)
# editby: gotbletu (https://www.youtube.com/user/gotbletu)

# demo: https://www.youtube.com/watch?v=kxJClZIXSnM
# info: this is a script to launch other rofi scripts,
#       saves us the trouble of binding multiple hotkeys for each script,
#       when we can just use one hotkey for everything.

declare -A LABELS
declare -A COMMANDS

###
# List of defined 'bangs'

# launch programs
COMMANDS["apps"]="rofi -combi-modi window,drun -show combi"
LABELS["apps"]=""

# open bookmarks
COMMANDS["bookmarks"]="~/.scripts/rofi-scripts-collection/rofi-surfraw-bookmarks.sh"
LABELS["bookmarks"]=""

# search local files
COMMANDS["Wallpaper"]="rofi -modi Wallpaper:~/.config/rofi/scripts/rofi-wal-theme-switcher.sh -show Wallpaper"
LABELS["Wallpaper"]=""

# open custom web searches
COMMANDS["websearch"]="~/.config/rofi/scripts/dmsearch"
LABELS["websearch"]=""

COMMANDS["kill"]="~/.config/rofi/scripts/dmkill"
LABELS["kill"]=""

COMMANDS["twitchy"]="rofi -modi twitchy:~/.config/rofi/scripts/rofi-twitchy -show twitchy"
LABELS["twitchy"]=""

COMMANDS["Sifreler"]="python ~/.config/rofi/scripts/rofi-keepass.py --database ~/.sifreler"
LABELS["Sifreler"]=""

COMMANDS["Ekran-Yakala"]="screenshot"
LABELS["Ekran-Yakala"]=""

COMMANDS["Exit"]="sh ~/.config/polybar/bspwm/scripts/powermenu"
LABELS["Exit"]=""

COMMANDS["Password"]="python ~/.config/rofi/scripts/quickeepass.py ~/.sifreler"
LABELS["Password"]=""

COMMANDS["Themes"]="rofi-theme-selector"
LABELS["Themes"]=""

COMMANDS["Müzik"]="sh ~/.config/rofi/scripts/rofi-music"
LABELS["Müzik"]=""

# show clipboard history
# source: https://bitbucket.org/pandozer/rofi-clipboard-manager/overview
# COMMANDS["clipboard"]='rofi -modi "clipboard:~/.bin/rofi-clipboard-manager/mclip.py menu" -show clipboard && ~/.bin/rofi-clipboard-manager/mclip.py paste'
# LABELS["clipboard"]=""

# references --------------------------
# COMMANDS[";sr2"]="chromium 'wikipedia.org/search-redirect.php?search=\" \${input}\""
# LABELS[";sr2"]=""

# COMMANDS[";piratebay"]="chromium --disk-cache-dir=/tmp/cache http://thepiratebay.org/search/\" \${input}\""
# LABELS[";piratebay"]=""

# COMMANDS[".bin"]="spacefm -r '/home/dka/bin'"
# LABELS[".bin"]=".bin"

# COMMANDS["#screenshot"]='/home/dka/bin/screenshot-scripts/myscreenshot.sh'
# LABELS["#screenshot"]="screenshot"

################################################################################
# do not edit below
################################################################################
##
# Generate menu
##
function print_menu()
{
    for key in ${!LABELS[@]}
    do
  echo "$key    ${LABELS}"
     #   echo "$key    ${LABELS[$key]}"
     # my top version just shows the first field in labels row, not two words side by side
    done
}
##
# Show rofi.
##
function start()
{
    # print_menu | rofi -dmenu -p "?=>" 
    print_menu | sort | rofi -dmenu -mesg ">>> launch your collection of rofi scripts" -i -p "rofi-bangs: "

}


# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.
input=${value:$((${#choice}+1))}

##
# Cancelled? bail out
##
if test -z ${choice}
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    # Execute the choice
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
else
 eval  $choice | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK) 
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi
