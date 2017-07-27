" Strip trailing empty newlines
function TrimTrailingLines()
  let lastLine = line('$')
  let lastNonblankLine = prevnonblank(lastLine)
  if lastLine > 0 && lastNonblankLine != lastLine
    let lastPos = getpos('.')
    silent execute lastNonblankLine + 1 . ',$delete _'
    call setpos('.', lastPos)
  endif
endfunction
