#!/bin/sh

nvim_config_file=~/.config/nvim/init.vim

mkdir -p ~/.config/

if [ ! -L "$nvim_config_file" ]; then
  ln -s ~/git/dotfiles/vim/init.vim "$nvim_config_file"
fi
