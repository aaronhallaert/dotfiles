vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        require("lsp-config.auto.keymaps").setup({
            bufnr = ev.buf,
            client = client,
        })
        require("lsp-config.auto.signature")
        -- require("lsp-config.auto.ui").lspHighlights({ client = client })
    end,
})

vim.api.nvim_create_user_command("FormatToggle", function()
    vim.g.disable_format = not vim.g.disable_format
    print("Format on save: " .. (vim.g.disable_format and "OFF" or "ON"))
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if not vim.g.disable_format then
            require("aaron.utils").lsp_format()
        end
    end,
    pattern = {
        -- "*.js",
        "*.jsx",
        "*.tsx",
        "*.ts",
        -- "*.py",
        "*.rb",
        "*.rs",
        "*.lua",
        "*.json",
        -- "*.md",
        "*.css",
        "*.cpp",
        "*.dart",
        "*.hpp",
        "*.svelte",
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    command = "silent! !eslint_d % --fix",
    pattern = { "*.js", "*.jsx", "*.tsx", "*.ts" },
})
