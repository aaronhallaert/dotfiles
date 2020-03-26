"
" vim settings for @aaronhallaert
"

" Plugins
call plug#begin()
	Plug 'plasticboy/vim-markdown'
call plug#end()

" Don't actually know what these do, set for markdown plugin
	syntax on
	filetype off
	filetype plugin indent on
	set wrap

	let g:vim_markdown_folding_disabled = 0

" Sets numbers relative to current line number
	set relativenumber

" Set split default positioning
	set splitbelow splitright

" Set window navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
