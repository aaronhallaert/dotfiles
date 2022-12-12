TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
    local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

    TelescopeMapArgs[map_key] = options or {}

    local mode = "n"
    local rhs = string.format(
        "<cmd>lua require('aaron.telescope')['%s'](TelescopeMapArgs['%s'])<CR>",
        f,
        map_key
    )

    local map_options = { noremap = true, silent = true }

    if not buffer then
        vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    else
        vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
    end
end

-- SEARCH
map_tele("<leader>fo", "search_recent_files")
map_tele("<leader>ff", "search_git_files")
map_tele("<leader>fg", "search_gitwords")
map_tele("<leader>fa", "find_all_patterns")
map_tele("<leader>fw", "search_gitwords_not_hidden")
map_tele("<leader>fr", "find_registers")
map_tele("<leader>vrc", "search_dotfiles_words")
map_tele("<leader>frc", "search_dotfiles")

-- LSP
map_tele("<leader>gr", "lsp_references")
map_tele("<leader>ss", "lsp_document_symbols")

-- GIT
map_tele("<leader>og", "show_custom_functions")
map_tele("<leader>on", "show_nipro_commands")

map_tele("<leader>fb", "buffers")
map_tele("<leader>fh", "help_tags")
map_tele("<leader>fws", "lsp_workspace_symbols")
