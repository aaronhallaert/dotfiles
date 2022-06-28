local nvimrc = '$HOME/dotfiles/nvim/.config/nvim'

-- " Use local quickfix list for LSP errors

vim.cmd('source' .. nvimrc .. '/basic.vim')
vim.cmd('source' .. nvimrc .. '/plugin/plug-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/ui-config.vim')

require('aaron.globals')

-- Extra file functionality
vim.cmd('source' .. nvimrc .. '/plugin/anyfold-config.vim') -- folding based on indentation
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
require("aaron.config.lsp") -- code understanding (diagnostic + navigation)
vim.cmd('source' .. nvimrc .. '/plugin/lsp-config.vim')

require("aaron.config.treesitter") -- code understanding (highlight...)
require('aaron.config.iswap') -- swapping arguments
require('aaron.config.comment') -- commenting code

require("aaron.config.cmp") -- completion
vim.cmd('source' .. nvimrc .. '/plugin/nvimcompe-config.vim')

-- CODE NAVIGATION
require("aaron.config.harpoon") -- mark files
vim.cmd('source' .. nvimrc .. '/plugin/harpoon-config.vim')

require("aaron.telescope.setup") -- search
require("aaron.telescope.mappings") -- search

-- UI
-- require("aaron.config.feline")
require('aaron.config.treesitter-context') -- fix context on first line
require("aaron.config.indent_blankline") -- indent characters
vim.cmd('source' .. nvimrc .. '/plugin/quickscope-config.vim') -- highlight on f/F
vim.cmd('source' .. nvimrc .. '/plugin/hop-config.vim')

-- BEHAVIOUR
require('aaron.config.cinnamon') -- smooth scrolling
require('aaron.config.pretty-fold') -- folding

require("aaron.config.nvim-tree") -- project view

-- GIT/GITHUB
-- require("octo").setup()
require('aaron.config.litee')
require("aaron.config.gitsigns")
vim.cmd('source' .. nvimrc .. '/plugin/gitfugitive-config.vim')
vim.cmd('source' .. nvimrc .. '/plugin/gitblame-config.vim')

-- EXTRA FUNCTIONALITY
require("aaron.config.telekasten") -- markdown notes
vim.cmd('source' .. nvimrc .. '/plugin/telekasten-config.vim')
