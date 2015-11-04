-- Load Extensions
local application = require "mjolnir.application"
local window      = require "mjolnir.window"
local hotkey      = require "mjolnir.hotkey"
local fnutils     = require "mjolnir.fnutils"
local alert       = require "mjolnir.alert"
local grid        = require "mjolnir.bg.grid"
-- Music controls
local spotify     = require "mjolnir.lb.spotify"
local audiodevice = require "mjolnir._asm.sys.audiodevice"
-- Sound and Notifications
local sound = require "mjolnir._asm.ui.sound"
local alert_sound = sound.get_byfile("alert.wav")
local tink_sound  = sound.get_byname("Tink") -- Not actually used, just as a nice example.
                                             -- More sounds in /System/Library/Sounds

-- Set up hotkey combinations
-- local mash      = {"cmd", "alt", "ctrl"}
-- local mashshift = {"cmd", "alt", "shift"}
local hit = {"cmd", "ctrl"}
local hits = {"cmd", "ctrl", "shift"}

-- Set grid size.
grid.GRIDWIDTH  = 12
grid.GRIDHEIGHT = 12
grid.MARGINX    = 0
grid.MARGINY    = 0

local function opendictionary()
  alert.show("Lexicon, at your service.", 0.75)
  application.launchorfocus("Dictionary")
end

local function focus_first_valid_window(ordered_wins)
  for _, win in pairs(ordered_wins) do
    win:focus()
    if window.focusedwindow():id() == win:id() then return true end
  end
  return false
end

local function focusnextwindow()
  local app_windows = application.allwindows(window.focusedwindow():application())
  local current_id = window.focusedwindow():id()
  local bigger_windows = fnutils.filter(app_windows, function(win) return (win:id() > current_id) end)
  local smaller_windows = fnutils.filter(app_windows, function(win) return (win:id() < current_id) end)
  table.sort(bigger_windows, function(a, b) return a:id() < b:id() end)
  table.sort(smaller_windows, function(a, b) return a:id() < b:id() end)
  if not focus_first_valid_window(bigger_windows) then
    focus_first_valid_window(smaller_windows)
  end
end

hotkey.bind({"ctrl"}, "tab", focusnextwindow)

-- Maximize and Minimize the current window
hotkey.bind(hit, 'M', grid.maximize_window)
hotkey.bind(hits, 'M', function() window.focusedwindow():minimize() end)

-- Spotify interaction
hotkey.bind(hits, 'space', spotify.play)
-- hotkey.bind(hits, 'K', spotify.play)
-- hotkey.bind(hits, 'J', spotify.pause)
hotkey.bind(hits, 'K', function() audiodevice.defaultoutputdevice():setvolume(audiodevice.current().volume + 5) end)
hotkey.bind(hits, 'J', function() audiodevice.defaultoutputdevice():setvolume(audiodevice.current().volume - 5) end)
hotkey.bind(hits, 'L', spotify.next)
hotkey.bind(hits, 'H', spotify.previous)

-- Speaker Volume
-- hotkey.bind(hit, 'k', function() audiodevice.defaultoutputdevice():setvolume(audiodevice.current().volume + 5) end)
-- hotkey.bind(hit, 'j', function() audiodevice.defaultoutputdevice():setvolume(audiodevice.current().volume - 5) end)

hotkey.bind(hits, 'left',  function() window.focusedwindow():focuswindow_west() end)
hotkey.bind(hits, 'right', function() window.focusedwindow():focuswindow_east() end)
hotkey.bind(hits, 'up',    function() window.focusedwindow():focuswindow_north() end)
hotkey.bind(hits, 'down',  function() window.focusedwindow():focuswindow_south() end)

-- hotkey.bind(mash, 'D', opendictionary)

-- hotkey.bind(mash, ';', function() grid.snap(window.focusedwindow()) end)
-- hotkey.bind(mash, "'", function() fnutils.map(window.visiblewindows(), grid.snap) end)

-- hotkey.bind(mash,      '=', function() grid.adjustwidth(1) end)
-- hotkey.bind(mash,      '-', function() grid.adjustwidth(-1) end)
-- hotkey.bind(mashshift, '=', function() grid.adjustheight(1) end)
-- hotkey.bind(mashshift, '-', function() grid.adjustheight(-1) end)

-- hotkey.bind(mashshift, 'left',  function() window.focusedwindow():focuswindow_west() end)
-- hotkey.bind(mashshift, 'right', function() window.focusedwindow():focuswindow_east() end)
-- hotkey.bind(mashshift, 'up',    function() window.focusedwindow():focuswindow_north() end)
-- hotkey.bind(mashshift, 'down',  function() window.focusedwindow():focuswindow_south() end)

-- hotkey.bind(mash,      'M', grid.maximize_window)
-- hotkey.bind(mashshift, 'M', function() window.focusedwindow():minimize() end)

-- hotkey.bind(mash,      'F', function() window.focusedwindow():setfullscreen(true) end)
-- hotkey.bind(mashshift, 'F', function() window.focusedwindow():setfullscreen(false) end)

-- hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
-- hotkey.bind(mash, 'P', grid.pushwindow_prevscreen)

-- hotkey.bind(mash, 'J', grid.pushwindow_down)
-- hotkey.bind(mash, 'K', grid.pushwindow_up)
-- hotkey.bind(mash, 'H', grid.pushwindow_left)
-- hotkey.bind(mash, 'L', grid.pushwindow_right)

-- hotkey.bind(mash, 'U', grid.resizewindow_taller)
-- hotkey.bind(mash, 'O', grid.resizewindow_wider)
-- hotkey.bind(mash, 'I', grid.resizewindow_thinner)
-- hotkey.bind(mash, 'Y', grid.resizewindow_shorter)

-- hotkey.bind(mashshift, 'space', spotify.displayCurrentTrack)
-- hotkey.bind(mashshift, 'P',     spotify.play)
-- hotkey.bind(mashshift, 'O',     spotify.pause)
-- hotkey.bind(mashshift, 'N',     spotify.next)
-- hotkey.bind(mashshift, 'I',     spotify.previous)

-- hotkey.bind(mashshift, 'T', function() alert.show(os.date("%A %b %d, %Y - %I:%M%p"), 4) end)


alert_sound:play()
alert.show("Mjolnir now rests safely in your hand", 3)
