" ===========================================================================
" ===================== Language Specific Settings ==========================
" ===========================================================================

" Disable rainbow parentheses for text files by default
augroup TextFileRainbowUndoGroup
  autocmd BufRead,BufEnter *.txt RainbowToggleOff
augroup END

