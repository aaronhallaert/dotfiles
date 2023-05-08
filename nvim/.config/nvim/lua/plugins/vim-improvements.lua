return {

    -- replace capital with capital, normal with normal
    { "tpope/vim-abolish", event = "VeryLazy" },
    -- change surrounding
    {
        "kylechui/nvim-surround",
        event = "BufReadPre",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    -- expand surround e.g. cin) = clear inside next parenthesis
    {
        "wellle/targets.vim",
        event = "BufReadPre",
    },
    -- {
    --     "mbbill/undotree",
    --     config = function()
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "<leader>u",
    --             ":UndotreeShow<CR>",
    --             { noremap = true }
    --         )
    --     end,
    -- },
    { "godlygeek/tabular", event = "VeryLazy" },
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
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    { "vim-utils/vim-man", event = "VeryLazy" },
    {
        "lambdalisue/suda.vim",
        event = "VeryLazy",
        config = function()
            vim.g.suda_smart_edit = 1
        end,
    },
    {
        "echasnovski/mini.ai",
        config = function()
            require("mini.ai").setup()
        end,
        event = "InsertEnter",
    },
    {
        "smjonas/live-command.nvim",
        event = "VeryLazy",
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

    { "vim-scripts/ReplaceWithRegister", event = "VeryLazy" },

    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter" },
        event = "VeryLazy",
        config = function()
            require("treesj").setup({
                use_default_keymaps = false,
            })
        end,
    },
}
