if !userspace#is_loaded('/plugin/vim-tidal')
  finish
endif

let g:tidal_ghci = "/usr/bin/ghci"
let g:tidal_boot_fallback = "$HOME/.config/tidal/BootTidal.ghci"
let g:tidal_sc_boot_fallback = "$HOME/.vim/pack/plugin/start/vim-tidal/boot.sc"
let g:tidal_superdirt_enable = 1
let g:tidal_sc_enable = 1
