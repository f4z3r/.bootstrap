" ===========================================================================
" ===================== Language Specific Settings ==========================
" ===========================================================================

" ==== Visualisation ====================================================={{{
setlocal textwidth=120

" Use tabs instead of spaces for go
setlocal autoindent
setlocal smartindent
setlocal shiftwidth=2
setlocal tabstop=2
setlocal smarttab
setlocal noexpandtab

" Show indent lines even though using tab
setlocal listchars=tab:\|\ 
setlocal list
" }}}



" ==== Bindings =========================================================={{{
" (t)est (a)ll (package level)
nnoremap <buffer> <localleader>ta :GolangTestCurrentPackage<cr>
" (t)est (f)ocused
nnoremap <buffer> <localleader>tf :GolangTestFocused<cr>
" }}}
