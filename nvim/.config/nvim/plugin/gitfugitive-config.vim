"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Fugitive: https://github.com/tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>dpr :call DiffPR()<CR>
nnoremap <leader>df :call DiffFileBase()<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tc :tabclose<CR>


function! DiffPR()
    let baseCommit = system('git merge-base master $(git branch --show-current)')
    execute "normal! :Git difftool -y ".baseCommit
endfunction

function! DiffFileBase()
    let baseCommit = system('git merge-base master $(git branch --show-current)')
    execute "normal! :Gvdiffsplit ".baseCommit
endfunction
