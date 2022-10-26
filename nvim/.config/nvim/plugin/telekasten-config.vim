nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zt :Telekasten goto_today<CR>
nnoremap <leader>md :MarkdownPreview<CR>
nnoremap <localleader>cal :lua require('telekasten').show_calendar()<CR>

" on hesitation, bring up the panel
nnoremap <leader>z :lua require('telekasten').panel()<CR>

"--------------------------- TELEKASTEN ---------------------------
"- gruvbox
highlight! tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
highlight! tkBrackets ctermfg=gray guifg=gray
highlight! tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold
highlight! link CalNavi CalRuler
highlight! tkTagSep ctermfg=gray guifg=gray
highlight! tkTag ctermfg=175 guifg=#d3869B
