function! DiffPR()
    let baseCommit = system('git merge-base master $(git branch --show-current)')
    execute "normal! :DiffviewOpen ".baseCommit
endfunction
nnoremap <leader>dpr :call DiffPR()<CR>
