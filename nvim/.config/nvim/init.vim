"
" Vim settings for @aaronhallaert
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default vim settings with shortcuts related to ui
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set eol
let mapleader=" "
let maplocalleader="\\"

function! DisableSyntaxOnWidth() abort
  let view = winsaveview()
  let max_col = 0
  g/^/let max_col=max([max_col, col('$') - 1])
  call histdel('search', -1)
  let @/ = histget('search', -1)
  call winrestview(view)
  if max_col > 250
      execute 'TSBufDisable highlight'
      execute 'syntax off'
  endif
endfunction

nnoremap <silent> fdp :Rg byebug$<CR>
nnoremap <silent> fiw :Rg <C-R><C-W><CR>

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


"autocmd BufEnter *.json call DisableSyntaxOnWidth()

nmap <silent> gx :!open <cWORD><CR>
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
filetype plugin indent on

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
" Specify plugins
source $HOME/dotfiles/nvim/.config/nvim/plugin/plug-config.vim

" UI functionality
source $HOME/dotfiles/nvim/.config/nvim/plugin/quickscope-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/ui-config.vim

" Extra file functionality
source $HOME/dotfiles/nvim/.config/nvim/plugin/anyfold-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/suda-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/vimmaximizer-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/undotree-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/netrw-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/nvimtree-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/hop-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/harpoon-config.vim

" General Nvim Tools
source $HOME/dotfiles/nvim/.config/nvim/plugin/markdownprev-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/gitfugitive-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/gitblame-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/floaterm-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/telescope-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/telekasten-config.vim
source $HOME/dotfiles/nvim/.config/nvim/plugin/lsp-config.vim
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

lua require("aaron")

augroup jdtls_lsp
    au!
    au FileType java lua require'jdtls_setup'.setup()
augroup END

