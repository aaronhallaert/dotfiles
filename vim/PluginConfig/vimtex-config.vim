"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimtex: https://github.com/lervag/vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" latex
if executable('SumatraPDF.exe')
    let g:vimtex_view_general_viewer='SumatraPDF.exe'
    let g:latex_view_method='SumatraPDF.exe'
    let g:vimtex_view_general_options
                \ = '-reuse-instance @pdf  -forward-search @tex @line'
                \ . '-inverse-search' . exepath(v:progpath)
                \ . '--servername' . v:servername .'\"%%f" -c \"%%l"'

    let g:vimtex_view_general_options_latexmk='-reuse-instance'

endif
let g:tex_flavor= 'latex'
let g:vimtex_compiler_latexmk = {'continuous' : 1}
