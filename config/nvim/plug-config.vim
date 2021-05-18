"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug https://github.com/junegunn/vim-plug/ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" ~/dotfiles/config/nvim/BasicConfig/ui-config.vim
Plug 'morhetz/gruvbox'
" Icons
Plug 'ryanoasis/vim-devicons'
" ~/dotfiles/config/nvim/PluginConfig/coc-config.vim
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ~/dotfiles/config/nvim/PluginConfig/nvimlspconfig-config.vim
Plug 'neovim/nvim-lspconfig'
" ~/dotfiles/config/nvim/PluginConfig/nvimcompletion-config.vim
Plug 'nvim-lua/completion-nvim'
" ~/dotfiles/config/nvim/PluginConfig/lightbulb-config.vim
Plug 'kosayoda/nvim-lightbulb'

" ~/dotfiles/config/nvim/PluginConfig/neosnippets-config.vim
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" ~/dotfiles/config/nvim/PluginConfig/telescope-config.vim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-obsession'

Plug 'simrat39/symbols-outline.nvim'
" ~/dotfiles/config/nvim/PluginConfig/feline-config.vim
Plug 'famiu/feline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-startify'
Plug 'wellle/targets.vim'
" ~/dotfiles/config/nvim/PluginConfig/quickscope-config.vim
Plug 'unblevable/quick-scope'
" ~/dotfiles/config/nvim/PluginConfig/gitfugitive-config.vim
Plug 'tpope/vim-fugitive'
" ~/dotfiles/config/nvim/PluginConfig/undotree-config.vim
Plug 'mbbill/undotree'
" ~/dotfiles/config/nvim/PluginConfig/anyfold-config.vim
Plug 'pseewald/vim-anyfold'
" ~/dotfiles/config/nvim/PluginConfig/vimtex-config.vim
Plug 'lervag/vimtex'
" ~/dotfiles/config/nvim/PluginConfig/markdownprev-config.vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" ~/dotfiles/config/nvim/PluginConfig/vimspector-config.vim
Plug 'puremourning/vimspector'
"  ~/dotfiles/config/nvim/PluginConfig/vimmaximizer-config.vim
Plug 'szw/vim-maximizer'
" ~/dotfiles/config/nvim/PluginConfig/tabularize.vim
Plug 'godlygeek/tabular'

" ~/dotfiles/config/nvim/PluginConfig/nerdcommenter-config.vim
Plug 'preservim/nerdcommenter'

" ~/dotfiles/config/nvim/PluginConfig/floaterm-config.vim
Plug 'voldikss/vim-floaterm'
Plug 'dbeniamine/cheat.sh-vim'

" Man pages
Plug 'vim-utils/vim-man'
" Great for cpp
Plug 'lyuts/vim-rtags'

" save as super user
" ~/dotfiles/config/nvim/PluginConfig/suda-config.vim
Plug 'lambdalisue/suda.vim'
" ~/dotfiles/config/nvim/PluginConfig/translator-config.vim
Plug 'voldikss/vim-translator'
" ~/dotfiles/config/nvim/PluginConfig/thesaurus-config.vim
Plug 'ron89/thesaurus_query.vim'
" ~/dotfiles/config/nvim/PluginConfig/grammarous-config.vim
Plug 'rhysd/vim-grammarous'

" ~/dotfiles/config/nvim/PluginConfig/vimwiki-config.vim
Plug 'vimwiki/vimwiki'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'
call plug#end()

nnoremap <silent> <leader>cf :e <cfile><cr>
