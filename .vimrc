" encording
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
scriptencoding utf-8

" view
syntax on
set showcmd
set title
set ruler
set number
set cursorline
set showmatch
set laststatus=2
set wrap
set t_Co=256
colorscheme monokai

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
set hlsearch
set wrapscan
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" key
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" complement
set wildmenu
set history=5000
set paste
set wildmode=list:longest

" golang
au FileType go nmap gr (go-run)  
au FileType go nmap gt (go-test)  
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" misc
set virtualedit=onemore
set ambiwidth=double
set nobackup
set noswapfile
set autoread
set hidden

" dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=/Users/momo/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/momo/.cache/dein')
  call dein#begin('/Users/momo/.cache/dein')
	
	call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
	call dein#add('fatih/vim-go')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
