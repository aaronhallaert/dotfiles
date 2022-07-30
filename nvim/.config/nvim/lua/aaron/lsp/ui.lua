vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "GruvBoxRedSign"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "GruvboxYellowSign"})
vim.fn.sign_define("DiagnosticSignInformation", {text = "", texthl = "GruvboxBlueSign"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "GruvboxAquaSign"})


vim.cmd('hi! link NormalFloat Normal')


local border = {
    {"🭽", "FloatBorder"}, {"▔", "FloatBorder"}, {"🭾", "FloatBorder"}, {"▕", "FloatBorder"}, {"🭿", "FloatBorder"},
    {"▁", "FloatBorder"}, {"🭼", "FloatBorder"}, {"▏", "FloatBorder"}
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
