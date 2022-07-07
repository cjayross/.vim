if &rtp !~ 'vim-prettier'
  finish
endif

let g:prettier#autoformat = 0
let g:prettier#autoformat_config_present = 0
let g:prettier#autoformat_require_pragma = 1
let g:prettier#exec_cmd_async = 1
