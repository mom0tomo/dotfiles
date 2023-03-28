# encoding
set -x LANG ja_JP.UTF-8

# Homwbrew
set PATH /opt/homebrew/bin $PATH

# Go
set -x GOPATH $HOME/dev/go
set -x PATH $GOPATH/bin $PATH

# google cloud SDK
set -x PATH $HOME/dev/google-cloud-sdk/bin $PATH

# anyenv
set -x PATH $HOME/.anyenv/bin $PATH
status --is-interactive; and anyenv init - fish | source

# direnv
set -x EDITOR vim
eval (direnv hook fish)

# rbenv
set -x PATH ~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin $PATH
status --is-interactive; and rbenv init - fish | source

# nodenv
status --is-interactive; and source (nodenv init -|psub)

# pyenv
pyenv init - | source

# plugins
set fish_plugin peco

# alias
alias vi 'vim'
alias cp 'cp -i'
alias mv 'mv -i'
alias relogin 'source ~/.config/fish/config.fish'
## Hack for warn in "brew doctor" when installing anyenv
### for Intel
#alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin command brew $argv"
### for ARM
alias brew="PATH=$PATH/\/Users\/$USER\/\.anyenv\/envs\/pyenv\/shims:/ command brew $argv"

# GitHub Actions
# set WORKFLOW ''
alias gh-run='gh workflow run .github/workflows/$WORKFLOW --ref $(git branch --show-current)'
alias gh-watch='gh run list --workflow=$WORKFLOW | grep $(git branch --show-current) | cut -f 7 | head -n 1 | xargs gh run watch'
alias gh-view='gh run list --workflow=$WORKFLOW | grep $(git branch --show-current) | cut -f 7 | head -n 1 | xargs gh run view'
alias gh-log='gh run list --workflow=$WORKFLOW | grep $(git branch --show-current) | cut -f 7 | head -n 1 | xargs gh run view --log'

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

# 秘匿情報を読み込む
source ~/.config/fish/.config.fish.local
