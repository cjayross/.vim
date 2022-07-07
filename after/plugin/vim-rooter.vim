if &rtp !~ 'vim-rooter'
  finish
endif

let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['.git', '.vimroot']
