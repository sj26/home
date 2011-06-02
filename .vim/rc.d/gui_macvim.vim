" MacVim specific

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T bindings
  map <D-J> :CommandT<CR>
  imap <D-J> <Esc>:CommandT<CR>
  map <D-S-J> :CommandTBuffer<CR>
  imap <D-S-J> <Esc>:CommandTBuffer<CR>
endif
