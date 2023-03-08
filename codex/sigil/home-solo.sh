#!/usr/bin/env bash
xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-1 --off
notify-send "HDMI OFF"

sleep 1
picom &

~/.fehbg