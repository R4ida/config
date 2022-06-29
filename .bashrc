# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# repair visibility of ip command
ip() {
  if [[ $@ == "addr" || $@ == "a" ]]; then
    command ip -brief addr
  elif [[ $@ == "link" || $@ == "l" ]]; then
    command ip -brief link
  else
    command ip "$@"
  fi
}

unset rc
export EDITOR='vim'
set -o vi

pgrep ssh-agent >/dev/null 2>&1
if [ "$?" -gt 0 ]; then
    eval $(ssh-agent) >/dev/null
fi

PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[00m\]\$ '

# bash history
HISTSIZE=100000
HISTFILESIZE=100000

# https://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux
# avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# append history entries
shopt -s histappend

# after each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session

# commented to figure out workflow with this setting disabled
#[ -x "$(command -v tmux)" ] \
#  && [ -z "${TMUX}" ] \
#  && { tmux attach || tmux; } >/dev/null 2>&1

#NNN
export NNN_PLUG='v:preview-tabbed;i:imgview;f:fzcd;d:dragdrop'
export NNN_COLORS='#a744b322' 
export NNN_FCOLORS='dfdfdf6c0000df42bbbaba5f'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_TRASH=1

alias nn='nnn -e'

alias diff='colordiff'
alias cgrep='compgen -c | grep'

alias sse='ssh 192.168.1.11'
alias sso='ssh root@192.168.1.12'
alias ssp='ssh pi@192.168.1.13'

# toggleDarkMode have to source .bashrc too
# well, I don't need shitty toggleDarkMode function probably,
# just one global switch somewhere.
# the issue is, I don't want to use light terminal theme together
# with light mode everytime, just when I sit outside
lightmode="$([ "$(cat ~/.brightmode)" == 'light' ] && echo 0 || echo 1)"
if [ $lightmode -eq 0 ]; then
    alias bat='bat --theme ansi'
else
    alias bat='bat'
fi


# system specific
if [[ $(hostname) == 'T4HB' ]]; then
    alias ls="ls --color=auto"
    alias vi="vim"
fi

if [[ $(hostname) == 'fedora' ]] || [[ $(hostname) == 'dicuri' ]]; then
    alias pipewire-restart='systemctl --user restart pipewire-pulse.service'
    __vte_prompt_command() { true; }
fi
