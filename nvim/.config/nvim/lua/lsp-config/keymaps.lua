local M = {}

M.setup = function(config)
    config = config or {}
    local bufnr = config.bufnr

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings/shortcuts.
    local opts = { noremap = true, silent = true }

    -- LuaFormatter off
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "H", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap(
        "n",
        "<C-s>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "<space>wa",
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "<space>wr",
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "<space>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "<space>D",
        "<cmd>lua vim.lsp.buf.type_definition()<CR>",
        opts
    )
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gtr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap(
        "n",
        "<space>e",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "[d",
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "]d",
        "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
        opts
    )
    -- buf_set_keymap(
    --     "n",
    --     "<space>q",
    --     "<cmd>lua vim.diagnostic.setloclist()<CR>",
    --     opts
    -- )
    buf_set_keymap(
        "n",
        "<localleader>ca",
        "<cmd>lua vim.lsp.buf.code_action({ diagnostics = vim.lsp.diagnostic.get_line_diagnostics()})<CR>",
        -- "<cmd>Lspsaga code_action<CR>",
        opts
    )
    buf_set_keymap("n", "<leader>is", "<Cmd>!eslint_d % --fix<CR>", opts)
    buf_set_keymap(
        "n",
        "<space>f",
        "<cmd>lua require('aaron.utils').lsp_format_async()<CR>",
        opts
    )
    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    -- LuaFormatter on
end

return M
