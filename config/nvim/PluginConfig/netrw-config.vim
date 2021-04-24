let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_altv = 1


function! OpenExplorer(path)
    execute 'Vexplore ' . a:path
endfunction

" Find root of 
let &path = system("git rev-parse --show-toplevel")
nnoremap <leader>pv :call OpenExplorer(&path)<CR>
