# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if [[ -d "$HOME/go/bin" ]]; then
    PATH="$PATH:$HOME/go/bin"
fi

if [[ -d "$HOME/.cargo/bin" ]]; then
    PATH="$PATH:$HOME/.cargo/bin"
fi

if [ -f "$HOME/.metabindings" ]; then
    . "$HOME/.metabindings"
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

DARK_BLUE='\[\e[34m\]'
DARK_GREEN='\[\e[32m\]'
LIGHT_BLUE='\[\e[94m\]'
LIGHT_GREEN='\[\e[92m\]'
WHITE='\[\e[00m\]'

if [[ $(hostname) == 'dicuri' ]];  then
    export PS1="$DARK_GREEN\h$WHITE:$DARK_BLUE\W$WHITE"  # light one doesn't look good on dicuri
else 
    export PS1="$LIGHT_GREEN\h$WHITE:$LIGHT_BLUE\W$WHITE"
fi

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export PS1="$PS1"'$(__git_ps1 " (%s)")'
fi

export PS1="$PS1"'\$ '

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

#NNN
export NNN_PLUG='v:preview-tabbed;i:imgview;f:fzcd;d:dragdrop'
export NNN_COLORS='#a744b322' 
export NNN_FCOLORS='dfdfdf6c0000df42bbbaba5f'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_TRASH=1

alias nn='nnn -e'
alias vv='vimv'
alias cp='cp -a'

alias diff='colordiff'
alias cgrep='compgen -c | grep'
alias rm='trash-put'
alias rmt='/usr/bin/rm'
alias rmtr='trash-empty -f'

which ipython 2>/dev/null 1>&2
if [ "$?" -eq 0 ]; then
    alias python='ipython'
fi

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

# vi mode?
if [ $(command -v rlwrap) ] ; then
      alias node='NODE_NO_READLINE=1 rlwrap node'
fi

if [[ $(hostname) == 'fedora' ]]; then
    export GOPATH="$HOME/src/plib/golang:$GOPATH"
    export GO111MODULE=off
fi


# TODO(dicuri): remove this
# export VITASDK=/usr/local/vitasdk
# export PATH=$VITASDK/bin:$PATH # add vitasdk tool to $PATH`
