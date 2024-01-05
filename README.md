# dotfiles

> dotfiles for happier hacking

This respository uses the "reverse gitignore" approach, inspired by
[this blog post](https://drewdevault.com/2019/12/30/dotfiles.html). It uses a git repository in the
`$HOME` directory to avoid the need to symlink files or sync files back and forth between the
repository and `$HOME`. To prevent tracking private files, the `.gitignore` file is set up to ignore
_everything_ using a `*` entry. The files that we want to track are then opted-in using
`!<filename>` entries.

## Software

The repository contains configuration files for the following software, plus a few other odds and
ends. The `bin` directory contains useful executables which, if necessary, can shadow system
binaries by putting `$HOME/bin` at the head of `$PATH`. The `lib` directory contains library code.

* Browser - [qutebrowser](https://qutebrowser.org/)
* Source control - [git](https://git-scm.com/)
* Editor - [vim](https://www.vim.org/)
* RSS reader - [newsboat](https://newsboat.org/)
* Shell - [bash](https://www.gnu.org/software/bash/)

## Installation

1. If setting up a fresh OS installation, you may need to install `git` and `vim`.
```sh
sudo apt install -y git vim
```
2. It's not possible to clone into an existing non-empty directory, so instead set up a new git
repository add the remote.
```sh
cd ~
git init
git remote add origin https://github.com/aronlebani/dotfiles.git
git fetch
git checkout -f main
```
3. Happy hacking!
