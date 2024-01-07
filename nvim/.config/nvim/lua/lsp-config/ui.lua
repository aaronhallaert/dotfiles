vim.fn.sign_define("DiagnosticSignError", { text = "󰅚", texthl = "Red" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "Yellow" })
vim.fn.sign_define(
    "DiagnosticSignInformation",
    { text = "", texthl = "White" }
)
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "Aqua" })

vim.cmd("hi! link NormalFloat Normal")
vim.cmd("hi! link FloatBorder DapUIFLoatBorder")

vim.cmd("hi! link VirtualTextError Red")
vim.cmd("hi! link VirtualTextWarning Yellow")
vim.cmd("hi! link VirtualTextInfo White")
vim.cmd("hi! link VirtualTextHint Aqua")

vim.cmd("hi! link ErrorFloat Red")
vim.cmd("hi! link WarnFloat Yellow")
vim.cmd("hi! link InfoFloat White")
vim.cmd("hi! link HintFloat Aqua")

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

