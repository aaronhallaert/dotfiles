vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = "⦿", spacing = 4, border = 'single'},
        signs = true,
        update_in_insert = false
    })
