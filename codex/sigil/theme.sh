#!/usr/bin/env bash
set -euo pipefail

# CDX=$HOME/.config
# MZL=$HOME/.mozilla/firefox/16j61ahj.default-release/chrome

# if [ $1 = "light" ]; then

#   cp $CDX/kitty/kitty.light    $CDX/kitty/kitty.conf
#   cp $CDX/alacritty/ayu.light    $CDX/alacritty/colors.yml
#   cp $CDX/polybar/config.light $CDX/polybar/config
#   cp $CDX/nvim/lua/core.light $CDX/nvim/lua/core.lua
#   # cp $MZL/userChrome.light     $MZL/userChrome.css
#   feh --bg-scale $HOME/Pictures/Barbatos/BarbatosLWPT.png
#   # emacsclient --eval "(load-theme 'doom-tomorrow-day t)"
#   # pkill picom && picom
#   notify-send "Light's up"

# fi

# if [ $1 = "dark" ]; then

#   cp $CDX/kitty/kitty.dark    $CDX/kitty/kitty.conf
#   cp $CDX/alacritty/ayu.dark    $CDX/alacritty/colors.yml
#   cp $CDX/polybar/config.dark $CDX/polybar/config
#   cp $CDX/nvim/lua/core.dark $CDX/nvim/lua/core.lua
#   # cp $MZL/userChrome.dark     $MZL/userChrome.css
#   feh --bg-scale $HOME/Pictures/Barbatos/BarbatosLBPT.png
#   # emacsclient --eval "(load-theme 'doom-tomorrow-night t)"
#   # pkill picom && picom
#   notify-send "Dark siders"

# fi

# kitty -1 -e kitty @ set-colors --all --configured $CDX/kitty/kitty.conf