function fish_greeting -d "What's up, fish?"
    set_color $fish_color_autosuggestion
    uname -nmsr

    command -q -s uptime
    and command uptime

    echo '---'

    set_color $fish_color_command

    fortune

    set_color normal
end
