-- application shortcuts
local bindings = {
    { key = "j", app = "Google Chrome" },
    { key = "k", app = "Visual Studio Code" },
    { key = "l", app = "Cursor"},
    { key = "p", app = "Preview" },
    { key = "o", app = "Obsidian" }
}

for _, b in ipairs(bindings) do
    hs.hotkey.bind({"cmd", "ctrl"}, b.key, function()
        hs.application.launchOrFocus(b.app)
    end)
end

-- window sizing shortcuts
local windowSizingModifiers = {"cmd", "ctrl", "alt"}

hs.hotkey.bind(windowSizingModifiers, "=", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(windowSizingModifiers, "1", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(windowSizingModifiers, "2", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(windowSizingModifiers, "3", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(windowSizingModifiers, "4", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 3
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(windowSizingModifiers, "5", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + 2 * (max.w / 3)
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(windowSizingModifiers, "6", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = (2 * max.w) / 3
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(windowSizingModifiers, "7", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 3
    f.y = max.y
    f.w = (2 * max.w) / 3
    f.h = max.h
    win:setFrame(f)
end)

-- chrome window shortcuts
function focusChromeWindowByName(name)
    local app = hs.application.find("Google Chrome")
    for _, win in ipairs(app:allWindows()) do
        local title = win:title()
        if title and string.find(title:lower(), name:lower()) then
            win:focus()
            return
        end
    end
end

local chromeWindowHotkeys = {
    ["1"] = "Home",
    ["2"] = "Media",
    ["3"] = "IntPrep",
    ["4"] = "Hacking",
    ["5"] = "Study",
    ["6"] = "SPatriot"
}

for key, name in pairs(chromeWindowHotkeys) do
    hs.hotkey.bind({"cmd", "ctrl"}, key, function()
        focusChromeWindowByName(name)
    end)
end