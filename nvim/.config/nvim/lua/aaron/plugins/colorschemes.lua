local M = {}
M.setup = function(config)
    local use = config.use

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

    use({
        "sainnhe/gruvbox-material",
        commit = "9e30f2095e8ab80c68901e7aaee186cd3aa97168",
        config = function()
            vim.api.nvim_command("colorscheme gruvbox-material")
            vim.opt.background = "dark"
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_better_performance = 0
        end,
    })
end
return M
