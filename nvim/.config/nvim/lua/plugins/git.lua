return {
    -- use 'ldelossa/gh.nvim'
    -- use 'ldelossa/litee.nvim'
    {
        "aaronhallaert/bitbucket.nvim",
        enabled = false,
        dev = true,
        config = function()
            require("bitbucket").setup()
        end,
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        dev = false,
        cmd = { "AdvancedGitSearch" },
        config = function()
            ---@type advanced_git_search.Config
            local config = {
                browse_command = "GBrowse",
                git_flags = { "-c", "delta.side-by-side=false" },
                git_diff_flags = {},
                show_builtin_git_pickers = true,
                diff_plugin = "diffview",
                entry_default_author_or_date = "author",
            }

            local fzf_adv = false

            if fzf_adv then
                require("advanced_git_search.fzf").setup(config)
            else
                require("telescope").setup({
                    extensions = {
                        advanced_git_search = config,
                    },
                })
                require("telescope").load_extension("advanced_git_search")
            end
        end,
        dependencies = {
            "tpope/vim-fugitive",
            "tommcdo/vim-fubitive",
            -- "nvim-telescope/telescope.nvim",
            -- "sindrets/diffview.nvim",
        },
    },
    {
        "pwntester/octo.nvim",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("plugins.config.octo")
        end,
        event = "VeryLazy",
    },
    {
        "f-person/git-blame.nvim",
        config = function()
            vim.g.gitblame_date_format = "%r"

            vim.api.nvim_set_keymap(
                "n",
                "<leader>gb",
                ":Git blame<CR>",
                { noremap = true }
            )
        end,
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.api.nvim_set_keymap(
                "n",
                "cp",
                ":Gitsigns preview_hunk<CR>",
                { noremap = true }
            )

            vim.api.nvim_set_keymap(
                "n",
                "<leader>cr",
                ":Gitsigns reset_hunk<CR>",
                { noremap = true }
            )
        end,
        event = "VeryLazy",
    },
    {
        "tpope/vim-fugitive",
        lazy = true,
        config = function()
            vim.cmd([[
                function! ShowCommit()
                    let baseCommit = system('git describe --all --contains ' . expand('<cword>'))
                    execute "normal! :GBrowse ".baseCommit
                endfunction

                " Open commit_hash under cursor in browser
                nnoremap <leader>gbc :call ShowCommit()<CR>
                ]])

            vim.api.nvim_set_keymap(
                "n",
                "<leader>tc",
                ":tabclose",
                { noremap = true }
            )
        end,
        event = "VeryLazy",
    },
    {
        "tpope/vim-rhubarb",
        dependencies = {
            "tpope/vim-fugitive",
            "tommcdo/vim-fubitive",
        },
        event = "VeryLazy",
    },

    -- {
    --     "ThePrimeagen/git-worktree.nvim",
    --     config = function()
    --         require("plugins.config.git-worktree")
    --     end,
    --     event = "VeryLazy",
    -- },

    -- use 'github/copilot.vim'
    {
        "sindrets/diffview.nvim",
        enabled = true,
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "andrewradev/linediff.vim",
    },
}
