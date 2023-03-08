starship init fish | source
zoxide init fish | source
xset r rate 200

function fish_greeting
  echo Archaict Machina: Accessed on (date)
end
funcsave fish_greeting

fish_add_path ~/bin

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

#set ft:fish
