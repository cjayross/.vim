function! userspace#visual_selection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call feedkeys(":Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call feedkeys(":%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! userspace#goto_last_edit_position()
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g'\""
  endif
endfunction
