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
"autocmd BufEnter * silent! lcd %:p:h
let g:startify_change_to_dir=0

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
nnoremap <silent> <A-j>    :resize -2<CR>
nnoremap <silent> <A-k>    :resize +2<CR>
nnoremap <silent> <A-h>    :vertical resize -2<CR>
nnoremap <silent> <A-l>    :vertical resize +2<CR>

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
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" update with leader key
nnoremap <leader>w :update<cr>
nnoremap <silent> <leader>cf :e <cfile><cr>

" best remaps
"" behave vim
nnoremap Y y$
"" fix search position
nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ`z
"" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
"" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
nnoremap gk :m .-2<CR>==
nnoremap gj :m .+1<CR>==

nnoremap <leader>tt :terminal<CR> i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)


nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap ha :lua require("harpoon.mark").add_file()<CR>
nnoremap gt1 :lua require("harpoon.term").gotoTerminal(1)<CR>i
nnoremap gt2 :lua require("harpoon.term").gotoTerminal(2)<CR>i
nnoremap st11 :lua require("harpoon.term").sendCommand(1,1)<CR>i
nnoremap g1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap g2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap g3 :lua require("harpoon.ui").nav_file(3)<CR>

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
source $HOME/dotfiles/nvim/.config/nvim/plugin/hop-config.vim

" General Nvim Tools
source $HOME/dotfiles/nvim/.config/nvim/plugin/markdownprev-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/gitfugitive-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/gitblame-config.vim
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
