require("nvim-treesitter").setup({
    -- Directory to install parsers and queries to
    install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Install parsers (no-op if already installed)
require("nvim-treesitter").install({
    "rust",
    "lua",
    "ruby",
    "tsx",
    "bash",
    "typescript",
    "javascript",
    "vim",
})

-- Enable treesitter highlighting and folds for all filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(ev)
        local ft = vim.bo[ev.buf].filetype
        -- Skip filetypes where treesitter highlighting should be disabled
        local disabled = { json = true }
        if ft ~= "" and not disabled[ft] then
            pcall(vim.treesitter.start)
        end

        -- Treesitter-based folding
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
    end,
})

vim.opt.foldenable = false
