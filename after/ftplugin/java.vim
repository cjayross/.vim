setlocal sw=4
setlocal wildignore+=*/target/*,*/dist/*,*/node_modules/*

nnoremap <silent> <buffer> <leader>i :JavaImport<CR>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<CR>
nnoremap <silent> <buffer> <CR> :JavaSearchContext<CR>
