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

PS1='[\u@\h \W]\$ '

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
