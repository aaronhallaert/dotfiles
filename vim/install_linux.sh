#!/bin/sh

vim_config_file=~/.vimrc

if [ ! -L "$nvim_config_file" ]; then
  ln -s ~/git/dotfiles/vim/.vimrc "$vim_config_file"
fi
