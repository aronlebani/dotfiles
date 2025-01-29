# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend
shopt -s checkwinsize

[ -f "$HOME"/bin/completions ] && . "$HOME"/bin/completions
[ -f "$HOME"/bin/xdg-ninja ] && . "$HOME"/bin/xdg-ninja

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export PAGER=less
export BROWSER=qutebrowser
export HISTSIZE=65536
export HISTCONTROL=ignoreboth
export NOTES=$HOME/notes
export PS1="\u@\h:\w\\$ "

[ -d "$HOME"/bin ] && export PATH=$HOME/bin:$PATH
[ -d "$HOME"/.local/bin ] && export PATH=$HOME/.local/bin:$PATH

alias ls='ls --color=auto'
alias la='ls -A'
alias lah='ls -lAh'
alias rm='rm -i'
alias grep='grep --color=auto'
alias fuck='sudo $(history -p \!\!)'
alias copy='xclip -sel clip'
alias todo='$EDITOR $NOTES/todo.md'
alias memo='$EDITOR $NOTES/scratch.j.md'
alias ev='$EDITOR $NOTES/eventually.md'
alias scratch='$EDITOR $HOME/src/scratch.lisp'
