local nvim_tree = require("nvim-tree")
local nvimrc = "$HOME/dotfiles/nvim/.config/nvim"

vim.cmd("source" .. nvimrc .. "/plugin/nvimtree-config.vim")

nvim_tree.setup({
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
        icons = { hint = "", info = "", warning = "", error = "" },
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
