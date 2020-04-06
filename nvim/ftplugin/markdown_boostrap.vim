" ===========================================================================
" ===================== Language Specific Settings ==========================
" ===========================================================================

" ==== Bindings =========================================================={{{
" (t)able of contents (g)enerate
nnoremap <buffer> <localleader>g :GenTocGFM<enter>
" (t)able of contents (s)how
nnoremap <buffer> <localleader>s :Toc<enter>
" (f)ormat table
nnoremap <buffer> <localleader>f :TableFormat<enter>
" conceal (e)nable
nnoremap <buffer> <localleader>e :set conceallevel=2<enter>
" conceal (d)isable
nnoremap <buffer> <localleader>d :set conceallevel=0<enter>
" }}}


" ==== Conceal ==========================================================={{{
setlocal conceallevel=2
setlocal concealcursor=n
" }}}


" ==== Wrapping =========================================================={{{
setlocal textwidth=100
setlocal formatoptions=nqjtc
setlocal nojoinspaces
" }}}


" ==== Spelling =========================================================={{{
setlocal spell
" }}}
