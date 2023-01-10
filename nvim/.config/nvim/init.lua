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

-- Extra file functionality
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/suda-config.vim") -- edit in sudo mode
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/undotree-config.vim") -- keep track of file history
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/netrw-config.vim") -- project view

-- General Nvim Tools
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/markdownprev-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/floaterm-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/vimwiki-config.vim")

-- Code Tools
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/vimspector-config.vim")

-- Text writing
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/spell/spell-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/vimtex-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/translator-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/thesaurus-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/grammarous-config.vim")

-- GIT/GITHUB
-- require('aaron.config.litee')
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/gitblame-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/gitfugitive-config.vim")

-- EXTRA FUNCTIONALITY
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/telekasten-config.vim")
