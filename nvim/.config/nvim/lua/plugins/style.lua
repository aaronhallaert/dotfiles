return {
    -- This plugin adds indentation guides to all lines (including empty lines).
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append("eol:")

            require("indent_blankline").setup({
                use_treesitter = true,
                char_list = { "|", "¦", "┆", "┊" },
                show_current_context = false,
                show_current_context_start = false,
            })
        end,
    },
    {
        "Bekaboo/deadcolumn.nvim",
        config = function()
            require("deadcolumn").setup({
                blending = {
                    threshold = 0.75,
                },
                scope = "line",
                modes = { "i", "ic", "ix", "R", "Rc", "Rx", "Rv", "Rvc", "Rvx" },
                warning = {
                    alpha = 0.4,
                    colorcode = "#FF0000",
                    hlgroup = {
                        "Error",
                        "background",
                    },
                },
            })
        end,
        event = "InsertEnter",
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                lightbulb = {
                    enable = true,
                    sign = false,
                    virtual_text = true,
                },
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            require("plugins.config.lualine")
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup()
        end,
        event = "LspAttach",
    },

    {
        "NMAC427/guess-indent.nvim",
        event = "VeryLazy",
        config = function()
            require("guess-indent").setup()
        end,
    },
    -- 'pseewald/vim-anyfold'
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" })
        end,
        event = "BufReadPre",
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
        event = "VeryLazy",
    },

    -- Lua
    -- {
    --     "krivahtoo/silicon.nvim",
    --     config = function()
    --         require("silicon").setup({
    --             font = "JetBrainsMono Nerd Font=16",
    --             theme = "Monokai Extended",
    --         })
    --     end,
    --     build = "./install.sh build",
    --     event = "VeryLazy",
    -- },

    "roobert/tailwindcss-colorizer-cmp.nvim",
}
