"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ripgrep: https://github.com/jremmen/vim-ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('rg')
    let g:rg_derive_root='true'
endif

" search for word in project
nnoremap <Leader>ps :Rg<SPACE>
" Search for word under cursor
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
