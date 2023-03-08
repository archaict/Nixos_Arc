# GLOBAL
setopt autocd extendedglob
setopt nomatch menucomplete
setopt interactive_comments
unsetopt BEEP prompt_cr prompt_sp
stty stop undef

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

setopt no_list_ambiguous
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zle_highlight=('paste:none')
zstyle ':completion:*' menu select

#COMPINIT
autoload -Uz compinit
# compinit -d $XDG_DATA_HOME/zsh/cache
 _comp_options+=(globdots)

re_initialize=0
for match in $zcompdump*(.Nmh+24); do
   re_initialize=1
   break
done

if [ "$re_initialized" -eq "1" ]; then
  compinit
else
  compinit -C
fi

autoload -Uz colors && colors

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search


#HISTORY
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$XDG_DATA_HOME/history/.zsh_history

#PERCENTAGE SIGN
PROMPT_EOL_MARK=''

# BINDINGS
bindkey -v
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey "\;5D" beginning-of-line
bindkey "\;5C" end-of-line
# bindkey "^[[1;5D" beginning-of-line
# bindkey "^[[1;5C" end-of-line
bindkey '^H' backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# bindkey "\E[F" end-of-line
# bindkey "\E[3~" delete-char
bindkey '^X' create_completion
