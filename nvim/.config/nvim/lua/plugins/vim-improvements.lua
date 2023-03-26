return {
    -- replace capital with capital, normal with normal
    "tpope/vim-abolish",
    -- change surrounding
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    -- expand surround e.g. cin) = clear inside next parenthesis
    "wellle/targets.vim",

    {
        "mbbill/undotree",
        config = function()
            vim.api.nvim_set_keymap(
                "n",
                "<leader>u",
                ":UndotreeShow<CR>",
                { noremap = true }
            )
        end,
    },
    "godlygeek/tabular",
    {
        "mizlan/iswap.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.config.iswap") -- swapping arguments
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
    {
        "lambdalisue/suda.vim",
        config = function()
            vim.g.suda_smart_edit = 1
        end,
    },
    {
        "echasnovski/mini.ai",
        config = function()
            require("mini.ai").setup()
        end,
    },
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

    {
        "cbochs/portal.nvim",
        config = function()
            require("portal").setup()
        end,
    },

    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter" },
        config = function()
            require("treesj").setup({
                use_default_keymaps = false,
            })
        end,
    },
}
