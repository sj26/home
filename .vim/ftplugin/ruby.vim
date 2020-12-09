" Align assignment blocks with variable, not hanging with the equals sign
"let g:ruby_indent_assignment_style = 'variable'

" Align blocks with the opening `do` line
let g:ruby_indent_block_style = 'do'

" Hanging element intendation -- use single indent instead of alignment for
" methods calls across lines etc
let g:ruby_indent_hanging_elements = 0

" Show whitespace errors like trailing whitespace and mixed spaces/tabs
let ruby_space_errors = 1

let ruby_line_continuation_error = 1

let ruby_global_variable_error = 1

" Trim blank lines from the end of ruby files
autocmd BufWritePre <buffer> call TrimTrailingLines()
