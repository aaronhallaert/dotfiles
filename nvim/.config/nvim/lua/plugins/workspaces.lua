return {
    "tpope/vim-obsession",

    "renerocksai/calendar-vim",

    {
        "renerocksai/telekasten.nvim",
        config = function()
            require("aaron.config.telekasten") -- markdown notes
        end,
    },

    -- {
    --     "mhinz/vim-startify",
    --     config = function()
    --         require("aaron.config.startify")
    --     end,
    -- },

    {
        "goolord/alpha-nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
            local status_ok, alpha = pcall(require, "alpha")
            if not status_ok then
                return
            end

            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                [[]],
                [[]],
                [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
                [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
                [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
                [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
                [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
                [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
            }

            dashboard.section.buttons.val = {
                dashboard.button(
                    "d",
                    "  Daily Note",
                    ":Telekasten goto_today<CR>"
                ),
                dashboard.button(
                    "f",
                    "  Find File",
                    ":Telescope find_files<CR>"
                ),
                dashboard.button(
                    "e",
                    "  New file",
                    ":ene <BAR> startinsert <CR>"
                ),
                dashboard.button(
                    "r",
                    "  Recent Files",
                    ":lua require('telescope.builtin').oldfiles{only_cwd=true}<CR>"
                ),
                dashboard.button(
                    "t",
                    "  Find Text",
                    ":Telescope live_grep<CR>"
                ),
                dashboard.button(
                    "c",
                    "  Configuration",
                    ":cd ~/dotfiles | e $MYVIMRC<CR>"
                ),
                dashboard.button("u", "  Update Plugins", ":PackerSync<CR>"),
                dashboard.button(
                    "p",
                    "🪐  Planets?",
                    ":Telescope planets<CR>"
                ),
                dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
            }

            local footer = function()
                local version = " "
                    .. vim.version().major
                    .. "."
                    .. vim.version().minor
                    .. "."
                    .. vim.version().patch
                if packer_plugins == nil then
                    return version
                else
                    local total_plugins = "   "
                        .. #vim.tbl_keys(packer_plugins)
                        .. " Plugins"
                    return version .. total_plugins
                end
            end

            dashboard.section.footer.val = footer()

            dashboard.section.footer.opts.hl = "AlphaFooter"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButton"

            dashboard.opts.opts.noautocmd = true
            alpha.setup(dashboard.opts)
        end,
    },
}
