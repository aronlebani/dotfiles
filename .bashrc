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
export NVM_DIR="$HOME/.nvm"     # Nvm

alias open="xdg-open"
alias dl="cd ~/Downloads"
alias db="cd ~/Dropbox"
alias wiki="cd ~/Dropbox/Wiki && vim index.md"
alias memo="cd ~/Dropbox/Wiki && vim memo.md"
alias todo="cd ~/Dropbox/Wiki && vim todo.md"
alias repo="cd ~/Repositories"
alias lah="ls -lah"
alias grep="grep --color=auto --exclude-dir={node_modules,.next,.cache,public}"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"
alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Include private bin in PATH
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Load ~/.bash_prompt
if [ -f "$HOME/.bash_prompt" ]; then
    . "$HOME/.bash_prompt"
fi

# Nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# OS specific
case "$(uname -s)" in
    Linux*)
        alias ls="ls --color=auto"
        ;;
    Darwin*)
        export BASH_SILENCE_DEPRECATION_WARNING=1
        export CLICOLOR=1
        ;;
esac
