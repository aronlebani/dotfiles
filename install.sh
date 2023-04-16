#!/bin/bash

install_linux () {
    # Apt stuff
    apt update && apt install -y \
        git \
        vim \
        curl \
        evolution \
        python3 \
        gnome-tweaks \
        build-essential \
        qalc \
        sqlite \
        redshift \
        newsboat \
        ag

    # Snap stuff
    snap install spotify \
        dbeaver \
        libreoffice
}

install_seafile () {
    wget https://linux-clients.seafile.com/seafile.asc -O /usr/share/keyrings/seafile-keyring.asc
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/$(lsb_release -cs)/ stable main" | sudo tee /etc/apt/sources.list.d/seafile.list > /dev/null
    apt update
    sudo apt install -y seafile-gui
}

install_macos () {
    # Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Homebrew stuff
    brew install \
        nvm \
        rust \
        qalculate-gtk
}

install () {
    # Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Wiki
    cd "$HOME/Repositories" \
        && git clone https://github.com/aronlebani/wiki.git \
        && cd wiki \
        && cargo build \
        && ./install.sh

    # Vimplug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

cd "$HOME"

mkdir -p "$HOME/Repositories"
mkdir -p "$HOME/bin"

rm -rf "$HOME/Documents" "$HOME/Music" "$HOME/Videos" "$HOME/Templates"

case "$(uname -s)" in
    Linux*)
        install_linux
        ;;
    Darwin*)
        install_macos
        ;;
esac

install
install_seafile
