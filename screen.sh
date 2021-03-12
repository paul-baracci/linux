#!/bin/sh

chosen=$( /bin/echo -e "laptop\nhdmi\ndual" | dmenu -i )

case $chosen in
        dual)
        xrandr --output eDP-1 --auto --output HDMI-1 --auto --left-of eDP-1
        ;;
        laptop)
        xrandr --output HDMI-1 --off --output VIRTUAL-1 --off --output eDP-1 --mode 1366x768
        ;;
        hdmi)
        xrandr --output HDMI-1 --auto --output eDP-1 --off
        ;;
esac
