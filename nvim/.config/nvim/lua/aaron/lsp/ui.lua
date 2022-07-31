local M = {}

M.init = function()

    vim.fn.sign_define("DiagnosticSignError",
                       {text = "", texthl = "GruvBoxRedSign"})
    vim.fn.sign_define("DiagnosticSignWarn",
                       {text = "", texthl = "GruvboxYellowSign"})
    vim.fn.sign_define("DiagnosticSignInformation",
                       {text = "", texthl = "GruvboxBlueSign"})
    vim.fn.sign_define("DiagnosticSignHint",
                       {text = "", texthl = "GruvboxAquaSign"})

    vim.cmd('hi! link NormalFloat Normal')

    local border = {
        {"🭽", "FloatBorder"}, {"▔", "FloatBorder"},
        {"🭾", "FloatBorder"}, {"▕", "FloatBorder"},
        {"🭿", "FloatBorder"}, {"▁", "FloatBorder"},
        {"🭼", "FloatBorder"}, {"▏", "FloatBorder"}
    }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
end

M.lspHighlights = function(config)
    config = config or {}
    local client = config.client

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)

    end
end

return M
