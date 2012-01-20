" MacVim specific

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T bindings
  nmap <D-O> :CommandT<CR>
  imap <D-O> <Esc>:CommandT<CR>
  "nmap <D-J> :CommandTBuffer<CR>
  "imap <D-J> <Esc>:CommandTBuffer<CR>
endif
