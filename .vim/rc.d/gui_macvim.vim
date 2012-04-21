" MacVim specific

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " CtrlP bindings
  nmap <D-O> :CtrlP<CR>
  imap <D-O> <Esc>:CtrlP<CR>
  "nmap <D-J> :CtrlPBuffer<CR>
  "imap <D-J> <Esc>:CtrlPBuffer<CR>
endif
