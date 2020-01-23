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
  let l:status = pomo#status()
  let l:active = l:status !=# 'Pomodoro inactive'
  if !l:active 
    return l:pomos." \ue001 "
  endif
  let l:short_break = l:status ==# 'Pomodoro short break started'
  let l:long_break = l:status ==# 'Pomodoro long break started'

  let l:icon = "\ue003"

  if l:short_break
    let l:icon = "\ue005"
  elseif l:long_break
    let l:icon = "\ue006"
  endif

  let l:pomo_time = pomo#remaining_time()
  return l:pomos." \ue001/".l:icon.' '.l:pomo_time.'m '
endfunction
