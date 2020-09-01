" Vim color file
" Maintainer:	N Vineeth <nvineeth a-t yahoo>
" Last Change:	2009 May 27
" Version: 0.3
" URL: https://github.com/vim-scripts/tango-morning.vim

" This color scheme uses a light grey background.
" Based on "morning" color scheme and 
" Tango color palette : http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines#Color_Palette
" The Terminal colors are based on "morning" color scheme and only the gui colors have been modified

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "tango"

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White
hi IncSearch term=reverse cterm=reverse
hi ModeMsg term=bold cterm=bold
hi StatusLine term=reverse,bold cterm=reverse,bold
hi StatusLineNC term=reverse cterm=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse ctermbg=grey
hi VisualNOS term=underline,bold cterm=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red
hi Directory term=bold ctermfg=DarkBlue
hi LineNr term=underline ctermfg=Brown
hi MoreMsg term=bold ctermfg=DarkGreen
hi NonText term=bold ctermfg=Blue
hi Question term=standout ctermfg=DarkGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue
hi Title term=bold ctermfg=DarkMagenta
hi WarningMsg term=standout ctermfg=DarkRed
hi WildMenu term=standout ctermbg=Yellow
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan
hi CursorLine term=underline cterm=underline
hi CursorColumn term=reverse ctermbg=grey

" Colors for syntax highlighting
hi Constant term=underline ctermfg=DarkRed
hi Statement term=bold cterm=bold ctermfg=Brown
hi Special term=bold ctermfg=DarkMagenta
hi Comment cterm=italic
hi Ignore ctermfg=LightGrey

" vim: sw=2
