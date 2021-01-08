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
