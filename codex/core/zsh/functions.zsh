zsh_add_file() {[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"}

zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}


function orgvogel(){
    pandoc $1.org -o $1.pdf \
    --template eisvogel --listings --table-of-contents --toc-depth 2 \
    --number-sections --metadata-file ~/Dropbox/vault/Assignment/metadata.md
}

function ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#f()   { cd $(ls -d * | fzf) }
#lsf() { ls | fzf }
emf() { emacsclient -nw $(rg --files | fzf) }
case "$(uname -s)" in

   Darwin)
     # echo 'Mac OS X'
	alias ls='ls -G'
     ;;

   Linux)
	alias ls='ls --color=auto'
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     # echo 'MS Windows'
     ;;
   *)
     # echo 'Other OS'
     ;;
esac




function navi_widget() {
    local -r input="${LBUFFER}"
    local output="$(navi --print --fzf-overrides '--no-select-1')"

    if [[ "$output" =~ "run: "* ]]; then
        # Saves current command and restores it in the new buffer
        zle push-line
        # Replaces it with the output of navi
        LBUFFER="${output/run: /}"
        # Runs the navi command
        zle accept-line
    elif [[ -n "$output" ]]; then
        # zle kill-whole-line
        LBUFFER="${input}${output}"
    fi

    zle redisplay
}

zle -N navi_widget




TODO_SAVE_TASKS_FILE="$HOME/.todo.sav"
TODO_SAVE_COLOR_FILE="$HOME/.todo_color.sav"

# Allow to use colors
typeset -T -x -g TODO_TASKS todo_tasks
typeset -T -x -g TODO_TASKS_COLORS todo_tasks_colors
typeset -a -x -g todo_colors
typeset -i -x -g todo_color_index

function load_tasks() {
# Load previous tasks from saved file
if [[ -e "$TODO_SAVE_TASKS_FILE" &&
      -e "$TODO_SAVE_COLOR_FILE" ]] then
    TODO_TASKS="$(cat $TODO_SAVE_TASKS_FILE)"
    TODO_TASKS_COLORS="$(head -n1 $TODO_SAVE_COLOR_FILE)"
    todo_color_index="$(tail -n1 $TODO_SAVE_COLOR_FILE)"
    if [[ -z "$TODO_TASKS" ]] then
        todo_tasks[1]=()
        todo_tasks_colors[1]=()
    fi
else
    todo_tasks=()
    todo_tasks_colors=()
    todo_color_index=1
fi
}

todo_colors=()
autoload -U add-zsh-hook
add-zsh-hook precmd todo_display

function todo_add_task {
    if [[ $# -gt 0 ]] then
      # Source: http://stackoverflow.com/a/8997314/1298019
      task=$(echo -E "$@" | tr '\n' '\000' | sed 's:\x00\x00.*:\n:g' | tr '\000' '\n')
      color="${fg[${todo_colors[${todo_color_index}]}]}"
	    load_tasks
      todo_tasks+="$task"
      todo_tasks_colors+="$color"
      (( todo_color_index %= ${#todo_colors} ))
      (( todo_color_index += 1 ))
      todo_save
    fi
}

alias todo=todo_add_task

function todo_task_done {
    pattern="$1"
	  load_tasks
    index=${(M)todo_tasks[(i)${pattern}*]}
    todo_tasks[index]=()
    todo_tasks_colors[index]=()
    todo_save
}

function _todo_task_done {
    load_tasks
    if [[ ${#todo_tasks} -gt 0 ]] then
      compadd $(echo ${TODO_TASKS} | tr ':' '\n')
    fi
  }

compdef _todo_task_done todo_task_done
alias task_done=todo_task_done

function todo_display {
    load_tasks
    if [[ ${#todo_tasks} -gt 0 ]] then
      printf "$fg_bold[default]Todo :$fg_no_bold[default]\n"
      for (( i = 1; i <= ${#todo_tasks}; i++ )); do
        printf "  - %s%s$fg[default]\n" "${todo_tasks_colors[i]}" "${todo_tasks[i]}"
      done
    fi
}

function todo_save {
    echo "$TODO_TASKS" > $TODO_SAVE_TASKS_FILE
    echo "$TODO_TASKS_COLORS" > $TODO_SAVE_COLOR_FILE
    echo "$todo_color_index" >> $TODO_SAVE_COLOR_FILE
}






if 'zmodload' 'zsh/parameter' 2>'/dev/null' && (( ${+options} )); then
  __fzf_key_bindings_options="options=(${(j: :)${(kv)options[@]}})"
else
  () {
    __fzf_key_bindings_options="setopt"
    'local' '__fzf_opt'
    for __fzf_opt in "${(@)${(@f)$(set -o)}%% *}"; do
      if [[ -o "$__fzf_opt" ]]; then
        __fzf_key_bindings_options+=" -o $__fzf_opt"
      else
        __fzf_key_bindings_options+=" +o $__fzf_opt"
      fi
    done
  }
fi

'emulate' 'zsh' '-o' 'no_aliases'

{

[[ -o interactive ]] || return 0

# CTRL-T - Paste the selected file path(s) into the command line
__fsel() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-file-widget
bindkey '^F' fzf-file-widget

# ALT-C - cd into the selected directory
fzf-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N    fzf-cd-widget
bindkey '^G' fzf-cd-widget

# CTRL-R - Paste the selected command from history into the command line
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

} always {
  eval $__fzf_key_bindings_options
  'unset' '__fzf_key_bindings_options'
}

# vf - fuzzy open with vim from anywhere
# using fd, fzf-tmux, and vim
# Usage: vf [file]
vf() {
  local file
  file=$(fd --type f --hidden --follow --exclude .git | fzf-tmux -m --preview cat ) &&
  if [[ -n $file ]]; then
    nvim "$file"
  fi
}

# vh - fuzzy open with vim from $HOME
# using fd, fzf-tmux, and vim
# Usage: vh [file]
vh() {
  local file
  file=$(fd --type f --hidden --follow --exclude .git --full-path . '/home/archaict/Vault' | fzf-tmux -m --preview cat ) &&
  if [[ -n $file ]]; then
    nvim "$file"
  fi
}