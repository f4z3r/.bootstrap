function! airline#extensions#wordcount#formatters#kilo#update_fmt(...)
  let s:fmt = get(g:, 'airline#extensions#wordcount#formatter#kilo#fmt', '%s words')
  let s:fmt_short = get(g:, 'airline#extensions#wordcount#formatter#kilo#fmt_short', s:fmt ==# '%s words' ? '%sW' : s:fmt)
endfunction

" Reload format when statusline is rebuilt
call airline#extensions#wordcount#formatters#kilo#update_fmt()
if index(g:airline_statusline_funcrefs, function('airline#extensions#wordcount#formatters#kilo#update_fmt')) == -1
  " only add it, if not already done
  call airline#add_statusline_funcref(function('airline#extensions#wordcount#formatters#kilo#update_fmt'))
endif

function! airline#extensions#wordcount#formatters#kilo#to_string(wordcount)
  let wordcount = a:wordcount < 1000 ? printf('%d', a:wordcount) :
        \ printf('%.1fk', a:wordcount / 1000.0)
  if airline#util#winwidth() > 85
    let str = printf(s:fmt, wordcount)
  else
    let str = printf(s:fmt_short, wordcount)
  endif
  return str . g:airline_symbols.space . g:airline_right_alt_sep . g:airline_symbols.space
endfunction

