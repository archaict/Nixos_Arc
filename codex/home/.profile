export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="vivaldi"
export TERM="screen-256color"
export TERMINAL="kitty"
export PAGER="less"
export DISPLAY=:0
# export WM="xmonad"

export PATH="$HOME/bin":$PATH
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=$HOME/.local/share/go

export LUTRIS_SKIP_INIT=1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_DATA_HOME/history/.history
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh/cache

export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer
export SUBVERSION_HOME=$XDG_CONFIG_HOME/subversion

export LESSKEY="${XDG_CONFIG_HOME}/less/keys"
export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export JUPYTER_CONFIG_DIR=/home/archaict/.config/jupyter

export GEM_PATH="$XDG_DATA_HOME"/ruby/gems
export GEM_SPEC_CACHE="$XDG_DATA_HOME"/ruby/specs
export GEM_HOME="$XDG_DATA_HOME"/ruby/gems

# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GOPAT="$XDG_DATA_HOME"/go
# export _JAVA_OPTIONS=Djava.util.prefs.userRoot="$XDG_CONOFIG_HOME"/java
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export SSB_HOME="$XDG_DATA_HOME"/zoom

export XMONAD_CONFIG_DIR="$XDG_CONFIG_HOME"/xmonad
export XMONAD_DATA_HOME="$XDG_DATA_HOME"/xmonad
export XMONAD_CONFIG_HOME="$XDG_CONFIG_HOME"/xmonad
export XMONAD_CACHE_HOME="$XDG_CACHE_HOME"/xmonad
export MOZ_USE_XINPUT2=1
export LD_LIBRARY_PATH=/nix/store/vjq3q7dq8vmc13c3py97v27qwizvq7fd-glibc-2.33-59/lib/libc.so.6
export JAVA_HOME=$(readlink -e $(type -p javac) | sed  -e 's/\/bin\/javac//g')

[ ! -d $HOME/.local/share/xmonad ] && mkdir -p $HOME/.local/share/xmonad
