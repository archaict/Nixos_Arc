#!/usr/bin/env bash

feh --bg-fill $(fd . ~/Pictures/ -e png -e jpg | fzf --preview='feh --bg-fill {}')