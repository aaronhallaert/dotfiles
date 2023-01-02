vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.grepformat = "%f:%l:%c:%m"
vim.api.nvim_command("set undodir=~/.vim/undodir")
vim.o.undofile = true

vim.g.material_style = "darker"

vim.o.syntax = true
vim.o.eol = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.relativenumber = true
vim.o.hlsearch = false
vim.o.errorbells = false
vim.o.incsearch = true
vim.o.hidden = true
vim.o.nu = true
vim.o.wrap = false
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.backup = false

vim.api.nvim_command("set colorcolumn=80")
vim.api.nvim_command("highlight ColorColumn ctermbg=grey guibg=black")
vim.o.ignorecase = true
-- see Treesitter config for folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
-- vim.o.clipboard = "unnamedplus"

vim.api.nvim_command("filetype plugin indent on")

-- TABS
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

--- Tab exception
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = vim.api.nvim_create_augroup("indentation", { clear = true }),
    callback = function()
        -- Override ftplugin indentation settings
        vim.opt_local.expandtab = vim.opt_global.expandtab:get()
        vim.opt_local.listchars = vim.opt_global.listchars:get()
        vim.opt_local.shiftwidth = vim.opt_global.shiftwidth:get()
        vim.opt_local.softtabstop = vim.opt_global.softtabstop:get()
        vim.opt_local.tabstop = vim.opt_global.tabstop:get()
        -- Run guess-indent
        if vim.fn.exists(":GuessIndent") == 2 then
            vim.api.nvim_command("silent GuessIndent auto_cmd")
        end
        -- Set whitespace characters for indentation with spaces
        if vim.opt_local.expandtab:get() then
            -- Switch to leadmultispace in Neovim 0.8
            local ms = ":" .. string.rep(" ", vim.opt_local.tabstop:get() - 1)
            vim.opt_local.listchars:remove("lead")
            vim.opt_local.listchars:append({ multispace = ms })
        end
    end,
})

-- MAPPINGS
-- Going to normal mode
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Navigating lists
vim.api.nvim_set_keymap("n", "<localleader>j", ":cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<localleader>k", ":cprev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<localleader>q", ":copen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":lnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":lprev<CR>", { noremap = true })

-- WINDOWS
--- Movement
vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
--- Resize
vim.api.nvim_set_keymap(
    "n",
    "<A-j>",
    ":resize -2<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<A-k>",
    ":resize +2<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<A-h>",
    ":vertical resize -2<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<A-l>",
    ":vertical resize +2<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "+", ":bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "_", ":bp<CR>", { noremap = true })

-- Search shortcuts
vim.api.nvim_set_keymap(
    "n",
    "fdp",
    ":Rg binding.break<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "fiw",
    ":Rg <C-R><C-W><CR>",
    { noremap = true, silent = true }
)

-- yank to clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', { noremap = true })
-- paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true })

-- Better visual tabbing
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- Vim enhancement
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true })

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- autocomplete parenthesis Latex
vim.api.nvim_create_augroup("LatexParenthesis", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex" },
    group = "LatexParenthesis",
    callback = function()
        vim.api.nvim_set_keymap("i", '"', "``''<Esc>", { noremap = true })
        vim.api.nvim_set_keymap(
            "i",
            "<C-b>",
            "\textbf{}<Esc>i",
            { noremap = true }
        )
        vim.api.nvim_set_keymap(
            "i",
            "<C-a>",
            "\textit{}<Esc>i",
            { noremap = true }
        )
    end,
})

vim.api.nvim_set_keymap(
    "n",
    "<leader>f",
    ":e <cfile><CR>",
    { noremap = true, silent = true }
)

-- jumplist mutations
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

vim.api.nvim_create_augroup("UpdateWinSize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.api.nvim_command(":wincmd =")
        vim.api.nvim_command("FloatermUpdate")
    end,
})

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
