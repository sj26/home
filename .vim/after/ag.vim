" override these commands after fzf has loaded (which defines :Ag)
for command in ['Ack', 'AckAdd', 'AckFromSearch', 'LAck', 'LAckAdd', 'AckFile', 'AckHelp', 'LAckHelp', 'AckWindow', 'LAckWindow']
  exe 'command! ' . substitute(command, 'Ack', 'Ag', "") . ' ' . command
endfor
