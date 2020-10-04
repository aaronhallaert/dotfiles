"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc: https://github.com/neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General keybinds
nmap <silent> <leader>cgd <Plug>(coc-definition)
nmap <silent> <leader>cfr <Plug>(coc-references)
nmap <silent> <leader>cff <Plug>(coc-format)

" Coc-Explorer
nmap <leader>pv :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


" TextEdit fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
    else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
let g:coc_snippet_next = '<tab>'

autocmd BufNewFile,BufRead *.ipynb let b:coc_suggest_disable = 1
nmap <leader>cda :call coc#config('suggest.autoTrigger', v:false)<CR>
nmap <leader>cea :call coc#config('suggest.autoTrigger', v:true)<CR>

