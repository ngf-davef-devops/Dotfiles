runtime! debian.vim

let mapleader="-"

if has("syntax")
  syntax enable
endif

if has("autocmd")
  filetype plugin indent on
endif

let g:autofmt_autosave = 1

set showcmd
set showmatch
set incsearch
set hlsearch
set number
set wildmenu
set nomodeline
set autoindent
set nostartofline
set ruler
set laststatus=2
" set visualbell instead of beep
set visualbell
" but make visualbell do nothing
set t_vb=
set cmdheight=2
set shiftwidth=4
set softtabstop=4
set expandtab
set history=200
set nrformats=

map Y y$
nnoremap <leader><space> :nohlsearch<CR>
