nmap <leader>cg :GrammarousCheck<CR>
nmap <leader>cr <Plug>(grammarous-reset)

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction

let g:grammarous#enabled_categories = {'*' : ['PUNCTUATION']}
let g:grammarous#disabled_rules = {
            \ '*' : ['WORD_CONTAINS_UNDERSCORE', 'PASSIVE_VOICE'],
            \ }

let g:grammarous#languagetool_cmd='java -jar $HOME/Downloads/LanguageTool-5.4-SNAPSHOT/languagetool-commandline.jar --level PICKY'
