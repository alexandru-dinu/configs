set nocompatible
set encoding=utf8

set nobackup
set nowb
set noswapfile

set shortmess+=I
set shortmess-=S
set laststatus=2
set noshowmode
set fileformats=unix,dos,mac
set virtualedit=all
set history=1000
set scrolloff=10
set cmdheight=1

set number
set relativenumber

set autoread
set hidden
set showmatch
set mat=2

" use case if any caps are used
set ignorecase
set smartcase

" use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set magic
set hlsearch
set incsearch
set lazyredraw

set autoindent
set smartindent
set wrap

" linebreak on 500 characters
set linebreak
set textwidth=500

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set ttimeoutlen=0
set updatetime=500

filetype plugin indent on

" vimdiff
if &diff
    map ] ]c
    map [ [c
endif

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" set whitespace type
set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" delete trailing whitespace on save
autocmd BufWrite * :call DeleteTrailingWS()

" better searching
set path+=**
set hidden
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab

" colorscheme
set t_Co=256
set background=dark
set cursorline
syntax enable

try
    colorscheme sierra
catch
    colorscheme elflord
endtry

" enable built-in manpage viewer
runtime! ftplugin/man.vim
