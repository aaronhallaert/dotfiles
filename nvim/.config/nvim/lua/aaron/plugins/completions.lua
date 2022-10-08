local M = {}
M.setup = function(config)
    local use = config.use
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("aaron.config.cmp") -- completion
        end,
    })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-emoji")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'
    -- use 'Sirver/ultisnips'
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("aaron.config.luasnip")
        end,
    })
end

return M
