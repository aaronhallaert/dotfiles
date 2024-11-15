return {
    -- This plugin adds indentation guides to all lines (including empty lines).
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        main = "ibl",
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append("eol:")

            require("ibl").setup({
                indent = {
                    char = { "|", "¦", "┆", "┊" },
                },
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
    "roobert/tailwindcss-colorizer-cmp.nvim",
}
