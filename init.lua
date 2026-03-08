-- application shortcuts
local bindings = {
    { key = "j", app = "Google Chrome" },
    { key = "k", app = "Visual Studio Code" },
}

for _, b in ipairs(bindings) do
    hs.hotkey.bind({"ctrl"}, b.key, function()
        hs.application.launchOrFocus(b.app)
    end)
end

-- window sizing shortcuts
local windowSizingModifiers = {"cmd", "ctrl", "alt"}

local function setWindowFrame(xRatio, yRatio, wRatio, hRatio)
    local win = hs.window.focusedWindow()
    if not win then return end
    local max = win:screen():frame()
    win:setFrame({
        x = max.x + xRatio * max.w,
        y = max.y + yRatio * max.h,
        w = wRatio * max.w,
        h = hRatio * max.h,
    })
end

local windowLayouts = {
    ["="] = {0,   0, 1,   1  }, -- full screen
    ["1"] = {0,   0, 1/2, 1  }, -- left half
    ["2"] = {1/2, 0, 1/2, 1  }, -- right half
    ["3"] = {0,   0, 1/3, 1  }, -- left third
    ["4"] = {1/3, 0, 1/3, 1  }, -- center third
    ["5"] = {2/3, 0, 1/3, 1  }, -- right third
    ["6"] = {0,   0, 2/3, 1  }, -- left two-thirds
    ["7"] = {1/3, 0, 2/3, 1  }, -- right two-thirds
}

for key, layout in pairs(windowLayouts) do
    hs.hotkey.bind(windowSizingModifiers, key, function()
        setWindowFrame(layout[1], layout[2], layout[3], layout[4])
    end)
end

-- chrome window shortcuts
-- keys map to Chrome profile name substrings; "9" focuses the default (non-profile) window
local chromeWindowHotkeys = {
    ["0"] = "DevBrowser",
}

local function focusChromeWindowByName(name)
    local app = hs.application.find("Google Chrome")
    if not app then return end
    for _, win in ipairs(app:allWindows()) do
        local title = win:title()
        if title and string.find(title:lower(), name:lower()) then
            win:focus()
            return
        end
    end
end

local function focusChromeDefaultProfile()
    local app = hs.application.find("Google Chrome")
    if not app then return end
    for _, win in ipairs(app:allWindows()) do
        local title = win:title()
        if title then
            local isOtherProfile = false
            for _, name in pairs(chromeWindowHotkeys) do
                if string.find(title:lower(), name:lower()) then
                    isOtherProfile = true
                    break
                end
            end
            if not isOtherProfile then
                win:focus()
                return
            end
        end
    end
end

hs.hotkey.bind({"ctrl"}, "9", focusChromeDefaultProfile)

for key, name in pairs(chromeWindowHotkeys) do
    hs.hotkey.bind({"ctrl"}, key, function()
        focusChromeWindowByName(name)
    end)
end
