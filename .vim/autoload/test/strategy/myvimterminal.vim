function! test#strategy#myvimterminal#Run(cmd) abort
  let curwinid = win_getid()
  " find an existing test terminal window in this tab and run there
  let wins = filter(filter(getwininfo(), "v:val['tabnr'] == tabpagenr()"), "v:val['terminal']")
  if !empty(wins)
    call win_gotoid(wins[0]['winid'])
  else
    " or open a new window and mark it for reuse later
    botright 10 new
    let b:test = 1
  endif
  call term_start(['/bin/sh', '-c', a:cmd], {'curwin':1})
  call win_gotoid(curwinid)
endfunction

