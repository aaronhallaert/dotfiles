local M = {}
M.setup = function(config)
    local use = config.use

    -- hop to word in file
    use {
        'phaazon/hop.nvim',
        config = function() require("aaron.config.hop") end
    }

    -- telescope pickers
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function()
            require("aaron.telescope.setup") -- search
            require("aaron.telescope.mappings") -- search
        end
    }

    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- search engine
    use {'junegunn/fzf', run = 'vim.fn["fzf#install"]'}
    use 'junegunn/fzf.vim'

    -- file tree 
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require("aaron.config.nvim-tree") -- project view
        end
    }

    -- custom marks and commands
    use {
        'ThePrimeagen/harpoon',
        config = function()
            require("aaron.config.harpoon") -- mark files
        end
    }

    -- outline file
    use 'simrat39/symbols-outline.nvim'

    -- highlight f and F characters
    use 'unblevable/quick-scope'

    -- show buffers in tabs
    use {
        'akinsho/bufferline.nvim',
        config = function() require('aaron.config.bufferline') end
    }

end
return M
