local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local plugins = {}

table.insert(plugins, require("aaron.plugins.vim-improvements"))
table.insert(plugins, require("aaron.plugins.colorschemes"))
table.insert(plugins, require("aaron.plugins.style"))
table.insert(plugins, require("aaron.plugins.icons"))
table.insert(plugins, require("aaron.plugins.git"))
table.insert(plugins, require("aaron.plugins.intellisense"))
table.insert(plugins, require("aaron.plugins.navigation"))
table.insert(plugins, require("aaron.plugins.completions"))
table.insert(plugins, require("aaron.plugins.workspaces"))
table.insert(plugins, require("aaron.plugins.search-info-helpers"))

table.insert(plugins, {
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
})

local options = {
    dev = {
        -- directory where you store your local plugin projects
        path = "~/Developer/personal/",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
    },
}

require("lazy").setup(plugins, options)
