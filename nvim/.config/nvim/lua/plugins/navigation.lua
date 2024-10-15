return {
    -- hop to word in file
    {
        "phaazon/hop.nvim",
        event = "VeryLazy",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap(
                "n",
                "<leader>w",
                ":HopWord<CR>",
                { noremap = true }
            )
        end,
    },
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --         { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    --         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    --     },
    -- },
    {
        "ibhagwan/fzf-lua",
        -- event = "BufReadPre",
        config = function()
            require("fzf-lua").setup({
                "telescope",
                devicons = {
                    enable = true,
                },
                winopts = {
                    hl_border = "Normal",
                },
                fzf_layout = "default",
            })

            --Search shortcuts
            vim.api.nvim_set_keymap(
                "n",
                "fdp",
                ":lua require('fzf-lua').grep({ search = 'binding.break' })<CR>",
                { noremap = true, silent = true }
            )

            -- Search shortcuts
            vim.api.nvim_set_keymap(
                "n",
                "<leader>ff",
                ":FzfLua files<CR>",
                { noremap = true, silent = true }
            )
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    },
    -- { "junegunn/fzf", run = { vim.fn["fzf#install()"] } },
    -- "junegunn/fzf.vim",
    -- telescope pickers
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        tag = "0.1.7",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzy-native.nvim", lazy = false },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            require("aaron.telescope.setup") -- search
            require("aaron.telescope.mappings") -- search
        end,
    },

    -- file tree
    {
        enabled = false,
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup({
                default_file_explorer = false,
                view_options = {
                    show_hidden = true,
                },
            })
        end,
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        event = "VeryLazy",
        -- branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                -- Add this section only if you've configured source selector.
                source_selector = {
                    winbar = true,
                    statusline = true,
                    sources = {
                        {
                            source = "filesystem",
                            display_name = " 󰉓 Files ",
                        },
                        { source = "git_status", display_name = " 󰊢 Git " },
                        { source = "buffers", display_name = "  Buffers " },
                    },
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                    },
                    filtered_items = {
                        visible = false, -- when true, they will just be displayed differently than normal items
                        hide_dotfiles = false,
                        hide_gitignored = true,
                        hide_hidden = false, -- only works on Windows for hidden files/directories
                    },
                },
                window = {
                    mappings = {
                        ["?"] = "",
                        ["/"] = "",
                        ["<bs>"] = "close_node",
                    },
                },

                -- Nerdfond v3 fix
                default_component_configs = {
                    icon = {
                        folder_empty = "󰜌",
                        folder_empty_open = "󰜌",
                    },
                    git_status = {
                        symbols = {
                            renamed = "󰁕",
                            unstaged = "󰄱",
                        },
                    },
                },
                document_symbols = {
                    kinds = {
                        File = { icon = "󰈙", hl = "Tag" },
                        Namespace = { icon = "󰌗", hl = "Include" },
                        Package = { icon = "󰏖", hl = "Label" },
                        Class = { icon = "󰌗", hl = "Include" },
                        Property = { icon = "󰆧", hl = "@property" },
                        Enum = { icon = "󰒻", hl = "@number" },
                        Function = { icon = "󰊕", hl = "Function" },
                        String = { icon = "󰀬", hl = "String" },
                        Number = { icon = "󰎠", hl = "Number" },
                        Array = { icon = "󰅪", hl = "Type" },
                        Object = { icon = "󰅩", hl = "Type" },
                        Key = { icon = "󰌋", hl = "" },
                        Struct = { icon = "󰌗", hl = "Type" },
                        Operator = { icon = "󰆕", hl = "Operator" },
                        TypeParameter = { icon = "󰊄", hl = "Type" },
                        StaticMethod = { icon = "󰠄 ", hl = "Function" },
                    },
                },
            })
            vim.api.nvim_set_keymap(
                "n",
                "<leader>pv",
                ":Neotree toggle<CR>",
                { noremap = true }
            )
        end,
    },
}
