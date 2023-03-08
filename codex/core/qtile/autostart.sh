#!/usr/bin/env bash
dunst &
sxhkd &
setxkbmap -option caps:super &
xset b off &
xset r rate 200 &
xset s off -dpms &
~/.fehbg &
light -S 20 &
polybar -r bar &
xrandr --output DisplayPort-1 --mode 1920x1080 --rate 60 --above eDP &
# xinput --map-to-output $(xinput list --id-only "Wacom HID 5203 Pen Pen (0xb746368a)") eDP &
# xinput --map-to-output $(xinput list --id-only "Wacom HID 5203 Finger") eDP &
picom &
