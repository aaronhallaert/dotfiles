#!/bin/bash

apt update 
apt install stow nodejs npm

echo "Current git version: $(git --version)"
echo "Install git 2.46.0? (y/n)"

read git
if [ $git == "y" ]
then
    wget https://github.com/git/git/archive/refs/tags/v2.46.0.tar.gz
    tar -zxf v2.46.0.tar.gz
    cd git-2.46.0
    make configure
    ./configure --prefix=/usr
    make all doc info
    sudo make install install-doc install-html install-info
fi

cd $HOME

if ! command -v lazygit &> /dev/null 
then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
fi

cd $HOME

if ! command -v nvim &> /dev/null
then
    git clone https://github.com/neovim/neovim.git
    cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=Release && sudo make install
fi

cd $HOME

if ! command -v rg &> /dev/null
then
    curl https://sh.rustup.rs -sSf | sh
    cargo install ripgrep
fi

cd $HOME

if ! command -v fzf &> /dev/null
then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --bin
    ln -s $HOME/.fzf/bin/fzf /usr/bin/fzf
fi

cd ~/dotfiles
rm -rf ~/.config/nvim && stow nvim
rm -rf ~/.config/lazygit && stow lazygit
