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
" (d)ebug toggle a (b)reakpoint
nnoremap <buffer> <localleader>db :DlvToggleBreakpoint<cr>
" (d)ebug toggle a (t)racepoint
nnoremap <buffer> <localleader>dt :DlvToggleTracepoint<cr>
" (d)ebug test (f)ocused
nnoremap <buffer> <localleader>df :DlvTestCurrent<cr>
" (d)ebug test (a)ll
nnoremap <buffer> <localleader>da :DlvTest<cr>
" (d)ebug (c)lear all points
nnoremap <buffer> <localleader>dc :DlvClearAll<cr>
" }}}
