"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug https://github.com/junegunn/vim-plug/ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
" Icons
Plug 'ryanoasis/vim-devicons'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'kosayoda/nvim-lightbulb'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-obsession'

Plug 'simrat39/symbols-outline.nvim'
Plug 'famiu/feline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-startify'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-fugitive'
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
Plug 'lyuts/vim-rtags'

" save as super user
Plug 'lambdalisue/suda.vim'
Plug 'voldikss/vim-translator'
Plug 'ron89/thesaurus_query.vim'
Plug 'rhysd/vim-grammarous'

Plug 'tpope/vim-rails'

"Plug 'vimwiki/vimwiki'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'
call plug#end()
