set nocompatible
set encoding=utf-8
set fileformats=unix,dos
set history=10000

set shortmess+=I
set shortmess-=S

set number
set relativenumber
set scrolloff=10

set laststatus=2

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set autoread

set ignorecase
set smartcase
set autoindent
set smartindent

set hlsearch
set incsearch

set hidden
set lazyredraw
set ttimeoutlen=0
set updatetime=500

set noshowmode
set virtualedit=all

" better searching
set path+=**
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

filetype plugin indent on

autocmd BufWrite * :call DeleteTrailingWS()

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set t_Co=256
set background=dark
set cursorline
syntax enable

try
    colorscheme sierra
catch
    colorscheme elflord
endtry

runtime! ftplugin/man.vim
