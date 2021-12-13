let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:clang_format_fallback_style = 'llvm'
let g:ctrlp_custom_ignore = 'build'

" function! Format()
"   let l:formatdiff = 1
"   let l:lines = 'all'
"   py3f /usr/lib/llvm/11/share/clang/clang-format.py
" endfunction

" autocmd BufWritePre *.h,*.hpp,*.cc,*.cpp call Format()
