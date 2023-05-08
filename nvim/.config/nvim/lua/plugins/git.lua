return {
    -- use 'ldelossa/gh.nvim'
    -- use 'ldelossa/litee.nvim'
    {
        "aaronhallaert/advanced-git-search.nvim",
        dev = true,
        config = function()
            require("telescope").load_extension("advanced_git_search")

            vim.api.nvim_create_user_command(
                "DiffCommitLine",
                "lua require('telescope').extensions.advanced_git_search.diff_commit_line()",
                { range = true }
            )

            vim.api.nvim_set_keymap(
                "v",
                "<leader>dcl",
                ":DiffCommitLine<CR>",
                { noremap = true }
            )

            require("advanced_git_search.fzf").setup({
                git_flags = { "-c", "delta.side-by-side=false" },
                git_diff_flags = {},
                show_builtin_git_pickers = true,
                diff_plugin = "diffview",
            })
        end,
        dependencies = {
            "tpope/vim-fugitive",
            "nvim-telescope/telescope.nvim",
            -- "sindrets/diffview.nvim",
        },
        event = "VeryLazy",
    },
    {
        "ruifm/gitlinker.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitlinker").setup({
                opts = {
                    add_current_line_on_normal_mode = false,
                    action_callback = function(url)
                        require("gitlinker.actions").copy_to_clipboard(url)
                        require("gitlinker.actions").open_in_browser(url)
                    end,
                },
            })
        end,
        event = "VeryLazy",
    },
    {
        "pwntester/octo.nvim",
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
        },
        event = "VeryLazy",
    },

    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("plugins.config.git-worktree")
        end,
        event = "VeryLazy",
    },

    -- use 'github/copilot.vim'
    {
        "sindrets/diffview.nvim",
        enabled = true,
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
}
