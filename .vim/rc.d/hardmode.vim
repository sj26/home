" Enable hardmode by default
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Toggle hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
