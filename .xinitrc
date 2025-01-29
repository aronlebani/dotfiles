#!/bin/sh

# ~/.xinitrc
#
# xinitrc file, used by all X sessions started by xinit (startx)

# Configure display using xrandr (see ~/bin/xsetdisplay)
xsetdisplay

feh --no-fehbg --bg-scale $HOME/.local/share/wallpaper.png

exec i3
