# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s checkwinsize   # Update window size if necessary after each command

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export PAGER=less
export BROWSER=qutebrowser
export HISTSIZE=65536           # Number of lines in history file
export HISTCONTROL=ignoreboth   # Ignore duplicate lines and lines starting with space in history
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export SBCL_HOME=/usr/lib/sbcl/
export GEM_HOME=$HOME/.ruby/
export NOTES=$HOME/notes/

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
alias scratch="vim $HOME/scratch.lisp"

# Completions

case "$OSTYPE" in
	freebsd* ) 
		[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && \
			source /usr/local/etc/bash_completion.d/git-completion.bash
		[ -f /usr/local/etc/bash_completion.d/password-store ] && \
			source /usr/local/etc/bash_completion.d/password-store
		;;
	linux-gnu )
		[ -f /usr/share/bash-completion/completions/git ] && \
			source /usr/share/bash-completion/completions/git
		[ -f /usr/share/bash-completion/completions/pass ] && \
			source /usr/share/bash-completion/completions/pass
		;;
esac

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
