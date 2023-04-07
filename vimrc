syntax enable
filetype plugin on
filetype indent on

set encoding=utf8
set background=dark
set termguicolors
set ffs=unix,dos,mac
set history=500
set scrolloff=8
set number
set relativenumber
set autoread
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.svn/*
set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set nohlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set hidden
set updatetime=500
set shortmess+=c
set signcolumn=number
set noerrorbells
set novisualbell
set t_vb=
set t_ut=
set tm=500
set nobackup
set nowritebackup
set noswapfile
set nofixendofline
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set wrap
set modeline
set modelines=2
set tagrelative
set tags=.tags,tags

nnoremap <Space> <Nop>
let mapleader = "\<Space>"

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <Up> 5<C-w>-
map <Down> 5<C-w>+
map <Left> 5<C-w><
map <Right> 5<C-w>>

map <Leader>w <C-w>

map <silent> <Leader>tn :tabn<CR>
map <silent> <Leader>tN :tablast<CR>
map <silent> <Leader>tp :tabp<CR>
map <silent> <Leader>tP :tabfirst<CR>
map <silent> <Leader>tq :tabclose<CR>
map <silent> <Leader>tQ :tabonly<CR>
map <silent> <Leader>tl :tabs<CR>
map <silent> <Leader>ts :tab split<CR>
map <silent> <Leader>tL :tabmove +1<CR>
map <silent> <Leader>tH :tabmove -1<CR>

map <silent> <Leader>bb :e #<CR>

map <Leader>[ <C-T>
map <Leader>] <C-]>

map <Leader>ss :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
map <Leader>sn ]s
map <Leader>sp [s
map <Leader>sa zg
map <Leader>s? z=

"nmap > mz:m+<CR>`z
"nmap < mz:m-2<CR>`z
"vmap > :m'>+<CR>`<my`>mzgv`yo`z
"vmap < :m'<-2<CR>`>my`<mzgv`yo`z

vnoremap P "_dP
vnoremap p "_dP
vnoremap n :<C-u>call userspace#visual_selection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap N :<C-u>call userspace#visual_selection('', '')<CR>?<C-R>=@/<CR><CR>

au BufReadPost * silent! call userspace#goto_last_edit_position()
