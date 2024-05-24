#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/wp8.png

swww img $imgPath
wal -i $imgPath

killall -SIGUSR2 waybar
