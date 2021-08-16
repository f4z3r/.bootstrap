------------------------------------------------------------------------------
-- luakit configuration file, more information at https://luakit.github.io/ --
------------------------------------------------------------------------------

require "lfs"

-- Check for lua configuration files that will never be loaded because they are
-- shadowed by builtin modules.
table.insert(package.loaders, 2, function (modname)
    if not package.searchpath then return end
    local f = package.searchpath(modname, package.path)
    if not f or f:find(luakit.install_paths.install_dir .. "/", 0, true) ~= 1 then
        return
    end
    local lf = luakit.config_dir .. "/" .. modname:gsub("%.","/") .. ".lua"
    if f == lf then
        msg.warn("Loading local version of '" .. modname .. "' module: " .. lf)
    elseif lfs.attributes(lf) then
        msg.warn("Found local version " .. lf
            .. " for core module '" .. modname
            .. "', but it won't be used, unless you update 'package.path' accordingly.")
    end
end)

require "unique_instance"

-- Set the number of web processes to use. A value of 0 means 'no limit'. This
-- has no effect since WebKit 2.26
luakit.process_limit = 4
-- set spell checking
luakit.enable_spell_checking = true
luakit.spell_checking_languages = { "lang_en", "lang_de", "lang_fr", }
-- Set the cookie storage location
soup.cookies_storage = luakit.data_dir .. "/cookies.db"

-- Load library of useful functions for luakit
local lousy = require "lousy"

-- Load users theme
-- ("$XDG_CONFIG_HOME/luakit/theme.lua" or "/etc/xdg/luakit/theme.lua")
lousy.theme.init(lousy.util.find_config("theme.lua"))
assert(lousy.theme.get(), "failed to load theme")

-- Load users window class
-- ("$XDG_CONFIG_HOME/luakit/window.lua" or "/etc/xdg/luakit/window.lua")
local window = require "window"

-- Load users webview class
-- ("$XDG_CONFIG_HOME/luakit/webview.lua" or "/etc/xdg/luakit/webview.lua")
local webview = require "webview"

webview.add_signal("init", function (view)
    view:add_signal("navigation-request", function (_, uri)
        -- gmail redirect
        if string.match(string.lower(uri), "^mailto:") then
            local mailto = "https://mail.google.com/mail/?extsrc=mailto&url=%s"
            local w = window.ancestor(v)
            w:new_tab(string.format(mailto, uri))
            return false
        end

        -- blank page color switch
        if uri == "about:blank" then
            local html = "<html><body bgcolor='#000000'></body></html>"
            view:load_string(html, "about:blank")
            return true
        end
    end)
end)

-- Add luakit;//log/ chrome page
local log_chrome = require "log_chrome"

window.add_signal("build", function (w)
    local widgets, l, r = require "lousy.widget", w.sbar.l, w.sbar.r

    -- Left-aligned status bar widgets
    l.layout:pack(widgets.uri())
    l.layout:pack(widgets.hist())
    l.layout:pack(widgets.progress())

    -- Right-aligned status bar widgets
    r.layout:pack(widgets.buf())
    r.layout:pack(log_chrome.widget())
    r.layout:pack(widgets.ssl())
    r.layout:pack(widgets.tabi())
    r.layout:pack(widgets.scroll())
end)

-- Load luakit binds and modes
local modes = require "modes"
local binds = require "binds"

-- add fd bind
modes.remap_binds("all", {
        { "fd", "<Escape>", false },
    })

local settings = require "settings"
require "settings_chrome"

settings.application.prefer_dark_mode = true
settings.always_save = true
settings.window.home_page = "https://www.hackernoon.com"
settings.window.scroll_step = 60
settings.window.close_with_last_tab = true
settings.webview.zoom_level = 150
settings.webview.enable_smooth_scrolling = true

local search_engines = {
    ddg  = "https://duckduckgo.com/?q=%s",
    al = "https://www.archlinux.org/packages/?q=%s",
    aur = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go",
}

search_engines.default = search_engines.ddg
settings.window.search_engines = search_engines


----------------------------------
-- Optional user script loading --
----------------------------------

-- Add adblock
local adblock = require "adblock"
local adblock_chrome = require "adblock_chrome"

local webinspector = require "webinspector"

-- Add uzbl-like form filling
local formfiller = require "formfiller"

-- Add proxy support & manager
local proxy = require "proxy"

