return {
    -- This plugin adds indentation guides to all lines (including empty lines).
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("aaron.config.indent_blankline") -- indent characters
        end,
    },

    -- smooth scrolling
    {
        "declancm/cinnamon.nvim",
        config = function()
            require("aaron.config.cinnamon") -- smooth scrolling
        end,
    },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup()
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
            require("aaron.config.pretty-fold") -- folding
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
        "narutoxy/silicon.lua",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("silicon").setup({})
        end,
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
}
