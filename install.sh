#!/bin/bash

# Set up user directories
mkdir ~/Repositories

# From package manager
apt install snapd
apt install git
apt install curl
apt install python3.8
apt install python2

# Snap installs
snap install atom --classic
snap install chromium
snap install datagrip --classic
snap install postman
snap install spotify
snap install docker
snap install docker-compose
snap install code --classic
snap install slack --classic

# node
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && nvm install node

# Dropbox daemon
#
# Need to check "Start Dropbox on system startup" in preferences to automatically run the daemon - not
# sure how to automate this
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - && ~/.dropbox-dist/dropboxd

# vscode extensions
if command -v code > /dev/null 2>&1; then
  echo "Install vscode plugins..."
  code --install-extension eamodio.gitlens
  code --install-extension monokai.theme-monokai-pro-vscode
  code --install-extension aaron-bond.better-comments
  code --install-extension platformio.platformio-ide
  code --install-extension ms-python.python
  code --install-extension ms-vscode.cpptools
  code --install-extension Compulim.indent4to2
fi

# Sync dotfiles
./sync.sh