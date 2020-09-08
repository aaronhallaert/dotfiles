"
" vim settings for @aaronhallaert
"
syntax on

" Sets numbers relative to current line number
set relativenumber

set noerrorbells

" tabs related
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set nu
set nowrap
set smartcase
set noswapfile

set nobackup
set undodir=~/.vim/undodir
set undofile

set colorcolumn=80
highlight ColorColumn ctermbg=grey guibg=black


" Set split default positioning
set splitbelow splitright

" Set window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


call plug#begin('~/.vim/plugged')

" color scheme
Plug 'morhetz/gruvbox'
" fast grep
Plug 'jremmen/vim-ripgrep'
" diffs or logs
Plug 'tpope/vim-fugitive'
" man pages
Plug 'vim-utils/vim-man'
" great for cpp
Plug 'lyuts/vim-rtags'
" File finding
Plug 'ctrlpvim/ctrlp.vim'
" Autocomplete
Plug 'git@github.com:Valloric/YouCompleteMe.git'
" undo tree
Plug 'mbbill/undotree'

call plug#end()



colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=" "

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0
