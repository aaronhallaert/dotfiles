local nvimrc = '$HOME/dotfiles/nvim/.config/nvim'
vim.cmd('source' .. nvimrc .. '/basic.vim')
require('aaron.globals')

require("aaron.plugins")
require("aaron.ui")

-- Extra file functionality
vim.cmd('source' .. nvimrc .. '/plugin/suda-config.vim') -- edit in sudo mode
vim.cmd('source' .. nvimrc .. '/plugin/undotree-config.vim') -- keep track of file history
vim.cmd('source' .. nvimrc .. '/plugin/netrw-config.vim') -- project view

-- General Nvim Tools
vim.cmd('source' .. nvimrc .. '/plugin/markdownprev-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/floaterm-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/vimwiki-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/octo-config.vim')

-- Code Tools
vim.cmd('source' .. nvimrc .. '/plugin/vimspector-config.vim')

-- Text writing
vim.cmd('source' .. nvimrc .. '/plugin/spell/spell-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/vimtex-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/translator-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/thesaurus-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/grammarous-config.vim')

-- CODE EDIT
require("aaron.lsp") -- code understanding (diagnostic + navigation)
require("aaron.config.mason") -- installing lsp servers, formatters, linters...
require("aaron.config.treesitter") -- code understanding (highlight...)
require('aaron.config.iswap') -- swapping arguments
require('aaron.config.comment') -- commenting code
require("aaron.config.cmp") -- completion
require("nvim-autopairs").setup()

-- CODE NAVIGATION
require("aaron.config.harpoon") -- mark files
vim.cmd('source' .. nvimrc .. '/plugin/harpoon-config.vim')

require("aaron.telescope.setup") -- search
require("aaron.telescope.mappings") -- search

-- UI
require("bufferline").setup {}
require('aaron.config.treesitter-context') -- fix context on first line
require('aaron.config.startify')
require('trouble')
require("aaron.config.indent_blankline") -- indent characters
require('true-zen').setup()
require("lualine").setup()
vim.cmd('source' .. nvimrc .. '/plugin/quickscope-config.vim') -- highlight on f/F
require("aaron.config.hop")
-- THEMES
require('material').setup()
require('catppuccin').setup()
require('aaron.config.luasnip')

-- BEHAVIOUR
require('aaron.config.cinnamon') -- smooth scrolling
require('aaron.config.pretty-fold') -- folding
require('aaron.config.surround') -- change encapsulating syntax

require("aaron.config.nvim-tree") -- project view

-- GIT/GITHUB
require("octo").setup()
-- require('aaron.config.litee')
-- require("aaron.config.gitsigns")
vim.cmd('source' .. nvimrc .. '/plugin/gitfugitive-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/gitblame-config.vim')
require("aaron.config.git-worktree")

-- EXTRA FUNCTIONALITY
require("aaron.config.telekasten") -- markdown notes
vim.cmd('source' .. nvimrc .. '/plugin/telekasten-config.vim')
require("guess-indent").setup()
