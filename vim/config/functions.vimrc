" display output of shell commands in a new window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1,substitute(getline(2),'.','=','g'))
    execute '$read !'. expanded_cmdline
    setlocal modifiable
    1
endfunction


func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc


" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

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


" common regex replace
function! ToGraph() range
    execute a:firstline . "," . a:lastline . 's/\(\d\)\+\( \)\{1\}\(\d\)\+\(\n\)\{1\}/\1 -> \3\, /g'
endfunction
