if !userspace#is_loaded('/plugin/ctrlp.vim')
  finish
endif

set wildignore+=*.so,*.swp,*.zip,*.tar.*
