#!/bin/bash

sudo dnf install neovim

pip install -y pynvim neovim flake8 pyflake

mkdir ~/.config
mkdir ~/.config/nvim

# Install vim plug
sudo dnf install -y curl


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl 'https://raw.githubusercontent.com/Simarra/myconfs/master/vim/init.vim' >> ~/.config/nvim/init.vim