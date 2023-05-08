return {
    -- code understanding (diagnostic + navigation)
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp-config")
        end,
        event = "BufReadPre",
    },
    {
        "folke/neodev.nvim",
        event = "BufReadPre",
    },

    -- diagnostic overview
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
        event = "VeryLazy",
    },

    -- installing lsp servers, formatters, linters...
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        event = "VeryLazy",
    },
    -- lsp for Java
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
    },

    -- code understanding (highlight...)
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPre",
        build = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
    },

    {
        "utilyre/barbecue.nvim",
        event = "BufReadPre",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            -- "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
            show_dirname = false,
        },
    },
    {
        "nvim-treesitter/playground",
        event = "VeryLazy",
    },

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
            require("Comment").setup()
        end,
        event = "VeryLazy",
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-a>",
                        accept_word = false,
                        accept_line = false,
                        next = "<C-]>",
                        prev = "<C-[>",
                        dismiss = "<C-j>",
                    },
                },
            })
        end,
    },

    --------------- DEBUGGING -------------------
    -- {
    --     "puremourning/vimspector",
    --     config = function()
    --         local nvimrc = "$HOME/dotfiles/nvim/.config/nvim"
    --         vim.cmd(
    --             "source"
    --             .. nvimrc
    --             .. "/lua/legacy-plugins/vimspector-config.vim"
    --         )
    --     end,
    -- },

    -- Lua
    {
        "folke/todo-comments.nvim",
        event = "BufReadPre",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
    },

    ------------- LANGUAGE SPECIFIC -------------
    -- MARKDOWN
    { "mzlogin/vim-markdown-toc", event = "BufReadPre" },
    { "lervag/vimtex", event = "BufReadPre" },
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        event = "BufReadPre",
    },

    -- RUBY ON RAILS
    { "tpope/vim-rails", event = "LspAttach" },

    { "ziontee113/query-secretary", event = "VeryLazy" },
    -- {
    --     "simrat39/rust-tools.nvim",
    --     config = function()
    --         require("rust-tools").setup()
    --     end,
    -- },

    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.doc").setup()
        end,
        event = "VeryLazy",
    },
}
