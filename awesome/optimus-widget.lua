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

  obj:update()

  return obj
end

function Optimus:update()
  if is_active("nvidia") then
    self.widget:set_text("\u{f108}: NVIDIA \u{fd3c} ")
  elseif is_active("intel") then
    self.widget:set_text("\u{f108}: INTEL")
  elseif is_active("integrated") then
    self.widget:set_text("\u{f108}: INTEGRATED \u{fd3c} ")
  elseif is_active("hybrid") then
    self.widget:set_text("\u{f108}: HYBRID \u{fd3c} ")
  else
    self.widget:set_text("\u{f108}: NO OPTIMUS")
  end
end

function Optimus.mt:__call(...)
    return Optimus.new(...)
end

return Optimus