-- Add cache control (clear-data, clear-favicon-db)
local clear_data = require "clear_data"

-- Add quickmarks support & manager
local quickmarks = require "quickmarks"

-- Add session saving/loading support
local session = require "session"

-- Add command to list closed tabs & bind to open closed tabs
local undoclose = require "undoclose"

-- Add command to list tab history items
local tabhistory = require "tabhistory"

-- Add command to list open tabs
local tabmenu = require "tabmenu"

-- Add gopher protocol support (this module needs luasocket)
-- local gopher = require "gopher"

-- Add greasemonkey-like javascript userscript support
local userscripts = require "userscripts"

-- Add bookmarks support
local bookmarks = require "bookmarks"
local bookmarks_chrome = require "bookmarks_chrome"

-- Add download support
local downloads = require "downloads"
local downloads_chrome = require "downloads_chrome"

downloads.default_dir = os.getenv("HOME") .. "/Downloads"

-- Add automatic PDF downloading and opening
local viewpdf = require "viewpdf"

-- Example using xdg-open for opening downloads / showing download folders
downloads.add_signal("open-file", function (file)
    luakit.spawn(string.format("xdg-open %q", file))
    return true
end)

-- Add vimperator-like link hinting & following
-- Customize to use letters
local follow = require "follow"
local select = require("select")
-- hint label
select.label_maker = function ()
    local chars = charset("asdfghjklqweruiop")
    return trim(sort(reverse(chars)))
end
-- Match only hint label text
follow.pattern_maker = follow.pattern_styles.match_label
follow.stylesheet = [===[
#luakit_select_overlay {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 2147483647; /* Maximum allowable on WebKit */
}
#luakit_select_overlay .hint_overlay {
    display: block;
    position: absolute;
    background-color: #ffff99;
    border: 1px dotted #000;
    opacity: 0.3;
}
#luakit_select_overlay .hint_label {
    display: block;
    position: absolute;
    background-color: #000088;
    border: 1px dashed #000;
    color: #fff;
    font-size: 14px;
    font-family: monospace, courier, sans-serif;
    opacity: 0.6;
}
#luakit_select_overlay .hint_selected {
    background-color: #00ff00 !important;
}
]===]

-- Add command history
local cmdhist = require "cmdhist"

-- Add search mode & binds
local search = require "search"

-- Add ordering of new tabs
local taborder = require "taborder"

-- Save web history
local history = require "history"
local history_chrome = require "history_chrome"

local help_chrome = require "help_chrome"
local binds_chrome = require "binds_chrome"

-- Add command completion
local completion = require "completion"

-- Press Control-E while in insert mode to edit the contents of the currently
-- focused <textarea> or <input> element, using `xdg-open`
local open_editor = require "open_editor"

-- NoScript plugin, toggle scripts and or plugins on a per-domain basis.
-- `,ts` to toggle scripts, `,tp` to toggle plugins, `,tr` to reset.
-- If you use this module, don't use any site-specific `enable_scripts` or
-- `enable_plugins` settings, as these will conflict.
--require "noscript"

local follow_selected = require "follow_selected"
local go_input = require "go_input"
local go_next_prev = require "go_next_prev"
local go_up = require "go_up"

-- Filter Referer HTTP header if page domain does not match Referer domain
require_web_module("referer_control_wm")

local error_page = require "error_page"

-- Add userstyles loader
local styles = require "styles"

-- Hide scrollbars on all pages
local hide_scrollbars = require "hide_scrollbars"

-- Add a stylesheet when showing images
local image_css = require "image_css"

-- Add a new tab page
local newtab_chrome = require "newtab_chrome"

-- Add tab favicons mod
local tab_favicons = require "tab_favicons"

-- Add :view-source command
local view_source = require "view_source"

-- Put "userconf.lua" in your Luakit config dir with your own tweaks; if this is
-- permanent, no need to copy/paste/modify the default rc.lua whenever you
-- update Luakit.
if pcall(function () lousy.util.find_config("userconf.lua") end) then
    require "userconf"
end

-----------------------------
-- End user script loading --
-----------------------------

-- Restore last saved session
local w = (not luakit.nounique) and (session and session.restore())
if w then
    for i, uri in ipairs(uris) do
        w:new_tab(uri, { switch = i == 1 })
    end
else
    -- Or open new window
    window.new(uris)
end
