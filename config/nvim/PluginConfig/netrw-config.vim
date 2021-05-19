let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_altv = 1

let g:NetrwIsOpen=0

function! ToggleNetrw(path)
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        if isdirectory(a:path)
            execute 'Vexplore ' . a:path
        else
            execute 'Vexplore'
        endif
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <C-E> :call ToggleNetrw()<CR>

" Find root of 
let &path = system("git rev-parse --show-toplevel | tr -d '\\n'")
nnoremap <leader>pv :call ToggleNetrw(&path)<CR>
