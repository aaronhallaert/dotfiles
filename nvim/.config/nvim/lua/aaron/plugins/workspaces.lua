local M = {}
M.setup = function(config)
    local use = config.use

    use("tpope/vim-obsession")

    use("renerocksai/calendar-vim")

    use({
        "renerocksai/telekasten.nvim",
        config = function()
            require("aaron.config.telekasten") -- markdown notes
        end,
    })

    use({
        "mhinz/vim-startify",
        config = function()
            require("aaron.config.startify")
        end,
    })
end
return M
