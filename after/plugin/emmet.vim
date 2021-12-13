if !exists(':Emmet')
  finish
endif

let g:user_emmet_install_global = 0
let g:emmet_html5 = 0

let g:user_emmet_settings = {
    \ 'typescript': {
    \   'extends': 'jsx',
    \   'quote_char': '',
    \   'empty_element_suffix': ' />',
    \}
\}

autocmd FileType html,css,javascript.jsx,typescript.tsx EmmetInstall
