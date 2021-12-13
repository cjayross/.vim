if &rtp !~ 'vim-easymotion'
  finish
endif

nmap <nowait> <Leader>j <Plug>(easymotion-prefix)s
