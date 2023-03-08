let

  source = ''
    # source /etc/nixos/core/modules/shell/zoxide
    # source /etc/nixos/core/modules/shell/aliases
    # source /etc/nixos/core/modules/shell/fish/theme.fish
    # source /etc/nixos/core/modules/shell/fish/command-not-found.fish
  '';

  theme = ''
    starship init fish | source
    # direnv hook fish | source
    zoxide init fish | source
    # xset r rate 200

    function fish_greeting
      echo Archaict Machina: Accessed on (date)
    end
    funcsave fish_greeting

    fish_add_path ~/bin
    fish_add_path ~/.config/composer/vendor/bin
    fish_add_path ~/.npm-global/lib/node_modules
    fish_add_path ~/.npm-global/bin

    function fish_right_prompt
        date '+%H:%M:%S'
    end

    set --universal fish_color_autosuggestion 4D5566 # ayu:common.ui        autosuggestions
    set --universal fish_color_command        39BAE6 # ayu:syntax.tag       commands
    set --universal fish_color_comment        626A73 # ayu:syntax.comment   code comments
    set --universal fish_color_cwd            59C2FF # ayu:syntax.entity    current working directory in the default prompt
    set --universal fish_color_end            F29668 # ayu:syntax.operator  process separators like ';' and '&'
    set --universal fish_color_error          FF3333 # ayu:syntax.error     highlight potential errors
    set --universal fish_color_escape         95E6CB # ayu:syntax.regexp    highlight character escapes like '\n' and '\x70'
    set --universal fish_color_match          F07178 # ayu:syntax.markup    highlight matching parenthesis
    set --universal fish_color_normal         B3B1AD # ayu:common.fg        default color
    set --universal fish_color_operator       E6B450 # ayu:syntax.accent    parameter expansion operators like '*' and '~'
    set --universal fish_color_param          B3B1AD # ayu:common.fg        regular command parameters
    set --universal fish_color_quote          C2D94C # ayu:syntax.string    quoted blocks of text
    set --universal fish_color_redirection    FFEE99 # ayu:syntax.constant  IO redirections
    set --universal fish_color_search_match   --background E6B450 # ayu:syntax.accent    highlight history search matches and the selected pager item (must be a background)
    set --universal fish_color_selection      E6B450 # ayu:syntax.accent    when selecting text (in vi visual mode)

    # color for fish default prompts item
    set --universal fish_color_cancel         0A0E14 # ayu:common.bg        the '^C' indicator on a canceled command
    set --universal fish_color_host           FFEE99 # ayu:syntax.constant  current host system in some of fish default prompts
    set --universal fish_color_host_remote    FFEE99 # ayu:syntax.constant  current host system in some of fish default prompts, if fish is running remotely (via ssh or similar)
    set --universal fish_color_user           FF8F40 # ayu:syntax.keyword   current username in some of fish default prompts

    function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
        if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
        end
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

    function kbd --description 'Start KMonad for all available keyboards'
        set config ~/.config/kmonad/config.kbd
        echo "Activate KMonad for internal keyboard"
        kmonad $config & ; disown

        set keyb /dev/input/(grep -B 8 -A 4 12001 /proc/bus/input/devices | grep Keychron -A 4 | grep -oE 'event[0-9]+')
        if test -e $keyb
            echo "Activate KMonad for Keychron K12"
            set dest "/tmp/kmonad-keychron-k12.kbd"
            cp $config $dest
            sed -i 's:/dev/input/by-path/platform-i8042-serio-0-event-kbd:'$keyb':' $dest
            kmonad $dest & ; disown
        end
    end
  '';

  zoxide = ''
    function __zoxide_pwd
        builtin pwd -L
    end

    if ! builtin functions -q __zoxide_cd_internal
        if builtin functions -q cd
            builtin functions -c cd __zoxide_cd_internal
        else
            alias __zoxide_cd_internal='builtin cd'
        end
    end

    function __zoxide_cd
        __zoxide_cd_internal $argv
    end


    function __zoxide_hook --on-variable PWD
        test -z "$fish_private_mode"
        and command zoxide add -- (__zoxide_pwd)
    end

    function __zoxide_z
        set argc (count $argv)
        if test $argc -eq 0
            __zoxide_cd $HOME
        else if test "$argv" = -
            __zoxide_cd -
        else if test $argc -eq 1 -a -d $argv[1]
            __zoxide_cd $argv[1]
        else
            set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
            and __zoxide_cd $result
        end
    end

    function __zoxide_z_complete
        set -l tokens (commandline -op)
        set -l curr_tokens (commandline -cop)

        if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
            __fish_complete_directories "$tokens[2]" ""
        else
            set -l query $tokens[2..-1]
            set -l result (_ZO_FZF_OPTS='--bind=ctrl-z:ignore --exit-0 --height=35% --inline-info --no-sort --reverse --select-1' zoxide query -i -- $query)
            and commandline -p "$tokens[1] "(string escape $result)
            commandline -f repaint
        end
    end

    function __zoxide_zi
        set -l result (command zoxide query -i -- $argv)
        and __zoxide_cd $result
    end

    function __zoxide_unset
        set --erase $argv >/dev/null 2>&1
        abbr --erase $argv >/dev/null 2>&1
        builtin functions --erase $argv >/dev/null 2>&1
    end

    __zoxide_unset z
    alias z=__zoxide_z
    complete -c z -e
    complete -c z -f -a '(__zoxide_z_complete)'

    __zoxide_unset zi
    alias zi=__zoxide_zi
  '';

  vars = ''
    # export JAVA_HOME=(readlink -e (type -p javac) | sed  -e 's/\/bin\/javac//g')
    export EDITOR=nvim
    export LUTRIS_SKIP_INIT=1
    export MOZ_USE_XINPUT2=1;
    export DISPLAY=:0
  '';

  startx = ''
    if status is-login
        if test "$XDG_VTNR" = 1
            pgrep emacs || exec startx -- -keeptty
        end
    end
  '';

  command-not-found = ''
    function __fish_command_not_found_handler --on-event fish_command_not_found
      if [ -n "$MC_SID" ] || ! [ -t 1 ]
        echo $argv[1]': command not found' >&2
        return 127
      end
    end
  '';

  alias_core = ''
    alias nixs="sudo nixos-rebuild -v switch --flake /etc/nixos --option use-binary-cache false --option build-use-subtitutes false"
    alias i="nixs"

    alias code-update-extension="cat ./codex/core/codium/extensions | grep -v '^#' | xargs -L1 codium --install-extension > /dev/null 2>&1 "
    alias cue="notify-send 'Codium: Updating Plugins' && code-update-extension && notify-send 'Codium: Done!'"

    alias ic="nixs && cde"

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
    alias vi='vi'
    alias vim="nvim";
    alias sv="sudo -E nvim";

    alias rm="rm --preserve-root";
    alias rmdir="sudo rm -Rfi";

    alias cl="clear"

    alias sudo="sudo "
    alias mv="mv -iv"
    alias cp="cp -v"
    alias ln="ln -iv"
    alias df="df -hT"
    alias du="du -hs * | sort -h"

    alias cpy="xclip"
    alias pst="xclip -o"
    alias cs="xclip -selection clipboard"
    alias vs="xclip -o -selection clipboard"
    alias q="exit"
    alias qa="exit"
    alias :q='exit'

    alias wget="wget -c"

    #buhbye
    # alias bye="shutdown -h now"
    alias sayonara="shutdown -h now"
    alias c="clear"

    #sudo based
    alias cpu-gui="sudo cpupower-gui"

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

    #Editors
    alias em="emacsclient -nw "
    alias e='emacsclient -nw'
    alias doom="$HOME/.emacs.d/bin/doom"
    alias doomsync="~/.emacs.d/bin/doom sync"
    alias doomdoctor="~/.emacs.d/bin/doom doctor"
    alias doomupgrade="~/.emacs.d/bin/doom upgrade"
    alias doompurge="~/.emacs.d/bin/doom purge"
    alias em='f -e emacsclient'
    alias ersh="pkill emacs && emacs --daemon"

    alias nv='f -e nvim'

    alias j='z'
    alias o='a -e xdg-open'

    alias kcon='sudo iptables -I INPUT -p tcp --dport 1714:1764 -j ACCEPT'

    alias sndpt='bluetoothctl connect 6C:0D:E1:C6:AE:99'
    alias sndptd='bluetoothctl disconnect 6C:0D:E1:C6:AE:99'

    alias scrcpym='scrcpy -m 1080 -f -S -w --shortcut-mod "lalt"'
    alias flush-trash='rm -rf /home/archaict/.Trash/files/*'
    alias bluetooth-refresh=' pactl unload-module module-bluetooth-discover && pactl load-module module-bluetooth-discover'
    alias soundpeats-connect="bluetooth-refresh && bluetoothctl connect 6C:0D:E1:C6:AE:99"
    alias soundpeats-disconnect="bluetoothctl disconnect 6C:0D:E1:C6:AE:99"
    alias wallpaper='feh --bg-fill (fd . ~/Pictures/ -e png -e jpg | fzf)'
    alias wls='wal -i (fd . ~/Pictures/ -e png -e jpg | fzf) && emacsclient -e "(load-theme \'ewal-doom-one)"'

    alias sage='eval (ssh-agent -c)'
  '';

  alias_sec = ''
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

    # alias nikto="nikto -Tuning 123457890abcde -C all $@"
    alias checkrain="sudo checkra1n"
  '';

  container = ''
    alias cont='distrobox'
    alias archcon='cd $HOME && distrobox-enter arch'
    alias ubuncon='cd $HOME && distrobox-enter ubuntu'
  '';

  barrier = ''
    alias barstart='sudo iptables -I INPUT -s 192.168.100.0/24 -p tcp --dport 24800 --syn -j ACCEPT && barrier'
    alias barsthap='sudo iptables -I INPUT -s 192.168.100.0/24 -p tcp --dport 24800 --syn -j REJECT && pkill barrier'
  '';
in {
  init = theme + vars + startx + command-not-found + alias_core + alias_sec
    + barrier + container + zoxide;
}
