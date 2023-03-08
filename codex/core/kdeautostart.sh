#!/usr/bin/env bash

notify-send "Starting KDE autostart scripts..."
# /run/current-system/sw/bin/sxhkd -c $HOME/.config/sxhkd/sxkde &
bkbd &
notify-send "DONE!"
