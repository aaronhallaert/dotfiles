return {
    -- use 'ldelossa/gh.nvim'
    -- use 'ldelossa/litee.nvim'
    {
        "pwntester/octo.nvim",
        config = function()
            require("aaron.config.octo")
        end,
    },
    "f-person/git-blame.nvim",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("aaron.config.git-worktree")
        end,
    },

    -- use 'github/copilot.vim'
    { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
}
