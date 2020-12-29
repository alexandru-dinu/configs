" Vundle START
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
Plugin 'junegunn/vim-easy-align'
Plugin 'airblade/vim-gitgutter'

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle END

" vimtex
let g:tex_flavor='latex'

" ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" airline
let g:airline_theme = 'distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#searchcount#enabled = 0

" abbreviate modes
let g:airline_mode_map = {
      \ '__': '-',
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'c' : 'C',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ '': 'VB',
      \ 's' : 'S',
      \ 'S' : 'S',
      \ '': 'S',
      \ }
let g:airline#extensions#wordcount#formatter#default#fmt = '%s W'

" nerdtree
let NERDTreeShowHidden = 1

" gitgutter
let g:gitgutter_map_keys = 0
" only enable in repositories
let g:gitgutter_enabled = 0
let is_git = system("git ls-files --error-unmatch " . expand('%:p'))
if v:shell_error == 0
    let g:gitgutter_enabled = 1
endif
