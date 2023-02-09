return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            local flavour = "macchiato" -- mocha, macchiato, frappe, latte
            require("catppuccin").setup({
                flavour = flavour,
            })
            vim.api.nvim_command("colorscheme catppuccin-" .. flavour)

            vim.api.nvim_command("hi OctoEditable guibg=#303446")
            vim.api.nvim_command(
                "hi OctoGreenFloat guifg=#238636 guibg=#303446"
            )
            vim.api.nvim_command("hi OctoRedFloat guifg=#da3633 guibg=#303446")
            vim.api.nvim_command(
                "hi OctoPurpleFloat guifg=#6f42c1 guibg=#303446"
            )
            vim.api.nvim_command(
                "hi OctoYellowFloat guifg=#d3c846 guibg=#303446"
            )
            vim.api.nvim_command("hi OctoBlueFloat guifg=#58a6ff guibg=#303446")
            vim.api.nvim_command("hi OctoGreyFloat guifg=#2a254c guibg=#303446")
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
