ip() {
  if [[ $@ == "addr" ]]; then
    command ip -brief addr
  elif [[ $@ == "link" ]]; then
    command ip -brief link
  else
    command ip "$@"
  fi
}

unset rc
export EDITOR='vim'

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
[ -x "$(command -v tmux)" ] \
  && [ -z "${TMUX}" ] \
  && { tmux attach || tmux; } >/dev/null 2>&1

