" ===========================================================================
" =============================== Hooks =====================================
" ===========================================================================

" Run fixer on writing and loading of all files
augroup all_fixer_group
  autocmd BufWritePre,BufRead * :ALEFix
augroup END
