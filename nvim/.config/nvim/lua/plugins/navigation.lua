return {
    -- hop to word in file
    {
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap(
                "n",
                "<leader>hw",
                ":HopWord<CR>",
                { noremap = true }
            )
        end,
    },

    -- telescope pickers
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
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

    -- search engine
    { "junegunn/fzf", run = 'vim.fn["fzf#install"]' },
    "junegunn/fzf.vim",

    -- file tree
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                -- disable_default_keybindings = true,
                disable_netrw = false,
                hijack_netrw = false,
                open_on_setup = false,
                ignore_ft_on_setup = {},
                -- auto_close = false,
                open_on_tab = false,
                hijack_cursor = true,
                update_cwd = false,
                sync_root_with_cwd = false,
                actions = { open_file = { resize_window = true } },
                hijack_directories = { enable = true, auto_open = true },
                diagnostics = {
                    enable = false,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = false,
                    ignore_list = {},
                },
                system_open = { cmd = nil, args = {} },
                filters = {
                    dotfiles = false,
                    custom = {
                        "docker-compose",
                        "tmp",
                        "docker-compose.medsoc.yml",
                        "docker-compose.sam.yml",
                        "docker-compose.vidal.yml",
                        "docker-compose.yml",
                    },
                },
                notify = {
                    threshold = vim.log.levels.ERROR,
                },
                view = {
                    width = 40,
                    hide_root_folder = false,
                    side = "left",
                    mappings = { custom_only = false, list = {} },
                },
                renderer = { highlight_opened_files = "all" },
            })

            vim.api.nvim_set_keymap(
                "n",
                "<leader>pv",
                ":NvimTreeToggle<CR>",
                { noremap = true }
            )
        end,
    },

    -- custom marks and commands

    -- outline file
    "simrat39/symbols-outline.nvim",

    -- show buffers in tabs
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup()

            vim.api.nvim_set_keymap(
                "n",
                "<leader>hf",
                ":BufferLinePick<CR>",
                { noremap = true }
            )
        end,
    },
}