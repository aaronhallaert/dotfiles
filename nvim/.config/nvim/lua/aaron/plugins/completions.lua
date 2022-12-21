return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("aaron.config.cmp") -- completion
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    -- 'quangnguyen30192/cmp-nvim-ultisnips',
    -- 'Sirver/ultisnips',
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("aaron.config.luasnip")
        end,
    },

    {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip").filetype_extend("ruby", { "rails" })
        end,
    },
}
