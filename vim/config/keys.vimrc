nnoremap <Space> <Nop>
let mapleader   = " "
let g:mapleader = " "

nnoremap ; :

" remap vim 0 to first non-blank character
map 0 ^

nmap <leader>w :w!<CR>

" start interactive EasyAlign in visual mode (e.g. vipea)
xmap ea <Plug>(EasyAlign)

" toggle paste mode
set pastetoggle=<F1>

" toggle NERDTree
map <silent> <F2> :NERDTreeToggle<CR>

" run make
map <F3> :!make<CR>

" run shell cmd in a new window
map <F4> :Shell<Space>

" toggle whitespace listing
noremap  <silent> <F5> :set list!<CR>
inoremap <silent> <F5> <C-o>:set list!<CR>
cnoremap <silent> <F5> <C-c>:set list!<CR>

" select line from first to last non-ws
vnoremap <silent> il :<C-U>normal ^vg_<CR>
omap     <silent> il :normal      vil<CR>

" copy last yanked text to clipboard
nnoremap <C-c> :call system("xclip -selection clipboard", @")<CR>

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
" useful when editing files in the same directory
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

" toggle spell checking
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sc z=

" show/close git hunk
nmap <silent> <leader>gg :GitGutterToggle<CR>
nmap <silent> <leader>gs <Plug>(GitGutterPreviewHunk)
nmap <silent> <leader>gk :bdelete gitgutter://hunk-preview<CR>
