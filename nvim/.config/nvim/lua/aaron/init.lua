require("aaron.telescope")
require("aaron.harpoon")
require("aaron.lsp")
require("aaron.cmp")
require("aaron.telekasten")
-- require("aaron.treesitter")
require("aaron.nvim-tree")
-- require("aaron.feline")
require("gitsigns").setup()
require("octo").setup()
require('Comment').setup()

require("indent_blankline").setup {
    use_treesitter = true,
    char_list = {'|', '¦', '┆', '┊'},
    show_current_context = true,
    show_current_context_start = true
}
