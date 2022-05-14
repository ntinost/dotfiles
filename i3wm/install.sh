#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "Configuring full i3wm environment...\n"

if [ -f ~/.config/i3/config ]; then
	echo "→ backup existing ~/.config/i3/config file to ~/.config/i3/config.orig"
	mv ~/.config/i3/config ~/.config/i3/config.orig
fi

echo "→ symlink ~/.config/i3/config to the real config file"
ln -sf "$DOTFILES/i3wm/i3" ~/.config/i3/config

echo -e "\nDone!\n"
