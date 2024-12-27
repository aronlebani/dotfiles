# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend
shopt -s checkwinsize

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export PAGER=less
export BROWSER=qutebrowser
export HISTSIZE=65536
export HISTCONTROL=ignoreboth
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export NOTES=$HOME/notes
export W3M_DIR=$XDG_DATA_HOME/w3m
export PS1="\u@\h:\w\\$ "

[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH
[ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH

alias ls="ls --color=auto"
alias la="ls -lah"
alias rm="rm -i"
alias grep="grep --color=auto"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"
alias todo="vim $NOTES/todo.md"
alias memo="vim $NOTES/scratch.j.md"
alias notes="vim $NOTES"
alias scratch="vim $HOME/src/scratch.lisp"

. $HOME/bin/completions
