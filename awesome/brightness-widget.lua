local wibox = require("wibox")
require("string")

local Brightness = { mt = {}, wmt = {} }
Brightness.wmt.__index = Brightness
Brightness.__index = Brightness

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

function Brightness:new(args)
  local obj = setmetatable({}, Brightness)

  obj.step = 5
  obj.cmd = "brightnessctl -c 'backlight' -d '*backlight*'"
  obj.inc = "set +"..obj.step.."%"
  obj.dec = "set "..obj.step.."%-"
  obj.get = "get"
  obj.max = "max"

  -- Create imagebox widget
  obj.widget = wibox.widget.textbox()
  obj.widget:set_font(args.font)

  -- Check the brightness every 30 seconds
  obj.timer = timer({ timeout = 30 })
  obj.timer:connect_signal("timeout", function() obj:update({}) end)
  obj.timer:start()

  obj:update()

  return obj
end

function Brightness:tooltipText()
  return string.format("%.0f%%", self:getBrightness())
end

function Brightness:update(status)
  local text = self:tooltipText()
  self.widget:set_text("\u{f5de} "..text)
end

function Brightness:up()
  run(self.cmd.." "..self.inc)
  self:update({})
end

function Brightness:down()
  run(self.cmd.." "..self.dec)
  self:update({})
end

function Brightness:getBrightness()
  local current = run(self.cmd.." "..self.get)
  local max = run(self.cmd.." "..self.max)
  return tonumber(current) / tonumber(max) * 100
end

function Brightness.mt:__call(...)
    return Brightness.new(...)
end

return Brightness


