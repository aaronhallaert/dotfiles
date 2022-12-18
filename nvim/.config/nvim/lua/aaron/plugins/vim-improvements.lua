local M = {}
M.setup = function(config)
    local use = config.use
    -- replace capital with capital, normal with normal
    use("tpope/vim-abolish")

    -- change surrounding
    use({
        "kylechui/nvim-surround",
        config = function()
            require("aaron.config.surround") -- change encapsulating syntax
        end,
    })
    -- expand surround e.g. cin) = clear inside next parenthesis
    use("wellle/targets.vim")

    use("mbbill/undotree")
    use("godlygeek/tabular")
    use({
        "mizlan/iswap.nvim",
        config = function()
            require("aaron.config.iswap") -- swapping arguments
        end,
    })
    use("anuvyklack/nvim-keymap-amend")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    })
    use("vim-utils/vim-man")
    use("lambdalisue/suda.vim")
    use("svermeulen/vimpeccable")
    use({
        "smjonas/live-command.nvim",
        config = function()
            require("live-command").setup({
                commands = {
                    Norm = { cmd = "norm" },
                    G = { cmd = "g" },
                    Reg = {
                        cmd = "norm",
                        -- This will transform ":5Reg a" into ":norm 5@a"
                        args = function(opts)
                            return (opts.count == -1 and "" or opts.count)
                                .. "@"
                                .. opts.args
                        end,
                        range = "",
                    },
                },
            })
        end,
    })

    use("vim-scripts/ReplaceWithRegister")
end
return M
