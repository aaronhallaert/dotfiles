----------------------------------
-- User Interface Configuration --
----------------------------------
-- DEFAULT
vim.api.nvim_command("set termguicolors")
vim.api.nvim_command("set t_8f=^[[38;2;%lu;%lu;%lum")
vim.api.nvim_command("set t_8b=^[[48;2;%lu;%lu;%lum")

-- """""""""""""""""""""""""""" Color Scheme Picker """""""""""""""""""""""""""""

local theme = os.getenv("THEME")

if theme == 'gruvbox' then
    vim.api.nvim_command('colorscheme gruvbox-material')
    vim.g.gruvbox_material_background = 'soft'
    vim.g.gruvbox_material_better_performance = 1
elseif theme == 'sonokai' then
    vim.api.nvim_command('colorscheme sonokai')
elseif theme == 'onedark' then
    vim.api.nvim_command("colorscheme onedark")
elseif theme == 'vscode' then
    vim.api.nvim_command("colorscheme vscode")
    vim.g.vscode_style = "dark"
elseif theme == 'nord' then
    vim.api.nvim_command("colorscheme nordfox")
elseif theme == 'material' then
    vim.api.nvim_command("colorscheme material")
elseif theme == 'catppuccin' then
    vim.api.nvim_command("colorscheme catppuccin")
end

-- vim.cmd.colorscheme 'oxocarbon-lua'

-- vim.o.background = 'dark'

---------------------------- TELEKASTEN ---------------------------
-- gruvbox
vim.api.nvim_command(
    "highlight! tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline")
vim.api.nvim_command("highlight! tkBrackets ctermfg=gray guifg=gray")
vim.api.nvim_command(
    "highlight! tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold")
vim.api.nvim_command("highlight! link CalNavi CalRuler")
vim.api.nvim_command("highlight! tkTagSep ctermfg=gray guifg=gray")
vim.api.nvim_command("highlight! tkTag ctermfg=175 guifg=#d3869B")
