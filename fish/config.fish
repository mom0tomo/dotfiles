# encoding
set -x LANG ja_JP.UTF-8

# go
set -x GOPATH /Users/mom0tomo/dev/go
set -x PATH $GOPATH/bin $PATH

# google cloud SDK
set -x PATH ~/dev/google-cloud-sdk/bin $PATH

#app engine Go
set -x PATH ~/dev/go_appengine/ $PATH

# ndenv
set -x PATH $NDENV_ROOT/shims $PATH

# rbenv
rbenv init - | source

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
