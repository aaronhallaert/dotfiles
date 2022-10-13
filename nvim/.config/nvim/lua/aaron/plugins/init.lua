vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
    -- Packer itself
    use("wbthomason/packer.nvim")

    require("aaron.plugins.vim-improvements").setup({ use = use })
    require("aaron.plugins.colorschemes").setup({ use = use })
    require("aaron.plugins.style").setup({ use = use })
    require("aaron.plugins.icons").setup({ use = use })
    require("aaron.plugins.git").setup({ use = use })
    require("aaron.plugins.intellisense").setup({ use = use })
    require("aaron.plugins.navigation").setup({ use = use })
    require("aaron.plugins.completions").setup({ use = use })
    require("aaron.plugins.workspaces").setup({ use = use })
    require("aaron.plugins.search-info-helpers").setup({ use = use })

    use({
        "creativenull/efmls-configs-nvim",

        requires = { "neovim/nvim-lspconfig" },
    })

    use({
        "~/Developer/personal/customLuaPlugs/continuous-testing.nvim",
        config = function()
            require("continuous-testing").setup({
                notify = true, -- The default is false
                framework_setup = {
                    ruby = {
                        test_tool = "rspec",
                        test_cmd = "bundle exec rspec %file --format json --no-fail-fast",
                    },
                    typescript = {
                        test_tool = "vitest",
                        test_cmd = "yarn vitest run --root=src/main %file --reporter=verbose --reporter=json",
                    },
                },
                project_override = {
                    ["/Users/aaronhallaert/Developer/nephroflow/nephroflow-api"] = {
                        ruby = {
                            test_tool = "rspec",
                            test_cmd = "run_api.sh -ni -- spring rspec %file --format json --no-fail-fast",
                        },
                    },
                },
            })
        end,
    })

    -- Code Extensions
    use("voldikss/vim-floaterm")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
end)
