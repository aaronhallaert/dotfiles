return {
    -- This plugin adds indentation guides to all lines (including empty lines).
    {
        "lukas-reineke/indent-blankline.nvim",
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
    },

    -- smooth scrolling
    -- {
    --     "declancm/cinnamon.nvim",
    --     config = function()
    --         require("cinnamon").setup()
    --     end,
    -- },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.config.lualine")
        end,
    },

    "kosayoda/nvim-lightbulb",

    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup()
        end,
    },

    {
        "NMAC427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup()
        end,
    },
    -- 'pseewald/vim-anyfold'
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup()
            require("fold-preview").setup()
        end,
    },
    "anuvyklack/fold-preview.nvim",

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" })
        end,
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },

    -- Lua
    {
        "krivahtoo/silicon.nvim",
        config = function()
            require("silicon").setup({
                font = "JetBrainsMono Nerd Font=16",
                theme = "Monokai Extended",
            })
        end,
        build = "./install.sh build",
    },

    -- {
    --     'anuvyklack/windows.nvim',
    --     config = function()
    --         require("windows").setup({
    --             animation = {
    --                 duration = 300 -- ms
    --             }
    --         })
    --     end
    -- }

    { "ElPiloto/significant.nvim" },

    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
    },
}
