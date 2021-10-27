require("string")
local wibox  = require("wibox")
local markup = require("lain.util").markup

local Utt       = { mt = {}, wmt = {} }
Utt.wmt.__index = Utt
Utt.__index     = Utt

local utt_logfile = "/home/jakob/.local/share/utt/utt.log"
local utt_cmd     = string.format("tail -n1 %s | perl -lane 'print join \" \", splice(@F, 2)'", utt_logfile)
local icon        = "\u{fa1e}"
local red         = "#CF0000"

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

function Utt:new(args)
  local obj = setmetatable({}, Utt)

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

function Utt:file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function Utt:update()
  local out = "-"
  if self:file_exists(utt_logfile) then
    local ctxt = get_trimmed_cmd_out(utt_cmd)
    out = icon .. " " .. ctxt
  end
  self.widget:set_markup_silently(markup(self.color, out))
end

function Utt.mt:__call(...)
    return Utt.new(...)
end

return Utt
