#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/wallpaper9.jpg

swww img $imgPath
wal -i $imgPath

killall -SIGUSR2 waybar
