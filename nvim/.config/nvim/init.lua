local nvimrc = "$HOME/dotfiles/nvim/.config/nvim"
vim.cmd("source" .. nvimrc .. "/basic.vim")
require("aaron.ui")
require("aaron.globals")

require("aaron.plugins")
-- require("aaron.config.integrated_tests")

-- Extra file functionality
vim.cmd("source" .. nvimrc .. "/plugin/suda-config.vim") -- edit in sudo mode
vim.cmd("source" .. nvimrc .. "/plugin/undotree-config.vim") -- keep track of file history
vim.cmd("source" .. nvimrc .. "/plugin/netrw-config.vim") -- project view

-- General Nvim Tools
vim.cmd("source" .. nvimrc .. "/plugin/markdownprev-config.vim")
vim.cmd("source" .. nvimrc .. "/plugin/floaterm-config.vim")
vim.cmd("source" .. nvimrc .. "/plugin/vimwiki-config.vim")

-- Code Tools
vim.cmd("source" .. nvimrc .. "/plugin/vimspector-config.vim")

-- Text writing
vim.cmd("source" .. nvimrc .. "/plugin/spell/spell-config.vim")
vim.cmd("source" .. nvimrc .. "/plugin/vimtex-config.vim")
vim.cmd("source" .. nvimrc .. "/plugin/translator-config.vim")
vim.cmd("source" .. nvimrc .. "/plugin/thesaurus-config.vim")
vim.cmd("source" .. nvimrc .. "/plugin/grammarous-config.vim")

-- GIT/GITHUB
-- require('aaron.config.litee')
vim.cmd("source" .. nvimrc .. "/plugin/gitblame-config.vim")
vim.cmd("source" .. nvimrc .. "/plugin/gitfugitive-config.vim")

-- EXTRA FUNCTIONALITY
vim.cmd("source" .. nvimrc .. "/plugin/telekasten-config.vim")
