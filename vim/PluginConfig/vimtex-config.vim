"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimtex: https://github.com/lervag/vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" latex
if executable('SumatraPDF')
    let g:vimtex_view_general_viewer='SumatraPDF'
    let g:vimtex_view_general_options='-reuse-instance @pdf'
    let g:vimtex_view_general_options_latexmk='-reuse-instance'
endif
let g:tex_flavor= 'latex'
 let g:vimtex_compiler_latexmk = {'continuous' : 0}
