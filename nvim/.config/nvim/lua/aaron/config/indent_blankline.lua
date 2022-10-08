local indent_blankline = require("indent_blankline")

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
    use_treesitter = true,
    char_list = { "|", "¦", "┆", "┊" },
    show_current_context = false,
    show_current_context_start = false,
})
