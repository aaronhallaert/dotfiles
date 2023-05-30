return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.config.cmp") -- completion
        end,
        event = "InsertEnter",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "InsertEnter",
    },

    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    { "hrsh7th/cmp-buffer", event = "InsertEnter" },
    { "hrsh7th/cmp-emoji", event = "InsertEnter" },
    { "hrsh7th/cmp-cmdline", event = "InsertEnter" },
    { "hrsh7th/cmp-path", event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    -- 'quangnguyen30192/cmp-nvim-ultisnips',
    -- 'Sirver/ultisnips',
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        config = function()
            require("plugins.config.luasnip")
        end,
    },
    {
        "rafamadriz/friendly-snippets",
        event = "VeryLazy",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip").filetype_extend("ruby", { "rails" })
        end,
    },
}
