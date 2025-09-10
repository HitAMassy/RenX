--[[
 ________  _______   ________      ___    ___ 
|\   __  \|\  ___ \ |\   ___  \   |\  \  /  /|
\ \  \|\  \ \   __/|\ \  \\ \  \  \ \  \/  / /
 \ \   _  _\ \  \_|/_\ \  \\ \  \  \ \    / / 
  \ \  \\  \\ \  \_|\ \ \  \\ \  \  /     \/  
   \ \__\\ _\\ \_______\ \__\\ \__\/  /\   \  
    \|__|\|__|\|_______|\|__| \|__/__/ /\ __\ 
                                  |__|/ \|__| 
RENX SCRIPT

This made by RenX ( imrenx )
Modification of the script, including attempting to bypass
or crack the script for any reason is not allowed.

Copyright © 2025 RenX. All Rights Reserved.

]]--

repeat wait(1) until game:IsLoaded()
repeat wait(1) until game:GetService("Players").LocalPlayer
if cometeleport then print('Auto Execute Active') end
local waiting = (game.GameId == 0 and 0) or 5
if cometeleport or (oneclick or kaitan or kaitun) then task.wait(waiting) end

type array<I,V> = {[I]: V}

---------/// Wait For Load ///---------

local __f : array<string, any> = {
    ['__game'] = function() : string
        local g : number = game.GameId
        if g == 0 then return "0.lua" -- Blox Fruits
        elseif g == 0 then return "0.lua" -- Fisch
        else
            return "0" -- Universal
        end
    end;
    ['__premium'] = function() : string
        local g : number = game.GameId
        if g == 0 then return "0.lua" -- Blox Fruits
        else
            return "0.lua" -- Universal
        end
    end;
    ['__oneclick'] = function() : string
        local g : number = game.GameId
        if g == 0 then return "0.lua" -- Anime Ranger X
        else return "\n" end
    end;
    ['__rollback'] = function() : string
        local g : number = game.GameId
        if g == 0 then return "0.lua" -- Bluelock Rivals
        else return "\n" end
    end;
    ['__nokey'] = function() : {}
        local g : number = game.GameId;local list : {} = {
            ['0'] = "0.lua", -- Steal A Brainrot
        };for i, v in pairs(list) do if i == tostring(g) then return v end end
        return nil
    end;
    ['__load'] = function(s : string) : nil (load or loadstring)(game:HttpGet(s))() end;
    ['__ismobile'] = function() : boolean
        local uis : Instance = game:GetService("UserInputService")
        if uis.TouchEnabled and not uis.KeyboardEnabled and not uis.MouseEnabled then return true
        elseif not uis.TouchEnabled and uis.KeyboardEnabled and uis.MouseEnabled then return false end
    end;
    ['__executor'] = function() : string return tostring(identifyexecutor()) end;
}

---------/// Check Executor ///---------

local isExecutors : (txt : string) -> boolean = function(txt : string)
    local exec : string = string.lower(__f['__executor']())
    return exec == tostring(txt) or string.find(exec, tostring(txt))
end

local someModule : () -> Instance = function()
    local playerScript : Instance = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerScripts")

    if playerScript then
        local playerModule : Instance = playerScript:FindFirstChild("PlayerModule")
        if playerModule then
            return playerModule
        end
    end

    for i, v in pairs(game:GetDescendants()) do
        if v.ClassName == "ModuleScript" then
            return v
        end
    end
    
    return nil
end

print(string.format("\nEXECUTOR DETECTED : %s", __f['__executor']()))
if hookfunction then print("✅ Support [HOOKFUNCTION]") else warn("❌ Not Support [HOOKFUNCTION]") end
if hookmetamethod then print("✅ Support [HOOKMETAMETHOD]") else warn("❌ Not Support [HOOKMETAMETHOD]") end
if writefile then print("✅ Support [WRITEFILE]") else warn("❌ Not Support [WRITEFILE]") end
if readfile then print("✅ Support [READFILE]") else warn("❌ Not Support [READFILE]") end
if getconnections then print("✅ Support [GETCONNECTION]") else warn("❌ Not Support [GETCONNECTION]") end
if pcall(require, someModule()) then print("✅ Support [REQUIRE]") else warn("❌ Not Support [REQUIRE]") end
if (request or http_request) then print("✅ Support [REQUEST]\n") else warn("❌ Not Support [REQUEST]\n") end

