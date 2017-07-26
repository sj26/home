" Align assignment blocks with variable, not hanging with the equals sign
"let g:ruby_indent_assignment_style = 'variable'

" Align blocks with the opening `do` line
let g:ruby_indent_block_style = 'do'

" Strip trailing empty newlines
function TrimTrailingLines()
  let l:save_cursor = getpos('.')
  :silent! %s#\($\n\s*\)\+\%$##
  call histdel('search', -1)
  call setpos('.', l:save_cursor)
endfunction

autocmd BufWritePre <buffer> call TrimTrailingLines()
