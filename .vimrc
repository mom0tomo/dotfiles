set encoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
scriptencoding utf-8　" Vim script内でマルチバイト文字を使う

"---------------------------------------------------------------------------
" 文字コード設定:
set fileencoding=utf-8　" 保存時の文字コード
set ambiwidth=double " □や○文字が崩れる問題を解決
set formatoptions+=mM " テキスト挿入中の自動折り返しを日本語に対応させる

"---------------------------------------------------------------------------
" タブ・インデント設定:
set expandtab " タブをスペースに置き換える
set tabstop=2 " タブの幅
set softtabstop=2 " タブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅
set list " タブや改行を表示 (nolist:非表示)
" バックスペースでインデントや改行を削除できるようにする

"---------------------------------------------------------------------------
" 文字列検索設定:
set incsearch " １文字入力毎に検索を行う
set ignorecase " 大文字小文字を区別しない
set smartcase " 大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ESCキー2度押しでハイライトの切り替え
set wrapscan " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)

"---------------------------------------------------------------------------
" カーソル設定:
set ruler " カーソルのある場所を表示 (noruler:非表示)
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルのある行をハイライト
set backspace=indent,eol,start " バックスペースキーの有効化

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"---------------------------------------------------------------------------
" 括弧・タグジャンプ設定:
set showmatch " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張 ノーマルモード時に「%」キーで対応するカッコにジャンプする

"---------------------------------------------------------------------------
" コマンド補完設定:
set wildmenu " コマンドモードの補完 コマンドの補完を視覚的に分かりやすく表示する　(参照 :help wildmenu)
set history=5000 " 保存するコマンド履歴の数

"---------------------------------------------------------------------------
" ペースト設定:
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set paste " コピペのとき変な改行をしない

"---------------------------------------------------------------------------
" マウス有効化設定:
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"---------------------------------------------------------------------------
" 表示設定:
set title " タイトルバーを表示（notitle:非表示）
set wrap " 長い行を折り返して表示 (nowrap:折り返さない)
set laststatus=2 " 常にステータス行を表示
set visualbell t_vb= " 行数を振らない(:set nuで表示)
set cmdheight=2 " コマンドラインの高さ
set showcmd " コマンドをステータス行に表示

"---------------------------------------------------------------------------
" その他設定:
set ambiwidth=double " ビープ音をオフ
let format_allow_over_tw = 1    " ぶら下り可能幅
syntax on " シンタックス
" どの文字でタブや改行を表示するかを設定(表示しないように)
set listchars=
" set listchars=tab:,extends:<,trail:-,eol:<
set hidden " 保存しなくても別のテキストファイルに切り替える

"----------------------------------------------------------------------------
" テーマ設定:
syntax enable
colorscheme monokai

"---------------------------------------------------------------------------
" Vimプラグイン設定:
" dein.vim
let s:dein_dir = expand('~/.cache/dein') " プラグインが実際にインストールされるディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim' " dein.vim 本体

if &runtimepath !~# '/dein.vim' " dein.vim がなければ github から落としてくる
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir) " 設定開始
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc') " プラグインリストを収めた TOML ファイル
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0}) " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end() " 設定終了
  call dein#save_state()
endif

if dein#check_install() " もし、未インストールものものがあったらインストール
  call dein#install()
endif
