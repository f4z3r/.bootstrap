" ===========================================================================
" =============================== Rainbow ===================================
" ===========================================================================

let g:rainbow_conf = {
\    'guifgs': ['darkorange3', 'seagreen3', 'firebrick', 'royalblue3'],
\    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\    'guis': [''],
\    'cterms': [''],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\    'separately': {
\        '*': {},
\        'markdown': {
\            'parentheses_options': 'containedin=markdownCode contained',
\        },
\        'lisp': {
\            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\        },
\        'haskell': {
\            'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\        },
\        'vim': {
\            'parentheses_options': 'containedin=vimFuncBody',
\        },
\        'perl': {
\            'syn_name_prefix': 'perlBlockFoldRainbow',
\        },
\        'stylus': {
\            'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\        },
\        'css': 0,
\    }
\}
" enable by default
augroup RainbowGroup
  autocmd BufRead * RainbowToggleOn
augroup END
