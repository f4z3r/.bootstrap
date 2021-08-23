--[[

     Awesome WM configuration

--]]

-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local helpers       = require("lain.helpers")
local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi

local scrlocker    = "i3lock -c 249eca"


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "unclutter -root", "xss-lock -- " .. scrlocker }) -- entries must be separated by commas
run_once({ "clipcatd" })

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

-- }}}

-- {{{ Variable definitions

local modkey       = "Mod4"
local altkey       = "Mod1"
local terminal     = "kitty tmux"
local editor       = os.getenv("EDITOR") or "nvim"
local guieditor    = "kitty tmux new -s vim"
local browser      = "brave"
local mail         = "thunderbird"
local music_player = "kitty ncmpcpp"
local ytop         = "kitty ytop"
local nvtop        = "kitty nvtop"
local inxi         = "kitty --hold inxi -F"

awful.util.terminal = "kitty"
awful.util.tagnames = { "1", "2", "3", "4", "5" }
awful.layout.layouts = {
    --awful.layout.suit.floating,
    --awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))
-- }}}


-- {{{ TimeWarrior
local function timew_prompt()
    awful.prompt.run {
        prompt       = "<b>Enter timew command: </b>",
        textbox      = awful.screen.focused().mypromptbox.widget,
        hooks        = {
          {{},'Return', function(cmd)
            if (not cmd) or cmd == '' then
              return "summary :ids"
            else
              return cmd
            end
          end},
        },
        exe_callback = function(t)
            helpers.async("timew "..t, function(f)
                naughty.notify {
                    preset = beautiful.pomodoro_notif_preset,
                    title  = "timew "..t,
                    text   = lain.util.markup.font(beautiful.pomodoro_notif_preset.font,
                             awful.util.escape(f:gsub("\n*$", "")))
                }
            end)
            beautiful.timew:update()
        end,
        history_path = awful.util.getdir("cache") .. "/history_timew"
    }
end
-- }}}


-- {{{ Menu
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end }
}
awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or dpi(16),
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        { "Open terminal", terminal },
        -- other triads can be put here
    }
})
-- hide menu when mouse leaves it
--awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)

menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it
-- }}}

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
-- }}}

-- {{{ Mouse bindings
root.buttons(my_table.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = my_table.join(
  -- === Awesome Keys ===
  -- quit awesome (logout)
  awful.key({ modkey, "Control"   }, "q", awesome.quit,
    {description = "quit awesome (logout)", group = "awesome"}),

  -- restart awesome
  awful.key({ modkey, "Control"   }, "r", awesome.restart,
    {description = "reload awesome", group = "awesome"}),

  -- lock screen
  awful.key({ modkey, "Control"   }, "l", function () os.execute("xset s activate && sleep 1 && xset dpms force off") end,
    {description = "lock screen", group = "awesome"}),

  -- suspend
  awful.key({ modkey, "Control"   }, "s", function () os.execute("systemctl suspend") end,
    {description = "suspend", group = "awesome"}),

  -- show help
  awful.key({ modkey, "Control"   }, "h", hotkeys_popup.show_help,
    {description = "show help", group="awesome"}),

  -- Show/Hide Wibox
  awful.key({ modkey, "Control"   }, "b",
    function ()
      for s in screen do
        s.mywibox.visible = not s.mywibox.visible
        if s.mybottomwibox then
          s.mybottomwibox.visible = not s.mybottomwibox.visible
        end
      end
    end, {description = "toggle wibox", group = "awesome"}),

  -- Toggle light/dark theme
  awful.key({ modkey, "Control"    }, "k",
    function ()
      local active_theme = run("cat ~/.config/kitty/active-theme"):gsub("\n*$", "")
      local new_theme = "light"
      if active_theme == "light" then
        new_theme = "dark"
      end
      run("rm ~/.config/kitty/active-theme.conf")
      run("ln -s ~/.config/kitty/kitty-colors/gruvbox-material-"..new_theme.."-soft.conf ~/.config/kitty/active-theme.conf")
      run("echo '"..new_theme.."' > ~/.config/kitty/active-theme")
      run("unlink ~/.k9s/skin.yml")
      run("ln -s ~/.k9s/"..new_theme.."_skin.yml ~/.k9s/skin.yml")
    end, {description = "toggle light/dark scheme", group = "awesome"}),



  -- === Launcher ===
  -- launch terminal
  awful.key({ modkey,              }, "Return", function () awful.spawn(terminal) end,
    {description = "launch terminal", group = "launcher"}),

  -- launch any program
  awful.key({ modkey, "Control"    }, "p", function() menubar.show() end,
    {description = "launch any program", group = "launcher"}),

  -- launch editor
  awful.key({ modkey, "Control"    }, "e", function () awful.spawn(guieditor) end,
    {description = "launch editor", group = "launcher"}),

  -- launch music player
  awful.key({ modkey, "Control"    }, "m", function () awful.spawn(music_player) end,
    {description = "launch music player", group = "launcher"}),

  -- launch mail
  awful.key({ modkey, "Control"    }, "t", function () awful.spawn(mail) end,
    {description = "launch mail (thunderbird)", group = "launcher"}),

  -- launch browser
  awful.key({ modkey, "Control"    }, "w", function () awful.spawn(browser) end,
    {description = "launch web browser", group = "launcher"}),

  -- launch system CPU info
  awful.key({ modkey, "Control"    }, "c", function () awful.spawn(ytop) end,
    {description = "launch CPU monitoring", group = "launcher"}),

  -- launch system NVIDIA info
  awful.key({ modkey, "Control"    }, "n", function () awful.spawn(nvtop) end,
    {description = "launch NVIDIA monitoring", group = "launcher"}),

  -- launch system general info
  awful.key({ modkey, "Control"    }, "g", function () awful.spawn(inxi) end,
    {description = "launch system information", group = "launcher"}),

  -- execute lua prompt
  awful.key({ modkey, "Control"    }, "x",
    function ()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {description = "lua execute prompt", group = "launcher"}),

  -- awful.key({ modkey, altkey, "Control"    }, "r", function () awful.screen.focused().mypromptbox:run() end,
  --   {description = "run shell prompt", group = "launcher"}),

  -- launch dropdown
    awful.key({ "Control"          }, "Return", function () awful.screen.focused().quake:toggle() end,
              {description = "dropdown application", group = "launcher"}),


  -- == Client ==
  -- focus down
  awful.key({ modkey }, "j",
    function()
      awful.client.focus.global_bydirection("down")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus down", group = "client"}),

  -- focus up
  awful.key({ modkey }, "k",
    function()
      awful.client.focus.global_bydirection("up")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client"}),

  -- focus left
  awful.key({ modkey }, "h",
    function()
      awful.client.focus.global_bydirection("left")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus left", group = "client"}),

  -- focus right
  awful.key({ modkey }, "l",
    function()
      awful.client.focus.global_bydirection("right")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus right", group = "client"}),

  -- focus next
  awful.key({ modkey, altkey }, "i",
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}),

  -- focus previous
  awful.key({ modkey, altkey }, "u",
    function ()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}),

  -- swap with next
  awful.key({ modkey,        }, "u", function () awful.client.swap.byidx(  1)    end,
    {description = "swap with next client by index", group = "client"}),

  -- swap with previous
  awful.key({ modkey,        }, "i", function () awful.client.swap.byidx( -1)    end,
    {description = "swap with previous client by index", group = "client"}),

  -- cycle clients
  awful.key({ modkey,        }, "Tab",
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = "cycle through clients", group = "client"}),

  -- got to urgent
  awful.key({ modkey,        }, ";", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),

  -- restore minimized
  awful.key({ modkey, altkey }, "m",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        client.focus = c
        c:raise()
      end
    end,
    {description = "restore minimized", group = "client"}),

  -- + see client keys

  -- === Screen ===
  -- focus next screen
  awful.key({ modkey, altkey }, "h", function () awful.screen.focus_relative( 1) end,
    {description = "focus the next screen", group = "screen"}),

  -- focus previous screen
  awful.key({ modkey, altkey }, "l", function () awful.screen.focus_relative(-1) end,
    {description = "focus the previous screen", group = "screen"}),

  -- === Tag ===
  -- Tag browsing
  awful.key({ modkey,        }, "Escape", awful.tag.history.restore,
    {description = "go back", group = "tag"}),

  -- move to left
  awful.key({ modkey, altkey  }, "Left", function () lain.util.move_tag(-1) end,
    {description = "move tag to the left/right", group = "tag"}),

  -- move to right
  awful.key({ modkey, altkey  }, "Right", function () lain.util.move_tag(1) end,
    {description = "move tag to the left/right", group = "tag"}),


  -- === Hotkey ===
  -- take a screenshot
  awful.key({ altkey, "Control" }, "s",
    function()
      os.execute("mkdir -p $HOME/screenshots/ && scrot -q 100 -uz $HOME/screenshots/$(date +%Y%m%d%H%M%S).png")
    end, {description = "take a screenshot", group = "hotkeys"}),

  -- brightness up
  awful.key({ }, "XF86MonBrightnessUp", function () beautiful.brightness:up() end,
    {description = "+10% brightness", group = "hotkeys"}),

  -- brightness down
  awful.key({ }, "XF86MonBrightnessDown", function () beautiful.brightness:down() end,
    {description = "-10% brightness", group = "hotkeys"}),

  -- volume up
  awful.key({ altkey }, "Up",
    function ()
      os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
      beautiful.volume.update()
    end, {description = "volume up", group = "hotkeys"}),

  -- volume down
  awful.key({ altkey }, "Down",
    function ()
      os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
      beautiful.volume.update()
    end, {description = "volume down", group = "hotkeys"}),

  -- volume mute
  awful.key({ altkey }, "m",
    function ()
      os.execute(string.format("amixer -q set Master toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
      beautiful.volume.update()
    end, {description = "toggle mute", group = "hotkeys"}),

  -- volume mute
  awful.key({ altkey }, "0",
    function ()
      os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
      beautiful.volume.update()
    end, {description = "volume 0%", group = "hotkeys"}),


  -- === Widget ===
  -- Pomodoro start
  awful.key({ altkey, "Control" }, "p", function () beautiful.pomodoro:toggle() end,
    {description = "toggle pomodoro", group = "widgets"}),
  awful.key({ altkey, "Control" }, "w", function () beautiful.pomodoro:skip_break() end,
    {description = "skip pomodoro break (reset)", group = "widgets"}),

  -- TimeWarrior run prompt
  awful.key({ altkey, "Control" }, "i", timew_prompt,
    {description = "run in timew prompt", group = "widgets"}),

  -- calendar
  awful.key({ altkey, "Control" }, "c", function () if beautiful.cal then beautiful.cal.show(7) end end,
    {description = "show calendar", group = "widgets"}),

  -- MPC control start stop
  awful.key({ altkey, "Control" }, "Up",
    function ()
      os.execute("mpc toggle")
      beautiful.mpd.update()
    end, {description = "mpc toggle", group = "widgets"}),

  -- MPC control stop
  awful.key({ altkey, "Control" }, "Down",
    function ()
      os.execute("mpc stop")
      beautiful.mpd.update()
    end,
    {description = "mpc stop", group = "widgets"}),

  -- MPC control previous
  awful.key({ altkey, "Control" }, "Left",
    function ()
      os.execute("mpc prev")
      beautiful.mpd.update()
    end, {description = "mpc prev/next", group = "widgets"}),

  -- MPC control next
  awful.key({ altkey, "Control" }, "Right",
    function ()
      os.execute("mpc next")
      beautiful.mpd.update()
    end, {description = "mpc prev/next", group = "widgets"}),

  -- MPC control show next
  awful.key({ altkey, "Control" }, "q",
    function ()
      local next_song = run("mpc queue")
      naughty.notify {
        title = "\u{f885} next queued song \u{f885}",
        text = next_song,
        timeout = 7
      }
    end, {description = "show next song", group = "widgets"}),

  -- MPC on/off
  awful.key({ altkey, "Control" }, "9",
    function ()
      local common = { text = "MPD widget ", position = "top_middle", timeout = 2 }
      if beautiful.mpd.timer.started then
        beautiful.mpd.timer:stop()
        common.text = common.text .. "OFF"
      else
        beautiful.mpd.timer:start()
        common.text = common.text .. "ON"
      end
      naughty.notify(common)
    end, {description = "mpc on/off", group = "widgets"}),

  -- k8s on/off
  awful.key({ altkey, "Control" }, "8",
    function ()
      local common = { text = "K8s widget ", position = "top_middle", timeout = 2 }
      if beautiful.k8s.timer.started then
        beautiful.k8s.timer:stop()
        common.text = common.text .. "OFF"
      else
        beautiful.k8s.timer:start()
        common.text = common.text .. "ON"
      end
      naughty.notify(common)
    end, {description = "k8s on/off", group = "widgets"}),

  -- All on/off
  awful.key({ altkey, "Control" }, "0",
    function ()
      local common = { text = "All widgets OFF (/", position = "top_middle", timeout = 4 }
      if beautiful.k8s.timer.started then
        beautiful.k8s.timer:stop()
        common.text = common.text .. "k8s/"
      end
      if beautiful.mpd.timer.started then
        beautiful.mpd.timer:stop()
        common.text = common.text .. "mpd/"
      end
      common.text = common.text .. ")"
      naughty.notify(common)
    end, {description = "all widgets off", group = "widgets"}),


  -- == Layout ===
  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
    {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
    {description = "select previous", group = "layout"})
)

clientkeys = my_table.join(
  -- minimize
  awful.key({ modkey,           }, "m",
    function (c)
      c.minimized = true
    end ,
    {description = "minimize", group = "client"}),

  -- center
  awful.key({ modkey,           }, "c",      lain.util.magnify_client,
    {description = "center client", group = "client"}),

  -- fullscreen
  awful.key({ modkey,           }, "f",
    function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),

  -- quit
  awful.key({ modkey,           }, "q",      function (c) c:kill()                         end,
    {description = "quit", group = "client"}),

  -- move to screen
  awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
    {description = "move to screen", group = "client"}),

  -- maximize clients
  awful.key({ modkey            }, "-",         function(c) c.maximized_horizontal = not c.maximized_horizontal end,
    {description = "toggle window horizontal maximization", group = "client"}),
  awful.key({ modkey, "Shift"   }, "\\",        function(c) c.maximized_vertical = not c.maximized_vertical end,
    {description = "toggle window vertical maximization", group = "client"}),
  awful.key({ modkey            }, "z",         function(c) c.maximized = not c.maximized end,
    {description = "toggle window maximization", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Move client to tag.
        awful.key({ modkey, altkey  }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move)
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = false } },

    -- Set Firefox to always map on the first tag on screen 1.
    --{ rule = { class = "Firefox" },
    --  properties = { screen = 1, tag = awful.util.tagnames[1] } },

    { rule = { class = "Gimp", role = "gimp-image-window" },
          properties = { maximized = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 2, function() c:kill() end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = dpi(16)}) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--    c:emit_signal("request::activate", "mouse_enter", {raise = true})
--end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251
-- }}}
