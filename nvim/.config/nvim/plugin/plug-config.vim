"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug https://github.com/junegunn/vim-plug/ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


Plug 'github/copilot.vim'


Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'Mofiqul/vscode.nvim'
" Icons
Plug 'ryanoasis/vim-devicons'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'mfussenegger/nvim-lint'
Plug 'mfussenegger/nvim-jdtls'
Plug 'neovim/nvim-lspconfig'
Plug 'kosayoda/nvim-lightbulb'
Plug 'pwntester/octo.nvim'
Plug 'phaazon/hop.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'Sirver/ultisnips'

Plug 'ray-x/lsp_signature.nvim'
Plug 'tzachar/compe-tabnine', {'do': './install.sh'}
Plug 'f-person/git-blame.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'ThePrimeagen/harpoon'
Plug 'aaronhallaert/harpoon', { 'commit': 'accf7ef4efb405f2ec11408b7781a1619cfcc574' }

Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
", {'commit': 'fd7f60e242205ea9efc9649101c81a07d5f458bb'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-sleuth'

Plug 'renerocksai/calendar-vim'
Plug 'renerocksai/telekasten.nvim'
Plug 'mzlogin/vim-markdown-toc'

"Plug 'simrat39/symbols-outline.nvim'
"Plug 'famiu/feline.nvim'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mortepau/codicons.nvim'
Plug 'mhinz/vim-startify'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mbbill/undotree'
Plug 'pseewald/vim-anyfold'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'godlygeek/tabular'

"Plug 'preservim/nerdcommenter'
Plug 'numToStr/Comment.nvim'

Plug 'voldikss/vim-floaterm'
Plug 'dbeniamine/cheat.sh-vim'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Man pages
Plug 'vim-utils/vim-man'
" Great for cpp
"Plug 'lyuts/vim-rtags'

" save as super user
Plug 'lambdalisue/suda.vim'
Plug 'voldikss/vim-translator'
Plug 'ron89/thesaurus_query.vim'
Plug 'rhysd/vim-grammarous'

Plug 'tpope/vim-rails'

"Plug 'vimwiki/vimwiki'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'
call plug#end()
