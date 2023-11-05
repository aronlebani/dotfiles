# dotfiles

> .files for happier hacking

## Software

- bash
- vim
- git
- xfce

## Steps

1. Install `git` with `sudo apt install -y git`
2. Clone repository
```sh
cd ~
git init
git remote add origin https://github.com/aronlebani/dotfiles.git
git fetch
git checkout -f main
```
3. Run `sudo ./install.sh`
4. Run `:PlugInstall` in vim
5. Happy coding!

## Warning

The `install.sh` file hasn't been tested!
