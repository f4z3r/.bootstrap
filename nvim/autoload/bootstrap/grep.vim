function! bootstrap#grep#operator(type)
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


