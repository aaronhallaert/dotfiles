nnoremap <leader>rt :Octo thread resolve<CR>
nnoremap <leader>spr :Octo search author:aaronhallaert is:pr is:open<CR>

function! ShowCurrentPR()
    let baseCommit = system('git rev-parse --abbrev-ref HEAD')
    execute "normal! :Octo search is:pr head:".baseCommit
endfunction
nnoremap <leader>pr :call ShowCurrentPR()<CR>
