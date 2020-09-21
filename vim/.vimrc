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
set tabstop=4 
set softtabstop=4
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
" color scheme
Plug 'morhetz/gruvbox'
" bar at bottom of buffer
Plug 'vim-airline/vim-airline'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Install with coc-snippets
Plug 'honza/vim-snippets'
" Autocompletion
Plug 'OmniSharp/omnisharp-vim'
" Linter
Plug 'dense-analysis/ale'
" highlight on f-F-t-T
Plug 'unblevable/quick-scope'

" fast grep
Plug 'jremmen/vim-ripgrep'
" Search for files
Plug 'junegunn/fzf', {'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" diffs or logs
Plug 'tpope/vim-fugitive'
" man pages
Plug 'vim-utils/vim-man'
" great for cpp
Plug 'lyuts/vim-rtags'

" undo tree
Plug 'mbbill/undotree'
" Folding
Plug 'pseewald/vim-anyfold'
" latex preview
Plug 'lervag/vimtex'
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" debug
Plug 'puremourning/vimspector'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

"set color for quickscope: Before! setting colorscheme
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

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
source ~/dotfiles/PluginConfig/coc-config.vim

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
inoremap { {}<Esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" quick end of line semicolon when in normal mode
nnoremap <leader>; A;<Esc><CR>
nnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>y "*y
vnoremap <leader>p "*p
nnoremap <leader>w :update<cr>

" OmniSharp (for C# development)
nnoremap <leader>ofu :OmniSharpFindUsages<CR>
nnoremap <leader>ogd :OmniSharpGotoDefinition<CR>
nnoremap <leader>opd :OmniSharpPreviewDefinition<CR>
nnoremap <leader>odr :!dotnet run<CR>

" Git fugitive
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gs :G<CR>

" Show undo tree
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>ps :Rg<SPACE>

" Search for word under cursor
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Resize
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Vimspector Debug
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General keyboard shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search for file 
nnoremap <C-p> :GFiles<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown previes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
