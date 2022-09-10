local M = {}

M.setup = function(config)
    local use = config.use

    -- code understanding (diagnostic + navigation)
    use {'neovim/nvim-lspconfig', config = function() require("aaron.lsp") end}

    -- diagnostic overview
    use {
        'folke/trouble.nvim',
        config = function() require('trouble').setup() end
    }

    -- installing lsp servers, formatters, linters...
    use {
        'williamboman/mason.nvim',
        config = function() require("aaron.config.mason") end
    }
    -- lsp for Java
    use 'mfussenegger/nvim-jdtls'

    -- code understanding (highlight...)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require("aaron.config.treesitter") end
    }
    -- use {
    --     'nvim-treesitter/nvim-treesitter-context',
    --     config = function()
    --         require('aaron.config.treesitter-context') -- fix context on first line
    --     end
    -- }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('aaron.config.comment') -- commenting code
        end
    }

    --------------- DEBUGGING -------------------
    use 'puremourning/vimspector'

    ------------- LANGUAGE SPECIFIC -------------
    -- MARKDOWN
    use 'mzlogin/vim-markdown-toc'
    use 'lervag/vimtex'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    })

    -- RUBY ON RAILS
    use 'tpope/vim-rails'
end

return M
