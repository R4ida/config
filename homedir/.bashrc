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

# does it even work correctly?
for path in "$HOME/go/bin" "/opt/rocm/bin" "$HOME/.cargo/bin" \
            "$HOME/.local/bin" "/usr/lib/emscripten" "/opt/emscripten-llvm/bin"; do
    [[ -d "$path" && "$PATH" != *"$path"* ]] && PATH="$PATH:$path"
done

if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
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
PROMPT_COMMAND_STANDARD="$PROMPT_COMMAND"
PROMPT_COMMAND_REFRESH="history -a; history -c; history -r; $PROMPT_COMMAND_STANDARD"
export PROMPT_COMMAND="$PROMPT_COMMAND_REFRESH"
prompt_command_refreshing='TRUE'

# disable or enable it, useful for terminal running one command to compile something
htoggle() {
    if [[ "$prompt_command_refreshing" == "TRUE" ]]; then
        export PROMPT_COMMAND="$PROMPT_COMMAND_STANDARD"
        prompt_command_refreshing='FALSE'
        echo 'disabled history refresh'
    else
        export PROMPT_COMMAND="$PROMPT_COMMAND_REFRESH"
        prompt_command_refreshing='TRUE'
        echo 'enabled history refresh'
    fi
}

find() {
    /usr/bin/find "$@" 2>/dev/null
}

yay() {
    /usr/bin/yay "$@" --sudoloop --save
}

dcff_reencode() {
    # @todo: if scale is equal to 1080p or less, then don't change it
    ffmpeg -i "$1" -vcodec h264 -vf "scale=1920:1080" "ff_reencoded_"$(date +%Y-%m-%d_%H:%M:%S)".mp4"
}

#NNN
export NNN_PLUG='v:preview-tabbed;i:imgview;f:fzcd;d:dragdrop'
export NNN_COLORS='#a744b322' 
export NNN_FCOLORS='dfdfdf6c0000df42bbbaba5f'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_TRASH=1

export IPYTHONDIR="$HOME/.config/ipython"

alias nn='nnn -e'
alias vv='vimv'
alias cp='cp -a'

alias diff='colordiff'
alias cgrep='compgen -c | grep'
alias rm='trash-put'
alias rmt='/usr/bin/rm'
alias pw-restart='systemctl --user restart pipewire.service'
alias grep='grep --color=auto'

alias ip='ip -c=auto'

alias :w="echo saving...; echo wait.. you\'re not in the vim dude"
alias :wq="echo quiting...; echo wait.. you\'re not in the vim dude"

alias luajit='rlwrap -a -c luajit'

alias zdg-open='xdg-open "$(fzf)"'
alias zi='vi "$(fzf)"'

export HISTCONTROL=ignorespace


which ipython 2>/dev/null 1>&2
if [ "$?" -eq 0 ]; then
    python() {
        # echo python is: "$(which python)"
        [[ "$@" == "" ]] && ipython || "$(which python)" "$@"
    }
fi

# vi mode in node
if [ $(command -v rlwrap) ] ; then
      alias node='NODE_NO_READLINE=1 rlwrap node'
fi
