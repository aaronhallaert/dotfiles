"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniSharp: https://github.com/OmniSharp/omnisharp-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" OmniSharp (for C# development)
let g:OmniSharp_server_stdio = 1

" Shortcuts
nnoremap <leader>ofu :OmniSharpFindUsages<CR>
nnoremap <leader>ogd :OmniSharpGotoDefinition<CR>
nnoremap <leader>opd :OmniSharpPreviewDefinition<CR>
nnoremap <leader>odr :!dotnet run<CR>
