if !userspace#is_loaded('/vim-svelte-plugin/')
  finish
endif

let g:vim_svelte_plugin_load_full_syntax = 1
let g:vim_svelte_plugin_use_typescript = 1
let g:vim_svelte_plugin_use_sass = 1
