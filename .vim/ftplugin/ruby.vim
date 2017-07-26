" Align assignment blocks with variable, not hanging with the equals sign
"let g:ruby_indent_assignment_style = 'variable'

" Align blocks with the opening `do` line
let g:ruby_indent_block_style = 'do'

" Strip trailing empty newlines
function TrimTrailingLines()
  let lastLine = line('$')
  let lastNonblankLine = prevnonblank(lastLine)
  if lastLine > 0 && lastNonblankLine != lastLine
    silent! execute lastNonblankLine + 1 . ',$delete _'
  endif
endfunction

autocmd BufWritePre <buffer> call TrimTrailingLines()
