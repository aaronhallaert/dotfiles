"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic custom vim quick edits 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocomplete parenthesis
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" quick end of line semicolon when in normal mode
nnoremap <leader>; A;<Esc><CR>

" yank to clipboard
nnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>y "*y
vnoremap <leader>p "*p

" update with leader key
nnoremap <leader>w :update<cr>
