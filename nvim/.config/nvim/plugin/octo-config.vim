nnoremap <leader>rt :Octo thread resolve<CR>
nnoremap <leader>spr :Octo search assignee:aaronhallaert is:pr is:open<CR>

function! ShowCurrentPR()
    let baseCommit = system('git rev-parse --abbrev-ref HEAD')
    execute "normal! :Octo search is:pr is:open head:".baseCommit
endfunction
nnoremap <leader>pr :call ShowCurrentPR()<CR>
