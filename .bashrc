# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s checkwinsize   # Update window size if necessary after each command

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export PAGER=less
export BROWSER=luakit
export HISTSIZE=65536           # Number of lines in history file
export HISTCONTROL=ignoreboth   # Ignore duplicate lines and lines starting with space in history
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export SBCL_HOME=/usr/lib/sbcl/
export GEM_HOME=$HOME/.ruby/
export GOPATH=$HOME/.go
export NOTES=$HOME/notes

[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH
[ -d $HOME/.ruby ] && export PATH=$HOME/.ruby/bin:$PATH
[ -d $HOME/.cargo/bin ] && export PATH=$HOME/.cargo/bin:$PATH

alias ls="ls --color=auto"
alias la="ls -lah"
alias rm="rm -i"
alias grep="grep --color=auto"
alias fzf="fzf --height=10 --no-unicode --no-scrollbar --pointer=' ' --color='gutter:-1'"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"
alias todo="vim $NOTES/todo.md"
alias memo="vim $NOTES/scratch.j.md"
alias notes="vim $NOTES"
alias swank="sbcl --load $HOME/.vim/plugged/slimv/slime/start-swank.lisp"
alias scratch="vim $HOME/src/scratch.lisp"

. "$HOME/bin/prompt"
. "$HOME/bin/completions"
