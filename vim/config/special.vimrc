" common regex replace
function! ToGraph() range
    execute a:firstline . "," . a:lastline . 's/\(\d\+\)\(\s\+\)\(\d\+\)\(\n\)\{1\}/\1 -> \3\, /g'
    normal $hx
endfunction
