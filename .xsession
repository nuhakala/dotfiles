#!/bin/bash

xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00
xrandr --output DP-2 --mode 3440x1440 --rate 143.92 --right-of DVI-D-0 --primary

# if [[ $(xrandr --listmonitors | grep -c DP-2) == "1" ]]; then
#     sleep 5
#     xrandr --output DP-2 --mode 3440x1440 --rate 143.92 --right-of DVI-D-0 --primary
# fi

# setxkbmap se
xset -dpms
xset s off
xset m 0 0

# feh --bg-scale ~/Pictures/mr_torgue_3.png
# feh --bg-scale ~/hdd/Kuvat/wallpapers/Alois-Arnegger-painting.jpg
feh --bg-scale ~/hdd/Kuvat/peli_kuvankaappaukset/mass_effect/maa_1.jpg
