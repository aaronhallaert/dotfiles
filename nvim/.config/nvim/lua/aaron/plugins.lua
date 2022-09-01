vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

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

    use 'sainnhe/gruvbox-material'
    -- use 'shapeoflambda/dark-purple.vim'
    use 'EdenEast/nightfox.nvim'
    use {
        'marko-cerovac/material.nvim',
        config = function() require('material').setup() end
    }
    use 'joshdick/onedark.vim'
    use 'sainnhe/sonokai'
    use 'Mofiqul/vscode.nvim'
    use 'nvim-lua/popup.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("aaron.config.treesitter") -- code understanding (highlight...)
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("aaron.config.indent_blankline") -- indent characters
        end
    }
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function() require('catppuccin').setup() end
    }
    -- use {
    --     'nvim-treesitter/nvim-treesitter-context',
    --     config = function()
    --         require('aaron.config.treesitter-context') -- fix context on first line
    --     end
    -- }
    use {
        'declancm/cinnamon.nvim',
        config = function()
            require('aaron.config.cinnamon') -- smooth scrolling
        end
    }
    use {
        'folke/trouble.nvim',
        config = function() require('trouble').setup() end
    }
    use {
        'Pocco81/true-zen.nvim',
        config = function() require('true-zen').setup() end
    }
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require("lualine").setup() end
    }
    use {
        'akinsho/bufferline.nvim',
        config = function() require('aaron.config.bufferline') end
    }

    -- Icons
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'mortepau/codicons.nvim'

    -- Navigation
    use {
        'phaazon/hop.nvim',
        config = function() require("aaron.config.hop") end
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require("aaron.telescope.setup") -- search
            require("aaron.telescope.mappings") -- search
        end
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'
    use {'junegunn/fzf', run = 'vim.fn["fzf#install"]'}
    use 'junegunn/fzf.vim'
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require("aaron.config.nvim-tree") -- project view
        end
    }
    use {
        'ThePrimeagen/harpoon',
        config = function()
            require("aaron.config.harpoon") -- mark files
        end
    }
    use 'simrat39/symbols-outline.nvim'
    -- use 'aaronhallaert/harpoon'
    use 'unblevable/quick-scope'

    -- Code Extensions
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("aaron.lsp") -- code understanding (diagnostic + navigation)
        end
    }
    use {
        'williamboman/mason.nvim',
        config = function()
            require("aaron.config.mason") -- installing lsp servers, formatters, linters...
        end
    }
    use 'mfussenegger/nvim-jdtls'
    use 'kosayoda/nvim-lightbulb'
    use {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".setup() end
    }
    use 'puremourning/vimspector'
    use {
        'NMAC427/guess-indent.nvim',
        config = function() require("guess-indent").setup() end
    }
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
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require("aaron.config.cmp") -- completion
        end
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-emoji'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'
    -- use 'Sirver/ultisnips'
    use {
        'L3MON4D3/LuaSnip',
        config = function() require('aaron.config.luasnip') end
    }
    use 'tpope/vim-abolish'
    use 'wellle/targets.vim'
    -- use 'tpope/vim-surround'
    use {
        'kylechui/nvim-surround',
        config = function()
            require('aaron.config.surround') -- change encapsulating syntax
        end
    }
    use 'mbbill/undotree'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('aaron.config.comment') -- commenting code
        end
    }
    use 'godlygeek/tabular'
    use 'voldikss/vim-translator'
    use 'ron89/thesaurus_query.vim'
    use 'rhysd/vim-grammarous'
    use 'inkarkat/vim-ingo-library'
    use 'inkarkat/vim-SpellCheck'
    use {
        'mizlan/iswap.nvim',
        config = function()
            require('aaron.config.iswap') -- swapping arguments
        end
    }
    -- use 'pseewald/vim-anyfold'
    use {
        'anuvyklack/pretty-fold.nvim',
        config = function()
            require('aaron.config.pretty-fold') -- folding
        end
    }
    use 'anuvyklack/fold-preview.nvim'
    use 'anuvyklack/nvim-keymap-amend'
    use {
        'mhinz/vim-startify',
        config = function() require('aaron.config.startify') end
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup() end
    }

    -- Git/GitHub
    -- use 'ldelossa/gh.nvim'
    -- use 'ldelossa/litee.nvim'
    use {'pwntester/octo.nvim', config = function() require("octo").setup() end}
    use 'f-person/git-blame.nvim'
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require("aaron.config.gitsigns") end
    }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use {
        'ThePrimeagen/git-worktree.nvim',
        config = function() require("aaron.config.git-worktree") end
    }

    -- Sessions and Workspaces
    use 'tpope/vim-obsession'
    use 'renerocksai/calendar-vim'
    use {
        'renerocksai/telekasten.nvim',
        config = function()
            require("aaron.config.telekasten") -- markdown notes
        end
    }

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
