"
" vim settings for @aaronhallaert
"
syntax on

" Sets numbers relative to current line number
set relativenumber
set nohlsearch

set noerrorbells
set incsearch

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
" Search for files
Plug 'junegunn/fzf', {'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" undo tree
Plug 'mbbill/undotree'

call plug#end()

" fzf optimizations
let g:fzf_layout={'window':{'width':0.8, 'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'


colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader=" "

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25



nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>

" go help word
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" project word
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" search for file keybind
nnoremap <C-p> :GFiles<CR>



nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

