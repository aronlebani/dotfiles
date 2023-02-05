#!/bin/bash

install_linux () {
    # Apt stuff
    apt update && apt install -y \
        git \
        vim \
        curl \
        evolution \
        python3 \
        usb-creator-gtk \
        gnome-tweaks \
        build-essential \
        htop \
        gparted \
        ardour

    # Snap stuff
    snap install qalculate

    # Dropbox
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
        && .dropbox-dist/dropboxd \
        && curl -o "$HOME/bin/dropbox.py" https://linux.dropbox.com/packages/dropbox.py \
        && "$HOME/bin/dropbox.py exclude add ./Dropbox/Archive ./Dropbox/Camera Uploads" \
        && "$HOME/bin/dropbox.py autostart"
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
