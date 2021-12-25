# repair visibility of ip command
ip() {
  if [[ $@ == "addr" ]]; then
    command ip -brief addr
  elif [[ $@ == "link" ]]; then
    command ip -brief link
  else
    command ip "$@"
  fi
}

alias bat='batcat'

unset rc
export EDITOR='vim'
set -o vi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# bash history
HISTSIZE=10000
HISTFILESIZE=10000

# https://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux
# avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# append history entries
shopt -s histappend

# after each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
[ -x "$(command -v tmux)" ] \
  && [ -z "${TMUX}" ] \
  && { tmux attach || tmux; } >/dev/null 2>&1

#NNN
export NNN_PLUG='v:preview-tabbed;i:imgview;f:fzcd;d:dragdrop'
export NNN_COLORS='#a744b322' 
export NNN_FCOLORS='dfdfdf6c0000df42bbbaba5f'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_TRASH=1

alias nn='nnn -e'

# system specific
# fedora:
alias pipewire-restart='systemctl --user restart pipewire-pulse.service'
__vte_prompt_command() { true; }
