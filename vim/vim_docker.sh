#!/bin/bash

VIM_CFG_FILES=tools/vim/*
VIM_CFG_DEST=~/.config/nvim/

# Install Vim
apt install -y neovim
pip install -y pynvim neovim flake8 pyflake

mkdir ~/.config
mkdir ~/.config/nvim

# Install vim plug
apt install -y curl


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cp -r $VIM_CFG_FILES VIM_CFG_FOLDER

nvim -c PlugInstall