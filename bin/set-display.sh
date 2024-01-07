# set-display.sh
#
# Sets the display resolution using xrandr
# To configure this to run automatically on login, add the following to Startup Applications:
# /bin/bash -c "~/bin/set-display.sh"

if [ $(xrandr | grep -c "current 2560 x 1600") -eq 0 ]
then
    exit 0;
fi

xrandr --newmode "1920x1200_90.00"  300.50  1920 2072 2280 2640  1200 1203 1209 1266 -hsync +vsync
xrandr --addmode eDP-1 "1920x1200_90.00"
xrandr --output eDP-1 --mode 1920x1200_90.00
