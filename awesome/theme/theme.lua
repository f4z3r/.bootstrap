--[[

     Jakob Awesome WM theme 1.0

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local k8s_widget        = require("k8s-widget")
local utt_widget        = require("utt-widget")
local mpv_widget        = require("mpv-widget")
local optimus_widget    = require("optimus-widget")
local brightness_widget = require("brightness-widget")
local systemctl_widget  = require("systemctl-widget")
local ip_widget         = require("ip-widget")
local pomodoro_widget   = require("pomodoro-widget")

local string, os, io = string, os, io
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/theme/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/theme/wallpapers/armada.jpg"
theme.font_base                                 = "FuraMono Nerd Font Bold"
theme.font                                      = "FuraMono Nerd Font Bold 10"
theme.taglist_font                              = "FuraMono Nerd Font Regular 10"
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#0099CC"
theme.bg_focus                                  = "#303030"
theme.bg_normal                                 = "#242424"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"
theme.border_width                              = dpi(6)
theme.border_normal                             = "#202020"
theme.border_focus                              = "#990000"
theme.taglist_fg_focus                          = "#FFFFFF"
theme.tasklist_bg_normal                        = "#222222"
theme.tasklist_fg_focus                         = "#4CB7DB"
theme.menu_height                               = dpi(40)
theme.menu_width                                = dpi(320)
theme.menu_icon_size                            = dpi(64)
theme.awesome_icon                              = theme.icon_dir .. "/manjaro_icon.png"
theme.awesome_icon_launcher                     = theme.icon_dir .. "/manjaro_icon_round.png"
theme.taglist_squares_sel                       = theme.icon_dir .. "/square_sel.png"
theme.taglist_squares_unsel                     = theme.icon_dir .. "/square_unsel.png"
theme.pomodoro_notif_preset                     = { font = theme.font_base.." 12", timeout = 5, width = 1000 }
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(0)

theme.musicplr = string.format("%s ncmpcpp", awful.util.terminal)

local markup     = lain.util.markup
local blue       = "#80CCE6"
local red        = "#DF0101"
local green      = "#00B700"
local yellow     = "#CCCC00"
local back_norm  = "#383838"
local back_light = "#4b4b4b"

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

-- Clock
local clockwidget = wibox.widget.textclock(markup("#FFFFFF", "\u{f64f} %H:%M " .. markup.font("Fira Code 4", " ")))
clockwidget.font = theme.font

-- Calendar
local calendarwidget = wibox.widget.textclock(markup.fontfg(theme.font, "#FFFFFF", "\u{f455} %d %b"))
theme.cal = lain.widget.cal({
    attach_to = { clockwidget, calendarwidget },
    notification_preset = {
      fg = "#FFFFFF",
      bg = theme.bg_normal,
      position = "bottom_right",
      font = "Monospace 10"
    }
  })

-- Brightness
theme.brightness = brightness_widget:new({font = theme.font})

-- MPD
local song_progres_width = 300
theme.mpd_flags = wibox.widget.textbox("<span font='" .. theme.taglist_font .. "'> [] </span>")
local mpd_icon = wibox.widget.textbox("<span font='" .. theme.font .. "'> \u{f885} </span>")
local mpd_sliders = wibox.widget.textbox("<span font='" .. theme.font .. "'> \u{f1de} </span>")
theme.mpdbarinner = wibox.widget {
  color            = theme.fg_normal,
  background_color = back_light,
  forced_height    = dpi(2),
  forced_width     = dpi(song_progres_width),
  margins          = dpi(6),
  paddings         = dpi(0),
  ticks            = false,
  widget           = wibox.widget.progressbar
}
theme.mpdbar = wibox.container.margin(theme.mpdbarinner, dpi(0), dpi(0), dpi(6), dpi(6))
theme.mpd = lain.widget.mpd({
    timeout = 4,
    notify = 'off',
    settings = function ()
      widget.progress.forced_width = dpi(0)
      local flags = "["
      if mpd_now.repeat_mode then
        flags = flags .. "r"
      end
      if mpd_now.random_mode then
        flags = flags .. "z"
      end
      if mpd_now.single_mode then
        flags = flags .. "s"
      end
      if mpd_now.consume_mode then
        flags = flags .. "c"
      end
      flags = flags .. "]"
      local progressbar_color = theme.fg_normal
      if mpd_now.state == "pause" then
        progressbar_color = red
      end
      widget.flags:set_markup(
        markup.font("Fira Code 5", " ") ..
        markup.font(theme.taglist_font, markup(progressbar_color, flags)) ..
        markup.font("Fira Code 5", " "))
      if mpd_now.state == "play" or mpd_now.state == "pause" then
        mpd_now.artist = mpd_now.artist:upper():gsub("&.-;", string.lower)
        mpd_now.title = mpd_now.title:upper():gsub("&.-;", string.lower)
        if mpd_now.artist == "N/A" and mpd_now.title == "N/A" then
          widget:set_markup(markup.font("Fira Code 4", " ")
            .. markup.font(theme.taglist_font,
              "PLAYING FROM YOUTUBE") .. markup.font("Fira Code 5", " "))
        else
          widget.progress.forced_width = dpi(song_progres_width)
          widget.progress:set_value(mpd_now.elapsed / mpd_now.time)
          widget.progress.color = progressbar_color
          widget:set_markup(markup.font("Fira Code 4", " ")
            .. markup.font(theme.taglist_font,
              " " .. mpd_now.artist
              .. " - " ..
            mpd_now.title
            ..  " ") .. markup.font("Fira Code 5", " "))
        end
      else
        widget:set_markup("")
      end
    end
  })
theme.mpd.widget.progress = theme.mpdbarinner
theme.mpd.widget.flags = theme.mpd_flags
local musicwidget = theme.mpd.widget

-- Battery
local bat = lain.widget.bat({
    settings = function()
      local color = blue
      bat_p      = bat_now.perc .. "%"
      bat_header = "\u{f244} "
      if bat_now.ac_status == 1 then
        bat_p = bat_p .. " \u{fba3}"
      end
      if bat_now.perc > 80 then
        color = green
        bat_header = "\u{f240} "
      elseif bat_now.perc > 60 then
        bat_header = "\u{f241} "
      elseif bat_now.perc > 40 then
        bat_header = "\u{f242} "
      elseif bat_now.perc > 20 then
        color = yellow
        bat_header = "\u{f243} "
      else
        color = red
        bat_header = "\u{f244} "
      end
      widget:set_markup(markup.font(theme.font, markup(color, bat_header) .. bat_p))
    end
  })

-- Kernel widget
local kernel = run("uname -r")
local kernel_widget = wibox.widget.textbox("\u{f312}  "..kernel)
kernel_widget:set_font(theme.taglist_font)

-- GPU switch
local gpu_widget = optimus_widget:new({ font = theme.taglist_font })

-- Services
local service_widget = systemctl_widget:new({
    font = theme.font,
    services = {
      prometheus_node_exporter = {
        name = "prometheus-node-exporter.service",
        symbol = "\u{f706}"
      },
      prometheus = {
        name = "prometheus.service",
        symbol = "\u{f737}"
      },
      grafana = {
        name = "grafana.service",
        symbol = "\u{f013}"
      },
      docker = {
        name = "docker.service",
        symbol = "\u{f308}"
      },
      bluetooth = {
        name = "bluetooth.service",
        symbol = "\u{f294}"
      },
      ssh = {
        name = "sshd.service",
        symbol = "\u{e795}"
      },
      mpd = {
        name = "mpd.service",
        symbol = "\u{f885}"
      },
      tlp = {
        name = "tlp.service",
        symbol = "\u{f0e7}"
      },
      network = {
        name = "NetworkManager.service",
        symbol = "\u{fbf3}"
      },
      proton = {
        name = "openvpn-client@proton-*.service",
        symbol = "\u{fa62}"
      },
      proton_tor = {
        name = "openvpn-client@proton-*-tor.service",
        symbol = "\u{fa29}"
      },
      cron = {
        name = "cronie.service",
        symbol = "\u{f01e}"
      },
      crypto = {
        -- usual cryptsetup units slice for manjaro
        name = "system-systemd\\x2dcryptsetup.slice",
        symbol = "\u{f840}"
      },
      swap = {
        -- can use any swap file/fs
        name = "*.swap",
        symbol = "\u{f9e0}"
      },
      timesync = {
        name = "systemd-timesyncd.service",
        symbol = "\u{f652}"
      },
      nfs_server = {
        name = "nfs-server.service",
        symbol = "\u{f716}"
      },
      nfs_client_mount = {
        name = "mnt-nfs.mount",
        symbol = "\u{fb44}"
      },
      ufw_filter_manager = {
        name = "ufw.service",
        symbol = "\u{fcfc}"
      },
      rsync_server = {
        name = "rsync.service",
        symbol = "\u{f46a}"
      },
      print_server = {
        name = "cups.service",
        symbol = "\u{f929}"
      },
      print_browser_server = {
        name = "cups-browsed.service",
        symbol = "\u{f665}"
      },
      optimus_manager = {
        name = "optimus-manager.service",
        symbol = "\u{f974}"
      },
      clamav_daemon = {
        name = "clamav-daemon.service",
        symbol = "\u{f6f3}"
      },
      clamav_freshclam_db = {
        name = "clamav-freshclam.service",
        symbol = "\u{f472}"
      },
      clamav_fangfrisch_timer = {
        name = "fangfrisch.timer",
        symbol = "\u{f2dc}"
      },
      rclone_gdrive = {
        name = "rclonemount.service",
        symbol = "\u{f7b5}"
      },
    }
  })

-- MPV widget
theme.mpv = mpv_widget:new({
  font  = theme.font,
  color = theme.fg_normal,
})

-- UTT widget
theme.utt = utt_widget:new({ font = theme.taglist_font })

-- K8s widget
theme.k8s = k8s_widget:new({ font = theme.taglist_font })

-- Pomodoro widget
theme.pomodoro = pomodoro_widget:new({
    font = theme.taglist_font,
    notification_preset = theme.pomodoro_notif_preset
  })

-- ALSA volume bar
theme.volume = lain.widget.alsabar({
    notification_preset = { font = "Monospace 9"},
    --togglechannel = "IEC958,3",
    width = dpi(100), height = dpi(2), border_width = dpi(0),
    colors = {
      background = back_light,
      unmute     = blue,
      mute       = red,
    },
  })
theme.volume.bar.paddings = dpi(0)
theme.volume.bar.margins = dpi(6)
local volumewidget = theme.volume.bar
volumewidget = wibox.container.margin(volumewidget, dpi(0), dpi(0), dpi(6), dpi(6))

-- Sysload
-- added space at end as no sep between this and CPU %
local harddisk = " \u{f7c9} "
local sysload = lain.widget.fs({
    settings  = function()
      local text = string.format("%s%d%% (%.1f%s left)", harddisk, fs_now["/"].percentage, fs_now["/"].free, fs_now["/"].units)
      widget:set_markup(markup.font(theme.font, text))
    end
  })

-- CPU
local cpuwidget = lain.widget.cpu({
    settings = function()
      local color = theme.fg_normal
      if cpu_now.usage >= 75 then
        color = red
      elseif cpu_now.usage >= 50 then
        color = yellow
      end
      widget:set_markup(markup.font(theme.font, "\u{f085} " .. markup(color, cpu_now.usage .. "%")))
    end
  })

-- CPU temp
-- added space at beginning as no sep between this and CPU %
local cputempwidget = lain.widget.temp({
    tempfile = "/sys/devices/virtual/thermal/thermal_zone1/temp",
    settings = function()
      local color = theme.fg_normal
      if coretemp_now >= 80 then
        color = red
      elseif coretemp_now >= 70 then
        color = yellow
      end
      widget:set_markup(markup.font(theme.font, " \u{f2c9} " .. coretemp_now .. "\u{fa03}"))
    end
  })

-- MEM
local memwidget = lain.widget.mem({
    settings = function()
      local memtext = mem_now.used .. "M"
      if mem_now.used > 1024 then
        memtext = string.format("%.1fG", (mem_now.used / 1024))
      end
      widget:set_markup(markup.font(theme.font, "\u{f85a} " .. memtext))
    end
  })

-- Net
local networkwidget = lain.widget.net({
    notify = "off",
    wifi_state = "on",
    eth_state = "on",
    settings = function()
      local icon = "\u{faa9}"
      local wifi = false
      local signal = -100
      local eth = false
      local color = red
      for _, iface in pairs(net_now.devices) do
        if iface.wifi then
          wifi = true
          signal = (iface.signal > signal and iface.signal or signal)
        elseif iface.ethernet then
          eth = true
        end
      end
      if wifi then
        icon = "\u{faa8}"
        if signal > -53 then
          color = green
        elseif signal > -70 then
          color = blue
        elseif signal > -83 then
          color = yellow
        else
          color = red
        end
      elseif eth then
        color = green
        icon = "\u{f6ff}"
      end
      local recvkbps = tonumber(net_now.received)
      local recvtext = recvkbps.."k"
      if recvkbps > 1024 then
        recvtext = string.format("%.1fM", (recvkbps / 1024))
      end
      local sentkbps = tonumber(net_now.sent)
      local senttext = sentkbps.."k"
      if sentkbps > 1024 then
        senttext = string.format("%.1fM", (sentkbps / 1024))
      end
      widget:set_markup(markup.font(theme.font, "\u{f47c} "..recvtext.." "..markup(color,icon)..
        " "..senttext.." \u{f47b}"))
    end
  })

local ip_address_widget = ip_widget:new({ font = theme.font })

-- Launcher
local mylauncher = awful.widget.button({ image = theme.awesome_icon_launcher })
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

-- OS Logo
file = io.open('/etc/os-release', 'r')
local os_text = file:read("*a")
-- get ID of /etc/os-release
local release = string.match(os_text, '%sID="?([%a-_]+)"?%s')
file:close()
local logo = "\u{f303}"
local logo_color = "#00ccff"
if release == "manjaro" then
  logo = "\u{f312}"
  logo_color = "green"
elseif release == "arch" then
  logo = "\u{f303}"
  logo_color = "#00ccff"
elseif release == "ubuntu" then
  logo = "\u{f31b}"
  logo_color = "#ff9900"
elseif release == "debian" then
  logo = "\u{f306}"
  logo_color = "red"
elseif release == "opensuse-leap" then
  logo = "\u{f314}"
  logo_color = "#00cc00"
elseif release == "opensuse-tumbleweed" then
  logo = "\u{f314}"
  logo_color = "#00cc00"
end

local first = wibox.widget.textbox('<span font="Fira Code 12" color="'..logo_color..'"> '..logo..' </span>')
-- Separators
local last = wibox.widget.textbox('<span font="Fira Code 10">  </span>')
local bottom_bar = wibox.widget.textbox("<span font='" .. theme.font .. "'> \u{f6d8} </span>")

local barcolor  = gears.color({
    type  = "linear",
    from  = { dpi(32), 0 },
    to    = { dpi(32), dpi(32) },
    stops = { {0, theme.bg_focus}, {0.25, "#505050"}, {1, theme.bg_focus} }
  })

function theme.at_screen_connect(s)
  -- Quake application
  s.quake = lain.util.quake({
    app = awful.util.terminal,
    argname = "--name %s tmux new -s quake",
    height = 0.75,
    width = 0.75,
    vert = "center",
    horiz = "center"
  })

  -- If wallpaper is a function, call it with the screen
  local wallpaper = theme.wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  gears.wallpaper.maximized(wallpaper, s)

  -- Tags
  awful.tag(awful.util.tagnames, s, awful.layout.layouts)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, { bg_focus = barcolor })

  mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_focus, gears.shape.rectangle)
  s.mytag = wibox.container.margin(mytaglistcont, dpi(0), dpi(0), dpi(2), dpi(2))

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.rectangle, shape_border_width = 5, shape_border_color = theme.tasklist_bg_normal, align = "center"})

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(25) })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      first,
      s.mytag,
      bottom_bar,
      bat.widget,
      bottom_bar,
      service_widget,
      bottom_bar,
      theme.utt,
      bottom_bar,
      theme.k8s,
      bottom_bar,
      theme.pomodoro,
      bottom_bar,
      s.mypromptbox,
    },
    nil, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      theme.mpv,
      musicwidget,
      theme.mpdbar,
      mpd_sliders,
      theme.mpd_flags,
      mpd_icon,
      volumewidget,
      last,
      kernel_widget,
      last,
      gpu_widget,
      last,
    },
  }

  -- Create the bottom wibox
  s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = dpi(0), height = dpi(32) })
  s.borderwibox = awful.wibar({ position = "bottom", screen = s, height = dpi(1), bg = theme.fg_focus, x = dpi(0), y = dpi(33)})

  -- Add widgets to the bottom wibox
  s.mybottomwibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      --mylauncher,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      last,
      ip_address_widget,
      bottom_bar,
      networkwidget,
      bottom_bar,
      memwidget,
      bottom_bar,
      sysload.widget,
      bottom_bar,
      cpuwidget,
      cputempwidget,
      bottom_bar,
      theme.brightness,
      bottom_bar,
      calendarwidget,
      bottom_bar,
      clockwidget,
    },
  }
end

return theme
