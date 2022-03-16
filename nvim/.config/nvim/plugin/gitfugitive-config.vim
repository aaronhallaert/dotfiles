"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Fugitive: https://github.com/tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>gb :Git blame<CR>

function! ShowCommit()
    let baseCommit = system('git describe --all --contains ' . expand('<cword>'))
    execute "normal! :GBrowse ".baseCommit
endfunction

function! DiffPR()
    let baseCommit = system('git merge-base $(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//") $(git branch --show-current)')
    execute "normal! :Git difftool -y ".baseCommit
endfunction


" Open commit_hash under cursor in browser
nnoremap <leader>gsc :call ShowCommit()<CR>
" Open changed files diff of current branch in tabs
nnoremap <leader>dpr :call DiffPR()<CR>
" Compare current file with master branch
nnoremap <leader>df :Gvdiffsplit system("git branch -l master main \| sed 's/^* //'")<CR>
nnoremap <leader>gs <cmd>lua require("telescope.builtin").git_status()<cr>
nnoremap <leader>gc <cmd>lua require("aaron.telescope").changed_on_branch()<cr>
nnoremap <leader>dfc <cmd>lua require("aaron.telescope").diff_file_commit()<cr>
nnoremap <leader>dfb <cmd>lua require("aaron.telescope").diff_file_branch()<cr>


nnoremap K :tabnext<CR>
nnoremap J :tabprev<CR>
nnoremap <leader>tc :tabclose<CR>
