# dotfiles

## Usage
1. Clone this repo.
```
$ git clone https://github.com/mom0tomo/dotfiles.git
$ cd dotfiles
```

2. Set symbolic link.
```
$ ln -sfv $PWD/.gitconfig ~/.gitconfig

// for fish
$ ln -sfv $PWD/fish/ ~/.config/

// for vim
$ ln -sfv $PWD/.vimrc ~/.vimrc
$ ln -sfv $PWD/.vim/ ~/

// for vim GUI
$ ln -sfv $PWD/.gvimrc ~/.gvimrc
```

### for neovim
```
$ mkdir ~/.config/nvim/dein
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.config/nvim/dein

$ ln -sfv $PWD/.vim/colors ~/.config/nvim/
$ ln -sfv $PWD/nvim/init.vim ~/.config/nvim/init.vim
```
