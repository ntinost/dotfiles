#!/bin/bash

# set / create save location
DOWNLOAD_DIR_MP3=~/.music/youtube/

if [ ! -d "$DOWNLOAD_DIR_MP3" ]; then
	mkdir -p "$DOWNLOAD_DIR_MP3"
fi
cd "$DOWNLOAD_DIR_MP3"

notify-send 'Downloading to MP3' 'Starting ...' -t 5000

# download audio only saves bandwidth (prevents downloading all playlist)
youtube-dl -x -f bestaudio -o "%(title)s.%(ext)s" "$1"

notify-send 'Downloading to MP3' 'Completed !!!' -t 5000
