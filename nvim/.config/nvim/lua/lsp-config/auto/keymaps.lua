local M = {}

M.setup = function(config)
    config = config or {}
    local bufnr = config.bufnr
    local client = config.client

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings/shortcuts.
    local opts = { noremap = true, silent = true }

    -- LuaFormatter off
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap(
        "n",
        "H",
        "<Cmd>lua vim.lsp.buf.hover({focusable = true})<CR>",
        opts
    )
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    buf_set_keymap(
        "n",
        "<leader>a",
        "<cmd>lua vim.lsp.buf.code_action({ diagnostics = vim.lsp.diagnostic.get_line_diagnostics()})<CR>",
        -- "<cmd>Lspsaga code_action<CR>",
        opts
    )

    buf_set_keymap(
        "n",
        "<C-s>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts
    )

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

    buf_set_keymap("n", "<leader>is", "<Cmd>!eslint_d % --fix<CR>", opts)
    buf_set_keymap(
        "n",
        "<space>f",
        "<cmd>lua require('aaron.utils').lsp_format_async()<CR>",
        opts
    )

    -- local function desc(description)
    --     return {
    --         noremap = true,
    --         silent = true,
    --         buffer = bufnr,
    --         desc = description,
    --     }
    -- end

    -- if client.server_capabilities.inlayHintProvider then
    --     vim.keymap.set("n", "<space>h", function()
    --         local current_setting = vim.lsp.inlay_hint.is_enabled(bufnr)
    --         vim.lsp.inlay_hint.enable(bufnr, not current_setting)
    --     end, desc("[lsp] toggle inlay hints"))
    -- end
end

return M
