setlocal sw=2

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
exec "set rtp+=" . g:opamshare . "/merlin/vim"
exec "set rtp+=" . g:opamshare . "/ocp-indent/vim"
