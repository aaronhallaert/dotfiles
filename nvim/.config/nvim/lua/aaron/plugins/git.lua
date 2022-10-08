local M = {}
M.setup = function(config)
    local use = config.use
    --
    -- use 'ldelossa/gh.nvim'
    -- use 'ldelossa/litee.nvim'
    use({
        "pwntester/octo.nvim",
        config = function()
            require("aaron.config.octo")
        end,
    })
    use("f-person/git-blame.nvim")
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("aaron.config.gitsigns")
        end,
    })
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
    use({
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("aaron.config.git-worktree")
        end,
    })

    -- use 'github/copilot.vim'
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
end
return M
