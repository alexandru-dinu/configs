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

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'fcpg/vim-osc52'
Plugin 'itchyny/lightline.vim'
Plugin 'deponian/vim-lightline-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

call vundle#end()

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
    \              [ 'filetype', 'fileformat', 'fileencoding'  ] ],
    \ },
    \ 'component_function': {
    \   'fileencoding': "SimpleFileencoding",
    \   'lineinfo': "SimpleLineinfo",
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

function! SimpleFileencoding() abort
    let l:enc = (&fenc !=# '' ? &fenc : &enc)
    return (enc == 'utf-8' ? '' : enc)
endfunction

function! SimpleLineinfo() abort
    let l:li = line('.') . ':' . col('.') . '/' . line('$')
    let l:pc = string(100 * line('.') / line('$'))
    return li . ' (' . pc . '%)'
endfunction
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

function! VisualSelection() range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


" escape special characters in a string for exact matching.
" based on http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
    let string=a:string
    let string = escape(string, '^$.*\/~[]')
    let string = substitute(string, '\n', '\\n', 'g')
    return string
endfunction

" get the current visual block for search and replaces
" based on https://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
    " save the current register and clipboard
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&

    " put the current visual selection in the " register
    normal! ""gvy
    let selection = getreg('"')

    " put the saved registers and clipboards back
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save

    " escape any special characters in the selection
    let escaped_selection = EscapeString(selection)

    return escaped_selection
endfunction


""" KEY-BINDINGS

nnoremap <Space> <Nop>
let mapleader   = " "
let g:mapleader = " "

" remap vim 0 to first non-blank character
map 0 ^

" start interactive EasyAlign in visual mode (e.g. vipea)
xmap ea <Plug>(EasyAlign)

" toggle paste mode
set pastetoggle=<F1>

" toggle NERDTree
map <silent> <F2> :NERDTreeToggle<CR>

" run make
map <F3> :!make<CR>

" toggle whitespace listing
noremap  <silent> <F4> :set list!<CR>
inoremap <silent> <F4> <C-o>:set list!<CR>
cnoremap <silent> <F4> <C-c>:set list!<CR>

" select line from first to last non-ws
vnoremap <silent> il :<C-U>normal ^vg_<CR>
omap     <silent> il :normal      vil<CR>

" copy last yanked text to clipboard
"nnoremap <C-c> :call system("xclip -selection clipboard", @")<CR>
vmap <C-c> y:Oscyank<CR>

" substitute all occurrences of the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/
vnoremap <leader>s <Esc>:%s/<c-r>=GetVisual()<CR>/

" disable highlight
map <silent> <leader><CR> :noh<CR>

" visual mode pressing * or # searches for the current selection
" from Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection()<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection()<CR>?<C-R>=@/<CR><CR>

" buffers
map <leader>f  :Files<CR>
map <leader>b  :Buffers<CR>
map <leader>bl :ls<CR>
map <leader>bk :Bclose<CR>
map <leader>bn :bnext<CR>
map <leader>bp :bprevious<CR>

" tabs
map <silent> <leader>tn :tabnew<CR>
map <silent> <leader>to :tabonly<CR>
map <silent> <leader>tk :tabclose<CR>
map <silent> <leader>tm :tabmove<CR>
map <silent> <leader>t<leader> :tabnext<CR>

" opens a new tab with the current buffer's path
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
nmap <silent> <leader>gk :bdelete gitgutter://hunk-preview<CR>
nmap <silent> <leader>gu <Plug>(GitGutterUndoHunk)


""" LANGUAGE-SPECIFIC

" separate configs for specific extensions
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.wppl setfiletype javascript

" run selection in interpreter
xnoremap <leader>py :w !python<CR>
xnoremap <leader>hs :w !ghci<CR>
