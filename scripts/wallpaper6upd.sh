#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/wallpaper6.jpg

swww img $imgPath
wal -i $imgPath

killall -SIGUSR2 waybar
