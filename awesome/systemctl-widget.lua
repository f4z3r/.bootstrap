local wibox = require("wibox")
require("string")
require("table")

local Systemctl = { mt = {}, wmt = {} }
Systemctl.wmt.__index = Systemctl
Systemctl.__index = Systemctl

local cmd = "systemctl is-active"

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

local function is_active(service)
  return run(cmd.." '"..service.."'"):gsub("\n*$", "") == "active"
end

function Systemctl:new(args)
  local obj = setmetatable({}, Systemctl)

  -- Create imagebox widget
  obj.widget = wibox.widget.textbox("")
  obj.widget:set_font(args.font)

  -- Check services every 60 seconds
  obj.timer = timer({ timeout = 60 })
  obj.timer:connect_signal("timeout", function() obj:update(args.services) end)
  obj.timer:start()

  obj:update(args.services)

  return obj
end

function Systemctl:update(services)
  local t = { }
  for k, v in pairs(services) do
    if is_active(v.name) then
      t[#t+1] = v.symbol
    end
  end
  local text = table.concat(t, " ")
  self.widget:set_text(text)
end

function Systemctl.mt:__call(...)
    return Systemctl.new(...)
end

return Systemctl


