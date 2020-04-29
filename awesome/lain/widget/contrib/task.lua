--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Jan Xie

--]]

local helpers = require("lain.helpers")
local markup  = require("lain.util").markup
local awful   = require("awful")
local naughty = require("naughty")
local mouse   = mouse
local string  = string

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

-- Taskwarrior notification
-- lain.widget.contrib.task
local task = {}

function task.hide()
    if not task.notification then return end
    naughty.destroy(task.notification)
    task.notification = nil
end

function task.show(scr)
    task.notification_preset.screen = task.followtag and awful.screen.focused() or scr or 1

    helpers.async({ awful.util.shell, "-c", task.show_cmd }, function(f)
        local widget_focused = true

        if mouse.current_widgets then
            widget_focused = false
            for _,v in ipairs(mouse.current_widgets) do
                if task.widget == v then
                    widget_focused = true
                    break
                end
            end
        end

        if widget_focused then
            task.hide()
            task.notification = naughty.notify {
                preset = task.notification_preset,
                title  = "task next",
                text   = markup.font(task.notification_preset.font,
                         awful.util.escape(f:gsub("\n*$", "")))
            }
        end
    end)
end

function task.prompt()
    awful.prompt.run {
        prompt       = "<b>"..task.prompt_text.."</b>",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = function(t)
            helpers.async("task "..t, function(f)
                naughty.notify {
                    preset = task.notification_preset,
                    title  = "task "..t,
                    text   = markup.font(task.notification_preset.font,
                             awful.util.escape(f:gsub("\n*$", "")))
                }
            end)
        end,
        history_path = awful.util.getdir("cache") .. "/history_task"
    }
end

function task.update()
  local timew_active = not (run("timew"):gsub("\n*$", "") == "There is no active time tracking.")
  local color = "cyan"
  if timew_active then
    color = "red"
  end
  task.widget.markup = '<span font="Fira Code 12" color="'..color..'">\u{f4a0}</span>'
end

function task.attach(widget, args)
    local args               = args or {}
    task.show_cmd            = args.show_cmd or "task next"
    task.prompt_text         = args.prompt_text or "Enter task command: "
    task.followtag           = args.followtag or false
    task.notification_preset = args.notification_preset
    task.widget              = widget
    task.widget.markup       = '<span font="Fira Code 12" color="cyan">\u{f4a0}</span>'
    task.timer               = timer({ timeout = 10 })
    task.timer:connect_signal("timeout", function () task.update() end)
    task.timer:start()

    if not task.notification_preset then
        task.notification_preset = {
            font = "Monospace 10",
            icon = helpers.icons_dir .. "/taskwarrior.png"
        }
    end

    if widget then
        widget:connect_signal("mouse::enter", function () task.show() end)
        widget:connect_signal("mouse::leave", function () task.hide() end)
    end
end

return task