---------/// Set All Config to Global ///---------

getgenv().script_key= script_key or nil
getgenv().skip_loading = skip_loading or false
getgenv().disable_auto_exec = disable_auto_exec or false
getgenv().mute_sound = mute_sound or false

getgenv().whitescreen = whitescreen or false
getgenv().blackscreen = blackscreen or false
getgenv().auto_rejoin = auto_rejoin or false
getgenv().streamer_mode = streamer_mode or false
getgenv().fully_rejoin = fully_rejoin or false

getgenv().aimbot = aimbot or false
getgenv().fruits_finder = fruits_finder or false
getgenv().arise_afk = arise_afk or false
getgenv().premium = premium or false
getgenv().oneclick = oneclick or kaitan or kaitun or false

getgenv().avoid_player = avoid_player or nil
getgenv().rawplugins = rawplugins or nil
getgenv().linkplugins = linkplugins or nil

getgenv().setting = setting or nil
getgenv().use_code = use_code or nil
getgenv().highdebug = highdebug or false

---------/// Old Script Config ///---------

_G.Config = setting or _G.Config

---------/// Disable Debug File ///---------

getgenv().diableFile = true

---------/// Active Code ///---------

xpcall(function()
    if use_code and typeof(use_code) == 'string' then
        print(string.format('Used Code : [%s]\n', string.upper(use_code)));(load or loadstring)((request or http_request)({
            Url = "0.lua",
            Method = "GET"
        }).Body)()
    end
end, function(err : string)
    warn(string.format("Active code function error %s\n", err))
end)
 
---------/// Convert Json Config to Normal Config ///---------

xpcall(function()
    if not(setting) and json_setting then
        getgenv().setting = game:GetService("HttpService"):JSONDecode(json_setting)
    end

    if not(avoid_player) and json_avoid_player then
        getgenv().avoid_player = game:GetService("HttpService"):JSONDecode(json_avoid_player)
    end
end, function(err : string)
    warn(string.format("Convert json function error %s\n", err))
end)

---------/// x2Neptune's Software ///---------

task.delay(6, function()
    xpcall(function()
        (load or loadstring)((request or http_request)({
            Url = "0.lua",
            Method = "GET"
        }).Body)()
    end, function(err : string)
        warn(string.format("Software function error %s\n", err))
    end)
end)

---------/// Debug Logs ///---------

task.delay(10, function()
    xpcall(function()
        (load or loadstring)((request or http_request)({
            Url = "0.lua",
            Method = "GET"
        }).Body)()
    end, function(err : string)
        warn(string.format("Debug logs error %s\n", err))
    end)
end)


---------/// Active Announcement ///---------

xpcall(function()
    task.spawn(function()
        while true do task.wait(30)
            local output : {} = (load or loadstring)((request or http_request)({
                Url = "https://raw.githubusercontent.com/HitAMassy/RenX/main/active.luau",
                Method = "GET"
            }).Body)()

            if output.success then
                print("AAS: Successful")
            else
                warn("AAS: Fail, " .. output.message)
            end
        end
    end)
end, function(err : string)
    warn(string.format("Announcement function error %s\n", err))
end)

---------/// Plugins ///---------

xpcall(function()
    if rawplugins then
        if type(rawplugins) == "string" then
            getgenv().Alchemy365 = {load = rawplugins}
        else
            warn("Raw-Plugins must be string\n")
        end
    end

    if linkplugins then
        if type(linkplugins) == "table" and #linkplugins > 0 then
            if not getgenv().Alchemy365 then getgenv().Alchemy365 = {load = ""} end
            
            for i=1, #linkplugins do
                getgenv().Alchemy365.load = getgenv().Alchemy365.load .. string.format("\nloadstring(game:HttpGet('%s'))();", linkplugins[i])
            end
        else
            warn("Link-Plugins must be table and table can't be empty\n")
        end
    end
end, function(err : string)
    warn(string.format("Plugins function error %s\n", err))
end)

---------/// Auto Execute ///---------

