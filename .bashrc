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
export SBCL_HOME=/usr/lib/sbcl/

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
alias swankrkt="racket /home/aron/src/contrib/swank-racket/server.rkt"
alias scratch="vim ~/src/scratch.lisp"

[ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git
[ -f /usr/share/bash-completion/completions/pass ] && source /usr/share/bash-completion/completions/pass

# Prompt

_red="\[\033[1;31m\]"
_blue="\[\033[1;34m\]"
_reset="\[\033[m\]"

_git_dirty() {
    [ -n "$(git status --porcelain)" ] && echo "*"
}

_git_info() {
	branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

	[ -n "$branch" ] && echo " $branch$(_git_dirty)"
}

export PS1="[\t]$_reset $_blue\w$_reset$_red\$(_git_info)$_reset\n\$$_reset "
