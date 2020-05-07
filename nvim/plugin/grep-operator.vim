" ===========================================================================
" ============================= Grep Operator ===============================
" ===========================================================================

if exists('g:custom_grep_operator_loaded')
  finish
endif

nnoremap ss :set operatorfunc=bootstrap#grep#operator<cr>g@
vnoremap ss :<c-u>call bootstrap#grep#operator(visualmode())<cr>

let g:custom_grep_operator_loaded = 1