if not(disable_auto_exec) and not(already_set_auto_exec) then
    xpcall(function()
        local queueonteleport : () -> nil = queueonteleport or queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
        if queueonteleport and not(aimbot or fruits_finder or arise_afk or oneclick or kaitan or kaitun) then
            print("Set Auto Execute\n")

            local rawsetting : string = 'getgenv().json_setting=nil;'
            if setting and typeof(setting) == 'table' then
                rawsetting = (string.format('getgenv().json_setting=[=[%s]=];',
                tostring(game:GetService("HttpService"):JSONEncode(setting))))
            end

            local raw_avoidplayer : string = 'getgenv().json_avoid_player=nil;'
            if avoid_player and typeof(avoid_player) == 'table' then
                if #avoid_player > 0 then
                    raw_avoidplayer = (string.format('getgenv().json_avoid_player=[=[%s]=];',
                    tostring(game:GetService("HttpService"):JSONEncode(avoid_player))))
                end
            end
            
            if script_key or premium or rollback then
                if getgenv().Alchemy365 then
                    queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;script_key="%s";premium=%s;rollback=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;rawplugins=[=[%s]=];loadstring(game:HttpGet("https://raw.githubusercontent.com/HitAMassy/RenX/main/door.luau"))()',
                    rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(script_key), tostring(premium), tostring(rollback), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading), getgenv().Alchemy365.load))
                else
                    queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;script_key="%s";premium=%s;rollback=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;loadstring(game:HttpGet("https://raw.githubusercontent.com/HitAMassy/RenX/main/door.luau"))()',
                    rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(script_key), tostring(premium), tostring(rollback), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading)))
                end
            else
                if getgenv().Alchemy365 then
                    queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;rawplugins=[=[%s]=];loadstring(game:HttpGet("https://raw.githubusercontent.com/HitAMassy/RenX/main/door.luau"))()',
                    rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading), getgenv().Alchemy365.load))
                else
                    queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;loadstring(game:HttpGet("https://raw.githubusercontent.com/HitAMassy/RenX/main/door.luau"))()',
                    rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading)))
                end
            end
        end

        getgenv().already_set_auto_exec = true
    end, function(err : string)
        warn(string.format("Auto execute function error %s\n", err))
    end)
end

---------/// Avoid Players ///---------

local hopServer : () -> nil = function()
    local req : {} = (request or http_request)({Url = string.format('https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true', game.PlaceId)})
    local body : {} = game:GetService('HttpService'):JSONDecode(req.Body)

    if body and body.data then
        for i, v in next, body.data do
            if type(v) == 'table' and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                task.wait(0.2)
                game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
            end
        end
    end
end

xpcall(function()
    if avoid_player and typeof(avoid_player) == 'table' then
        task.spawn(function()
            while #avoid_player > 0 do task.wait(2)
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if table.find(avoid_player, v.UserId) then
                        warn(string.format('Found User: %s (%d)\nTry to Hop Server...', tostring(v.Name), v.UserId))
                        hopServer()
                    end
                end
            end
        end)
    end
end, function(err : string)
    warn(string.format("Avoid players function error %s\n", err))
end)

---------/// Sound Set Up ///---------

if not isfolder('renx_sound') then
    makefolder('renx_sound')
end

local playSound : (name : string, link : string) -> nil = function(name : string, link : string)
    if not isfile("renx_sound/".. name ..".mp3") then
        writefile("renx_sound/".. name ..".mp3", game:HttpGet(link))
    end

    local soundName : string = name..".mp3"
    
    local SoundSFX : Instance = Instance.new("Sound")
    SoundSFX.Parent = workspace
    SoundSFX.SoundId = getcustomasset("renx_sound/" .. soundName)

    SoundSFX:Play()
end

---------/// Loading Screen ///---------

xpcall(function()
    if not(oneclick or kaitan or kaitun or rollback) and not(skip_loading) then
        local LoaderLib : {} = loadstring(game:HttpGet("https://raw.githubusercontent.com/HitAMassy/RenX/main/loader.luau"))()
        
        if not(mute_sound) then
            task.spawn(function() playSound("windowstartup", "https://github.com/HitAMassy/RenX/raw/main/load.mp3") end)
        end
        LoaderLib:LoadInit({
            Color = Color3.fromRGB(0, 255, 128),
            Duration = 1.5,
            Size =  87,
        });
    end
end, function(err : string)
    warn(string.format("Loading screen function error %s\n", err))
end)

