return {
    "shortcuts/no-neck-pain.nvim",
    {
        "voldikss/vim-floaterm",
        event = "VeryLazy",
        config = function()
            vim.api.nvim_set_keymap(
                "n",
                "<leader>tg",
                ":FloatermNew lazygit<CR>",
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>ts",
                ":FloatermNew spt<CR>",
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>td",
                ":FloatermNew lazydocker<CR>",
                { noremap = true }
            )

            vim.o.timeoutlen = 500
            vim.g.floaterm_gitcommit = "floaterm"
            vim.g.floaterm_autoinsert = 1
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8
            vim.g.floaterm_wintitle = 0
            vim.g.floaterm_autoclose = 1

            vim.api.nvim_create_autocmd("VimResized", {
                callback = function()
                    vim.api.nvim_command(":wincmd =")
                    vim.api.nvim_command("FloatermUpdate")
                end,
            })
        end,
    },
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-neotest/neotest",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rouge8/neotest-rust",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-rust"),
                },
            })
        end,
    },
    {
        "aaronhallaert/continuous-testing.nvim",
        enabled = false,
        -- dev = true,
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("continuous-testing").setup({
                notify = true,
                run_tests_on_setup = true,
                framework_setup = {
                    ruby = {
                        test_tool = "rspec",
                        test_cmd = "bundle exec rspec %file",
                    },
                    javascript = {
                        test_tool = "vitest",
                        test_cmd = "yarn vitest run %file",
                        root_pattern = "tsconfig.json",
                    },
                },
                project_override = {
                    ["/Users/aaronhallaert/Developer/nephroflow/nephroflow-api"] = {
                        ruby = {
                            test_tool = "rspec",
                            test_cmd = "run_api -- bundle exec rspec %file",
                        },
                    },
                    ["/Users/aaronhallaert/Developer/nephroflow/link"] = {
                        ruby = {
                            test_tool = "rspec",
                            test_cmd = "docker-compose run --rm link bundle exec rspec %file",
                        },
                    },
                },
            })
        end,
    },
}
