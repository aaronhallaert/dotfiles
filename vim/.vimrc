"
" Vim settings for @aaronhallaert
"
" Language support
"  - C#
"
syntax on

let mapleader=" "
let maplocalleader="\\"

" Sets numbers relative to current line number
set relativenumber
set nohlsearch

set noerrorbells
set incsearch

" Tabs related
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


set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Autocompletion
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
" color scheme
Plug 'morhetz/gruvbox'
" fast grep
Plug 'jremmen/vim-ripgrep'
" diffs or logs
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
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
" Folding
Plug 'pseewald/vim-anyfold'
" latex preview
Plug 'lervag/vimtex'
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color Scheme
colorscheme gruvbox
set background=dark

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" anyfold
filetype plugin indent on
autocmd Filetype * AnyFoldActivate
set foldlevel=99

" FZF
let g:fzf_layout={'window':{'width':0.8, 'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'

" Ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif

" not sure
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick edits 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocomplete parenthesis
inoremap ( ()<Esc>i
" quick end of line semicolon when in normal mode
nnoremap <leader>; A;<Esc><CR>
nnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>y "*y
vnoremap <leader>p "*p



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" latex
if executable('SumatraPDF')
    let g:vimtex_view_general_viewer='SumatraPDF'
    let g:vimtex_view_general_options='-reuse-instance @pdf'
    let g:vimtex_view_general_options_latexmk='-reuse-instance'
endif
let g:tex_flavor= 'latex'

" OmniSharp
let g:OmniSharp_server_stdio = 1
nnoremap <leader>ofu :OmniSharpFindUsages<CR>
nnoremap <leader>ogd :OmniSharpGotoDefinition<CR>
nnoremap <leader>opd :OmniSharpPreviewDefinition<CR>
nnoremap <leader>odr :!dotnet run<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Resize
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General keyboard shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Git fugitive
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gs :G<CR>

" Show undo tree
nnoremap <leader>u :UndotreeShow<CR>
" Show file tree
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>


" Go help word under cursor
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
" Search word under cursor with coc
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" Search for word under cursor
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" Search for file 
nnoremap <C-p> :GFiles<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TextEdit fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
    else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