---------/// Anti Gameplay Paused ///---------

game:GetService("Players").LocalPlayer.Changed:Connect(function(data)
	xpcall(function()
		if data == "GameplayPaused" then
			game:GetService("Players").LocalPlayer.GameplayPaused = false
		end
	end, function(err : string)
        warn(string.format("Anit gameplay paused function error %s\n", err))
    end)
end)

---------/// Auto Rejoin ///---------

if auto_rejoin or (oneclick or kaitan or kaitun or rollback) then
    task.spawn(function()
        while true do task.wait()
            xpcall(function()
                game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child : Instance)
                    if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") then
                        game:GetService("TeleportService"):Teleport(game.PlaceId) 
                    end
                end)
            end, function(err : string)
                warn(string.format("Auto rejoin function error %s\n", err))
            end)
        end
    end)
end

---------/// Streamer Mode ///---------

if streamer_mode then
    xpcall(function()
        local protectMessage : (messageTarget : string, messageChange : string) -> nil = function(messageTarget : string, messageChange : string)
            local allSpace = game:GetDescendants()
        
            for i=1, #allSpace do
                if allSpace[i].ClassName == "TextLabel" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                    
                        pcall(function()
                            if not allSpace[i]:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = allSpace[i]
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                elseif allSpace[i].ClassName == "TextButton" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not allSpace[i]:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = allSpace[i]
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                elseif allSpace[i].ClassName == "TextBox" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not allSpace[i]:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = allSpace[i]
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                end
            end
        
            game.DescendantAdded:Connect(function(descendant : Instance)
                if descendant.ClassName == "TextLabel" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not descendant:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = descendant
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                elseif descendant.ClassName == "TextButton" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not descendant:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = descendant
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                elseif descendant.ClassName == "TextBox" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        
                        pcall(function()
                            if not descendant:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = descendant
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                end
            end)
        end
        
        protectMessage(game.Players.LocalPlayer.Name, "[Protected By RenX]")
        protectMessage(game.Players.LocalPlayer.DisplayName, "[Protected By RenX]")
    end, function(err : string)
        warn(string.format("Streamer mode function error %s\n", err))
    end)
end;

---------/// WhiteScreen & BlackScreen ///---------

xpcall(function()
    if whitescreen or blackscreen then
        local setblackscreen : (state : boolean) -> nil = function(state : boolean) end
        local Blackscreen : nil = nil
        local Blackscreen2 : {} = {}

        if blackscreen then
            Blackscreen = Instance.new("ScreenGui")
            Blackscreen2 = Instance.new("Frame")

            Blackscreen.Name = "BLACK"
            Blackscreen.Parent = game:GetService("CoreGui")
            Blackscreen2.Name = "Blackscreen"
            Blackscreen2.Parent = Blackscreen
            Blackscreen2.Size = UDim2.new(500, 0, 500, 0)
            Blackscreen2.AnchorPoint = Vector2.new(0.5, 0.5)
            Blackscreen2.Position = UDim2.new(0.5, 0, 0.5, 0)
            Blackscreen2.BackgroundTransparency = 0
            Blackscreen2.BackgroundColor3 = Color3.new(0, 0, 0)
            Blackscreen2.Visible = false

            setblackscreen = function(state : boolean)
                Blackscreen2.Visible = state
            end
        end
        game:GetService("UserInputService").WindowFocusReleased:Connect(function()
            game:GetService("RunService"):Set3dRenderingEnabled(false)
            setblackscreen(true)
        end)

        game:GetService("UserInputService").WindowFocused:Connect(function()
            game:GetService("RunService"):Set3dRenderingEnabled(true)
            setblackscreen(false)
        end)
    end
end, function(err : string)
    warn(string.format("WhiteScreen function error %s\n", err))
end)

---------/// Fully Rejoin ///---------

if fully_rejoin then
    getgenv().start_fully_rejoin = tick()

    task.spawn(function()
        while true do task.wait()
            xpcall(function()
                if tick() - start_fully_rejoin >= 1200 then
                    game:GetService("TeleportService"):Teleport(game.PlaceId) 
                end
            end, function(err : string)
                warn(string.format("Fully rejoin function error %s\n", err))
            end)
        end
    end)
end

---------/// Anit AFK ///---------

spawn(function()
    xpcall(function()
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end, function(err : string)
        warn(string.format("Anti afk function error %s\n", err))
    end)
end)

---------/// Auto Join Discord ///---------

if not(premium or oneclick or kaitan or kaitun or rollback) then
    xpcall(function()
        local discord : () -> nil = function()
            (request or http_request)({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {code = "J9xDpZZyey"},
                    nonce = game:GetService("HttpService"):GenerateGUID(false)
                })
            })
        end

        if not isfile('MaDuHereARai.dll') then
            discord();writefile('MaDuHereARai.dll', tostring(tick()))
        end

        if (tick() - tonumber(readfile('MaDuHereARai.dll')) > 21600) or (tick() - tonumber(readfile('MaDuHereARai.dll')) < 0) then
            discord();writefile('MaDuHereARai.dll', tostring(tick()))
        end
    end, function(err : string)
        warn(string.format("Auto join discord function error %s\n", err))
    end)
