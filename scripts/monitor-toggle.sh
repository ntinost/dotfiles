#!/bin/bash
intern=LVDS-1
extern=HDMI-3

if xrandr | grep "$extern disconnected"; then
	nmcli radio wifi on
	xmodmap ~/.Xmod_right
    xrandr --output "$extern" --off --output "$intern" --primary --mode 1366x768 --pos 0x0 --rotate normal
	hsetroot -fill ~/.dotfiles/misc/wallhaven-642271.jpg
else
	nmcli radio wifi off
	xmodmap ~/.Xmod_left
    xrandr --output "$extern" --primary --mode 1920x1080 --pos 0x0 --rotate normal --output "$intern" --off
	hsetroot -fill ~/.dotfiles/misc/wallhaven-642271.jpg
fi
