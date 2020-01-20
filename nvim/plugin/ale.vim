" ===========================================================================
" ================================== ALE ====================================
" ===========================================================================


" use ale as completion backend for deoplete
call deoplete#custom#option('sources', {
  \ '_': ['ale'],
  \})
" airline support
let g:airline#extensions#ale#enabled = 1
" set error message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" lint only on insert leave
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
" disable some linters 
let g:ale_linters = {
  \ 'python': ['pyls'],  
  \}
let g:ale_fixers = {
  \ 'python': ['black'],
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
