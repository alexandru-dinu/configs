runtime! ftplugin/man.vim

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" set whitespace type
set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

" delete trailing whitespace on save
autocmd BufWrite * :call DeleteTrailingWS()

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" vimdiff
if &diff
    set cursorline
    map ] ]c
    map [ [c
endif

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

" for gitgutter
set updatetime=750
