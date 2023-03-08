if cat /etc/*-release | grep -q 'arch'; then

    alias i='sudo pacman -S --color auto'
    alias pacman='sudo pacman --color auto'
    alias update='sudo pacman -Syu'
    alias ayu='paru -Syu --noconfirm'
    alias parus='paru -S --nodiffmenu --noremovemake --save'

    #alias i="sudo pacman -S "
    alias yi="paru -S "
    alias u="sudo pacman -Syyu "

    # paru as aur helper - updates everything
    alias pksyua="paru -Syu --noconfirm"
    alias upall="paru -Syu --noconfirm"

    # get fastest mirrors in your neighborhood
    alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
    alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
    alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
    alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'

fi

if cat /etc/*-release | grep -q 'Fedora'; then

    alias dnf="sudo dnf "
    alias i="dnf install -y"
    alias u="dnf update -y"
    alias del="sudo dnf remove "
    alias dnfg="dnf group list --hidden -v | less"

fi

if cat /etc/*-release | grep -q 'nix'; then
    # alias nixs="sudo nixos-rebuild -v switch --flake /etc/nixos --option use-binary-cache false --option build-use-subtitutes false"
    alias nixs="sudo nixos-rebuild switch"
    alias i="nixs"
    alias nixfast="nixs --fast"
fi

if echo $SHELL | grep -q 'zsh'; then

    alias shr="source ~/.zshrc"
    alias eiri="emacsclient -nw ~/.config/zsh/.zshrc"

fi

if echo $SHELL | grep -q 'fish'; then

    alias shr="source ~/.config/fish/config.fish"
    alias eiri="emacsclient ~/.config/fish/config.fish"

fi

###########
# Aliases #
###########

alias em="emacsclient -nw "
alias sc="sudo systemctl "

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias grep="grep --color=auto"

export EXA_ICON_SPACING=2
alias ls="exa --icons --group-directories-first"
# alias ls="ls --color=auto --group-directories-first"
alias l="ls -lah --group-directories-first"
alias ll="ls -lah --group-directories-first"
alias lt="ls --human-readable --size -1 -S --classify"
# alias la="ls -A --color=auto --group-directories-first"
alias la="ls -a --color=auto --group-directories-first"

# alias nvim='rm -f ~/.config/nvim/init.vim && nvim '
# alias v='nvim'
alias vi='nvim'
alias vim="nvim"
alias sv="sudo -E nvim"
alias notes="nvim ~/Vault/File/Personal/Fleeting-Notes/Fleeting.md"
alias dashboard="nvim ~/Vault/File/Personal/Dashboard.md"
alias dash="nvim ~/Vault/File/Personal/Dashboard.md"

alias e='emacsclient -nw'
alias doom="$HOME/.emacs.d/bin/doom"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

alias dup="docker compose up "
alias dups="docker compose up --build "

alias rm="rm --preserve-root"
alias rmdir="sudo rm -Rfi"

alias cl="clear"
# GIT
alias gcl='git clone '
alias ga='git add '
alias gs='git status '
alias gm='git commit -m '
alias gp='git push'

alias sudo="sudo "
alias mv="mv -iv"
alias cp="cp -iv"
alias ln="ln -iv"
alias df="df -hT"
alias du="du -hs * | sort -h"

alias cpy="xclip"
alias pst="xclip -o"
alias cs="xclip -selection clipboard"
alias vs="xclip -o -selection clipboard"
alias q="exit"
alias :q='exit'

#alias fping= "ping -c 10"

alias tobash='sudo chsh $USER -s /bin/bash && echo "Now log out."'
alias tozsh='sudo chsh $USER -s /bin/zsh && echo "Now log out."'
alias tofish='sudo chsh $USER -s /usr/bin/fish "Now log out."'

alias free="free -mt"
alias wget="wget -c"

alias userlist="cut -d: -f1 /etc/passwd"
alias merge="xrdb -merge ~/.Xresources"
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias hw="hwinfo --short"

#grub update
alias update-grub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias update-fc='sudo fc-cache -fv'

#vim everything
alias vlightdm="sudo nvim /etc/lightdm/lightdm.conf"
alias vpacman="sudo nvim /etc/pacman.conf"
alias vgrub="sudo nvim /etc/default/grub"
alias vconfgrub="sudo nvim /boot/grub/grub.cfg"
alias vmkinitcpio="sudo nvim /etc/mkinitcpio.conf"
alias vmirrorlist="sudo nvim /etc/pacman.d/mirrorlist"
alias vsddm="sudo nvim /etc/sddm.conf"

#buhbye
alias ssn="sudo shutdown now"
alias sr="sudo reboot"
alias bye="shutdown -h now"
alias sayonara="shutdown -h now"
alias djb="reboot"
alias c="clear"
alias cln="clean"

#sudo based
alias cpu-gui="sudo cpupower-gui"
alias white="feh --bg-scale ~/Pictures/Raven_Cybernetics_WHITE.png"
alias dark="feh --bg-scale ~/Pictures/Raven_Cybernetics.png"

#chmod
alias chx="chmod +x "

#Android
alias adbs="cd ~/Phones/adb"
alias phims="cd ~/Phones/IMG"
alias fatals="sudo fastboot flash system ./system.img && sudo fastboot -w && sudo fastboot reboot"

alias ph-list="adb shell pm list packages"
alias ph-enable="adb shell pm enable --user 0 "
alias ph-disable="adb shell pm disable-user --user 0 "

alias checkrain="sudo checkra1n"

alias mc="sudo machinectl"

alias em='f -e emacsclient'
alias em='f -e emacsclient'
alias nv='f -e nvim'
alias ersh="pkill emacs && emacs --daemon"

alias j='z'
alias o='a -e xdg-open'

alias b='buku --suggest'
alias bka='buku --suggest -a'
alias bku='buku --suggest -u'
alias bkw='buku --suggest -w'
alias bkd='buku --suggest -d'
alias bkp='buku --suggest -p'

alias ff='firefox -new-tab $(buku -p -f 10 | fzf)'
alias ffh='firefox -new-tab $(ffhist)'

alias nmap_open_ports="nmap --open"
alias nmap_list_interfaces="nmap --iflist"
alias nmap_slow="sudo nmap -sS -v -T1"
alias nmap_fin="sudo nmap -sF -v"
alias nmap_full="sudo nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v"
alias nmap_check_for_firewall="sudo nmap -sA -p1-65535 -v -T4"
alias nmap_ping_through_firewall="nmap -PS -PA"
alias nmap_fast="nmap -F -T5 --version-light --top-ports 300"
alias nmap_detect_versions="sudo nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn"
alias nmap_check_for_vulns="nmap --script=vuln"
alias nmap_full_udp="sudo nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 "
alias nmap_traceroute="sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
alias nmap_full_with_scripts="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all "
alias nmap_web_safe_osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "
alias nmap_ping_scan="nmap -n -sP"

alias msfvenom-list-all='cat ~/.msf4/msfvenom/all'
alias msfvenom-list-nops='cat ~/.msf4/msfvenom/nops'
alias msfvenom-list-payloads='cat ~/.msf4/msfvenom/payloads'
alias msfvenom-list-encoders='cat ~/.msf4/msfvenom/encoders'
alias msfvenom-list-formats='cat ~/.msf4/msfvenom/formats'
alias msfvenom-list-generate='_msfvenom-list-generate'

alias nikto="nikto -Tuning 123457890abcde -C all $@"

alias neo-minivimist="nvim -S ~/.config/nvim/.neo-minivimist"
alias roam="cd ~/Dropbox/vault/roam"
alias ytd="youtube-dl "
alias ytdf="youtube-dl -F "
alias gb='git branch --sort=committerdate | fzf --header "Checkout Recent Branch" --preview "git diff --color=always {1}" --pointer=">" | xargs git checkout'
alias gbd='git branch --sort=committerdate | fzf --header "Checkout Recent Branch" --preview "git diff --color=always {1} | delta" --pointer=">" | xargs git checkout'
alias nix-flush-gen="sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +2"

alias ta="tmux attach "
alias wgup="sudo wg-quick up WGNate"
alias wgdown="sudo wg-quick down WGNate"

alias refalias="source ~/.config/zsh/alias.zsh"
alias tf="terraform "
alias tfi="terraform init "
alias tfp="terraform plan "
alias tfa="terraform apply "
alias vv="nvim --listen /tmp/nvimsocket"
alias v="nvr --remote"
