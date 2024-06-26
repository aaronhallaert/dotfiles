local nvimrc = "$HOME/.config/nvim"
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
                -- "gzip",
                "matchit",
                "matchparen",
                -- "netrwPlugin",
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
-- Text writing
vim.cmd("source" .. nvimrc .. "/lua/spell/spell-config.vim")

vim.cmd([[
augroup jdtls_lsp
    au!
    au FileType java lua require('lsp-config.java.jdtls_setup').setup()
augroup END
]])
