function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:coc_start()
  packadd coc.nvim

  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=? Fold :call CocAction('fold', <F-args>)
  command! -nargs=0 SortImports :call CocAction('runCommand', 'editor.action.organizeImport')

  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType json syntax match Comment +\/\/.\+$+

  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <silent><expr> <c-@> coc#refresh()
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  nmap <silent> g[ <Plug>(coc-diagnostic-prev)
  nmap <silent> g] <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  nmap <Leader>rn <Plug>(coc-rename)
  xmap <Leader>rf <Plug>(coc-format-selected)
  nmap <Leader>rf <Plug>(coc-format-selected)

  nmap <Leader>a <Plug>(coc-codeaction-selected)
  xmap <Leader>a <Plug>(coc-codeaction-selected)
  nmap <nowait> <Leader>ac <Plug>(coc-codeaction)
  nmap <nowait> <Leader>af <Plug>(coc-fix-current)

  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"

  nnoremap <silent> <Leader>p :<C-u>Format<CR>
  nnoremap <silent> <Leader>cd :<C-u>CocList diagnostics<CR>
  nnoremap <silent><nowait> <Leader>cdo :<C-u>CocCommand workspace.showOutput<CR>
  nnoremap <silent><nowait> <Leader>ce :<C-u>CocConfig<CR>
  nnoremap <silent><nowait> <Leader>cc :<C-u>CocList lists<CR>
  nnoremap <silent><nowait> <Leader>cx :<C-u>CocList extensions<CR>
  nnoremap <silent><nowait> <Leader>cm :<C-u>CocList commands<CR>
  nnoremap <silent><nowait> <Leader>co :<C-u>CocList outline<CR>
  nnoremap <silent><nowait> <Leader>cs :<C-u>CocList --interactive --number-select symbols<CR>
  nnoremap <silent><nowait> <Leader>cf :<C-u>CocList files<CR>
  nnoremap <silent><nowait> <Leader>cw :<C-u>CocList words<CR>
  nnoremap <silent><nowait> <Leader>cg :<C-u>CocList grep<CR>
  nnoremap <silent><nowait> <Leader>cj :<C-u>CocNext<CR>
  nnoremap <silent><nowait> <Leader>ck :<C-u>CocPrev<CR>
  nnoremap <silent><nowait> <Leader>cp :<C-u>CocListResume<CR>
endfunction

command! -nargs=0 CocStart :call s:coc_start()
nmap <silent><nowait> <Leader>ls :<C-u>CocStart<CR>
