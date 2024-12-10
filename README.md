# dotfiles

Dotfiles for happier hacking.

This respository uses the "reverse gitignore" approach, inspired by [this blog
post](https://drewdevault.com/2019/12/30/dotfiles.html). It uses a git
repository in the `$HOME` directory to avoid the need to symlink files or sync
files back and forth between the repository and `$HOME`. To prevent tracking
private files, the `.gitignore` file is set up to ignore _everything_ using a
`*` entry. The files that we want to track can be explicitly added using
`git add --force <file>`. Files we no longer want to track can be removed
with `git rm --cached <file>`.

## Software

The repository contains configuration files for the following software, plus a
few other odds and ends. The `bin` directory contains useful executables which,
if necessary, can shadow system binaries by putting `$HOME/bin` at the head of
`$PATH`. The `lib` directory contains library code.

* Browser - [qutebrowser](https://qutebrowser.org/)
* Source control - [git](https://git-scm.com/)
* Editor - [vim](https://www.vim.org/)
* RSS reader - [newsboat](https://newsboat.org/)
* Shell - [bash](https://www.gnu.org/software/bash/)
* WM - [i3](https://i3wm.org/)
* Terminal emulator - [alacritty](https://alacritty.org/)
* Mail - [aerc](https://aerc-mail.org/) + [isync](https://isync.sourceforge.io/) + [mbsmtp](https://marlam.de/msmtp/)

## Installation

1. If setting up a fresh OS installation, you may need to install `git` and
   `vim`.

        sudo apt install -y git vim

2. It's not possible to clone into an existing non-empty directory, so instead
   set up a new git repository add the remote.

        cd ~
        git init
        git remote add origin https://github.com/aronlebani/dotfiles.git
        git fetch
        git checkout -f main

3. Happy hacking!

## Minimal version

The `min` branch is a minimal version of the dotfiles which contains the bare
minimum configuration to comfortably use a system. It is useful for working on
remote servers via `ssh`. Since this branch probably won't change much, it is
just as easy to clone it onto the server, and move the files into the home
directory.

    git clone -b min https://github.com/aronlebani/dotfiles.git
    mv dotfiles/.bashrc dotfiles/.inputrc dotfiles/.vimrc ~
