local M = {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            local config = {
                -- Your global settings here
                terms = {
                    settings = {
                        save_on_toggle = false,
                        select_with_nil = false,
                        sync_on_ui_close = false,
                    },
                },
            }

            local keymaps = {
                ["stl"] = {
                    default = {
                        ["rust"] = "cargo nextest run --no-capture -- %word",
                        ["python"] = "pytest %file -k %word",
                    },
                    overrides = {
                        {
                            pattern = "/workspaces/confero%-digital%-audio%-distribution",
                            actions = {
                                ["rust"] = "./gst-cargo nextest run --no-capture -- %word",
                            },
                        },
                        {
                            pattern = "plixus%_apps",
                            actions = {
                                ["cpp"] = "cd /home/aaron/Developer/televic/build_scripts && ./build_pc.sh",
                            },
                        },
                        {
                            pattern = "confero%-audio%-configurator",
                            actions = {
                                ["python"] = "pytest %file -k %word --run-apps --dev",
                            },
                        },
                    },
                },
                ["stf"] = {
                    default = {
                        ["rust"] = "cargo nextest run --no-capture",
                        ["python"] = "pytest %file",
                    },
                    overrides = {
                        {
                            pattern = "/workspaces/confero%-digital%-audio%-distribution",
                            actions = {
                                ["rust"] = "./gst-cargo nextest run --no-capture",
                            },
                        },
                        {
                            pattern = "plixus%_apps",
                            actions = {
                                ["cpp"] = "cd /home/aaron/Developer/televic/build_scripts && ./build_pc.sh",
                            },
                        },
                        {
                            pattern = "confero%-audio%-configurator",
                            actions = {
                                ["python"] = "pytest %file --run-apps --dev",
                            },
                        },
                    },
                },
            }

            harpoon:setup(config)

            local hterm = require("plugins.config.harpoon.term")
            hterm.apply_keymaps(keymaps)

            vim.keymap.set("n", "<leader>ah", function()
                harpoon:list():add()
            end)

            vim.keymap.set("n", "gj", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "gk", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "gl", function()
                harpoon:list():select(3)
            end)

            vim.keymap.set("n", "gp", function()
                harpoon:list():prev()
            end)
            vim.keymap.set("n", "gn", function()
                harpoon:list():next()
            end)

            vim.keymap.set("n", "<C-h>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)
        end,
    },
    -- {
    --     "aaronhallaert/harpoon",
    --     branch = "fix/nil_check",
    --     enabled = false,
    --     event = "VeryLazy",
    --     config = function()
    --         local harpoon = require("harpoon")
    --
    --         harpoon.setup({})
    --
    --         -- Marks
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "<C-h>",
    --             ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
    --             { noremap = true }
    --         )
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "<leader>ah",
    --             ':lua require("harpoon.mark").add_file()<CR>',
    --             { noremap = true }
    --         )
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "<leader>th",
    --             ':lua require("harpoon.mark").toggle_file()<CR>',
    --             { noremap = true }
    --         )
    --
    --
    --         function _G.Get_ruby_test_command(--[[optional]]line)
    --             local test_file = vim.fn.getreg("%")
    --             local test_line = vim.api.nvim_win_get_cursor(0)[1]
    --             local test_position = test_file .. ":" .. test_line
    --
    --             if not line then
    --                 line = false
    --             end
    --
    --             if line then
    --                 return "bundle exec rspec " .. test_position
    --             else
    --                 return "bundle exec rspec " .. test_file
    --             end
    --         end
    --
    --         if
    --             string.find(
    --                 vim.fn.getcwd(),
    --                 "/workspaces/confero%-digital%-audio%-distribution"
    --             )
    --         then
    --             vim.api.nvim_set_keymap(
    --                 "n",
    --                 "stl",
    --                 ':lua RunCommandInTerminal("./gst-cargo nextest run --no-capture -- " .. vim.fn.expand("<cword>"))<CR>',
    --                 { noremap = true, silent = true }
    --             )
    --         else
    --             vim.api.nvim_set_keymap(
    --                 "n",
    --                 "stl",
    --                 ':lua RunCommandInTerminal("cargo nextest run --no-capture -- " .. vim.fn.expand("<cword>"))<CR>',
    --                 { noremap = true, silent = true }
    --             )
    --         end
    --
    --         if string.find(vim.fn.getcwd(), "plixus%_apps") then
    --             vim.api.nvim_set_keymap(
    --                 "n",
    --                 "stf",
    --                 ':lua RunCommandInTerminal("cd /home/aaron/Developer/televic/build_scripts && ./build_pc.sh")<CR>',
    --                 { noremap = true, silent = true }
    --             )
    --         end
    --
    --         -- NAVIGATION
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "gt",
    --             ':lua require("harpoon.term").gotoTerminal(1)<CR>',
    --             { noremap = true }
    --         )
    --
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "gj",
    --             ':lua require("harpoon.ui").nav_file(1)<CR>',
    --             { noremap = true }
    --         )
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "gk",
    --             ':lua require("harpoon.ui").nav_file(2)<CR>',
    --             { noremap = true }
    --         )
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "gl",
    --             ':lua require("harpoon.ui").nav_file(3)<CR>',
    --             { noremap = true }
    --         )
    --         -- vim.api.nvim_set_keymap(
    --         --     "n",
    --         --     "g;",
    --         --     ':lua require("harpoon.ui").nav_file(4)<CR>',
    --         --     { noremap = true }
    --         -- )
    --
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "gn",
    --             ':lua require("harpoon.ui").nav_next()<CR>',
    --             { noremap = true }
    --         )
    --         vim.api.nvim_set_keymap(
    --             "n",
    --             "gp",
    --             ':lua require("harpoon.ui").nav_prev()<CR>',
    --             { noremap = true }
    --         )
    --     end,
    -- },
}

return M
