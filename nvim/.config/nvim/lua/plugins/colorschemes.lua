return {
    {
        "catppuccin/nvim",
        enabled = true,
        name = "catppuccin",
        event = "VimEnter",
        priority = 1000,
        config = function()
            local flavour = "macchiato" -- mocha, macchiato, frappe, latte
            vim.api.nvim_command("colorscheme catppuccin-" .. flavour)

            require("catppuccin").setup({
                flavour = flavour,
                highlight_overrides = {
                    all = function()
                        return {
                            OctoEditable = { bg = "#303449" },
                            OctoGreenFloat = { fg = "#238636", bg = "#303446" },
                            OctoRedFloat = { fg = "#da3633", bg = "#303446" },
                            OctoPurpleFloat = { fg = "#6f42c1", bg = "#303446" },
                            OctoYellowFloat = { fg = "#d3c846", bg = "#303446" },
                            OctoBlueFloat = { fg = "#58a6ff", bg = "#303446" },
                            OctoGreyFloat = { fg = "#2a254c", bg = "#303446" },
                            TelescopePromptBorder = { fg = "#C4CBED" },
                            TelescopeResultsBorder = { fg = "#C4CBED" },
                            TelescopePreviewBorder = { fg = "#C4CBED" },
                        }
                    end,
                },
            })
        end,
    },
    {
        "sainnhe/gruvbox-material",
        enabled = false,
        -- commit = "9e30f2095e8ab80c68901e7aaee186cd3aa97168",
        config = function()
            vim.api.nvim_command("colorscheme gruvbox-material")
            vim.opt.background = "dark"
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_better_performance = 0
            vim.api.nvim_command("hi OctoEditable guibg=#3c3836 guifg=#fbf1c7")
            vim.api.nvim_command(
                "hi OctoGreenFloat guifg=#b8bb26 guibg=#3c3836"
            )
            vim.api.nvim_command("hi OctoRedFloat guifg=#fb4934 guibg=#3c3836")
            vim.api.nvim_command(
                "hi OctoPurpleFloat guifg=#d3869b guibg=#3c3836"
            )
            vim.api.nvim_command(
                "hi OctoYellowFloat guifg=#fabd2f guibg=#3c3836"
            )
            vim.api.nvim_command("hi OctoBlueFloat guifg=#83a598 guibg=#3c3836")
            vim.api.nvim_command("hi OctoGreyFloat guifg=#928374 guibg=#3c3836")
        end,
    },
    -- {
    --
    --     "AlexvZyl/nordic.nvim",
    --     config = function()
    --         require("nordic").load()
    --         require("nordic").setup({
    --             telescope = {
    --                 style = "flat",
    --             },
    --         })
    --     end,
    -- },
    -- use {
    --     'sam4llis/nvim-tundra',
    --     config = function()
    --         require('nvim-tundra').setup({
    --             transparent_background = false,
    --             editor = {search = {}, substitute = {}},
    --             syntax = {
    --                 booleans = {bold = true, italic = true},
    --                 comments = {bold = true, italic = true},
    --                 conditionals = {},
    --                 constants = {bold = true},
    --                 functions = {},
    --                 keywords = {},
    --                 loops = {},
    --                 numbers = {bold = true},
    --                 operators = {bold = true},
    --                 punctuation = {},
    --                 strings = {},
    --                 types = {italic = true}
    --             },
    --             diagnostics = {
    --                 errors = {},
    --                 warnings = {},
    --                 information = {},
    --                 hints = {}
    --             },
    --             plugins = {
    --                 lsp = true,
    --                 treesitter = true,
    --                 cmp = true,
    --                 context = true,
    --                 dbui = true,
    --                 gitsigns = true,
    --                 telescope = true
    --             },
    --             overwrite = {colors = {}, highlights = {}}
    --         })
    --         vim.opt.background = 'dark'
    --         vim.api.nvim_command('colorscheme tundra')
    --     end
    -- }

    -- use {
    --     'B4mbus/oxocarbon-lua.nvim',
    --     config = function() vim.cmd.colorscheme 'oxocarbon-lua' end
    -- }

    -- use 'shapeoflambda/dark-purple.vim'
    -- use 'EdenEast/nightfox.nvim'
    -- use {
    --     'marko-cerovac/material.nvim',
    --     config = function() require('material').setup() end
    -- }
    -- use {
    --     'joshdick/onedark.vim',
    --     config = function() vim.api.nvim_command("colorscheme onedark") end
    -- }
    -- use {
    --     'sainnhe/sonokai',
    --     config = function() vim.api.nvim_command('colorscheme sonokai') end
    -- }
    -- use {
    --     'Mofiqul/vscode.nvim',
    --     config = function()
    --         vim.api.nvim_command("colorscheme vscode")
    --         vim.g.vscode_style = "dark"
    --     end
    -- }
    -- use {
    --     'catppuccin/nvim',
    --     as = 'catppuccin',
    --     config = function()
    --         require('catppuccin').setup()
    --         vim.api.nvim_command("colorscheme catppuccin")
    --     end
    -- }
}
