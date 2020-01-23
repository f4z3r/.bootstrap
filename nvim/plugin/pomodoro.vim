" ===========================================================================
" ================================ Pomodoro =================================
" ===========================================================================

" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25

" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5

" Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 0

" Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = '/tmp/pomodoro.log'

let g:pomodoro_notification_cmd = 'notify-send -c POMODORO -i dialog-warning '
      \ . '-u critical -t 10000 "Pomodoro Completed" "Return to vim to start '
      \ . 'a break or skip it."'

function! PomodoroStatus() abort
    if pomo#remaining_time() ==# '0'
        return "\ue001"
    else
        return "\ue003 ".pomo#remaining_time()
    endif
endfunction
