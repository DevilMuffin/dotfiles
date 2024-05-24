#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/wallpaper5.png

swww img $imgPath
wal -i $imgPath

killall -SIGUSR2 waybar
