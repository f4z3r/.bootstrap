" ===========================================================================
" ============================== Taskwarrior ================================
" ===========================================================================
" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = ['summary', 'age', 'today', 'high', 'sch']
" allows user to override task configurations. Seperated by space.
let g:task_rc_override     = 'rc.defaultwidth=999'
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" max number of historical entries
let g:task_log_max         = '20'
" forward arrow shown on statusline
let g:task_left_arrow      = ' <'
" backward arrow ...
let g:task_left_arrow      = '> '
" info window position
let g:task_info_position   = 'belowright'
" default fields to ask for
let g:task_default_prompt  = ['project', 'schedule', 'due', 'tag',
      \'description', 'depends']

" set custom highlights
highlight link taskwarrior_id               GruvboxGray
highlight link taskwarrior_due              GruvboxRedBold
highlight link taskwarrior_priority         GruvboxOrange
highlight link taskwarrior_depends          GruvboxAqua
highlight link taskwarrior_scheduled        GruvboxYellow
highlight link taskwarrior_estimate         GruvboxPurple
highlight link taskwarrior_totalactivetime  GruvboxBlue
highlight link taskwarrior_until            GruvboxGray
highlight link taskwarrior_start            GruvboxGreenBold
highlight link taskwarrior_project          GruvboxRed
highlight link taskwarrior_tags             GruvboxGreen
highlight link taskwarrior_description      Normal

highlight link taskwarrior_entry            GruvboxOrange
