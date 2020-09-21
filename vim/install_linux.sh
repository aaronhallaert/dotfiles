#!/bin/sh

vim_config_file=~/.vimrc
coc_config_file=~/.config/nvim/coc-settings.json

if [ ! -L "$nvim_config_file" ]; then
  ln -s ~/dotfiles/vim/.vimrc "$vim_config_file"
  ln -s ~/dotfiles/vim/coc-settings.json "$coc_config_file"
fi
