runtime! debian.vim

if has("syntax")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on
endif

let g:autofmt_autosave = 1

set showcmd
set showmatch
set incsearch
set nohlsearch
set number
set wildmenu
set nomodeline
set autoindent
set nostartofline
set ruler
set laststatus=2
set novisualbell
set cmdheight=2
set shiftwidth=4
set softtabstop=4
set expandtab
set history=200
set nrformats=

map Y y$
