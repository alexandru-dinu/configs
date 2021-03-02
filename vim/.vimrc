if !has('nvim')
    set nocompatible
    set encoding=utf-8
    set fileformats=unix,dos
    set history=10000
    set laststatus=2

    set autoread
    set autoindent
    set smarttab
    set wildmenu

    set hlsearch
    set incsearch

    set virtualedit=all

    set t_Co=256
    set background=dark
    syntax enable

    filetype plugin indent on

    runtime! ftplugin/man.vim
endif

set shortmess+=I
set shortmess-=S
set noshowmode

set number
set relativenumber
set scrolloff=10

set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set smartindent

set hidden
set lazyredraw
set ttimeoutlen=0
set updatetime=500

set cursorline
set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

" return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" delete whitespace on save
autocmd BufWrite * exe "normal mz" | %s/\s\+$//ge | exe "normal `z"

try
    colorscheme sierra
catch
    colorscheme elflord
endtry


""" PLUGINS
if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'itchyny/lightline.vim'
Plug 'deponian/vim-lightline-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
if !has('nvim')
    Plug 'fcpg/vim-osc52'
endif
" Plug 'sirver/ultisnips' " TODO: slow!
" Plug 'lervag/vimtex'

call plug#end()


" nerdtree
let NERDTreeShowHidden = 1

" vimtex
let g:tex_flavor = 'latex'

" ultisnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" gitgutter (only enable in repositories)
let g:gitgutter_enabled  = 0
let g:gitgutter_map_keys = 0
let is_git = system("cd $(dirname " . expand("%:p") . ") && git ls-files --error-unmatch " . expand("%:p") . " && cd -")
if v:shell_error == 0
    let g:gitgutter_enabled = 1
endif

" lightline
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \ 	'left': [ [ 'mode', 'paste', 'spell' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'whitespace' ],
    \              [ 'lineinfo' ],
    \              [ 'filetype', 'fileformat', 'fileencoding' ] ],
    \ },
    \ 'component_function': {
    \   'fileencoding': 'LL_fileencoding',
    \   'lineinfo': 'LL_lineinfo',
    \   'vimtype': 'LL_vimtype',
    \ },
    \ 'component_expand': {
    \   'whitespace': 'lightline#whitespace#check',
    \ },
    \ 'component_type': {
    \   'whitespace': 'warning',
    \ },
    \ 'mode_map': {
    \     'n' : 'N',
    \     'i' : 'I',
    \     'R' : 'R',
    \     'v' : 'V',
    \     'V' : 'VL',
    \     '': 'VB',
    \     'c' : 'C',
    \     's' : 'S',
    \     'S' : 'SL',
    \     '': 'SB',
    \     't': 'T',
    \   },
    \ }

if has('nvim')
    let g:lightline.colorscheme = 'seoul256'
endif

func! LL_fileencoding() abort
    let l:enc = (&fenc !=# '' ? &fenc : &enc)
    return (enc == 'utf-8' ? '' : enc)
endfunc

func! LL_lineinfo() abort
    let l:li = line('.') . ':' . col('.') . '/' . line('$')
    let l:pc = string(100 * line('.') / line('$'))
    return li . ' (' . pc . '%)'
endfunc


func! GetVisual() range
    " get the current visual block for search and replace
    normal! ""gvy

    let l:sel = getreg('"')
    let l:sel = escape(sel, '^$.*\/~[]')
    let l:sel = substitute(sel, '\n', '\\n', 'g')

    return sel
endfunc


func! VisualSelection() range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let @/ = l:pattern
    let @" = l:saved_reg
endfunc


""" KEY-BINDINGS
nnoremap <Space> <Nop>
let g:mapleader = " "

" start interactive EasyAlign in visual mode (e.g. vipea)
xmap ea <Plug>(EasyAlign)

" toggle paste mode
set pastetoggle=<F1>

" toggle NERDTree
map <silent> <F2> :NERDTreeToggle<CR>

" toggle whitespace listing
noremap  <silent> <F3> :set list!<CR>
inoremap <silent> <F3> <C-o>:set list!<CR>
cnoremap <silent> <F3> <C-c>:set list!<CR>

" copy last yanked text to clipboard
if !has('nvim')
    "nnoremap <C-c> :call system("xclip -selection clipboard", @")<CR>
    vmap <C-c> y:Oscyank<CR>
endif

" substitute all occurrences of the word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
vnoremap <leader>r <Esc>:%s/<c-r>=GetVisual()<CR>/

" disable highlight
map <silent> <leader><CR> :noh<CR>

" visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection()<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection()<CR>?<C-R>=@/<CR><CR>

" buffers
map <leader>f  :Files<CR>
map <leader>bs :Buffers<CR>
map <leader>bl :ls<CR>
map <leader>bk :bd<CR>
map <leader>bn :bnext<CR>
map <leader>bp :bprevious<CR>

" tabs
map <silent> <leader>tn :tabnew<CR>
map <silent> <leader>to :tabonly<CR>
map <silent> <leader>tk :tabclose<CR>
map <silent> <leader>tm :tabmove<CR>
map <silent> <leader>t<leader> :tabnext<CR>
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" resize splits
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 11/10)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 10/11)<CR>
nnoremap <silent> <Leader>0 :exe "vertical resize " . (winwidth(0) * 11/10)<CR>
nnoremap <silent> <Leader>9 :exe "vertical resize " . (winwidth(0) * 10/11)<CR>

" spell checking
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sc z=

" GitGutter
nmap <silent> <leader>gg :GitGutterToggle<CR>
nmap <silent> <leader>gs <Plug>(GitGutterPreviewHunk)
nmap <silent> <leader>gu <Plug>(GitGutterUndoHunk)
if !has('nvim')
    nmap <silent> <leader>gk :bdelete gitgutter://hunk-preview<CR>
endif

""" LANGUAGE-SPECIFIC

" separate configs for specific extensions
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.wppl setfiletype javascript

" run selection in interpreter
xnoremap <leader>py :w !python<CR>
xnoremap <leader>hs :w !ghci<CR>
