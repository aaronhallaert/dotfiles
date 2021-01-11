"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default vim settings with shortcuts related to ui
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

let mapleader=" "
let maplocalleader="\\"

" Sets numbers relative to current line number
set relativenumber
set nohlsearch
set noerrorbells
set incsearch

" Tabs related
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set nu
set nowrap
set smartcase
set noswapfile

set scrolloff=15
set signcolumn=yes

set nobackup
set undodir=~/.vim/undodir
set undofile

set colorcolumn=80
highlight ColorColumn ctermbg=grey guibg=black

set foldmethod=syntax
autocmd BufEnter * silent! lcd %:p:h

" Cursor settings
if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[5 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

" Movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Resize
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Go out of insert mode
imap kj <Esc>
imap jk <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv
