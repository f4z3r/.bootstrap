
" Custom highlight for todos
syntax match MyTodo display
      \ /.\<\(FIXME\|TODO\|OPTIMIZE\|NOTE\|XXX\)\((@\?\w\+)\)\?:\?/hs=s+1
      \ containedin=.*Comment,.*CommentTitle
hi link MyTodo Todo
hi Todo ctermfg=green guifg=green

" Custom highlight for targeted person
syntax match TargetPerson display
      \ /@\w\+/
      \ containedin=MyTodo
hi TargetPerson ctermfg=red guifg=red
