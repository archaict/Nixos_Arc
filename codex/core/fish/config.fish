starship init fish | source
fish_vi_key_bindings
xset r rate 200

set PATH "$HOME/bin:$PATH"
set PATH "$HOME/.local/bin:$PATH"
set -Ux EDITOR nvim
export EDITOR="emacsclient -nw"

#cat bin/miku
set -U fish_greeting ""

#   Readline colors
set -g fish_color_autosuggestion  969896
set -g fish_color_command         8B8B8B
set -g fish_color_comment         969896
set -g fish_color_cwd             de935f
set -g fish_color_cwd_root        5f0000
set -g fish_color_error           cc0000 --bold
set -g fish_color_escape          af5f5f
set -g fish_color_history_current 87afd7
set -g fish_color_host            5f87af
set -g fish_color_match           d7d7d7 --background=303030
set -g fish_color_normal          normal
set -g fish_color_operator        888888
set -g fish_color_param           5f87af
set -g fish_color_quote           888888
set -g fish_color_redirection     normal
set -g fish_color_search_match    --background=purple
set -g fish_color_status          5f0000
set -g fish_color_user            5f875f
set -g fish_color_valid_path      --underline

################
## -- Arch -- ##
################

if cat /etc/*-release | grep -q 'arch'

    alias i='sudo pacman --color auto'
    alias pacman='sudo pacman --color auto'
    alias update='sudo pacman -Syu'

    # package management
    alias pacman='sudo pacman --color auto'
    alias update='sudo pacman -Syyu'
    alias ayu='yay -Syu --noconfirm'
    alias yays='yay -S --nodiffmenu --noremovemake --save'

    #alias i="sudo pacman -S "
    alias yi="yay -S "
    alias u="sudo pacman -Syyu "

    # yay as aur helper - updates everything
    alias pksyua="yay -Syu --noconfirm"
    alias upall="yay -Syu --noconfirm"

    #skip integrity check
    alias yayskip='yay -S --mflags --skipinteg'
    alias trizenskip='trizen -S --skipinteg'

    #pacman unlock
    alias unlock="sudo rm /var/lib/pacman/db.lck"
    alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

    # >> skip integrity checks
    alias yayskip='yay -S --mflags --skipinteg'
    alias trizenskip='trizen -S --skipinteg'

    # get fastest mirrors in your neighborhood
    alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
    alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
    alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
    alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'

    # pacman unlock
    alias unlock='sudo rm /var/lib/pacman/db.lck'
    alias rmpacmanlock='sudo rm /var/lib/pacman/db.lck'

    # obvious typos typos
    alias udpate='sudo pacman -Syyu'
    alias upate='sudo pacman -Syyu'
    alias updte='sudo pacman -Syyu'
    alias updqte='sudo pacman -Syyu'
    alias upqll='yay -Syu --noconfirm'

end

if cat /etc/*-release | grep -q 'Fedora'

  alias dnf="sudo dnf "
  alias i="dnf install -y"
  alias u="dnf update -y"
  alias del="sudo dnf remove "
  alias dnfg="dnf group list --hidden -v | less"

end

if echo $SHELL | grep -q 'zsh'

   alias shr="source ~/.zshrc";
   alias eiri="emacsclient ~/.zshrc";

end

if echo $SHELL | grep -q 'fish'

   alias shr="source ~/.config/fish/config.fish";
   alias eiri="emacsclient ~/.config/fish/config.fish";

end


###########
# Aliases #
###########

alias em="emacsclient -nw "
alias sc="sudo systemctl "

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias grep="grep --color=auto";
alias ls="ls --color=auto --group-directories-first";
alias l="ls --color=auto --group-directories-first";
alias lt="ls --human-readable --size -1 -S --classify";
alias la="ls -A --color=auto --group-directories-first";

alias v='nvim'
alias vim="nvim";
alias sv="sudo -E nvim";

alias e='emacsclient -nw'
alias doom="$HOME/.emacs.d/bin/doom"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

alias kali="cd ~/Virtualize/Kali && vm kali"
alias slavery="cd ~/Virtualize/Slave && vm kali"

alias rm="rm --preserve-root";
alias rmdir="sudo rm -Rfi";

alias cl="clear"
alias gcl="git clone "

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

alias fping= "ping -c 10"

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

alias mc="sudo machinectl"

#############
# FUNCTIONS #
#############

function orgvogel
    pandoc $1.org -o $1.pdf \
    --template eisvogel --listings --table-of-contents --toc-depth 2 \
    --number-sections --metadata-file ~/Dropbox/vault/Assignment/metadata.md
end

function ex -d 'EXtractor for all kinds of archives'
    if test (count $argv) -eq 0
        echo "Hello! I'm ex. I'll try extract the first compressed file you give me!"
    else if test ! -e $argv[1]
        echo 'This one does not exist, maybe try this: ex <file>'
    else if test ! -f $argv[1]
        echo 'This one is not a regular file, sorry...'
    else
        switch $argv[1]
            case *.tar.bz2; tar xjf $argv[1]
            case *.tar.gz;  tar xzf $argv[1]
            case *.bz2;     bunzip2 $argv[1]
            case *.rar;     unrar x $argv[1]
            case *.gz;      gunzip $argv[1]
            case *.tar;     tar xf $argv[1]
            case *.tbz2;    tar xjf $argv[1]
            case *.tgz;     tar xzf $argv[1]
            case *.zip;     unzip $argv[1]
            case *.Z;       uncompress $argv[1]
            case *.7z;      7z x $argv[1]
            case *.deb;     ar x $argv[1]
            case *.tar.xz;  tar xf $argv[1]
            case *.tar.zst; unzstd $argv[1]
            case *
                echo "I don't know how to uncompress that, my bad."
        end
    end
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

function f
  cd (ls -d * | fzf)
end

function lsf
  ls | fzf
end

function emf
 emacsclient (rg --files | fzf)
end

#if status is-interactive
#and not set -q TMUX
#    exec tmux
#end
