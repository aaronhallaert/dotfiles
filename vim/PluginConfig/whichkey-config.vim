"run Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" ~/dotfiles/vim/BasicConfig/default-config.vim
let g:which_key_map.h = 'which_key_ignore'
let g:which_key_map.j = 'which_key_ignore'
let g:which_key_map.k = 'which_key_ignore'
let g:which_key_map.l = 'which_key_ignore'

let g:which_key_map.y = 'which_key_ignore'
let g:which_key_map.p = 'which_key_ignore'
let g:which_key_map.w = 'which_key_ignore'

let g:which_key_map[';'] = 'Append semicolon'
let g:which_key_map['i'] = 'Next jupyter notebook block'
let g:which_key_map['b'] = 'Previous jupyter notebook block'
let g:which_key_map['u'] = 'Show undo tree'
let g:which_key_map['ps'] = 'Search word in project'
let g:which_key_map['pw'] = 'Search word under cursor'

" ~/dotfiles/vim/PluginConfig/omnisharp-config.vim
let g:which_key_map.o = {
      \ 'name' : '+Omnisharp' ,
      \ 'fu' : [':OmniSharpFindUsages'    , 'Find Usages'],
      \ 'gd' : [':OmniSharpGotoDefinition'    , 'Go To Definition'],
      \ 'pd' : [':OmniSharpPreviewDefinition'    , 'Preview Definition'],
      \ 'dr' : [':!dotnet run'          , 'dotnet run'],
      \ 'f' : ['name'          , 'which_key_ignore'],
      \ 'g' : ['name'          , 'which_key_ignore'],
      \ 'p' : ['name'          , 'which_key_ignore'],
      \ 'd' : ['name'          , 'which_key_ignore'],
      \ }

" ~/dotfiles/vim/PluginConfig/gitfugitive-config.vim
let g:which_key_map.g = {
      \ 'name' : '+GitFugitive' ,
      \ 'j' : ['name'          , 'which_key_ignore'],
      \ 'f' : ['name'          , 'which_key_ignore'],
      \ 's' : [':G'          , 'Git status'],
      \ }

" ~/dotfiles/vim/PluginConfig/vimmaximizer-config.vim
let g:which_key_map['f'] = 'Maximize window'


" ~/dotfiles/vim/PluginConfig/coc-config.vim
let g:which_key_map['x'] = 'Convert to snippet'
let g:which_key_map.c = {
      \ 'name' : '+COC' ,
      \ 'gd' : ['name'    , 'Go Definition'],
      \ 'fr' : ['name'    , 'Find References'],
      \ 'ff' : ['name'    , 'Format File'],
      \ 'rf' : ['name'    , 'Rename File'],
      \ 'SPC' : ['name'    , 'Comment selection'],
      \ '$' : ['name'    , 'Comment from current position'],
      \ 'si' : ['name'    , 'Show Method Information'],
      \ 'pv' : ['name'    , 'Open Explorer'],
      \ 'ea' : ['name'    , 'Enable autocomplete'],
      \ 'da' : ['name'    , 'Disable autocomplete'],
      \ 'A' : ['name'    , 'Append a comment'],
      \ }

" ~/dotfiles/vim/PluginConfig/floaterm-config.vim
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }

" ~/dotfiles/vim/PluginConfig/vimspector-config.vim
let g:which_key_map.d = {
      \ 'name' : '+debug' ,
      \ 'SPC' : ['name'        , 'Continue'],
      \ '_' : ['name'                           , 'Restart'],
      \ 'c' : ['name'                           , 'Focus on code window'],
      \ 'o' : ['name'                           , 'Focus on Output'],
      \ 's' : ['name'                           , 'Focus on Stacktrace'],
      \ 'v' : ['name'                           , 'Focus on Variables'],
      \ 'w' : ['name'                           , 'Focus on Watches'],
      \ 't' : ['name'                           , 'Focus on Tagpage'],
      \ 'd' : ['name'                           , 'Launch debugger'],
      \ 'e' : ['name'                           , 'Stop debugger'],
      \ 'j' : ['name'                           , 'Step Over'],
      \ 'k' : ['name'                           , 'Step Out'],
      \ 'l' : ['name'                           , 'Step Into'],
      \ 'cpb' : ['name'                           , 'Toggle Conditional Breakpoint'],
      \ 'tcb' : ['name'                           , 'Clean Line Breakpoint'],
      \ 'bp' : ['name'                           , 'Toggle Breakpoint'],
      \ 'rc' : ['name'                           , 'Run to cursor'],
      \ 'b' : ['name'                           , 'which_key_ignore'],
      \ 'r' : ['name'                           , 'which_key_ignore'],
      \ }

let g:which_key_map.r = {
      \ 'name' : '+rtags (cpp)' ,
      \}

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
