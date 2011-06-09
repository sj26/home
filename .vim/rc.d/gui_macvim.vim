" MacVim specific

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T bindings
  nmap <D-j> :CommandT<CR>
  imap <D-j> <Esc>:CommandT<CR>
  nmap <D-J> :CommandTBuffer<CR>
  imap <D-J> <Esc>:CommandTBuffer<CR>
endif
