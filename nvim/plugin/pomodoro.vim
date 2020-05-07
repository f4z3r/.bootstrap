" ===========================================================================
" ================================ Pomodoro =================================
" ===========================================================================

" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25

" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5

" Path to the pomodoro log file (default: no logging)
let g:pomodoro_log_file = '/tmp/pomodoro.log'

" Pomodoros before long break (default: 4)
let g:pomodoros_before_reward = 4

" Duration of long break in minutes (default: 25)
let g:pomodoro_time_reward = 25

let g:pomodoro_notification_cmd = 'notify-send -c POMODORO -i dialog-warning '
      \ . '-u critical -t 10000 "Pomodoro Completed" "Return to vim to start '
      \ . 'a break or skip it."'
