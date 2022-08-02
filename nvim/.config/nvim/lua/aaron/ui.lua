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
    vim.api.nvim_command('colorscheme gruvbox')
    vim.g.gruvbox_invert_selection = '0'
    -- vim.g.gruvbox_contrast_dark = 'hard'
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
end

vim.o.background = 'dark'

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

--------------------------- COMPLETION ---------------------------------
-- gray
vim.api.nvim_command(
    "highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
-- blue
vim.api.nvim_command("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vim.api
    .nvim_command("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")
-- light blue
vim.api.nvim_command("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
vim.api.nvim_command("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE")
vim.api.nvim_command("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE")
-- pink
vim.api.nvim_command("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
vim.api.nvim_command("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0")
-- front
vim.api.nvim_command("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
vim.api.nvim_command("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4")
vim.api.nvim_command("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4")
