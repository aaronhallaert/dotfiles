#### INSTALL BASIC PACKAGES #####
clear
sudo apt update
sudo apt install git python3 python3-pip npm nodejs
sudo pip install neovim neovim-remote
sudo npm install -g neovim
sudo apt install lazygit


#### SETUP GITHUB WITH KEYS ####
git config --global user.name "Aaron Hallaert"
git config --global user.email "hallaertaaron@gmail.com"

clear
echo "SETTING UP SSH KEYS"
ssh-keygen -t ed25519 -C "hallaertaaron@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
sudo apt-get install xclip -y

xclip -selection clipboard < ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub | clip.exe
echo "COPY KEYS TO GITHUB"
read -p "Press enter to continue"

#### LOAD IN DOTFILES #####
git clone git@github.com:aaronhallaert/dotfiles.git


#### BUILD NEOVIM #####
mkdir repos
cd repos
sudo apt install cmake -y
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y
git clone git@github.com:neovim/neovim.git
cd neovim
make CMAKE_BUILD_TRYPE=Release
sudo make install

# load in neovim config
cd $HOME
bash ~/dotfiles/config/nvim/Installation/install.sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#### install extras ####
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

