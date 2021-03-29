"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector: https://github.com/puremourning/vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_code_minwidth = 90
let g:vimspector_terminal_maxwidth = 75
let g:vimspector_terminal_minwidth = 30

"function! s:CustomiseUI()
  "" Customise the basic UI...

  "" Close the output window
  "call win_gotoid( g:vimspector_session_windows.output )
  "q
"endfunction

"function s:SetUpTerminal()
  "" Customise the terminal window size/position
  "" For some reasons terminal buffers in Neovim have line numbers
  "call win_gotoid( g:vimspector_session_windows.term )
  "set norelativenumber nonumber
"endfunction

"augroup MyVimspectorUICustomistaion
  "autocmd!
  "autocmd User VimspectorUICreated call s:CustomiseUI()
  "autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
"augroup END

autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
