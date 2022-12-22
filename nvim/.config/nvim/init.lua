local nvimrc = "$HOME/dotfiles/nvim/.config/nvim"
vim.cmd("source" .. nvimrc .. "/basic.vim")
require("aaron.ui")
require("aaron.globals")

------- PLUGINS -------

-- Clone lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local options = {
    dev = {
        -- directory where you store your local plugin projects
        path = "~/Developer/personal/",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
    },
}

require("lazy").setup("plugins", options)

---------------------

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
