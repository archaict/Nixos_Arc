#!/usr/bin/env bash
xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 0x-1080 --rotate normal 
notify-send "HDMI ON"

sleep 1
picom &

~/.fehbg