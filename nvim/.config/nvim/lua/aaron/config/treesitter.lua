require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"phpdoc", "php"},
    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = {'org'}
    }
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
