" ===========================================================================
" =========================== Visualisation =================================
" ===========================================================================


" ==== Theme ============================================================={{{
syntax on
set background=dark
colorscheme gruvbox
" }}}


" ==== Colors ============================================================{{{
if $STY ==# ''
  set termguicolors
endif
set t_Co=256
" }}}


" ==== Encodings ========================================================={{{
set encoding=UTF-8
" }}}


" ==== Column Indicators ================================================={{{
set colorcolumn=+1
highlight ColorColumn ctermbg=darkgrey
" }}}


" ==== Whitespace ========================================================{{{
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list
" }}}


" ==== Keyword Overrides ================================================={{{
syn match   myTodo   contained   "\<\(TODO\|FIXME\):"
hi def link myTodo Todo
" }}}


" ==== Indentation ======================================================={{{
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
" }}}


" ==== Liner Ruler ======================================================={{{
set number
set relativenumber
" toggle relative and absolute numbering based on mode
augroup LineNumberGroup
  autocmd InsertEnter * :set nornu
  autocmd InsertLeave * :set rnu
augroup END
" }}}
