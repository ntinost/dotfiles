#!/bin/bash

# set / create save location
DOWNLOAD_DIR_MP3=~/youtube/z_music

if [ ! -d "$DOWNLOAD_DIR_MP3" ]; then
	mkdir -p "$DOWNLOAD_DIR_MP3"
fi
cd "$DOWNLOAD_DIR_MP3"

notify-send 'Downloading to MP3' 'Starting ...' -t 5000

# download audio only saves bandwidth (prevents downloading all playlist)
youtube-dl -c --restrict-filenames --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" -f 171 "$1"

notify-send 'Downloading to MP3' 'Completed !!!' -t 5000
