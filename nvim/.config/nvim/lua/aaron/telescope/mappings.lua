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

map_tele("<leader>ff", "search_git_files")
map_tele("<leader>fg", "search_gitwords")
map_tele("<leader>vrc", "search_dotfiles_words")
map_tele("<leader>frc", "search_dotfiles")

map_tele("<leader>gr", "lsp_references")
map_tele("<leader>ss", "lsp_document_symbols")
map_tele("<leader>sws", "lsp_workspace_symbols")

map_tele("<leader>fb", "buffers")
map_tele("<leader>fh", "help_tags")

