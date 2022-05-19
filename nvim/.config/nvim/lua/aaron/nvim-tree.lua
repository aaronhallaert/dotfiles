-- let g:nvim_tree_disable_default_keybindings = 1
-- lua <<EOF
-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
---- default mappings
-- vim.g.
-- nvim_tree_bindings = {
-- { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
-- { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
-- { key = "<C-v>",                        cb = tree_cb("vsplit") },
-- { key = "<C-x>",                        cb = tree_cb("split") },
-- { key = "<C-t>",                        cb = tree_cb("tabnew") },
-- { key = "<",                            cb = tree_cb("prev_sibling") },
-- { key = ">",                            cb = tree_cb("next_sibling") },
-- { key = "P",                            cb = tree_cb("parent_node") },
-- { key = "<BS>",                         cb = tree_cb("close_node") },
-- { key = "<S-CR>",                       cb = tree_cb("close_node") },
-- { key = "K",                            cb = tree_cb("first_sibling") },
-- { key = "J",                            cb = tree_cb("last_sibling") },
-- { key = "I",                            cb = tree_cb("toggle_ignored") },
-- { key = "H",                            cb = tree_cb("toggle_dotfiles") },
-- { key = "R",                            cb = tree_cb("refresh") },
-- { key = "a",                            cb = tree_cb("create") },
-- { key = "d",                            cb = tree_cb("remove") },
-- { key = "r",                            cb = tree_cb("rename") },
-- { key = "<C-r>",                        cb = tree_cb("full_rename") },
-- { key = "x",                            cb = tree_cb("cut") },
-- { key = "c",                            cb = tree_cb("copy") },
-- { key = "p",                            cb = tree_cb("paste") },
-- { key = "y",                            cb = tree_cb("copy_name") },
-- { key = "Y",                            cb = tree_cb("copy_path") },
-- { key = "gy",                           cb = tree_cb("copy_absolute_path") },
-- { key = "[c",                           cb = tree_cb("prev_git_item") },
-- { key = "]c",                           cb = tree_cb("next_git_item") },
-- { key = "-",                            cb = tree_cb("dir_up") },
-- { key = "s",                            cb = tree_cb("system_open") },
-- { key = "q",                            cb = tree_cb("close") },
-- { key = "g?",                           cb = tree_cb("toggle_help") },
-- }
-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback,
-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require"nvim-tree".setup({
    -- disable_default_keybindings = true,
    disable_netrw = false,
    hijack_netrw = false,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    -- auto_close = false,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    update_to_buf_dir = {enable = true, update_cwd = false, auto_open = true},
    diagnostics = {enable = false, icons = {hint = "", info = "", warning = "", error = ""}},
    update_focused_file = {enable = true, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},
    filters = {
        dotfiles = false,
        custom = {
            "docker-compose", "tmp", "log", "docs", "docker-compose.medsoc.yml", "docker-compose.sam.yml", "docker-compose.vidal.yml",
            "docker-compose.yml"
        }
    },
    view = {width = 70, height = 30, hide_root_folder = false, side = 'right', auto_resize = false, mappings = {custom_only = false, list = {}}}
    -- nvim_tree_bindings = {
    --     {key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit")}, {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
    --     {key = "<C-v>", cb = tree_cb("vsplit")}, {key = "<C-x>", cb = tree_cb("split")}, {key = "<C-t>", cb = tree_cb("tabnew")},
    --     {key = "<", cb = tree_cb("prev_sibling")}, {key = ">", cb = tree_cb("next_sibling")}, {key = "P", cb = tree_cb("parent_node")},
    --     {key = "<BS>", cb = tree_cb("close_node")}, {key = "<S-CR>", cb = tree_cb("close_node")}, {key = "K", cb = tree_cb("first_sibling")},
    --     {key = "J", cb = tree_cb("last_sibling")}, {key = "I", cb = tree_cb("toggle_ignored")}, {key = "H", cb = tree_cb("toggle_dotfiles")},
    --     {key = "R", cb = tree_cb("refresh")}, {key = "a", cb = tree_cb("create")}, {key = "d", cb = tree_cb("remove")},
    --     {key = "r", cb = tree_cb("rename")}, {key = "<C-r>", cb = tree_cb("full_rename")}, {key = "x", cb = tree_cb("cut")},
    --     {key = "c", cb = tree_cb("copy")}, {key = "p", cb = tree_cb("paste")}, {key = "y", cb = tree_cb("copy_name")},
    --     {key = "Y", cb = tree_cb("copy_path")}, {key = "gy", cb = tree_cb("copy_absolute_path")}, {key = "[c", cb = tree_cb("prev_git_item")},
    --     {key = "]c", cb = tree_cb("next_git_item")}, {key = "-", cb = tree_cb("dir_up")}, {key = "s", cb = tree_cb("system_open")},
    --     {key = "q", cb = tree_cb("close")}, {key = "g?", cb = tree_cb("toggle_help")}
    -- }
})
