if &rtp !~ 'vim-fugitive'
  finish
endif

nnoremap <Leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

nnoremap <Leader>gb :Git blame<CR>
