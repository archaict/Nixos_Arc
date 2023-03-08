#!/usr/bin/env bash
# mpd &
# vivaldi &
dunst &
sxhkd &
emacs --daemon &
setxkbmap -option caps:super &
xset b off &
xset r rate 200 &
xset s off -dpms &
unclutter &
~/.fehbg &
light -S 20 &
# gromit-mpx &
# pulseaudio &
# ~/bin/bartop &
# ~/bin/launch-polybar & # with hdmi monitor
# dropbox &
# ~/bin/vbg.log &
xrandr --output DisplayPort-1 --mode 1920x1080 --rate 60 --above eDP &
xinput --map-to-output $(xinput list --id-only "Wacom HID 5203 Pen Pen (0xb746368a)") eDP &
xinput --map-to-output $(xinput list --id-only "Wacom HID 5203 Finger") eDP &
# codium &
sleep 4
picom --experimental-backend &
