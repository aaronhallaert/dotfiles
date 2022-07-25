"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug https://github.com/junegunn/vim-plug/ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" UI
Plug 'morhetz/gruvbox'
" Plug 'shapeoflambda/dark-purple.vim'
Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'marko-cerovac/material.nvim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'declancm/cinnamon.nvim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mortepau/codicons.nvim'

" Navigation
Plug 'phaazon/hop.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ThePrimeagen/harpoon'
Plug 'simrat39/symbols-outline.nvim'
" Plug 'aaronhallaert/harpoon'
Plug 'unblevable/quick-scope'

" Code Extensions
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'kosayoda/nvim-lightbulb'
Plug 'ray-x/lsp_signature.nvim'
Plug 'puremourning/vimspector'
"" Language Specific
Plug 'tpope/vim-rails'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'

" Editing Extensions
" Plug 'github/copilot.vim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'Sirver/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'
" Plug 'tpope/vim-surround'
Plug 'kylechui/nvim-surround'
Plug 'mbbill/undotree'
Plug 'numToStr/Comment.nvim'
Plug 'godlygeek/tabular'
Plug 'voldikss/vim-translator'
Plug 'ron89/thesaurus_query.vim'
Plug 'rhysd/vim-grammarous'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'
Plug 'mizlan/iswap.nvim'
" Plug 'pseewald/vim-anyfold'
Plug 'anuvyklack/pretty-fold.nvim'
Plug 'anuvyklack/nvim-keymap-amend'
Plug 'mhinz/vim-startify'

" Git/GitHub
" Plug 'ldelossa/gh.nvim'
" Plug 'ldelossa/litee.nvim'
Plug 'pwntester/octo.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ThePrimeagen/git-worktree.nvim'

" Sessions and Workspaces
Plug 'tpope/vim-obsession'
Plug 'renerocksai/calendar-vim'
Plug 'renerocksai/telekasten.nvim'

" Vim Extensions
Plug 'voldikss/vim-floaterm'
Plug 'dbeniamine/cheat.sh-vim'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

Plug 'vim-utils/vim-man'
Plug 'lambdalisue/suda.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ap/vim-css-color'
" Plug 'williamboman/nvim-lsp-installer'

call plug#end()
