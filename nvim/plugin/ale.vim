scriptencoding utf-8
" ===========================================================================
" ================================== ALE ====================================
" ===========================================================================

" airline support
let g:airline#extensions#ale#enabled = 1
" automatic pipenv on python projects
let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_bandit_auto_pipenv = 1
let g:ale_python_black_auto_pipenv = 1
" ale sign update
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
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
let g:ale_fix_on_save = 0
" disable some linters (clangd, hie) and enable others (mypy)
let g:ale_linters = {
      \ 'python': ['bandit', 'mypy'],
      \ 'haskell': ['hlint', 'stack-build', 'hdevtools'],
      \ 'cpp': ['cppcheck', 'cpplint', 'flawfinder'],
      \ 'c': ['cppcheck', 'cpplint', 'flawfinder'],
      \ 'objc': ['cppcheck', 'cpplint', 'flawfinder'],
      \ 'objcpp': ['cppcheck', 'cpplint', 'flawfinder'],
      \ 'text': ['vale', 'proselint'],
      \}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['black', 'reorder-python-imports', 'yapf'],
      \ 'java': ['uncrustify'],
      \ 'haskell': ['floskell', 'stylish-haskell'],
      \ 'cpp': ['clang-format', 'uncrustify'],
      \ 'c': ['clang-format', 'uncrustify'],
      \}
