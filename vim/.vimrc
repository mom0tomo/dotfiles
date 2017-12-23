" encording
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
scriptencoding utf-8

" view(not for GUI)
syntax on
set showcmd
set title
set ruler
set number
set list
set cursorline
set laststatus=2
set wrap
set guifont=Ricty-RegularForPowerline:h11
set lines=100
set columns=180
set cmdheight=2
set t_Co=256
set termguicolors
set background=dark

" formating
set ambiwidth=double
set formatoptions+=mM
set virtualedit=onemore

" indent
set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=2
set autoindent
set smartindent
set backspace=indent,eol,start

" search
set incsearch
set ignorecase
set smartcase

" edit
set hlsearch
set wrapscan
set backspace=indent,eol,start
set showmatch
set wildmenu
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" key
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
"nnoremap <up> gk
inoremap <C-c> <Esc> 
noremap <S-h> ^
noremap <S-l> $
"for insert mode
inoremap <C-j>  <down>
inoremap <C-k>  <up>
inoremap <C-h>  <left>
inoremap <C-l>  <right>
nnoremap == gg=G    
" !!!!Don't use cursor key!!!!
noremap  <up>    <nop>
noremap  <left>  <nop>
noremap  <right> <nop>
noremap  <down>  <nop>
noremap! <up>    <nop>
noremap! <left>  <nop>
noremap! <right> <nop>
noremap! <down>  <nop>

" complement
set wildmenu
set history=5000
set paste
set wildmode=list:longest
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" misc
set wildmode=list:longest
set virtualedit=onemore
set ambiwidth=double
set nobackup
set noswapfile
set autoread
set autowrite
set hidden
set clipboard+=unnamed

" dein.vim
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = '~/.vim/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = 'vim/dein.toml'

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" colorscheme monokai
