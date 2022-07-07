if &rtp !~ 'vim-one'
  finish
endif

au ColorScheme * call one#highlight('Normal', '', '262729', '')
au ColorScheme * call one#highlight('SignColumn', '', '262729', '')
colorscheme one
