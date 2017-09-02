# encoding
set -x LANG ja_JP.UTF-8

# PATH
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# homebrew
set -U fish_user_paths /usr/local/bin $fish_user_paths

# go
set -U fish_user_paths $GOPATH/bin $fish_user_paths

# plugins
set fish_plugin peco

# alias
alias vi 'vim'
alias la 'ls -la'
alias ll 'ls -la'

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

alias mkdir 'mkdir -p'

alias sudo 'sudo -E env PATH=$PATH'
alias sudo 'sudo'

alias relogin 'source ~/.config/fish/config.fish'

# vi mode
fish_vi_key_bindings
