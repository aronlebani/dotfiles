#!/bin/bash

install_full () {
    snap install arduino \
        guitarix \
        libreoffice \
        freecad \
        fritzing \
        ardour \
        usb-creator-gtk \
        neofetch
}

install_linux () {
    apt update && apt install -y \
        git \
        vim \
        curl \
        evolution \
        python3 \
        build-essential \
        qalc \
        sqlite \
        redshift \
        newsboat \
        silversearcher-ag \
        xclip \
        pass \
        pass-extensions-otp

    snap install \
        spotify \
        dbeaver

    # Install seafile
    wget https://linux-clients.seafile.com/seafile.asc -O /usr/share/keyrings/seafile-keyring.asc
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/$(lsb_release -cs)/ stable main" | sudo tee /etc/apt/sources.list.d/seafile.list > /dev/null
    apt update
    sudo apt install -y seafile-gui

    # Install theme
    git clone https://github.com/elmodos/numix-taller.git $HOME/.themes

    # Temporary - upgrade to xfce 4.18
    sudo add-apt-repository ppa:xubuntu-dev/staging
    sudo apt update
    sudo apt dist-upgrade
}

install_macos () {
    # Install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew install \
        nvm \
        rust \
        qalculate-gtk
}

install_essential () {
    # Install rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Install wiki
    cd "$HOME/Repositories" \
        && git clone https://github.com/aronlebani/wiki.git \
        && cd wiki \
        && cargo build \
        && ./install.sh

    # Install vimplug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Inastall nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    # Symlink newsboat feeds

    # OS specific
    case "$(uname -s)" in
        Linux*)
            install_linux
            ;;
        Darwin*)
            install_macos
            ;;
    esac
}

admin () {
    mkdir -p "$HOME/Repositories"
    mkdir -p "$HOME/bin"
    mkdir -p "$HOME/.themes"

    rm -rf "$HOME/Documents" \
        "$HOME/Music" \
        "$HOME/Videos" \
        "$HOME/Templates" \
        "$HOME/Pictures" \
        "$HOME/Public"
}

admin
install_essential

if [ $1 = "--full" ]
then
    install_full
fi
