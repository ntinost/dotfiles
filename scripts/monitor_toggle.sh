#!/bin/bash
intern=LVDS1
extern=VGA1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
	feh --bg-scale $DOTFILES/i3wm/wallhaven-7427.png
else
    xrandr --output "$intern" --off --output "$extern" --auto
	feh --bg-scale $DOTFILES/i3wm/wallhaven-7427.png
fi
