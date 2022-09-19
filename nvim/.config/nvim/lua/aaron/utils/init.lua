local M = {}

M.lsp_format_async = function()
    if type(vim.lsp.buf.format) == "function" then
        vim.lsp.buf.format({async = true})
    elseif type(vim.lsp.buf.formatting) == "function" then
        vim.lsp.buf.formatting()
    end
end

M.lsp_format = function()
    if type(vim.lsp.buf.format) == "function" then
        vim.lsp.buf.format()
    elseif type(vim.lsp.buf.formatting_sync) == "function" then
        vim.lsp.buf.formatting_sync()
    end
end

return M
