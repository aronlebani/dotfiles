#!/bin/bash

function sync() {
  if [ ! -d ~/.logs ]; then
    mkdir ~/.logs
    chmod 700 ~/.logs
  fi

  rsync --exclude ".git/" \
        --exclude "install.sh" \
        --exclude "README.md" \
        -av . ~

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
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  sync
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    sync
  fi
fi

unset install
source ~/.bash_profile
