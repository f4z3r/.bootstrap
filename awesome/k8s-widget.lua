require("string")
local wibox  = require("wibox")
local markup = require("lain.util").markup

local K8s       = { mt = {}, wmt = {} }
K8s.wmt.__index = K8s
K8s.__index     = K8s

local ns_cmd       = "kubens -c"
local ctxt_cmd     = "kubectx -c"
local wheel        = "\u{fd31}"
local mediumorchid = "#BA55D3"

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

local function get_trimmed_cmd_out(cmd)
  return run(cmd):gsub("\n*$", "")
end

function K8s:new(args)
  local obj = setmetatable({}, K8s)

  -- Create imagebox widget
  obj.widget    = wibox.widget.textbox("")
  obj.color     = args.color or mediumorchid
  local timeout = args.timeout or 3
  obj.widget:set_font(args.font)

  obj.timer = timer({ timeout = timeout })
  obj.timer:connect_signal("timeout", function() obj:update() end)
  obj.timer:start()

  obj:update()

  return obj
end

function K8s:update()
  local ns   = get_trimmed_cmd_out(ns_cmd) or "-"
  local ctxt = get_trimmed_cmd_out(ctxt_cmd) or "-"
  self.widget:set_markup_silently(markup(self.color, ctxt.." "..wheel.." "..ns))
end

function K8s.mt:__call(...)
    return K8s.new(...)
end

return K8s




