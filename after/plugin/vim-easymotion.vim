if !userspace#is_loaded('/plugin/EasyMotion.vim')
  finish
endif

nmap <nowait> <Leader>j <Plug>(easymotion-prefix)s
