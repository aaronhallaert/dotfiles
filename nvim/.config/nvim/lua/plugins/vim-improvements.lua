return {
    -- replace capital with capital, normal with normal
    "tpope/vim-abolish",

    -- change surrounding
    {
        "kylechui/nvim-surround",
        config = function()
            require("aaron.config.surround") -- change encapsulating syntax
        end,
    },
    -- expand surround e.g. cin) = clear inside next parenthesis
    "wellle/targets.vim",

    "mbbill/undotree",
    "godlygeek/tabular",
    {
        "mizlan/iswap.nvim",
        config = function()
            require("aaron.config.iswap") -- swapping arguments
        end,
    },
    "anuvyklack/nvim-keymap-amend",
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    "vim-utils/vim-man",
    "lambdalisue/suda.vim",
    "svermeulen/vimpeccable",
    {
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
    },

    "vim-scripts/ReplaceWithRegister",
}
