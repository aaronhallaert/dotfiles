vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    require("aaron.plugins.vim-improvements").setup {use = use}
    require('aaron.plugins.colorschemes').setup {use = use}
    require('aaron.plugins.style').setup {use = use}
    require('aaron.plugins.icons').setup {use = use}
    require('aaron.plugins.git').setup {use = use}
    require('aaron.plugins.intellisense').setup {use = use}
    require('aaron.plugins.navigation').setup {use = use}
    require('aaron.plugins.completions').setup {use = use}
    require("aaron.plugins.workspaces").setup {use = use}
    require("aaron.plugins.search-info-helpers").setup {use = use}

    -- Code Extensions
    use 'voldikss/vim-floaterm'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
end)
