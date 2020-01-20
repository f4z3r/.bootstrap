" ===========================================================================
" ===================== Language Specific Settings ==========================
" ===========================================================================

" Disable rainbow parentheses for todo files by default
augroup TodoFileRainbowUndoGroup
  autocmd BufRead,BufEnter todo.txt RainbowToggleOff
augroup END

