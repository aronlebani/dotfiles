# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s checkwinsize   # Update window size if necessary after each command

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export HISTSIZE=65536           # Number of lines in history file
export HISTCONTROL=ignoreboth   # Ignore duplicate lines and lines starting with space in history
export NVM_DIR="$HOME/.nvm"

alias la="ls -lah"
alias grep="grep --color=auto --exclude-dir={node_modules,.next,.cache,public,packages,bin,logs}"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -f "$HOME/.bash_prompt" ] && \. "$HOME/.bash_prompt"
[ -f "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

case "$(uname -s)" in
    Linux*)
        alias ls="ls -gGh --group-directories-first --color=auto"
        ;;
    Darwin*)
        export BASH_SILENCE_DEPRECATION_WARNING=1
        export CLICOLOR=1
        ;;
esac
