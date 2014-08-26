" GUI specific

if has("gui_running")
  " Start without the toolbar
  set guioptions-=T
  set guifont=Monaco\ for\ Powerline:h16
  set background=light

  " CtrlP bindings
  nmap <D-P> :CtrlP<CR>
  imap <D-P> <Esc>:CtrlP<CR>
end
