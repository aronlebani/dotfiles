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

alias lah="ls -lah"
alias grep="grep --color=auto --exclude-dir={node_modules,.next,.cache,public}"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"

# For work
alias bc-server="cd ~/Repositories/server && /usr/bin/dotnet run --project ./App/App.csproj --launch-profile AppAllHosts"
alias bc-front="cd ~/Repositories/front && nvm use 14.13 && npm run dev"

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
