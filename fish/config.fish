# encoding
set -x LANG ja_JP.UTF-8

# go
set -x GOPATH $HOME/dev/go
set -x PATH $GOPATH/bin $PATH

# google cloud SDK
set -x PATH $HOME/dev/google-cloud-sdk/bin $PATH

# mecab-golang
set -x CGO_LDFLAGS '-L/usr/local/Cellar/mecab/0.996/lib -lmecab -lstdc++'
set -x CGO_CFLAGS '-I/usr/local/Cellar/mecab/0.996/include'

# direnv
set -x EDITOR vim
eval (direnv hook fish)

# rbenv
rbenv init - | source

# nodenv
status --is-interactive; and source (nodenv init -|psub)

# webpack
set -x PATH $PATH:./node_modules/.bin

# plugins
set fish_plugin peco

# alias
alias vi 'vim'
alias ll 'ls -la'
alias cp 'cp -i'
alias mv 'mv -i'
alias mkdir 'mkdir -p'
alias relogin 'source ~/.config/fish/config.fish'
alias it '~/bin/iterm-setting'

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mom0tomo/dev/go/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/mom0tomo/dev/go/google-cloud-sdk/path.fish.inc'; else; . '/Users/mom0tomo/dev/go/google-cloud-sdk/path.fish.inc'; end; end
