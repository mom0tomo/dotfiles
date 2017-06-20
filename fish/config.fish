# encoding
set -x LANG ja_JP.UTF-8

# PATH
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# homebrew
set -U fish_user_paths /usr/local/bin $fish_user_paths

# use gvm
function gvm
  bass source ~/.gvm/scripts/gvm ';' gvm $argv
end

# plugins
set fish_plugin peco

# peco
function peco
  command peco --layout=bottom-up $argv
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

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

rbenv init - | source

# cd > ls -la
function cd
  builtin cd $argv
  ls -la
end

# vi mode
fish_vi_key_bindings
