return {
    "aduros/ai.vim",
    "voldikss/vim-floaterm",
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    {
        "aaronhallaert/continuous-testing.nvim",
        dev = true,
        config = function()
            require("continuous-testing").setup({
                notify = true, -- The default is false
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
                            test_cmd = "run_api.sh -ni -- bundle exec rspec %file",
                        },
                    },
                    ["/Users/aaronhallaert/Developer/nephroflow/link"] = {
                        ruby = {
                            test_tool = "rspec",
                            test_cmd = "docker exec channel_host bundle exec rspec %file",
                        },
                    },
                },
            })
        end,
    },
}
