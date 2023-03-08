eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=""

# any-nix-shell zsh --info-right | source /dev/stdin
#iprograms.neovim.withPython3 = true;f [[ -z "$TMUX" ]]; then exec tmux ; fi

source $HOME/.config/zsh/env.zsh
source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/alias.zsh

if [[ -f $HOME/.alias ]]; then
    source $HOME/.alias
fi

zsh_add_plugin 'extract'
zsh_add_plugin 'Aloxaf/fzf-tab'
zsh_add_plugin 'zsh-users/zsh-autosuggestions'
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin 'hlissner/zsh-autopair'
zsh_add_plugin 'tom-doerr/zsh_codex'

# bindkey -s '^o' 'ranger^M'
# bindkey -s '^e' 'emacsclient -nw .^M'
# bindkey -s '^T' 'tmux^M'
