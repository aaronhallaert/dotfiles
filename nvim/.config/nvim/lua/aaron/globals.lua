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
vim.o.signcolumn = 'yes'
vim.o.backup = false
vim.o.undodir = '~/.vim/undodir'
vim.o.undofile = true
vim.o.colorcolumn = 80
vim.o.ignorecase = true
vim.api.nvim_command('highlight ColorColumn ctermbg=grey guibg=black')
-- see Treesitter config for folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.clipboard = "unnamedplus"

vim.api.nvim_command('filetype plugin indent on')

-- TABS
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
--- Tab exceptions
vim.api.nvim_command('autocmd FileType typescript setlocal softtabstop=2 shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType typescriptreact setlocal softtabstop=2 shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType javascriptreact setlocal softtabstop=2 shiftwidth=2 tabstop=2')

-- MAPPINGS
-- Going to normal mode
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})

-- Navigating lists
vim.api.nvim_set_keymap('n', '<localleader>j', ':cnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>k', ':cprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<localleader>q', ':copen<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':lnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':lprev<CR>', {noremap = true})

-- WINDOWS
--- Movement
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', {noremap = true})
--- Resize
vim.api.nvim_set_keymap('n', '<A-j>', ':resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-h>', ':vertical resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', ':vertical resize +2<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '(', '()', {noremap = true})
vim.api.nvim_set_keymap('i', '{', '{}', {noremap = true})
vim.api.nvim_set_keymap('i', '\"', '""', {noremap = true})
vim.api.nvim_set_keymap('i', '\'', '\'\'', {noremap = true})

-- Search shortcuts
vim.api.nvim_set_keymap('n', 'fdp', ':Rg binding.break<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'fiw', ':Rg <C-R><C-W><CR>', {noremap = true, silent = true})

-- yank to clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {noremap = true})

-- Better visual tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})

-- Vim enhancement
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})
vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true})
