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
        end,
        dependencies = {
            "tpope/vim-fugitive",
            "nvim-telescope/telescope.nvim",
            -- "sindrets/diffview.nvim",
        },
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("plugins.config.octo")
        end,
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
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
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

                function! DiffPR()
                    let baseCommit = system('git merge-base $(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//") $(git branch --show-current)')
                    execute "normal! :Git difftool -y ".baseCommit
                endfunction

                " Open commit_hash under cursor in browser
                nnoremap <leader>gbc :call ShowCommit()<CR>
                " Open changed files diff of current branch in tabs
                nnoremap <leader>dpr :call DiffPR()<CR>
                " Compare current file with master branch
                nnoremap <leader>df :Gvdiffsplit system("git branch -l master main \| sed 's/^* //'")<CR>
                ]])

            vim.api.nvim_set_keymap(
                "n",
                "<leader>tc",
                ":tabclose",
                { noremap = true }
            )
        end,
    },
    {
        "tpope/vim-rhubarb",
        dependencies = {
            "tpope/vim-fugitive",
        },
    },

    {
        "ThePrimeagen/git-worktree.nvim",
        lazy = true,
        config = function()
            require("plugins.config.git-worktree")
        end,
    },

    -- use 'github/copilot.vim'
    {
        "sindrets/diffview.nvim",
        enabled = true,
        dependencies = "nvim-lua/plenary.nvim",
    },
}
