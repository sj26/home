" Vim color file
" Name:       tango.vim
" Maintainer: none
" URL: https://github.com/vim-scripts/tango-desert.vim
" This should work in the GUI, rxvt-unicode (88 colour mode) and xterm (256
" colour mode). It won't work in 8/16 colour terminals.

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "tango-dark"

hi Normal					gui=NONE guifg=#d3d7cf guibg=#2e3436
hi NonText				gui=NONE guifg=#d3d7cf guibg=#2e3436

" Search
hi IncSearch			gui=NONE guifg=#555753 guibg=#8ae234
hi Search					gui=NONE guifg=#555753 guibg=#8ae234

" Messages
hi ErrorMsg				gui=NONE guifg=#d3d7cf guibg=#cc0000
hi WarningMsg			gui=NONE guifg=#cc0000 guibg=#2e3436

" Split area
hi StatusLine			gui=NONE guifg=#d3d7cf guibg=#204a87
hi StatusLineNC		gui=NONE guifg=#d3d7cf guibg=#204a87

" Diff
"hi DiffText				gui=NONE guifg=#cc0000 guibg=#eeeeec
"hi DiffChange			gui=NONE guifg=#2e3436 guibg=#FFFFFF
"hi DiffDelete			gui=NONE guifg=#FFFFFF guibg=#cc0000
"hi DiffAdd				gui=NONE guifg=#4e9a06 guibg=#8ae234

" Cursor
hi Cursor					gui=NONE guifg=#2e3436 guibg=#eeeeec
hi lCursor				gui=NONE guifg=#2e3436 guibg=#eeeeec
hi CursorIM				gui=NONE guifg=#2e3436 guibg=#eeeeec

" Fold
hi Folded					gui=NONE guifg=#d3d7cf guibg=#3465a4
hi FoldColumn			gui=NONE guifg=#d3d7cf guibg=#3465a4

" Other
hi LineNr					gui=NONE guifg=#babdb6 guibg=#2e3436
hi Directory			gui=NONE guifg=#729fcf guibg=#2e3436
hi NonText				gui=NONE guifg=#ad7fa8 guibg=#2e3436
hi SpecialKey			gui=NONE guifg=#888a85 guibg=#2e3436
hi Title					gui=NONE guifg=#edd400 guibg=#2e3436
hi Visual					gui=NONE guifg=#eeeeec guibg=#204a87

" Syntax group
hi Comment				gui=NONE guifg=#888a85 guibg=#2e3436
hi Constant				gui=NONE guifg=#c17d11 guibg=#2e3436
hi Error					gui=NONE guifg=#cc0000 guibg=#2e3436
hi Identifier			gui=NONE guifg=#babdb6 guibg=#2e3436
hi Ignore					gui=NONE guifg=#eeeeec guibg=#2e3436
hi PreProc				gui=NONE guifg=#73d216 guibg=#2e3436
hi Special				gui=NONE guifg=#ad7fa8 guibg=#2e3436
hi Statement			gui=NONE guifg=#ad7fa8 guibg=#2e3436
hi Todo						gui=NONE guifg=#ad7fa8 guibg=#2e3436
hi Type						gui=NONE guifg=#729fcf guibg=#2e3436
hi Underlined			gui=UNDERLINE guifg=#3465a4 guibg=NONE
hi Italic					gui=ITALIC guifg=#3465a4 guibg=NONE
hi Bold						gui=BOLD guifg=#3465a4 guibg=NONE

" HTML
hi htmlLink									gui=UNDERLINE guifg=#3465a4 guibg=NONE
hi htmlBold									gui=BOLD
hi htmlBoldItalic						gui=BOLD,ITALIC
hi htmlBoldUnderline				gui=BOLD,UNDERLINE
hi htmlBoldUnderlineItalic	gui=BOLD,UNDERLINE,ITALIC
hi htmlItalic								gui=ITALIC
hi htmlUnderline						gui=UNDERLINE
hi htmlUnderlineItalic			gui=UNDERLINE,ITALIC

" Scrollbar
hi Scrollbar			gui=NONE guifg=#729fcf guibg=#d3d7cf
hi VertSplit			gui=NONE guifg=#FFFFFF guibg=#d3d7cf

hi MatchParen			gui=BOLD guifg=#000000 guibg=grey90
hi Pmenu					gui=NONE guifg=#d3d7cf guibg=#75507b
hi CursorLine			gui=NONE guibg=#3f4648
