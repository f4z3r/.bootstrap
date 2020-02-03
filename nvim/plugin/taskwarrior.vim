" ===========================================================================
" ============================== Taskwarrior ================================
" ===========================================================================
" default task report type
let g:task_report_name     = 'next'
" allows user to override task configurations. Seperated by space.
let g:task_rc_override     = 'rc.defaultwidth=999'
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 1
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" directory to store log files defaults to taskwarrior data.location
let g:task_log_directory   = '~/.task'
" max number of historical entries
let g:task_log_max         = '20'
" forward arrow shown on statusline
let g:task_left_arrow      = ' <<-'
" backward arrow ...
let g:task_left_arrow      = '->> '
