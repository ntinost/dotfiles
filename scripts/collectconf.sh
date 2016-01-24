#!/bin/bash
# Backup system and personal configuration files

# general
files[0]=/etc/fstab
files[1]=/etc/hosts
# arch
files[2]=/etc/pacman.conf
files[3]=/etc/makepkg.conf
files[4]=/etc/modprobe.d/modprobe.conf
# systemd-boot
files[8]=/boot/loader/loader.conf
files[9]=/boot/loader/entries/*
# ssh
files[9]=~/.ssh/*

if [ ! -f ~/conffilesbackup.tar ]; then
	tar -cvzf ~/conffilesbackup.tar ${files[*]}
else
	echo "~/conffilesbackup.tar already exists"
fi
