set nocompatible
filetype off

set encoding=utf8
set shortmess+=I     " disable startup message
set shortmess-=S     " show search count
set noshowmode       " disable mode show (as airline shows the mode)
set autoread         " when file is read from outside
set ffs=unix,dos,mac " use Unix as the standard file type
set virtualedit=all  " cursor can also be positioned where there is no actual character

set history=1000     " history size
set so=7             " lines to the cursor when moving vertically using j/k

set number           " line numbers...
set relativenumber   " ...are relative to the current one

set foldcolumn=1     " add a bit extra margin to the left
set cmdheight=1      " height of command bar
set hid              " a buffer becomes hidden when it is abandoned

set showmatch        " show matching brackets when text indicator is over them
set mat=2            " how many tenths of a second to blink when matching brackets

set ignorecase
set smartcase        " use case if any caps are used
set hlsearch         " highlight search results
set incsearch        " move the cursor to the matched string, while typing the search pattern

set lazyredraw       " don't redraw while executing macros

set magic            " makes characters have the same meaning as in grep

set ai               " auto indent
set si               " smart indent
set wrap             " wrap lines

set laststatus=2     " always show the status line

" linebreak on 500 characters
set lbr
set tw=500

" use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" for gitgutter
set updatetime=750

" vimdiff
if &diff
    map ] ]c
    map [ [c
endif

" turn backup off
set nobackup
set nowb
set noswapfile

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" set whitespace type
set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

" enable filetype plugins
filetype plugin on
filetype indent on

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
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry


" enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" colorscheme
syntax enable

try
    colorscheme sierra
catch
endtry

set background=dark
set cursorline


runtime! ftplugin/man.vim
