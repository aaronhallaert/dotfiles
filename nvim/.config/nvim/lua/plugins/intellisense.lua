return {
    -- code understanding (diagnostic + navigation)
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp-config")
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
            require("mason").setup()
        end,
    },
    -- lsp for Java
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
    },

    -- code understanding (highlight...)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter")
        end,
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        "utilyre/barbecue.nvim",
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
        build = function()
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
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.doc").setup()
        end,
    },
}
