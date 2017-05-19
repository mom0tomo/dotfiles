########################################
# 基本設定
# 標準エディタをvimに設定する
export EDITOR=vim

# 文字コードを設定する
export LANG=ja_JP.UTF-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# '#' 以降をコメントとして扱う
setopt interactive_comments

# コマンドミスを修正する
setopt correct

# zshの開始終了を記録する
setopt EXTENDED_HISTORY

# ls 時の色を設定する
export CLICOLOR=true
export LSCOLORS=gxgxcxdxbxegedabagacad # Mac OS
export LS_COLORS='di=36:ln=36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43' # Linux
zstyle ':completion:*' list-colors di=34 ln=35 ex=31
zstyle ':completion:*:kill:*' list-colors \
   '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

# 一覧表示の形式
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

# ディレクトリ名だけでcdする
setopt auto_cd
# = の後はパス名として補完する
setopt magic_equal_subst
# cd 時に自動でディレクトリスタックに追加する
setopt auto_pushd

# 自動でpushdを実行
setopt auto_pushd
# pushdから重複を削除
setopt pushd_ignore_dups

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# ビープを無効にする
setopt no_beep
setopt no_hist_beep
setopt no_list_beep

# ^D でシェルを終了しない
setopt ignore_eof

# バックグラウンド処理の状態変化をすぐに通知する
setopt notify

# 終了ステータスが0以外の場合にステータスを表示する
setopt print_exit_value

# rm * の前に確認をとる
setopt rm_star_wait

# URLをエスケープする
autoload -Uz url-quote-magic

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

########################################
# プロンプト設定
# 2行表示にする
#PROMPT='%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~ %# '

# プロンプトに色を付ける
autoload -U colors; colors

# プロンプトの色や表示方法を設定する
setopt prompt_subst

# ユーザー名は表示せず、ディレクトリとgitのみ指定した色で表示する（関数は下記）
PROMPT='
%F{yellow}[%~]%f `vcs_echo`
%(?.$.%F{red}$%f) '

########################################
# git設定
# vcs_info を使う
autoload -Uz vcs_info
# vcs_info を呼び出す
precmd () { vcs_info }
# gitを使う
zstyle ':vcs_info:*' enable git svn

# vcs_info の結果を表示する
setopt prompt_subst
# formatを使う
zstyle ':vcs_info:git:*' check-for-changes true
# formatに入る変数の最大数
zstyle ':vcs_info:*' max-exports 6

# ブランチ名@ディレクトリ名で表示する
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'

# 何か特別な状況になった時にformatsの代わりにactionformatsを使う
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'

# ブランチ名@リポジトリ名で表示し、指定した色をつける
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} # addのみ、commitされていないとき
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} # addされていないとき
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg_bold[cyan]} # 変更なし、未追跡ファイルあり
    else color=${fg[blue]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}

########################################
# キーバインド設定
# コマンドラインの編集モードをViにする
bindkey -v

# バックスペースキーで文字を削除する
bindkey -v '^?' backward-delete-char

# Shift-Tabで候補を逆順に補完する
# bindkey '^[[Z' reverse-menu-complete

########################################
# ヒストリ設定
# コマンドのオプションや引数を補完する
autoload -Uz compinit && compinit -u

# フック機能を有効にする
# autoload -Uz add-zsh-hook

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# コマンド履歴を保存するファイルを指定
HISTFILE=~/.zsh_history

# コマンド履歴に実行時間も記録する
setopt extended_history

# コマンドを途中まで入力後、ヒストリから絞り込み
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^b' history-beginning-search-forward-end

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を一覧で表示する
setopt auto_list
# 補完キー連打で候補順に自動で補完する
setopt auto_menu

# 履歴中の重複行をすべて削除する
setopt hist_ignore_all_dups
# 直前と重複するコマンドを記録しない
setopt hist_ignore_dups
# 履歴と重複するコマンドを記録しない
setopt hist_save_no_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# コマンド中の余分なスペースは削除して履歴に記録する
setopt hist_reduce_blanks
# # 以降をコメントとして扱う
setopt interactive_comments

# 履歴をすぐに追加する（通常はシェル終了時）
setopt inc_append_history

# メモリに保存する履歴の件数を指定する
export HISTSIZE=1000
# ファイルに保存する履歴の件数を指定する
export SAVEHIST=1000000

# = 以降も補完する（例：--option=value）
setopt magic_equal_subst

########################################
# エイリアス設定
# よく使うコマンド
alias vi='vim'
alias la='ls -la'
alias ll='ls -la'

# 再起動 relogin
alias relogin='exec $SHELL -l'

# 上書きされるファイルがある場合、確認を入れる
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ディレクトリ/ディレクトリを作成できるようにする
alias mkdir='mkdir -p'

# sudoでPATHなどの環境変数を引き継ぐ
alias sudo='sudo -E env PATH=$PATH'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo'

# ディレクトリやファイル容量を確認
alias du='du -h'
# ディスクの容量を確認
alias df='df -h'

#######################################
#エディタ設定
# IDEをターミナルから開く
idea () {
  /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea $(cd "${1}" && /bin/pwd)
}

# Goglandをターミナルから開く
ggld () {
  /Applications/Gogland\ 1.0\ EAP.app/Contents/MacOS/gogland $(cd "${1}" && /bin/pwd)
}

#######################################
# パス設定
# gvm
[[ -s "/Users/mo-watanabe/.gvm/scripts/gvm" ]] && source "/Users/mo-watanabe/.gvm/scripts/gvm"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# gvm
[[ -s "/Users/mo-watanabe/.gvm/scripts/gvm" ]] && source "/Users/mo-watanabe/.gvm/scripts/gvm"