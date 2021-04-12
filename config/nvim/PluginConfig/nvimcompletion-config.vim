lua << EOF
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)
