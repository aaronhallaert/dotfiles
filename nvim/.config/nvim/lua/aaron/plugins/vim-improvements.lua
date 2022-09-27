local M = {}
M.setup = function(config)
    local use = config.use
    -- replace capital with capital, normal with normal
    use 'tpope/vim-abolish'

    -- change surrounding
    use {
        'kylechui/nvim-surround',
        config = function()
            require('aaron.config.surround') -- change encapsulating syntax
        end
    }
    -- expand surround e.g. cin) = clear inside next parenthesis
    use 'wellle/targets.vim'

    use 'takac/vim-hardtime'

    use 'mbbill/undotree'
    use 'godlygeek/tabular'
    use {
        'mizlan/iswap.nvim',
        config = function()
            require('aaron.config.iswap') -- swapping arguments
        end
    }
    use 'anuvyklack/nvim-keymap-amend'
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup() end
    }
    use 'vim-utils/vim-man'
    use 'lambdalisue/suda.vim'
    use 'svermeulen/vimpeccable'
end
return M
