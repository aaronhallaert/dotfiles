local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        -- prompt_prefix = "> ",
        vimgrep_arguments = {
            "rg",
            "--hidden",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                results_width = 0.6,
            },
            vertical = { mirror = false },
            width = 0.8,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        file_ignore_patterns = { "node_modules", "packer_compiled", "%.git" },
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- squared borders
        borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        mappings = {
            i = {
                ["<c-e>"] = function(prompt_bufnr)
                    require("telescope.actions").select_default(prompt_bufnr)
                    require("telescope.builtin").resume()
                end,
                ["<c-s>"] = actions.send_selected_to_qflist
                    + actions.open_qflist,
                ["<c-a>"] = actions.add_selected_to_qflist
                    + actions.open_qflist,
            },
            n = {
                ["<c-e>"] = function(prompt_bufnr)
                    require("telescope.actions").select_default(prompt_bufnr)
                    require("telescope.builtin").resume()
                end,
                ["<c-s>"] = actions.send_selected_to_qflist
                    + actions.open_qflist,
                ["<c-a>"] = actions.add_selected_to_qflist
                    + actions.open_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
        advanced_git_search = {
            git_flags = { "-c", "delta.side-by-side=false" },
            git_diff_flags = {},
            diff_plugin = "diffview",
        },
    },
    pickers = {
        buffers = {
            sort_lastused = true,
            mappings = {
                i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
                n = { ["<c-d>"] = require("telescope.actions").delete_buffer },
            },
        },
    },
})

-- telescope.load_extension("fzy_native")
telescope.load_extension("ui-select")
telescope.load_extension("git_worktree")
