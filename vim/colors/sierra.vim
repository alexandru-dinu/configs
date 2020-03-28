"AUTHOR: Alessandro Yorba
"SCRIPT: https://github.com/AlessandroYorba/Sierra
"
" SUPPORT:
" 256 color terminals, Gui versions of vim, and Termguicolors versions of vim

set background=dark

highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="sierra"

"COMMON COLORS AND SETTINGS
highlight PreProc guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight Function guifg=#afd7d7 guibg=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
highlight Identifier guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
highlight Statement guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
highlight Constant guifg=#af5f5f guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight Type guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight Number guifg=#d78787 guibg=NONE gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
highlight Label guifg=#af5f5f guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight String guifg=#dfafaf guibg=NONE gui=NONE ctermfg=181 ctermbg=NONE cterm=NONE
highlight Special guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
highlight Operator guifg=#b2b2b2 guibg=NONE gui=NONE ctermfg=249 ctermbg=NONE cterm=NONE
highlight Title guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight Conditional guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
highlight StorageClass guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
highlight htmlStatement guifg=#afd7d7 guibg=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
highlight htmlItalic guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight htmlArg guifg=#d78787 guibg=NONE gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
highlight cssTagName guifg=#afd7d7 guibg=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
highlight cssClassName guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight cssIdentifier guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE

" VIMSCRIPT
highlight link vimAutoCmdSfxList Type
highlight link vimAutoEventList Identifier
highlight link vimCmdSep Special
highlight link vimCommentTitle SpecialComment
highlight link vimFunction Function
highlight link vimUserFunc Function

"DIFF
highlight DiffAdd guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight DiffText guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight DiffChange guifg=#5f8787 guibg=NONE gui=reverse ctermfg=66 ctermbg=NONE cterm=reverse
highlight DiffDelete guifg=#af5f5f guibg=NONE gui=reverse ctermfg=131 ctermbg=NONE cterm=reverse
highlight link diffAdded DiffAdd
highlight link diffBDiffer WarningMsg
highlight link diffChanged DiffChange
highlight link diffCommon WarningMsg
highlight link diffDiffer WarningMsg
highlight link diffFile Directory
highlight link diffIdentical WarningMsg
highlight link diffIndexLine Number
highlight link diffIsA WarningMsg
highlight link diffNoEOL WarningMsg
highlight link diffOnly WarningMsg
highlight link diffRemoved DiffDelete

"SPELLING
highlight SpellBad guifg=#ff0000 guibg=NONE gui=undercurl ctermfg=196 ctermbg=NONE cterm=undercurl
highlight SpellLocal guifg=#5f875f guibg=NONE gui=undercurl ctermfg=65 ctermbg=NONE cterm=undercurl
highlight SpellCap guifg=#87afff guibg=NONE gui=undercurl ctermfg=111 ctermbg=NONE cterm=undercurl
highlight SpellRare guifg=#ff8700 guibg=NONE gui=undercurl ctermfg=208 ctermbg=NONE cterm=undercurl

"WINDOW UI
highlight MoreMsg guifg=#dfaf5f guibg=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
highlight SpecialComment guifg=#767676 guibg=NONE gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
highlight VimCommentTitle guifg=#767676 guibg=NONE gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
highlight Underlined guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight FoldColumn guifg=#afd7d7 guibg=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
highlight Todo guifg=#eeeeee guibg=#1c1c1c gui=reverse ctermfg=255 ctermbg=234 cterm=reverse
highlight Visual guifg=#dfdfdf guibg=#875f5f gui=NONE ctermfg=188 ctermbg=95 cterm=NONE
highlight Question guifg=#dfaf5f guibg=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
highlight Search guifg=#87af87 guibg=NONE gui=reverse ctermfg=108 ctermbg=NONE cterm=reverse
highlight MatchParen guifg=#eeeeee guibg=#875f5f gui=NONE ctermfg=255 ctermbg=95 cterm=NONE
highlight Error guifg=#d75f5f guibg=NONE gui=reverse ctermfg=167 ctermbg=NONE cterm=reverse
highlight ErrorMsg guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight WarningMsg guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight netrwExe guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight Directory guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
highlight Cursor guifg=#000000 guibg=#ffffff gui=NONE ctermfg=16 ctermbg=231 cterm=NONE
highlight WildMenu guifg=#c6c6c6 guibg=NONE gui=reverse ctermfg=251 ctermbg=NONE cterm=reverse
highlight ModeMsg guifg=#dfdfdf guibg=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE
highlight SignColumn guifg=#87af87 guibg=NONE gui=NONE ctermfg=108 ctermbg=NONE cterm=NONE

"COLORS
highlight Normal guifg=#dfdfdf guibg=#262626 gui=NONE ctermfg=188 ctermbg=235 cterm=NONE
highlight Comment guifg=#585858 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE

"WINDOW UI
highlight StatusLine guifg=#eeeeee guibg=#1c1c1c gui=NONE ctermfg=255 ctermbg=234 cterm=NONE
highlight StatusLineNC guifg=#6c6c6c guibg=#1c1c1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE
highlight StatusLineTerm guifg=#eeeeee guibg=#1c1c1c gui=NONE ctermfg=255 ctermbg=234 cterm=NONE
highlight StatusLineTermNC guifg=#6c6c6c guibg=#1c1c1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE

highlight Pmenu guifg=#6c6c6c guibg=#303030 gui=NONE ctermfg=242 ctermbg=236 cterm=NONE
highlight PmenuSel guifg=#eeeeee guibg=#303030 gui=NONE ctermfg=255 ctermbg=236 cterm=NONE
highlight PmenuSbar guifg=#303030 guibg=#303030 gui=NONE ctermfg=236 ctermbg=236 cterm=NONE
highlight PmenuThumb guifg=#303030 guibg=#303030 gui=NONE ctermfg=236 ctermbg=236 cterm=NONE
highlight TabLine guifg=#6c6c6c guibg=#1c1c1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE
highlight TabLineSel guifg=#eeeeee guibg=#1c1c1c gui=NONE ctermfg=255 ctermbg=234 cterm=NONE
highlight TabLineFill guifg=NONE guibg=#1c1c1c gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE

highlight CursorLineNR guifg=#9e9e9e guibg=#1c1c1c gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight CursorLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight CursorColumn guifg=NONE guibg=#303030 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#303030 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
highlight Folded guifg=#6c6c6c guibg=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
highlight VertSplit guifg=#3a3a3a guibg=#262626 gui=NONE ctermfg=237 ctermbg=235 cterm=NONE
highlight LineNr guifg=#4e4e4e guibg=#1c1c1c gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight NonText guifg=#3a3a3a guibg=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
highlight SpecialKey guifg=#3a3a3a guibg=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE

"make bg transparent
hi Normal guibg=NONE ctermbg=NONE