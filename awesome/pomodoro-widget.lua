local wibox   = require("wibox")
local string  = require("string")
local os      = os
local lain    = require("lain")
local markup  = lain.util.markup
local naughty = require("naughty")
local awful   = require("awful")

local setmetatable = setmetatable

local Pomodoro = { mt = {}, wmt = {} }
Pomodoro.wmt.__index = Pomodoro
Pomodoro.__index = Pomodoro

function Pomodoro:new(args)
  local obj = setmetatable({}, Pomodoro)

  -- tweak these values in seconds to your liking
  obj.short_pause_duration = 5 or 5 * 60
  obj.long_pause_duration = 30 or 15 * 60
  obj.work_duration = 10 or 25 * 60
  obj.pause_duration = obj.short_pause_duration
  obj.current_duration = obj.work_duration

  obj.last_start = 0

  obj.log = '/tmp/pomodoro.log'
  obj.notif_done = "Completed! Time for a break..."
  obj.notif_go_back = "Pause finished, go back to work!"

  obj.notification_preset = args.notification_preset
  if not obj.notification_preset then
    obj.notification_preset = {
      font      = "Monospace 10"
    }
  end

  obj.color         = "#ACA1A1"
  obj.color_working = "#DF0101"
  obj.color_pausing = "#00B700"
  obj.current_color = obj.color_working

  obj.symbol_running = "\u{e003}"
  obj.symbol_stopped = "\u{e002}"
  obj.current_symbol = obj.symbol_stopped
  obj.running = false
  obj.ran = -1

  obj.format = function (t, c, s, d) return "<b>"..markup(obj.color, d).."</b> "..markup(c, s).." <b>"..markup(obj.color, t).."</b>" end
  obj.working = true

  obj.completed = obj:completed()

  obj.widget = wibox.widget.textbox()
  obj.widget:set_font(args.font)
  obj.widget:set_markup(obj.format("00:00", obj.current_color, obj.current_symbol, obj.completed))

  obj.timer = timer { timeout = 5 }

  obj.timer:connect_signal("timeout", function () obj:update() end)

  return obj
end

function Pomodoro:update()
  if self.last_start == 0 then
    self.widget:set_markup(self.format("-", self.color_stopped, self.symbol_stopped, self.completed))
    return
  end

  local current_time = os.time()
  local time_running = current_time - self.last_start
  local time_left = self.current_duration - time_running

  if time_left < 0 then
    self.timer:stop()
    self.last_start = 0
    time_left = 0
    local notif = self.notif_go_back
    if self.working then
      self:add()
      notif = self.notif_done
      self.current_color = self.color_pausing
    else
      self.current_color = self.color_working
    end
    self:notify(notif)
    self.current_symbol = self.symbol_stopped
    self.working = not self.working
    self.running = false
  end

  formated_time = os.date("%M:%S", time_left)
  self.widget:set_markup(self.format(formated_time, self.current_color, self.current_symbol, self.completed))
end


function Pomodoro:notify(t)
  naughty.notify {
    preset = self.notification_preset,
    title  = "Pomodoro",
    text   = markup.font(self.notification_preset.font,
      awful.util.escape(t:gsub("\n*$", "")))
  }
end

function Pomodoro:toggle()
  if self.running then
    self.timer:stop()
    self.current_symbol = self.symbol_stopped
    self:update()
    local current_time = os.time()
    self.ran = current_time - self.last_start
    self.running = false
  elseif self.last_start == 0 then
    self:start()
  else
    self.last_start = os.time() - self.ran
    self.ran = 1
    self.timer:start()
    self.current_symbol = self.symbol_running
    self:update()
    self.running = true
  end
end

function Pomodoro:start()
  self.current_duration = self.work_duration
  self.current_color = self.color_working
  self.current_symbol = self.symbol_running
  self.running = true

  if not self.working then
    self.current_color = self.color_pausing
    if (self.completed % 4) == 0 then
      self.current_duration = self.long_pause_duration
    else
      self.current_duration = self.pause_duration
    end
  end
  self.last_start = os.time()
  self.timer:start()
  self:update()
end

function Pomodoro:completed()
  local file = io.open(self.log, 'r')
  if not file then return nil end
  local content = file:read "*a"
  local count = 0
  for _ in content:gmatch "Pomodoro auto ended at " do
    count = count + 1
  end
  return count
end

function Pomodoro:add()
  out = io.open(self.log, 'a')
  out:write("\nPomodoro auto ended at " .. os.date("%a %d %b %Y %T") .. ', duration: 25 minutes')
  io.close(out)
  self.completed = self.completed + 1
end

function Pomodoro.mt:__call(...)
    return Pomodoro.new(...)
end

return Pomodoro



