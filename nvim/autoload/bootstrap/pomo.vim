function! bootstrap#pomo#status() abort
  let l:pomos = pomo#get_num_pomos_today()
  let l:pomos_today = l:pomos < 0 ? 0 : l:pomos
  let l:status = pomo#status()
  let l:active = l:status !=# 'Pomodoro inactive'
  if !l:active 
    return l:pomos_today."\ue001 "
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
  return l:pomos_today.'+'.l:icon.' '.l:pomo_time.'m '
endfunction