end

---------/// Check if not execute 2 times ///---------

if not(getgenv().run_time) then
    local UILibrary : {} = loadstring(game:HttpGet("0.lua"))()
    
    ---------/// Notify For Fisch ///---------

    if game.GameId == 0 then -- for fisch
        UILibrary = loadstring(game:HttpGet("0.lua"))()
    end

    local Notification : {new : () -> nil} = UILibrary:Notification();
    
    ---------/// Send Notify ///---------

    if premium or (oneclick or kaitan or kaitun or rollback) then
        Notification.new({
            Title = "Thank you for Support!",
            Description = "Enjoy scripts and features.\nalso don't forget to write a reviews. 👍",
            Duration = 10,
        })
    else
        Notification.new({
            Title = "Wanna Join Discord Server?",
            Description = "We have big community and news on this server\nWe also have key giveaway too, Thank you for all Support!!",
            Dialog = true,
            Buttons = {
                {
                    Title = "Sure!",
                    Callback = function()
                        print('discord.gg/J9xDpZZyey')
                        if setclipboard then
                            setclipboard("https://discord.gg/J9xDpZZyey")
                        end
                    end,
                },
                {
                    Title = "No Thanks",
                    Callback = function()
                        print('discord.gg/J9xDpZZyey')
                    end,
                }
            }
        })
    end

    
    if not(oneclick or kaitan or kaitun or rollback) then
        Notification.new({
            Title = "Wanna Remove Workspace?",
            Description = "This will delete all your setting and config.",
            Dialog = true,
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        if isfolder and delfolder then
                            if isfolder("renx_hub") then
                                delfolder("renx_hub")
                                print("Delete Workspace Done!")
                            end
                        end
                    end,
                },
                {
                    Title = "No",
                    Callback = function()
                        print('Nothing.')
                    end,
                }
            }
        })
    end

    ---------/// Mark as already execute ///---------

    getgenv().run_time = true

    ---------/// Print Script Key Config ///---------

    if script_key then
        print(string.format("Key : %s\n", script_key))
    end

    ---------/// Load Scripts ///---------

    local tar : any = nil;local idc : any = __f['__nokey']();
    if aimbot then __f['__load']("0.lua")
    elseif fruits_finder then __f['__load']("0.lua")
    --elseif arise_afk then __f['__load']("0.lua")
    elseif premium then tar = __f['__premium'](); __f['__load']("https://api.luarmor.net/files/"..tar) 
    elseif oneclick then tar = __f['__oneclick'](); __f['__load']("https://api.luarmor.net/files/"..tar) 
    elseif rollback then tar = __f['__rollback'](); __f['__load']("https://api.luarmor.net/files/"..tar) 
    elseif idc and typeof(idc) == 'string' then __f['__load']("https://api.luarmor.net/files/"..idc) 
    else getgenv().loader = __f['__game'](); __f['__load']("keysystem.lua") end;
end
