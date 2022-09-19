local M = {}
M.setup = function(config)
    local use = config.use
    -- This plugin adds indentation guides to all lines (including empty lines).
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("aaron.config.indent_blankline") -- indent characters
        end
    }

    -- smooth scrolling
    use {
        'declancm/cinnamon.nvim',
        config = function()
            require('aaron.config.cinnamon') -- smooth scrolling
        end
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require("lualine").setup() end
    }

    use 'kosayoda/nvim-lightbulb'

    use {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".setup() end
    }

    use {
        'NMAC427/guess-indent.nvim',
        config = function() require("guess-indent").setup() end
    }
    -- use 'pseewald/vim-anyfold'
    use {
        'anuvyklack/pretty-fold.nvim',
        config = function()
            require('aaron.config.pretty-fold') -- folding
        end
    }
    use 'anuvyklack/fold-preview.nvim'

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup {'*'} end
    }

    use {
        'anuvyklack/windows.nvim',
        config = function()
            require("windows").setup({
                animation = {
                    duration = 300 -- ms
                }
            })
        end
    }
end

return M
