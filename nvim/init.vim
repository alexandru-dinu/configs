set shortmess+=I
set shortmess-=S

set number
set relativenumber
set scrolloff=10

set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set smartindent
set ttimeoutlen=0
set updatetime=500

set hidden
set lazyredraw

set cursorline
set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd BufWrite * :call DeleteTrailingWS()
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
