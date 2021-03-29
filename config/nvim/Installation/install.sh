#!/bin/sh

vim_config_file=~/.vimrc
nvim_config_file=~/.config/nvim/init.vim
coc_config_file=~/.config/nvim/coc-settings.json

mkdir ~/.config/nvim

ln -s ~/dotfiles/config/nvim/.vimrc "$vim_config_file"
ln -s ~/dotfiles/config/nvim/.vimrc "$nvim_config_file"
ln -s ~/dotfiles/config/nvim/coc-settings.json "$coc_config_file"

