#!/bin/sh

vim_config_file=~/.vimrc
nvim_config_file=~/.config/nvim/init.vim
coc_config_file=~/.config/nvim/coc-settings.json

mkdir ~/.config/nvim

ln -s ~/dotfiles/vim/.vimrc "$vim_config_file"
ln -s ~/dotfiles/vim/.vimrc "$nvim_config_file"
ln -s ~/dotfiles/vim/coc-settings.json "$coc_config_file"

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt install nodejs -y
sudo apt install npm -y
pip install neovim
