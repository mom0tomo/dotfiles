#!/bin/sh
cd $(dirname ${0})

vim_home=~/.vim
nvim_home=~/.config/nvim
fish_home=/.config/fish

# for git
ln -sf $PWD/git/.gitconfig ~/.gitconfig
ln -sf $PWD/git/.gitignore ~/.gitignore

# for fish
ln -sf $PWD/fish/ ${fish_home}

# for vim
mkdir -p ${vim_home}
ln -sf $PWD/vim/.vimrc ~/.vimrc
ln -sf $PWD/vim/.gvimrc ~/.gvimrc
ln -sf $PWD/vim/.vim ${vim_home}

# for neovim
mkdir -p ${nvim_home} 
ln -sf $PWD/nvim/init.vim ${nvim_home}
ln -sf $PWD/nvim/colors ${nvim_home}

# for dein.vim
mkdir -p ${vim_home}/dein
mkdir -p ${nvim_home}/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ${vim_home}/dein
sh ./installer.sh ${nvim_home}/dein
rm ./installer.sh
