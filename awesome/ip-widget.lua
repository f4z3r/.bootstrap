local wibox = require("wibox")
require("string")
require("table")

local IPAddress = { mt = {}, wmt = {} }
IPAddress.wmt.__index = IPAddress
IPAddress.__index = IPAddress

local cmd = "ip --color=never address | grep -A2 -E \"state\\s+UP\\s\" | head -n3 | tail -n1 | perl -lane 'print @F[1]'"

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

function IPAddress:new(args)
  local obj = setmetatable({}, IPAddress)

  -- Create imagebox widget
  obj.widget = wibox.widget.textbox("")
  obj.widget:set_font(args.font)

  -- Check services every 30 seconds
  obj.timer = timer({ timeout = 30 })
  obj.timer:connect_signal("timeout", function() obj:update() end)
  obj.timer:start()

  obj:update()

  return obj
end

function IPAddress:update()
  local ip = run(cmd):gsub("\n*$", "")
  local text = "\u{fccf} no IP"
  if ip ~= "" then
    text = "\u{fccf} "..ip
  end
  self.widget:set_text(text)
end


function IPAddress.mt:__call(...)
    return IPAddress.new(...)
end

return IPAddress


