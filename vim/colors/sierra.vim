"AUTHOR: Alessandro Yorba
"SCRIPT: https://github.com/AlessandroYorba/Sierra
"
" SUPPORT:
" 256 color terminals, Gui versions of vim, and Termguicolors versions of vim

set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="sierra"

"COMMON COLORS AND SETTINGS
hi PreProc       guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi Function      guifg=#afd7d7 guibg=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi Identifier    guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Statement     guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Constant      guifg=#af5f5f guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
hi Type          guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi Number        guifg=#d78787 guibg=NONE gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
hi Label         guifg=#af5f5f guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
hi String        guifg=#dfafaf guibg=NONE gui=NONE ctermfg=181 ctermbg=NONE cterm=NONE
hi Special       guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
hi Operator      guifg=#b2b2b2 guibg=NONE gui=NONE ctermfg=249 ctermbg=NONE cterm=NONE
hi Title         guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi Conditional   guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66  ctermbg=NONE cterm=NONE
hi StorageClass  guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
hi htmlStatement guifg=#afd7d7 guibg=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi htmlItalic    guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi htmlArg       guifg=#d78787 guibg=NONE gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
hi cssTagName    guifg=#afd7d7 guibg=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi cssClassName  guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi cssIdentifier guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE

" VIMSCRIPT
hi link vimAutoCmdSfxList Type
hi link vimAutoEventList  Identifier
hi link vimCmdSep         Special
hi link vimCommentTitle   SpecialComment
hi link vimFunction       Function
hi link vimUserFunc       Function

"DIFF
hi DiffAdd    guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
hi DiffText   guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
hi DiffChange guifg=#5f8787 guibg=NONE gui=reverse ctermfg=66  ctermbg=NONE cterm=reverse
hi DiffDelete guifg=#af5f5f guibg=NONE gui=reverse ctermfg=131 ctermbg=NONE cterm=reverse

hi link diffAdded     DiffAdd
hi link diffBDiffer   WarningMsg
hi link diffChanged   DiffChange
hi link diffCommon    WarningMsg
hi link diffDiffer    WarningMsg
hi link diffFile      Directory
hi link diffIdentical WarningMsg
hi link diffIndexLine Number
hi link diffIsA       WarningMsg
hi link diffNoEOL     WarningMsg
hi link diffOnly      WarningMsg
hi link diffRemoved   DiffDelete

"SPELLING
hi SpellBad   guifg=#ff0000 guibg=NONE gui=undercurl ctermfg=196 ctermbg=NONE cterm=undercurl
hi SpellLocal guifg=#5f875f guibg=NONE gui=undercurl ctermfg=65  ctermbg=NONE cterm=undercurl
hi SpellCap   guifg=#87afff guibg=NONE gui=undercurl ctermfg=111 ctermbg=NONE cterm=undercurl
hi SpellRare  guifg=#ff8700 guibg=NONE gui=undercurl ctermfg=208 ctermbg=NONE cterm=undercurl

"WINDOW UI
hi MoreMsg         guifg=#dfaf5f guibg=NONE    gui=NONE    ctermfg=179 ctermbg=NONE cterm=NONE
hi SpecialComment  guifg=#767676 guibg=NONE    gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
hi VimCommentTitle guifg=#767676 guibg=NONE    gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
hi Underlined      guifg=#dfaf87 guibg=NONE    gui=NONE    ctermfg=180 ctermbg=NONE cterm=NONE
hi FoldColumn      guifg=#afd7d7 guibg=NONE    gui=NONE    ctermfg=152 ctermbg=NONE cterm=NONE
hi Todo            guifg=#eeeeee guibg=#1c1c1c gui=reverse ctermfg=255 ctermbg=234  cterm=reverse
hi Visual          guifg=#dfdfdf guibg=#875f5f gui=NONE    ctermfg=188 ctermbg=95   cterm=NONE
hi Question        guifg=#dfaf5f guibg=NONE    gui=NONE    ctermfg=179 ctermbg=NONE cterm=NONE
hi Search          guifg=#87af87 guibg=NONE    gui=reverse ctermfg=108 ctermbg=NONE cterm=reverse
hi MatchParen      guifg=#eeeeee guibg=#875f5f gui=NONE    ctermfg=255 ctermbg=95   cterm=NONE
hi Error           guifg=#d75f5f guibg=NONE    gui=reverse ctermfg=167 ctermbg=NONE cterm=reverse
hi ErrorMsg        guifg=#d75f5f guibg=NONE    gui=NONE    ctermfg=167 ctermbg=NONE cterm=NONE
hi WarningMsg      guifg=#d75f5f guibg=NONE    gui=NONE    ctermfg=167 ctermbg=NONE cterm=NONE
hi netrwExe        guifg=#d75f5f guibg=NONE    gui=NONE    ctermfg=167 ctermbg=NONE cterm=NONE
hi Directory       guifg=#af8787 guibg=NONE    gui=NONE    ctermfg=138 ctermbg=NONE cterm=NONE
hi Cursor          guifg=#000000 guibg=#ffffff gui=NONE    ctermfg=16  ctermbg=231  cterm=NONE
hi WildMenu        guifg=#c6c6c6 guibg=NONE    gui=reverse ctermfg=251 ctermbg=NONE cterm=reverse
hi ModeMsg         guifg=#dfdfdf guibg=NONE    gui=NONE    ctermfg=188 ctermbg=NONE cterm=NONE
hi SignColumn      guifg=#87af87 guibg=NONE    gui=NONE    ctermfg=108 ctermbg=NONE cterm=NONE

