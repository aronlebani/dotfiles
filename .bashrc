# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s checkwinsize   # Update window size if necessary after each command

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export HISTSIZE=65536           # Number of lines in history file
export HISTCONTROL=ignoreboth   # Ignore duplicate lines and lines starting with space in history
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH
[ -d $HOME/.cargo/bin ] && export PATH=$HOME/.cargo/bin:$PATH
[ -d /usr/local/go/bin ] && export PATH=/usr/local/go/bin:$PATH

alias ls="ls --group-directories-first --color=auto"
alias la="ls -lah"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"
alias news="newsboat"
alias todo="vim $HOME/notes/todo.md"
alias memo="vim $HOME/notes/memo.md"
alias notes="vim $HOME/notes"
alias swank="sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp"
alias scratch="vim ~/src/scratch.lisp"

[ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git
[ -f /usr/share/bash-completion/completions/pass ] && source /usr/share/bash-completion/completions/pass

# Bash prompt configuration

_RED="\[\033[1;31m\]"
_GREEN="\[\033[1;32m\]"
_YELLOW="\[\033[1;33m\]"
_BLUE="\[\033[1;34m\]"
_MAGENTA="\[\033[1;35m\]"
_CYAN="\[\033[1;36m\]"
_WHITE="\[\033[37;1m\]"
_NORMAL="\[\033[0m\]"
_RESET="\[\033[m\]"

_git_info ()
{
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

	if [ ! "${BRANCH}" == "" ]
	then
		STATUS=$(_git_dirty)
		echo " > ${BRANCH}${STATUS}"
	fi
}

_git_dirty ()
{
    if [[ $(git status --porcelain) ]]
    then
        echo "*"
    fi
}

export PS1="[\t]${_RESET} ${_BLUE}\w${_RESET}${_RED}\$(_git_info)${_RESET}\n\$${_RESET} "
