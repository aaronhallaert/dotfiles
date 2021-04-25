let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_altv = 1


function! OpenExplorer(path)
    if isdirectory(a:path)
        execute 'Vexplore ' . a:path
    else
        execute 'Vexplore'
    endif
endfunction

" Find root of 
let &path = system("git rev-parse --show-toplevel | tr -d '\\n'")
nnoremap <leader>pv :call OpenExplorer(&path)<CR>
