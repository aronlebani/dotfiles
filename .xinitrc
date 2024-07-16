#!/bin/sh

# ~/.xinitrc
#
# xinitrc file, used by all X sessions started by xinit (startx)

# Configure display using xrandr (see ~/bin/xsetdisplay)
xsetdisplay

exec i3
