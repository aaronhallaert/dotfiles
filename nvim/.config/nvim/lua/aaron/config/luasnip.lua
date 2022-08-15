require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
        "/Users/aaronhallaert/.vim/my-vim-snippets/LuaSnip/vscode-style-snippets/"
    }
})

vim.api.nvim_set_keymap('i', '<C-n>',
                        '<Esc>:lua require("luasnip").jump(1)<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('i', '<C-p>',
                        '<Esc>:lua require("luasnip").jump(-1)<CR>',
                        {noremap = true})
