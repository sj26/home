" Align assignment blocks with variable, not hanging with the equals sign
"let g:ruby_indent_assignment_style = 'variable'

" Align blocks with the opening `do` line
let g:ruby_indent_block_style = 'do'

" Trim blank lines from the end of ruby files
autocmd BufWritePre <buffer> call TrimTrailingLines()
