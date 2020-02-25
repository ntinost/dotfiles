#!/bin/bash

if xrandr | grep "HDMI-3 disconnected"; then
	nmcli radio wifi on
	xrandr --output VGA-1 --off --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off
	sh ~/.dotfiles/scripts/launch_polybar.sh
else
	nmcli radio wifi off
	xrandr --output VGA-1 --off --output LVDS-1 --off --output HDMI-2 --off --output HDMI-3 --mode 1920x1080 --rotate normal --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off
	sh ~/.dotfiles/scripts/launch_polybar.sh
fi
