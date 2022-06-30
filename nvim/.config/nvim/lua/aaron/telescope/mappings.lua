TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
    local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

    TelescopeMapArgs[map_key] = options or {}

    local mode = "n"
    local rhs = string.format("<cmd>lua require('aaron.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

    local map_options = {noremap = true, silent = true}

    if not buffer then
        vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    else
        vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
    end
end

-- SEARCH
map_tele("<leader>ff", "search_git_files")
map_tele("<leader>fg", "search_gitwords")
map_tele("<leader>vrc", "search_dotfiles_words")
map_tele("<leader>frc", "search_dotfiles")

-- LSP
map_tele("<leader>gr", "lsp_references")
map_tele("<leader>ss", "lsp_document_symbols")
map_tele("<leader>sws", "lsp_workspace_symbols")

-- GIT
map_tele("<leader>gs", "git_status")
map_tele("<leader>gc", "changed_on_branch")
map_tele("<leader>dfc", "diff_file_commit")
map_tele("<leader>dfb", "diff_file_branch")

map_tele("<leader>fb", "buffers")
map_tele("<leader>fh", "help_tags")

