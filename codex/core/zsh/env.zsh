export EDITOR="nvr --remote"
export VISUAL="nvr --remote"
export BROWSER="vivaldi"
export TERM="xterm-256color"
export TERMINAL="kitty"
export PAGER="less"
export WM="xmonad"
export FZF_DEFAULT_COMMAND="ag --hidden \
    --ignore={'.git','.cache','.local','*cache*','*Cache*'} -g ''"
# export FZF_DEFAULT_OPTS='--layout=reverse --inline-info --prompt="codex > "'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info --prompt="codex > "'

export MOZ_USE_XINPUT2=1

export PATH="$HOME/bin":$PATH
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.npm-global/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH

export GO111MODULE=on
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_DATA_HOME/history/.history
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh/cache
export ZSH_CUSTOM=$HOME/.config/zsh

export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer
export SUBVERSION_HOME=$XDG_CONFIG_HOME/subversion

export LESSKEY="${XDG_CONFIG_HOME}/less/keys"
export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export JUPYTER_CONFIG_DIR=/home/cacharle/.config/jupyter

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
[ ! -d $HOME/.local/share/xmonad ] && mkdir -p $HOME/.local/share/xmonad

export VAGRANT_DEFAULT_PROVIDER=libvirt
export PATH

export NVIM_LISTEN_ADDRESS="/tmp/nvimsocket"
