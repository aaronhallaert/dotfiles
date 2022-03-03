"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Fugitive: https://github.com/tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :Git blame<CR>

function! ShowCommit()
    let baseCommit = system('git describe --all --contains ' . expand('<cword>'))
    execute "normal! :GBrowse ".baseCommit
endfunction
nnoremap <leader>gsc :call ShowCommit()<CR>

function! DiffPR()
    let baseCommit = system('git merge-base $(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//") $(git branch --show-current)')
    execute "normal! :Git difftool -y ".baseCommit
endfunction
nnoremap <leader>dpr :call DiffPR()<CR>

function! DiffFileBase()
    let baseCommit = system('git merge-base --fork-point master $(git rev-parse HEAD)')
    execute "normal! :Gvdiffsplit ".baseCommit
endfunction
nnoremap <leader>df :call DiffFileBase()<CR>

nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tc :tabclose<CR>
