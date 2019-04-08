#!/bin/bash

if xrandr | grep "HDMI-2 disconnected"; then
	nmcli radio wifi on
	xmodmap ~/.Xmod_right
	xrandr --output VGA-1 --off --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off
else
	nmcli radio wifi off
	xmodmap ~/.Xmod_left
	xrandr --output VGA-1 --off --output LVDS-1 --primary --mode 1366x768 --pos 1920x320 --rotate normal --output HDMI-3 --off --output HDMI-2 --mode 1920x1080 --pos 0x8 --rotate normal --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off
fi
