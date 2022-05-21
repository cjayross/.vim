fun! s:detect()
  if getline(1) == '#!/sbin/openrc-run' || getline(1) == '#!/usr/bin/openrc-run'
    set filetype=sh
  endif
endfun

autocmd BufNewFile,BufRead * call s:detect()
