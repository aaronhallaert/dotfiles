require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "rust",
        "lua",
        "ruby",
        "tsx",
        "bash",
        "typescript",
        "javascript",
        "org",
        "vim",
        "help",
    },
    ignore_install = { "phpdoc", "php" },
    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = { "org" },
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
})

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd("syntax off")

vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*" }, command = "normal zxzR" }
)

vim.api.nvim_create_autocmd(
    { "BufReadPost,FileReadPost" },
    { pattern = { "*" }, command = "normal zR" }
)
