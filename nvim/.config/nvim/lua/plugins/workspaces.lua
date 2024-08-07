local header = {
    [[]],
    [[]],
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
}

return {
    -- "tpope/vim-obsession",

    -- "renerocksai/calendar-vim",

    -- {
    --     "renerocksai/telekasten.nvim",
    --     enabled = false,
    --     config = function()
    --         require("plugins.config.telekasten") -- markdown notes
    --     end,
    -- },

    {
        "jamestthompson3/nvim-remote-containers",
    },
    {
        "juansalvatore/git-dashboard-nvim",
        enabled = false,
        dev = false,
        opts = {
            use_git_username_as_author = true,
            basepoints = {},
        },
    },
    -- {
    --     "nvimdev/dashboard-nvim",
    --     event = "VimEnter",
    --     dependencies = {
    --         {
    --             "juansalvatore/git-dashboard-nvim",
    --             dependencies = { "nvim-lua/plenary.nvim" },
    --         },
    --     },
    --     opts = function()
    --         local git_dashboard = require("git-dashboard-nvim").heatmap()
    --
    --         local opts = {
    --             config = {
    --                 header = git_dashboard,
    --                 center = {
    --                     { action = "", desc = "", icon = "", key = "n" },
    --                 },
    --                 footer = function()
    --                     return {}
    --                 end,
    --             },
    --         }
    --
    --         -- extra dashboard nvim config ...
    --
    --         return opts
    --     end,
    -- },
    {
        "goolord/alpha-nvim",
        enabled = true,
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            -- local git_dashboard = require("git-dashboard-nvim").heatmap()

            dashboard.section.header.val = header
            dashboard.section.buttons.val = {
                dashboard.button(
                    "f",
                    " " .. " Find file",
                    ":FzfLua files<CR>"
                ),
                dashboard.button(
                    "n",
                    " " .. " New file",
                    ":ene <BAR> startinsert <CR>"
                ),
                dashboard.button(
                    "r",
                    "󰄉 " .. " Recent files",
                    ":lua require('telescope.builtin').oldfiles{only_cwd=true}<CR>"
                ),
                dashboard.button(
                    "g",
                    " " .. " Find text",
                    ":Telescope live_grep<CR>"
                ),
                dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
                dashboard.button(
                    "s",
                    "󰑓" .. " Restore Session",
                    [[:lua require("persistence").load() <cr>]]
                ),
                dashboard.button(
                    "t",
                    "♠" .. " Themes",
                    ":Telescope colorscheme<CR>"
                ),
                dashboard.button(
                    "p",
                    "Ꭾ" .. " Planets",
                    ":Telescope planets<CR>"
                ),
                dashboard.button("l", "󰒲" .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }

            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            vim.b.miniindentscope_disable = true

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded "
                        .. stats.count
                        .. " plugins in "
                        .. ms
                        .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
}
