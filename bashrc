if [[ -f "$HOME/.bashrc_system" ]]; then
    . "$HOME/.bashrc_system"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if [[ -d "$HOME/go/bin" ]]; then
    PATH="$PATH:$HOME/go/bin"
fi

if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
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


unset rc
export EDITOR='nvim'
alias vi='nvim'
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

export PS1="$LIGHT_GREEN\h$WHITE:$LIGHT_BLUE\W$WHITE"

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
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

# after each command, save and reload history to see commands run on other terminals
OLD_PROMPT_COMMAND="$PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# disable or enable it, useful for terminal running one command to compile something
htoggle() {
    prompt_temp="$PROMPT_COMMAND"
    export PROMPT_COMMAND="$OLD_PROMPT_COMMAND"
    OLD_PROMPT_COMMAND="$prompt_temp"
}

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
alias pw-restart='systemctl --user restart pipewire.service'

alias ip='ip -c=auto'

which ipython 2>/dev/null 1>&2
if [ "$?" -eq 0 ]; then
    alias python='ipython'
fi

# vi mode in node
if [ $(command -v rlwrap) ] ; then
      alias node='NODE_NO_READLINE=1 rlwrap node'
fi

# system specific
if [[ $(hostname) == 'cassini' || $(hostname) == 'nova' ]]; then
	alias vi="nvim"
	alias vim="nvim"
    alias grep='grep --color=auto'
    export IPYTHONDIR="$HOME/.config/ipython"
fi
