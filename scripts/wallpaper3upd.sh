#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/wallpaper3.png

swww img $imgPath
wal -i $imgPath

killall -SIGUSR2 waybar
