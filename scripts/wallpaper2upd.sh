#!/bin/sh

imgPath=/home/devilmuffin/wallpapers/wp2v2.jpg

swww img $imgPath
wal -i $imgPath

killall -SIGUSR2 waybar
