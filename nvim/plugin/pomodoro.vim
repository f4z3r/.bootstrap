" ===========================================================================
" ================================ Pomodoro =================================
" ===========================================================================

function! PomodoroStatus() abort
    if pomo#remaining_time() ==# '0'
        return "\ue001"
    else
        return "\ue003 ".pomo#remaining_time()
    endif
endfunction
