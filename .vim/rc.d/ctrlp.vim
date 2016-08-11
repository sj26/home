" Use ctrlp-cmatcher
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s --ignore-case --nocolor --nogroup --ignore .git --hidden -g ""'
endif

" Just use the cwd all the time
let g:ctrlp_working_path_mode = ''
