runtime! debian.vim

let mapleader = "-"

if has("syntax")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on
  :au BufReadPost *
	 \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	 \ |   exe "normal! g`\""
	 \ | endif
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
set novisualbell
set cmdheight=2
set shiftwidth=4
set softtabstop=4
set expandtab
set history=200
set nrformats=

map Y y$
nnoremap <leader><space> :nohlsearch<CR>

let g:gruvbox_bold = 1
let g:gruvbox_underline = 1
let g:gruvbox_italic = 1

set background=dark
colorscheme gruvbox
