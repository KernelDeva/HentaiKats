-- Environment Check Function
local function checkEnvironment()
    if not game or not game:IsLoaded() then
        error("Script cannot run outside Roblox environment, Master! UwU")
    end
end

-- Loader Name Check with Notify
local loaderName = "HentaiKats"
local function checkLoader()
    if not _G[loaderName .. "Loaded"] then
        library:Notify("Kitty Cat Notification", loaderName .. " has not loaded correctly, Master! Please ensure you're using the right loader UwU.")
        error(loaderName .. " has not loaded.")
    else
        library:Notify("Kitty Cat Notification", loaderName .. " has loaded successfully. Proceeding, Master! UwU")
    end
end

-- Notify function for consistent messaging
local function kittyCatNotify(message)
    library:Notify("Kitty Cat Notification", message .. " UwU, Master!")
end

-- Wait for game to fully load with notification
local function waitForGameLoad()
    if not game:IsLoaded() then
        game.Loaded:Wait()
        kittyCatNotify("The game has now fully loaded, Master UwU!")
    end
end

-- Load Osmium Library with Notify
local function loadLibrary()
    local success, library = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Osmium/main/OsmiumLibrary.lua")))
    if not success then
        kittyCatNotify("Failed to load Osmium Library, Master UwU! Error: " .. tostring(library))
        error("Failed to load Osmium Library")
    else
        kittyCatNotify("Successfully loaded Osmium Library, Master UwU!")
    end
    return library
end

-- Execute main logic with error handling
local function main()
    checkEnvironment()
    checkLoader()

    -- Load the Osmium Library
    local library = loadLibrary()

    -- Create UI Window
    local window = library:CreateWindow("Master's Cloud 🌸")

    -- Error Cleaning Function with Notify
    local function cleanErrors(err)
        print("Cleaning Errors: " .. err)
        kittyCatNotify("Cleaning errors, Master! Please wait UwU...")

        -- Simulated cleaning process with notifications
        for i = 1, 5 do
            task.wait(0.5)
            kittyCatNotify("Cleaning in progress UwU... (" .. i .. "/5)")
        end

        kittyCatNotify("All errors cleaned, Master UwU!")
    end

    -- Safe Execution Wrapper with Error Handling and Notifies
    local function KittyCatSafeExecution(func)
        local success, err = xpcall(func, function(e) return "Error during execution: " .. tostring(e) end)
        if not success then
            kittyCatNotify("Execution failed, Master UwU! " .. err)
            cleanErrors(err)
        else
            kittyCatNotify("Execution succeeded, Master UwU!")
        end
    end

    -- Example Feature Execution with Safe Handling
    KittyCatSafeExecution(function()
        kittyCatNotify("Executing main features, Master UwU!")
        
        -- Simulated logic with delay
        task.wait(2)
        
        kittyCatNotify("Main features executed successfully, Master UwU!")
    end)

    -- UI Tabs and Features
    local aimbotTab = window:CreateTab("Master's Aimbot 🌸")
    aimbotTab:AddToggle("Enable Aimbot", function(state)
        if state then
            kittyCatNotify("Aimbot enabled, Master UwU!")
        else
            kittyCatNotify("Aimbot disabled, Master UwU!")
        end
    end)

    aimbotTab:AddSlider("Master's Aimbot FOV 🌸", {Min = 30, Max = 360, Default = 90}, function(fov)
        kittyCatNotify("Aimbot FOV set to " .. tostring(fov) .. " degrees, Master UwU!")
    end)

    local silentAimTab = window:CreateTab("Master's Silent Aim 🌸")
    silentAimTab:AddToggle("Enable Silent Aim", function(state)
        if state then
            kittyCatNotify("Silent Aim enabled, Master UwU!")
        else
            kittyCatNotify("Silent Aim disabled, Master UwU!")
        end
    end)

    -- Anti-AFK Feature
    local antiAfkTab = window:CreateTab("Master's AntiAfk 🌸")
    antiAfkTab:AddToggle("Enable Anti-AFK", function(state)
        if state then
            kittyCatNotify("Master, You're Anti-AFK is On!")
            
            -- Anti-AFK Script Logic
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)

        else
            kittyCatNotify("Anti-AFK disabled, Master UwU!")
        end
    end)

    -- Your Kat's Favourite Tab
    local favouriteTab = window:CreateTab("Your Kat's Favourite Tab 🌸")
    favouriteTab:AddButton("Fist Me Master~", function()
        library:Notify("Kitty Cat Notification", "Master More Deeper~\n*Moans* M-master~\nDeeper Master~\nCum On Me Master~", {
            Title = "Your Kat's Favourite Tab UwU!",
            ButtonText = "Ok! My Little Kitty Cat!!"
        })
    end)

    -- Your Kat's Favourite Tab 2
    local favouriteTab2 = window:CreateTab("Your Kat's Favourite Tab 2 🌸")
    favouriteTab2:AddButton("Fuck Me Master~", function()
        library:Notify("Kitty Cat Notification", "Fuck me Master!!~\nFuck Me Deep~~\nAhh~ F-fuck me Master~", {
            Title = "Your Kat's Favourite Tab 2 UwU!",
            ButtonText = "Ok! My Little Kitty Cat!!"
        })
    end)

    -- New Click Me Tab
    local clickMeTab = window:CreateTab("Click Me 🌸")
    clickMeTab:AddLabel("This whole 'Master' thing is a joke. Please don't think I like calling you this, it's just for fun and stuff so yeah better not get weird vibes!")

    -- Error simulation to trigger cleaning process
    KittyCatSafeExecution(function()
        error("Simulated error for testing, Master UwU!")
    end)

    -- Credits Tab
    local creditsTab = window:CreateTab("Master's Credits 🌸")
    creditsTab:AddLabel("Credits :D")
    creditsTab:AddLabel("Discord: auti4sm")

    -- Notify when the entire script is fully loaded
    kittyCatNotify("Wait until Master Is Fully Loaded 🌸 UwU!")
end

-- Execute main function
main()
