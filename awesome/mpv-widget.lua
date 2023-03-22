require("string")
local os      = os
local wibox   = require("wibox")
local markup  = require("lain.util").markup
local awful   = require("awful")
local naughty = require("naughty")

local MPV       = { mt = {}, wmt = {} }
MPV.wmt.__index = MPV
MPV.__index     = MPV

local mpv_logfile    = "/tmp/mpv_log"
local mpv_cmd_format = "mpv --no-video --save-position-on-quit '%s' > %s"
local icon           = "\u{fa1e}"
local red            = "#CF0000"

local function run(command)
  local prog = io.popen(command)
  local result = prog:read('*all')
  prog:close()
  return result
end

function MPV:new(args)
  local obj = setmetatable({}, MPV)

  -- Create imagebox widget
  obj.widget    = wibox.widget.textbox("")
  obj.color     = args.color or red
  obj.pid       = nil
  obj.widget:set_font(args.font)

  obj:update("-")

  return obj
end

function MPV:stop()
  if self.pid ~= nil then
    os.execute(string.format("kill %d", self.pid))
  end
  self:update("-")
end

function MPV:play(content)
  local cmd = string.format(mpv_cmd_format, content, mpv_logfile)
  self.pid = awful.spawn.with_shell(cmd)
  self:update("playing from mpv")
end

function MPV:update(text)
  self.widget:set_markup_silently(markup(self.color, text))
end

function MPV.mt:__call(...)
    return MPV.new(...)
end

return MPV
