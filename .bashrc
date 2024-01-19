# ~/.bashrc: executed by bash(1) for non-login shells.

[ -z "$PS1" ] && return

shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s checkwinsize   # Update window size if necessary after each command

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export HISTSIZE=65536           # Number of lines in history file
export HISTCONTROL=ignoreboth   # Ignore duplicate lines and lines starting with space in history

alias ls="ls --group-directories-first --color=auto"
alias la="ls -lah"

[ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git
