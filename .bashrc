# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s checkwinsize   # Update window size if necessary after each command

export LANG=en_AU.UTF-8
export VISUAL=vim
export EDITOR=vim
export HISTSIZE=65536           # Number of lines in history file
export HISTCONTROL=ignoreboth   # Ignore duplicate lines and lines starting with space in history
export NVM_DIR="$HOME/.nvm"

alias ls="ls --group-directories-first --color=auto"
alias la="ls -lah"
alias grep="grep --color=auto --exclude-dir={node_modules,.next,.cache,public,packages,bin,logs}"
alias fuck='sudo $(history -p \!\!)'
alias copy="xclip -sel clip"

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

[ -f "$HOME/.bash_prompt" ] && \. "$HOME/.bash_prompt"
[ -f "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"
[ -f "$HOME/.asdf/asdf.sh" ] && \. "$HOME/.asdf/asdf.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f /usr/share/bash-completion/completions/git ] && \. /usr/share/bash-completion/completions/git
[ -f /usr/share/bash-completion/completions/pass ] && \. /usr/share/bash-completion/completions/pass
[ -f "$HOME/.asdf/completions/asdf.bash" ] && \. "$HOME/.asdf/completions/asdf.bash"
