#!/bin/sh
cd $(dirname ${0})

vim_home=~/
nvim_home=~/.config/
fish_home=~/.config/

# for git
ln -sf $PWD/git/.gitconfig ~/.gitconfig
ln -sf $PWD/git/.gitignore ~/.gitignore
ln -sf $PWD/git/.gitignore_global ~/.gitignore_global

# for fish
sudo ln -sf $PWD/fish/ ${fish_home}

# for vim
ln -sf $PWD/vim/.vimrc ~/.vimrc
ln -sf $PWD/vim/.gvimrc ~/.gvimrc
ln -sf $PWD/vim/.vim/ ${vim_home} 

# for neovim
sudo mkdir -p ${nvim_home} 
sudo ln -sf $PWD/nvim/init.vim ${nvim_home}
sudo ln -sf $PWD/nvim/colors ${nvim_home}

# for dein.vim
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

# for psql
ln -sf $PWD/psql/.psqlrc ~/.psqlrc

# for karabiner
ln -sf $PWD/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
