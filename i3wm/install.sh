#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "Configuring full i3wm environment...\n"

for i in i3 termite; do
	if [ -f ~/.config/i3/config ]; then
		echo "→ backup existing ~/.config/${i}/config file to ~/.config/${i}/config.orig"
		mkdir ~/.config/$i
		mv ~/.config/$i/config ~/.config/$i/config.orig
	fi
done

for i in i3 termite; do
	echo "→ symlink ~/.config/${i}/config to the real config file"
	ln -sf "$DOTFILES/i3wm/$i" ~/.config/$i/config
done

echo -e "\nDone!\n"
