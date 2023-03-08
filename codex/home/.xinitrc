#!/usr/bin/env bash

# xset b off &
# xset r rate 200 &
# xset s off -dpms &
#
# light -S 20 &
#
# bkbd &
# xhost +si:localuser:$USER &
# exec emacs --maximized # --debug-init # -bg "#1d2021"
exec xmonad
# exec Hyprland
