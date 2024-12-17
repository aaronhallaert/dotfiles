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
                            pattern = "plixus%-apps",
                            actions = {
                                ["cpp"] = "build_scripts pc",
                                ["cmake"] = "build_scripts pc",
                            },
                        },
                        {
                            pattern = "confero%-audio%-configurator",
                            actions = {
                                ["python"] = "pytest %file -k %word --run-app=yes --run-core-mock=yes --dev",
                            },
                        },
                    },
                },
                ["stf"] = {
                    default = {
                        ["rust"] = "cargo nextest run",
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
                            pattern = "plixus%-apps",
                            actions = {
                                ["cpp"] = "build_scripts pc",
                                ["cmake"] = "build_scripts pc",
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
}

return M
