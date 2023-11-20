# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s checkwinsize   # Update window size if necessary after each command

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export HISTSIZE=65536           # Number of lines in history file
export HISTCONTROL=ignoreboth   # Ignore duplicate lines and lines starting with space in history

[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH
[ -d $HOME/.cargo/bin ] && export PATH=$HOME/.cargo/bin:$PATH
[ -d /usr/local/go/bin ] && export PATH=/usr/local/go/bin:$PATH

alias ls="ls --group-directories-first --color=auto"
alias la="ls -lah"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"

[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt
[ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git
[ -f /usr/share/bash-completion/completions/pass ] && source /usr/share/bash-completion/completions/pass
