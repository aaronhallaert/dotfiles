"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug https://github.com/junegunn/vim-plug/ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" ~/dotfiles/vim/BasicConfig/ui-config.vim
Plug 'morhetz/gruvbox'
" Icons
Plug 'ryanoasis/vim-devicons'
" ~/dotfiles/vim/PluginConfig/coc-config.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ~/dotfiles/vim/PluginConfig/omnisharp-config.vim
Plug 'OmniSharp/omnisharp-vim'
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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" ~/dotfiles/vim/PluginConfig/vimspector-config.vim
Plug 'puremourning/vimspector'


" ~/dotfiles/vim/PluginConfig/nerdcommenter-config.vim
Plug 'preservim/nerdcommenter'

" Jupyter notebooks
" ~/dotfiles/vim/PluginConfig/vimpyter-config.vim
" Plug 'szymonmaszke/vimpyter' 
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' , 'for': 'ipynb'}
" Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'ipynb'}
" let g:deoplete#enable_at_startup = 1


" Vim bar
Plug 'vim-airline/vim-airline'
" Snippets
Plug 'honza/vim-snippets'
" Man pages
Plug 'vim-utils/vim-man'
" Great for cpp
Plug 'lyuts/vim-rtags'



call plug#end()
