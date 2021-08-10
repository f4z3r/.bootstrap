require("string")
local wibox  = require("wibox")
local markup = require("lain.util").markup

local Timew       = { mt = {}, wmt = {} }
Timew.wmt.__index = Timew
Timew.__index     = Timew

local timew_cmd = "timew | grep Tracking | cut -d' ' -f2"
local icon      = "\u{fa1e}"
local red       = "#CF0000"

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

local function get_trimmed_cmd_out(cmd)
  local out = run(cmd):gsub("\n*$", "")
  if out == "" then
    return nil
  end
  return out
end

function Timew:new(args)
  local obj = setmetatable({}, Timew)

  -- Create imagebox widget
  obj.widget    = wibox.widget.textbox("")
  obj.color     = args.color or red
  local timeout = args.timeout or 60
  obj.widget:set_font(args.font)

  obj.timer = timer({ timeout = timeout })
  obj.timer:connect_signal("timeout", function() obj:update() end)
  obj.timer:start()

  obj:update()

  return obj
end

function Timew:update()
  local ctxt = get_trimmed_cmd_out(timew_cmd)
  local out = "-"
  if ctxt then
    out = icon .. " " .. ctxt
  end
  self.widget:set_markup_silently(markup(self.color, out))
end

function Timew.mt:__call(...)
    return Timew.new(...)
end

return Timew
