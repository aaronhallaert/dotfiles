"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug https://github.com/junegunn/vim-plug/ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


" ~/dotfiles/vim/PluginConfig/whichkey-config.vim
Plug 'liuchengxu/vim-which-key'

" ~/dotfiles/vim/BasicConfig/ui-config.vim
Plug 'morhetz/gruvbox'
" Icons
Plug 'ryanoasis/vim-devicons'
" ~/dotfiles/vim/PluginConfig/coc-config.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ~/dotfiles/vim/PluginConfig/nvimlspconfig-config.vim
Plug 'neovim/nvim-lspconfig'
" ~/dotfiles/vim/PluginConfig/quickscope-config.vim
Plug 'unblevable/quick-scope'
" ~/dotfiles/vim/PluginConfig/ripgrep-config.vim
Plug 'jremmen/vim-ripgrep'
" ~/dotfiles/vim/PluginConfig/fzf-config.vim
Plug 'junegunn/fzf', {'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" ~/dotfiles/vim/PluginConfig/gitfugitive-config.vim
Plug 'tpope/vim-fugitive'
" ~/dotfiles/vim/PluginConfig/undotree-config.vim
Plug 'mbbill/undotree'
" ~/dotfiles/vim/PluginConfig/anyfold-config.vim
Plug 'pseewald/vim-anyfold'
" ~/dotfiles/vim/PluginConfig/vimtex-config.vim
Plug 'lervag/vimtex'
" ~/dotfiles/vim/PluginConfig/markdownprev-config.vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" ~/dotfiles/vim/PluginConfig/vimspector-config.vim
Plug 'puremourning/vimspector'
"  ~/dotfiles/vim/PluginConfig/vimmaximizer-config.vim
Plug 'szw/vim-maximizer'
" ~/dotfiles/vim/PluginConfig/tabularize.vim
Plug 'godlygeek/tabular'

" ~/dotfiles/vim/PluginConfig/nerdcommenter-config.vim
Plug 'preservim/nerdcommenter'

" ~/dotfiles/vim/PluginConfig/floaterm-config.vim
Plug 'voldikss/vim-floaterm'

Plug 'dbeniamine/cheat.sh-vim'

" Vim bar
Plug 'vim-airline/vim-airline'
" Snippets
Plug 'honza/vim-snippets'
" Man pages
Plug 'vim-utils/vim-man'
" Great for cpp
Plug 'lyuts/vim-rtags'

" save as super user
" ~/dotfiles/vim/PluginConfig/suda-config.vim
Plug 'lambdalisue/suda.vim'
" ~/dotfiles/vim/PluginConfig/translator-config.vim
Plug 'voldikss/vim-translator'
" ~/dotfiles/vim/PluginConfig/thesaurus-config.vim
Plug 'ron89/thesaurus_query.vim'
call plug#end()