" ===========================================================================
" ============================= Grep Operator ===============================
" ===========================================================================

if exists('g:custom_grep_operator_loaded')
  finish
endif

nnoremap ss :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap ss :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  silent execute 'vimgrep! |\<' . @@ . '\>| %'
  copen

  let @@ = saved_unnamed_register
endfunction


let g:custom_grep_operator_loaded = 1
