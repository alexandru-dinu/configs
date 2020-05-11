nnoremap <Space> <Nop>
let mapleader   = " "
let g:mapleader = " "

" remap vim 0 to first non-blank character
map 0 ^

nmap <leader>w :w!<CR>

" start interactive EasyAlign in visual mode (e.g. vipea)
xmap ea <Plug>(EasyAlign)

" toggle NERDTree
map <F2> :NERDTreeToggle<CR>

" run shell cmd in a new window
map <F3> :Shell #

" toggle whitespace listing
noremap  <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" copy last yanked text to clipboard
nnoremap <C-c> :call system("xclip -selection clipboard", @")<CR>

" substitute all occurrences of the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" bracket matching
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" go to beginning/end of line
map  <C-a> <ESC>^
map  <C-e> <ESC>$
imap <C-a> <ESC>I
imap <C-e> <ESC>A
xmap <C-a> g^
xmap <C-e> g$

" disable highlight
map <silent> <leader><CR> :noh<CR>

" visual mode pressing * or # searches for the current selection
" from Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" better way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" buffers
map <leader>b  :ls<CR>
map <leader>bd :Bclose<CR>
map <leader>ba :bufdo bd<CR>
map <leader>l  :bnext<CR>
map <leader>h  :bprevious<CR>

" tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" toggle spell checking
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" opens a new tab with the current buffer's path
" useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
