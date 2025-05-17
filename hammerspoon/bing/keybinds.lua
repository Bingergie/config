local function launchOrFocusByBundleID(bundleID)
    -- Get application reference (works across versions)
    local app = hs.application.get(bundleID, function(app)
        return app:bundleID() == bundleID
    end)

    if app then
        -- Create window filter for current space
        local wf = hs.window.filter.new(function(win)
            return win:application():bundleID() == bundleID
        end):setCurrentSpace(true)

        local targetWindows = wf:getWindows()
        if #targetWindows > 0 then
            local targetIDs = {}
            for _, win in ipairs(targetWindows) do
                targetIDs[win:id()] = true
            end

            -- Check front-to-back windows
            for _, win in ipairs(hs.window.orderedWindows()) do
                if targetIDs[win:id()] then
                    win:focus()
                    return
                end
            end
        end
        app:activate()
    else
        hs.application.launchOrFocusByBundleID(bundleID)
    end
end

-- Hotkeys with bundle IDs
hs.hotkey.bind({ "ctrl", "alt" }, "1", nil, function()
    launchOrFocusByBundleID("com.apple.Safari") -- Safari
end)

hs.hotkey.bind({ "ctrl", "alt" }, "2", nil, function()
    launchOrFocusByBundleID("net.kovidgoyal.kitty") -- Kitty
end)

hs.hotkey.bind({ "ctrl", "alt" }, "3", nil, function()
    launchOrFocusByBundleID("com.apple.Finder") -- Finder
end)

hs.hotkey.bind({ "ctrl", "alt" }, "4", nil, function()
    launchOrFocusByBundleID("com.apple.mail") -- Mail
end)

hs.hotkey.bind({ "ctrl", "alt" }, "8", nil, function()
    launchOrFocusByBundleID("net.sourceforge.skim-app.skim") -- Skim
end)

hs.hotkey.bind({ "ctrl", "alt" }, "9", nil, function()
    launchOrFocusByBundleID("com.apple.iWork.Pages") -- Pages
end)

hs.hotkey.bind({ "ctrl", "alt" }, "0", nil, function()
    launchOrFocusByBundleID("com.avid.sibelius") -- Sibelius
end)

hs.window.filter.forceRefreshOnSpaceChange = true  -- Maintain accurate space tracking

