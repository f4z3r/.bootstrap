local wibox = require("wibox")
local awful = require("awful")
require("string")

local Brightness = { mt = {}, wmt = {} }
Brightness.wmt.__index = Brightness
Brightness.__index = Brightness

config = awful.util.getdir("config")

function Brightness:isXBacklightInstalled()
  local prog = io.popen("xbacklight")
  prog:read('*all')
  local result = {prog:close()}

  return result[3] == 0
end

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

function Brightness:new(args)
  local obj = setmetatable({}, Brightness)

  obj.step = 10
  obj.cmd = "xbacklight"
  obj.inc = "-inc"
  obj.dec = "-dec"
  obj.set = "-set"
  obj.get = "-get"

  -- Create imagebox widget
  obj.widget = wibox.widget.textbox()
  obj.widget:set_font(args.font)

  -- Check the brightness every 10 seconds
  obj.timer = timer({ timeout = 10 })
  obj.timer:connect_signal("timeout", function() obj:update({}) end)
  obj.timer:start()

  obj:update()

  return obj
end

function Brightness:tooltipText()
  local text = self:getBrightness()
  local subbed = string.gsub(text, ".000000\n", "")
  return subbed.."%"
end

function Brightness:update(status)
  local text = self:tooltipText()
  self.widget:set_text("\u{f5de} "..text)
end

function Brightness:up()
  run(self.cmd.." "..self.inc.." "..self.step)
  self:update({})
end

function Brightness:down()
  run(self.cmd.." "..self.dec.." "..self.step)
  self:update({})
end

function Brightness:set(val)
  run(self.cmd.." "..self.set.." "..val)
  self:update({})
end

function Brightness:getBrightness()
  return run(self.cmd.." "..self.get)
end

function Brightness.mt:__call(...)
    return Brightness.new(...)
end

return Brightness


