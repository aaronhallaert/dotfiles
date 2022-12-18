local M = {}

M.setup = function(config)
    local use = config.use

    -- code understanding (diagnostic + navigation)
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("aaron.lsp")
        end,
    })

    -- diagnostic overview
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
    })

    -- installing lsp servers, formatters, linters...
    use({
        "williamboman/mason.nvim",
        config = function()
            require("aaron.config.mason")
        end,
    })
    -- lsp for Java
    use("mfussenegger/nvim-jdtls")

    -- code understanding (highlight...)
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("aaron.config.treesitter")
        end,
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")

    use({
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("aaron.config.treesitter-context") -- fix context on first line
        end,
    })
    use("nvim-treesitter/playground")

    use({
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        config = function()
            require("fidget").setup({})
        end,
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("aaron.config.comment") -- commenting code
        end,
    })

    --------------- DEBUGGING -------------------
    use("puremourning/vimspector")

    -- Lua
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end,
    })

    ------------- LANGUAGE SPECIFIC -------------
    -- MARKDOWN
    use("mzlogin/vim-markdown-toc")
    use("lervag/vimtex")
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    -- RUBY ON RAILS
    use("tpope/vim-rails")

    use("ziontee113/query-secretary")
    -- use({
    --     "simrat39/rust-tools.nvim",
    --     config = function()
    --         require("rust-tools").setup()
    --     end,
    -- })

    use({
        "creativenull/efmls-configs-nvim",
        requires = { "neovim/nvim-lspconfig" },
    })
end

return M
