
syntax match MyTodo display
      \ /.\<\(FIXME\|TODO\|OPTIMIZE\|NOTE\|NOTE\)\((@\?\w\+)\)\?:\?/hs=s+1
      \ containedin=.*Comment
hi link MyTodo Todo
hi Todo ctermfg=green guifg=green
