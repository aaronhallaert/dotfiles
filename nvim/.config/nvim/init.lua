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
    spec = {
        { import = "plugins" },
    },
    performance = {
        cache = {
            enabled = true,
            -- disable_events = {},
        },
        defaults = { lazy = true },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    dev = {
        -- directory where you store your local plugin projects
        path = "~/Developer/personal/",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
    },
    debug = false,
}

require("lazy").setup(options)

---------------------

-- Extra file functionality
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/netrw-config.vim") -- project view

-- General Nvim Tools
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/markdownprev-config.vim")

-- Text writing
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/spell/spell-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/vimtex-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/translator-config.vim")
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/grammarous-config.vim")

-- EXTRA FUNCTIONALITY
vim.cmd("source" .. nvimrc .. "/lua/legacy-plugins/telekasten-config.vim")
