return {
    -- code understanding (diagnostic + navigation)
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("aaron.lsp")
        end,
    },

    -- diagnostic overview
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
    },

    -- installing lsp servers, formatters, linters...
    {
        "williamboman/mason.nvim",
        config = function()
            require("aaron.config.mason")
        end,
    },
    -- lsp for Java
    "mfussenegger/nvim-jdtls",

    -- code understanding (highlight...)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("aaron.config.treesitter")
        end,
        lazy = false,
    },
    "nvim-treesitter/nvim-treesitter-textobjects",

    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("aaron.config.treesitter-context") -- fix context on first line
        end,
    },
    "nvim-treesitter/playground",

    {
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        config = function()
            require("fidget").setup({})
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("aaron.config.comment") -- commenting code
        end,
    },

    --------------- DEBUGGING -------------------
    "puremourning/vimspector",

    -- Lua
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
    },

    ------------- LANGUAGE SPECIFIC -------------
    -- MARKDOWN
    "mzlogin/vim-markdown-toc",
    "lervag/vimtex",
    {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    -- RUBY ON RAILS
    "tpope/vim-rails",

    "ziontee113/query-secretary",
    -- {
    --     "simrat39/rust-tools.nvim",
    --     config = function()
    --         require("rust-tools").setup()
    --     end,
    -- },

    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
}
