vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup_ts_grammar()
            require('orgmode').setup {
                org_agenda_files = {'~/org/**/*'},
                org_default_notes_file = '~/org/default.org'
            }
        end
    }

    use 'wbthomason/packer.nvim'
    use 'sainnhe/gruvbox-material'
    -- use 'shapeoflambda/dark-purple.vim'
    use 'EdenEast/nightfox.nvim'
    use 'marko-cerovac/material.nvim'
    use 'joshdick/onedark.vim'
    use 'sainnhe/sonokai'
    use 'Mofiqul/vscode.nvim'
    use 'nvim-lua/popup.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'lukas-reineke/indent-blankline.nvim'
    use {'catppuccin/nvim', as = 'catppuccin'}
    -- use 'nvim-treesitter/nvim-treesitter-context'
    use 'declancm/cinnamon.nvim'
    use 'folke/trouble.nvim'
    use 'Pocco81/true-zen.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'

    -- Icons
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'mortepau/codicons.nvim'

    -- Navigation
    use 'phaazon/hop.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'
    use {'junegunn/fzf', run = 'vim.fn["fzf#install"]'}
    use 'junegunn/fzf.vim'
    use 'kyazdani42/nvim-tree.lua'
    use 'ThePrimeagen/harpoon'
    use 'simrat39/symbols-outline.nvim'
    -- use 'aaronhallaert/harpoon'
    use 'unblevable/quick-scope'

    -- Code Extensions
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'mfussenegger/nvim-jdtls'
    use 'kosayoda/nvim-lightbulb'
    use 'ray-x/lsp_signature.nvim'
    use 'puremourning/vimspector'
    use 'NMAC427/guess-indent.nvim'
    -- " Language Specific
    use 'tpope/vim-rails'
    use 'mzlogin/vim-markdown-toc'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    })

    use 'lervag/vimtex'

    -- Editing Extensions
    -- use 'github/copilot.vim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-emoji'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'
    -- use 'Sirver/ultisnips'
    use 'L3MON4D3/LuaSnip'
    use 'tpope/vim-abolish'
    use 'wellle/targets.vim'
    -- use 'tpope/vim-surround'
    use 'kylechui/nvim-surround'
    use 'mbbill/undotree'
    use 'numToStr/Comment.nvim'
    use 'godlygeek/tabular'
    use 'voldikss/vim-translator'
    use 'ron89/thesaurus_query.vim'
    use 'rhysd/vim-grammarous'
    use 'inkarkat/vim-ingo-library'
    use 'inkarkat/vim-SpellCheck'
    use 'mizlan/iswap.nvim'
    -- use 'pseewald/vim-anyfold'
    use 'anuvyklack/pretty-fold.nvim'
    use 'anuvyklack/fold-preview.nvim'
    use 'anuvyklack/nvim-keymap-amend'
    use 'mhinz/vim-startify'
    use 'windwp/nvim-autopairs'

    -- Git/GitHub
    -- use 'ldelossa/gh.nvim'
    -- use 'ldelossa/litee.nvim'
    use 'pwntester/octo.nvim'
    use 'f-person/git-blame.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'ThePrimeagen/git-worktree.nvim'

    -- Sessions and Workspaces
    use 'tpope/vim-obsession'
    use 'renerocksai/calendar-vim'
    use 'renerocksai/telekasten.nvim'

    -- Vim Extensions
    use 'voldikss/vim-floaterm'
    use 'dbeniamine/cheat.sh-vim'

    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-cheat.sh'

    use 'vim-utils/vim-man'
    use 'lambdalisue/suda.vim'
    use 'nvim-lua/plenary.nvim'
    use 'ap/vim-css-color'
end)
