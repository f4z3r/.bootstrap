" ===========================================================================
" =============================== Deoplete ==================================
" ===========================================================================

" use ale as completion backend for deoplete
call deoplete#custom#option('sources', {
  \ 'python': ['jedi'],
  \ '_': ['ale'],
  \})
call deoplete#custom#option({
  \ 'auto_complete_delay': 200,
  \ 'smart_case': v:true,
  \})
