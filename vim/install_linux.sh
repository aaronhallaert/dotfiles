#!/bin/sh

nvim_config_file=~/.vimrc

if [ ! -L "$nvim_config_file" ]; then
  ln -s ~/git/dotfiles/vim/.vimrc "$nvim_config_file"
fi
