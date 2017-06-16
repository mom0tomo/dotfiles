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
set wildmode=list:longest

" formating
set ambiwidth=double
set formatoptions+=mM
set virtualedit=onemore

" indent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
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

" misc
set virtualedit=onemore
set ambiwidth=double
set nobackup
set noswapfile
set autoread
set hidden