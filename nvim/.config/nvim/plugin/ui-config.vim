"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface Configuration 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color Scheme
set termguicolors
"colorscheme sonokai
"colorscheme gruvbox
colorscheme onedark
let g:lightline = {
        \ 'colorscheme' :'onedark',
        \ }

lua vim.cmd([[ autocmd ColorScheme gruvbox :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 
lua vim.cmd([[ autocmd ColorScheme sonokai :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 


let g:gruvbox_contrast_dark = 'hard'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'
set background=dark
