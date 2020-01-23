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

" Pomodoros before long break
let g:pomodoros_before_reward = 4

" Duration of long break
let g:pomodoros_before_reward = 4

let g:pomodoro_notification_cmd = 'notify-send -c POMODORO -i dialog-warning '
      \ . '-u critical -t 10000 "Pomodoro Completed" "Return to vim to start '
      \ . 'a break or skip it."'

function! PomodoroStatus() abort
  let l:pomos = pomo#get_num_pomos_today()
  let l:pomo_time = pomo#remaining_time()
  if l:pomo_time ==# '0'
    return l:pomos." \ue001 "
  else
    return l:pomos." \ue001/\ue003 ".l:pomo_time.'m '
  endif
endfunction