"COLORS
hi Normal  guifg=#dfdfdf guibg=#262626 gui=NONE ctermfg=188 ctermbg=235  cterm=NONE
hi Comment guifg=#585858 guibg=NONE    gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE

"WINDOW UI
hi StatusLine       guifg=#eeeeee guibg=#1c1c1c gui=NONE ctermfg=255 ctermbg=234 cterm=NONE
hi StatusLineNC     guifg=#6c6c6c guibg=#1c1c1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE
hi StatusLineTerm   guifg=#eeeeee guibg=#1c1c1c gui=NONE ctermfg=255 ctermbg=234 cterm=NONE
hi StatusLineTermNC guifg=#6c6c6c guibg=#1c1c1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE

hi Pmenu        guifg=#6c6c6c guibg=#303030 gui=NONE ctermfg=242  ctermbg=236  cterm=NONE
hi PmenuSel     guifg=#eeeeee guibg=#303030 gui=NONE ctermfg=255  ctermbg=236  cterm=NONE
hi PmenuSbar    guifg=#303030 guibg=#303030 gui=NONE ctermfg=236  ctermbg=236  cterm=NONE
hi PmenuThumb   guifg=#303030 guibg=#303030 gui=NONE ctermfg=236  ctermbg=236  cterm=NONE
hi TabLine      guifg=#6c6c6c guibg=#1c1c1c gui=NONE ctermfg=242  ctermbg=234  cterm=NONE
hi TabLineSel   guifg=#eeeeee guibg=#1c1c1c gui=NONE ctermfg=255  ctermbg=234  cterm=NONE
hi TabLineFill  guifg=NONE    guibg=#1c1c1c gui=NONE ctermfg=NONE ctermbg=234  cterm=NONE
hi CursorLine   guifg=NONE    guibg=NONE    gui=NONE ctermfg=NONE ctermbg=236  cterm=NONE
hi CursorLineNR guifg=#9e9e9e guibg=#1c1c1c gui=NONE ctermfg=167  ctermbg=NONE cterm=NONE
hi CursorColumn guifg=NONE    guibg=#303030 gui=NONE ctermfg=NONE ctermbg=236  cterm=NONE
hi ColorColumn  guifg=NONE    guibg=#303030 gui=NONE ctermfg=NONE ctermbg=236  cterm=NONE
hi Folded       guifg=#6c6c6c guibg=NONE    gui=NONE ctermfg=242  ctermbg=NONE cterm=NONE
hi VertSplit    guifg=#3a3a3a guibg=#262626 gui=NONE ctermfg=242  ctermbg=235  cterm=NONE
hi LineNr       guifg=#4e4e4e guibg=#1c1c1c gui=NONE ctermfg=102  ctermbg=NONE cterm=NONE
hi NonText      guifg=#3a3a3a guibg=NONE    gui=NONE ctermfg=247  ctermbg=NONE cterm=NONE
hi SpecialKey   guifg=#3a3a3a guibg=NONE    gui=NONE ctermfg=247  ctermbg=NONE cterm=NONE

"make bg transparent
hi Normal guibg=NONE ctermbg=NONE

"darker cursorline in insert mode
au InsertEnter * hi CursorLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
au InsertLeave * hi CursorLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
