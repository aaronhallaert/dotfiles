" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect
"" Avoid showing message extra message when using completion
"set shortmess+=c

"let g:compe = {}
"let g:compe.enabled = v:true
"let g:compe.autocomplete = v:true
"let g:compe.debug = v:false
"let g:compe.min_length = 1
"let g:compe.preselect = 'enable'
"let g:compe.throttle_time = 80
"let g:compe.source_timeout = 200
"let g:compe.resolve_timeout = 800
"let g:compe.incomplete_delay = 400
"let g:compe.max_abbr_width = 100
"let g:compe.max_kind_width = 100
"let g:compe.max_menu_width = 100
"let g:compe.documentation = v:true

"let g:compe.source = {}
"let g:compe.source.path = v:true
"let g:compe.source.buffer = v:true
"let g:compe.source.calc = v:true
"let g:compe.source.nvim_lsp = v:true
"let g:compe.source.nvim_lua = v:true
"let g:compe.source.vsnip = v:true
"let g:compe.source.ultisnips = v:true
"let g:compe.source.neosnippet = v:true
"let g:compe.source.luasnip = v:true
"let g:compe.source.emoji = v:true
"let g:compe.source.tabnine = v:false


"inoremap <silent><expr> <C-l> cmp#confirm('<CR>')

"tabnine options
"let g:compe.source.tabnine = {}
"let g:compe.source.tabnine.max_line = 1000
"let g:compe.source.tabnine.max_num_results = 6
"let g:compe.source.tabnine.priority = 5000
"" setting sort to false means compe will leave tabnine to sort the completion items
"let g:compe.source.tabnine.sort = v:false
"let g:compe.source.tabnine.show_prediction_strength = v:true
"let g:compe.source.tabnine.ignore_pattern = ''


" Ultisnips settings
"let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
