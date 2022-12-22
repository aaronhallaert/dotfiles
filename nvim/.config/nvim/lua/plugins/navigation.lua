return {
    -- hop to word in file
    {
        "phaazon/hop.nvim",
        config = function()
            require("aaron.config.hop")
        end,
    },

    -- telescope pickers
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzy-native.nvim", lazy = false },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            require("aaron.telescope.setup") -- search
            require("aaron.telescope.mappings") -- search
        end,
    },

    -- search engine
    { "junegunn/fzf", run = 'vim.fn["fzf#install"]' },
    "junegunn/fzf.vim",

    -- file tree
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("aaron.config.nvim-tree") -- project view
        end,
    },

    -- custom marks and commands
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("aaron.config.harpoon") -- mark files
        end,
    },

    -- outline file
    "simrat39/symbols-outline.nvim",

    -- show buffers in tabs
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("aaron.config.bufferline")
        end,
    },
}
