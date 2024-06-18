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

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        require("aaron.utils").lsp_format()
    end,
    pattern = {
        "*.js",
        "*.jsx",
        "*.tsx",
        "*.ts",
        "*.py",
        "*.rb",
        "*.rs",
        "*.lua",
        "*.json",
        -- "*.md",
        "*.css",
        "*.cpp",
        "*.hpp",
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    command = "silent! !eslint_d % --fix",
    pattern = { "*.js", "*.jsx", "*.tsx", "*.ts" },
})
