" separate configs for specific extensions
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.wppl setfiletype javascript

" run selection in interpreter
xnoremap <leader>py :w !python<CR>
xnoremap <leader>hs :w !ghci<CR>