scriptencoding utf-8
" ===========================================================================
" ================================== ALE ====================================
" ===========================================================================


" manual omnifunc for completion
set omnifunc=ale#completion#OmniFunc
" airline support
let g:airline#extensions#ale#enabled = 1
" automatic pipenv on python projects
let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_pyls_auto_pipenv = 1
let g:ale_python_bandit_auto_pipenv = 1
let g:ale_python_black_auto_pipenv = 1
" set error message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" lint only on insert leave
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
" fix on save
let g:ale_fix_on_save = 1
" disable some linters
let g:ale_linters = {
  \ 'python': ['pyls', 'bandit', 'mypy'],
  \}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'python': ['black', 'reorder-python-imports', 'yapf'],
  \ 'haskell': ['brittany', 'stylish-haskell'],
  \ 'java': ['uncrustify'],
  \ 'cpp': ['clang-format', 'uncrustify'],
  \ 'c': ['clang-format', 'uncrustify'],
  \}
if executable('pyls')
  augroup PythonLanguageServer
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
  augroup END
endif
let g:ale_java_javalsp_executable='/home/jakob/.config/nvim/lsps/java-language-server/dist/lang_server_linux.sh'
" symbol overrides
let g:ale_completion_symbols = {
  \ 'text': '',
  \ 'method': '',
  \ 'function': '',
  \ 'constructor': '',
  \ 'field': '',
  \ 'variable': '',
  \ 'class': '',
  \ 'interface': '',
  \ 'module': '',
  \ 'property': '',
  \ 'unit': 'unit',
  \ 'value': 'val',
  \ 'enum': '',
  \ 'keyword': 'keyword',
  \ 'snippet': '',
  \ 'color': 'color',
  \ 'file': '',
  \ 'reference': 'ref',
  \ 'folder': '',
  \ 'enum member': '',
  \ 'constant': '',
  \ 'struct': '',
  \ 'event': 'event',
  \ 'operator': '',
  \ 'type_parameter': 'type param',
  \ '<default>': 'v'
  \ }
