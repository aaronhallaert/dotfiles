"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug https://github.com/junegunn/vim-plug/ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


Plug 'github/copilot.vim'


Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
" Icons
Plug 'ryanoasis/vim-devicons'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kosayoda/nvim-lightbulb'
Plug 'pwntester/octo.nvim'
Plug 'phaazon/hop.nvim'

Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ray-x/lsp_signature.nvim'
Plug 'tzachar/compe-tabnine', {'do': './install.sh'}
Plug 'f-person/git-blame.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'ThePrimeagen/harpoon'
Plug 'aaronhallaert/harpoon', { 'commit': '1bd1675d1e24b2a099637769485d621a11efdea3' }

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

Plug 'simrat39/symbols-outline.nvim'
"Plug 'famiu/feline.nvim'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
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

Plug 'preservim/nerdcommenter'

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
