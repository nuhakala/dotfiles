#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Set keymap before xmodmap
setxkbmap fi

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Set displays
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00
xrandr --output DP-2 --mode 3440x1440 --rate 143.92 --right-of DVI-D-0 --primary

xset -dpms
xset s off
xset m 0 0

feh --bg-scale ~/Kuvat/ME-1_02.jpg

export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-Dark

# Create runtime dir. It is deleted on shutdown in /etc/rc.shutdown
mkdir -p /tmp/$(id -u)-runtime
chmod 700 /tmp/$(id -u)-runtime
export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime

# Start pipewire
pipewire &
wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.5

# Execute wm
exec dbus-run-session i3
