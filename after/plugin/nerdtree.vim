if !userspace#is_loaded('/plugin/NERD_tree.vim')
  finish
endif

nnoremap <Leader>n :NERDTreeFind<CR>
