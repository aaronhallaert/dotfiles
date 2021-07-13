"
" Vim settings for @aaronhallaert
"

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

set hidden

set smartindent
set nu
set nowrap
set smartcase
set noswapfile

set scrolloff=8
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
inoremap kj <Esc>
inoremap jk <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic custom vim quick edits 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocomplete parenthesis
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

autocmd FileType tex inoremap " ``''<Esc>hi
autocmd FileType tex inoremap <C-b> \textbf{}<Esc>i
autocmd FileType tex inoremap <C-a> \textit{}<Esc>i

" go to next jupyter notebook block
nnoremap <leader>i /#%%<CR> zt
" go to previous jupyter notebook block
nnoremap <leader>b 2?#%%<CR> zt

" quick end of line semicolon when in normal mode
nnoremap <leader>; A;<Esc><CR>

" yank to clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

" update with leader key
nnoremap <leader>w :update<cr>
nnoremap <silent> <leader>cf :e <cfile><cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify plugins
source $HOME/dotfiles/nvim/.config/nvim/plugin/plug-config.vim

" UI functionality
source $HOME/dotfiles/nvim/.config/nvim/plugin/quickscope-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/ui-config.vim

" Extra file functionality
source $HOME/dotfiles/nvim/.config/nvim/plugin/anyfold-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/suda-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/vimmaximizer-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/nerdcommenter-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/undotree-config.vim
"source $HOME/dotfiles/nvim/.config/nvim/plugin/netrw-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/nvimtree-config.vim

" General Nvim Tools
source $HOME/dotfiles/nvim/.config/nvim/plugin/feline-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/markdownprev-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/gitfugitive-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/floaterm-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/telescope-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/vimwiki-config.vim

" Code Tools
source $HOME/dotfiles/nvim/.config/nvim/plugin/nvimcompe-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/vimspector-config.vim


" Text writing
source $HOME/dotfiles/nvim/.config/nvim/plugin/spell/spell-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/vimtex-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/translator-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/thesaurus-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/grammarous-config.vim
