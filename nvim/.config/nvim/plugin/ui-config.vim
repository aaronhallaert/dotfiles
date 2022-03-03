"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface Configuration 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""" defaults """""""""""""""""""""""""""""""""""
" set termguicolors
"
" if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

""""""""""""""""""""""""""""" Color Scheme Picker """""""""""""""""""""""""""""
"colorscheme sonokai
"colorscheme gruvbox
"colorscheme onedark
colorscheme vscode


"""""""""""""""""""""""""""""""" Lightline """"""""""""""""""""""""""""""""""""
let g:lightline = {
        \ 'colorscheme' :'onedark',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
        \ }
        \ }

""""""""""""""""""""""""""""""""" Settings """"""""""""""""""""""""""""""""""""

let g:vscode_style = "dark"

lua vim.cmd([[ autocmd ColorScheme gruvbox :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
set background=dark

lua vim.cmd([[ autocmd ColorScheme sonokai :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 


""""""""""""""""""""""""""" TELEKASTEN """""""""""""""""""""""""""
" for gruvbox
highlight! tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
highlight! tkBrackets ctermfg=gray guifg=gray

" real yellow
highlight! tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
" gruvbox
"highlight! tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold

highlight! link CalNavi CalRuler
highlight! tkTagSep ctermfg=gray guifg=gray
highlight! tkTag ctermfg=175 guifg=#d3869B

""""""""""""""""""""""""""""""""" Completion """""""""""""""""""""""""""""""""
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4



