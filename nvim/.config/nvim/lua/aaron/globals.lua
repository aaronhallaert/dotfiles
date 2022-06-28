vim.api.nvim_command('set relativenumber')
vim.api.nvim_command('set nohlsearch')
vim.api.nvim_command('set noerrorbells')
vim.api.nvim_command('set incsearch')
vim.api.nvim_command('set hidden')
vim.api.nvim_command('set nu')
vim.api.nvim_command('set nowrap')
vim.api.nvim_command('set smartcase')
vim.api.nvim_command('set noswapfile')
vim.api.nvim_command('set scrolloff=8')
vim.api.nvim_command('set signcolumn=yes')
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('set nobackup')
vim.api.nvim_command('set undodir=~/.vim/undodir')
vim.api.nvim_command('set undofile')
vim.api.nvim_command('set colorcolumn=80')
vim.api.nvim_command('highlight ColorColumn ctermbg=grey guibg=black')
-- see Treesitter config for folding
vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

-- TABS
vim.api.nvim_command('set tabstop=4 softtabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set smartindent')
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
