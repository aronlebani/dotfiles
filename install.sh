#!/bin/bash

# Set up user directories
mkdir ~/Repositories

# From package manager
apt install -y snapd git curl python3.8 python2 openvpn make g++

# Snap installs
snap install firefox
snap install datagrip --classic
snap install postman
snap install spotify
snap install docker
snap install docker-compose
snap install evolution

# Node
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && nvm install node
nvm install node

# Dropbox daemon
#
# Need to check "Start Dropbox on system startup" in preferences to automatically run the daemon
# Need to automate this
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - && ~/.dropbox-dist/dropboxd

# Sync dotfiles
./sync.sh

