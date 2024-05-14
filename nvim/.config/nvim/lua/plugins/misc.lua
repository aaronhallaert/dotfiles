return {
    "shortcuts/no-neck-pain.nvim",
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>tg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-neotest/neotest",
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
