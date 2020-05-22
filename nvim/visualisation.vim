" ===========================================================================
" =========================== Visualisation =================================
" ===========================================================================


" ==== Colors ============================================================{{{
if $STY ==# ''
  set termguicolors
endif
set t_Co=256
" }}}


" ==== Theme ============================================================={{{
syntax on
if $KITTY_THEME ==# 'dark'
  set background=dark
else
  set background=light
endif
" set low contrast mode
let g:gruvbox_material_background = 'soft'
" set theme
colorscheme gruvbox-material
" source syntax override on buffer read or create (required due to lazy
" loading of polyglot)
augroup TODO_color_overrides
  autocmd BufRead,BufCreate * source <sfile>:h/after/colors/gruvbox.vim
augroup END
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
