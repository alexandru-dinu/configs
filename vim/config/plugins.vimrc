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
    \ 'colorscheme': 'srcery_drk',
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
    \   'whitespace': 'error',
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
