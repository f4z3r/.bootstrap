local wibox = require("wibox")
require("string")

local Optimus = { mt = {}, wmt = {} }
Optimus.wmt.__index = Optimus
Optimus.__index = Optimus

local cmd = "optimus-manager --print-mode"

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

local function is_active(gpu)
  return string.find(run(cmd):gsub("\n*$", ""), gpu) ~= nil
end

function Optimus:new(args)
  local obj = setmetatable({}, Optimus)

  -- Create imagebox widget
  obj.widget = wibox.widget.textbox("")
  obj.widget:set_font(args.font)

  -- Check services every 10 minutes seconds
  obj.timer = timer({ timeout = 600 })
  obj.timer:connect_signal("timeout", function() obj:update() end)
  obj.timer:start()

  obj:update()

  return obj
end

function Optimus:update()
  if is_active("nvidia") then
    self.widget:set_text("NVIDIA: \u{fd3c}")
  elseif is_active("intel") then
    self.widget:set_text("INTEL: \u{f108}")
  else
    self.widget:set_text("NO OPTIMUS: \u{f108}")
  end
end

function Optimus.mt:__call(...)
    return Optimus.new(...)
end

return Optimus




