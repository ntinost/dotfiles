#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring vim...\n"

if [ ! -d ~/.vim/bundle/Vundle.vim/ ]; then
	echo "--> install vundle"
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
fi

if [ -f ~/.vimrc ]; then
	echo "--> backup existing ~/.vimrc file to ~/vimrc.orig"
	mv ~/.vimrc ~/.vimrc.orig
fi

echo "--> install custom vimrc"
cat > ~/.vimrc <<EOF
if filereadable(expand("$DOTFILES/vim/vimrc"))
    source $DOTFILES/vim/vimrc
endif
EOF

echo "--> install gVim fix"
if [ -f ~/.gtkrc-2.0 ]; then
	if ! (grep -q LX ~/.gtkrc-2.0); then
		echo "→ backup existing ~/.gtk-2.0 file to ~/.gtkrc-2.0.orig"
		mv ~/.gtkrc-2.0 ~/.gtkrc-2.0.orig
	else
		echo "→ backup existing ~/.gtk-2.0.mine file to ~/.gtkrc-2.0.mine.orig"
		mv ~/.gtkrc-2.0.mine ~/.gtkrc-2.0.mine.orig
	fi
fi

if ! (grep -q LX ~/.gtkrc-2.0); then
	echo "→ symlink ~/.gtkrc-2.0 to the real config file"
	ln -s "$DOTFILES/vim/gtkrc-2.0" ~/.gtkrc-2.0
else
	echo "→ symlink ~/.gtkrc-2.0.mine to the real config file"
	ln -s "$DOTFILES/vim/gtkrc-2.0" ~/.gtkrc-2.0.mine
fi

echo "--> install vim plugins"
vim +PluginInstall +qall

echo -ne "\nDo you want to compile YCM library now (for vim 7.4+)? (y/n) "
an=$(read a && echo "$a" | tr '[:upper:]' '[:lower:]')

if [ -z "$an" -o "$an" == "y" -o "$an" == "yes" ]; then
	if [ -f ~/.vim/bundle/YouCompleteMe/install.py ]; then
		echo -e "\n--> compiling YCM library"
		python2 ~/.vim/bundle/YouCompleteMe/install.py
	else
		echo -e "Error: couldn't find YCM folder\n"
	fi
fi

echo -e "\ndone...\n"
