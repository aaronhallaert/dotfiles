#!/bin/sh

vim_config_file=~/.vimrc
coc_config_file=~/.config/nvim/coc-settings.json

if [ ! -L "$nvim_config_file" ]; then
  ln -s .vimrc "$vim_config_file"
  ln -s coc-settings.json "$coc_config_file"
fi
