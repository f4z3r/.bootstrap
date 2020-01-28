" ===========================================================================
" =============================== Hooks =====================================
" ===========================================================================

" Run fixer on loading of all files (writing it performed by ALE config)
augroup all_fixer_group
  autocmd BufRead * :ALEFix
augroup END
