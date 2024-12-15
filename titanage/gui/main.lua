repeat wait() until game:IsLoaded()
if game.PlaceId == 6737540754 or game.PlaceId == 7176980618 or game.PlaceId == 6803256560 then
    --Variables:
    local ws = game:GetService("Workspace")
    local plrs = game:GetService("Players")
    local rpls = game:GetService("ReplicatedStorage")
    local light = game:GetService("Lighting")
    local http = game:GetService("HttpService")
    local runs = game:GetService("RunService")
    local core = game:GetService("CoreGui")
    local lplr = plrs.LocalPlayer
    local mouse = lplr:GetMouse()

    if game.PlaceId == 6737540754 then
        remote = rpls:WaitForChild("RemoteEvent")
    elseif game.PlaceId == 7176980618 or game.PlaceId == 6803256560 then
        character = lplr.Character or lplr.CharacterAdded:Wait()
        data = lplr:WaitForChild("Data")
        remote = rpls:WaitForChild("Remotes")
    end

    local settings
    local defaultsettings = {
        AutoJoin = false,
        AutoQuest = false,
        AntiGrip = false,
        AntiDeath = false,
        Fullbright = false,
        TitanEsp = false,
        RemoveInjuries = false,
        LobbyGuiEnabled = false,
        GuiDisabled = false,
        AutoInvite = false,
        IgnoreSquads = false,
    }

    if not pcall(function()readfile("Titanage_Setting.cfg") end) then
        writefile("Titanage_Setting.cfg", http:JSONEncode(defaultsettings))
    end

    settings = http:JSONDecode(readfile("Titanage_Setting.cfg"))

    --Functions:
    local function save()
        writefile("Titanage_Setting.cfg", http:JSONEncode(settings))
    end

    --UI:
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/2kbyte/public/main/finity-ui.lua"))()
    local window = library.new("Titanage GUI | Press 'BackSlash' to hide this menu")
    local main = window:Category("Main")

    local mainsector = main:Sector("Main")
    local autojoin = mainsector:Cheat("Checkbox", "Auto Join PVE", function(AutoJoinEnabled)
        if AutoJoinEnabled then
            settings.AutoJoin = true
            save()
            if game.PlaceId == 6737540754 then
                remote:FireServer("PVE")
            end
        else
            settings.AutoJoin = false
            save()
        end
    end, {enabled = settings.AutoJoin})
    local autoquest = mainsector:Cheat("Checkbox", "Auto Quest", function(AutoQuestEnabled)
        if AutoQuestEnabled then
            settings.AutoQuest = true
            save()
            getgenv().autoquestloop = runs.RenderStepped:Connect(function()
                if game.PlaceId == 7176980618 then
                    if data.Quest.QuestName.Value == "" and data.QuestCooldown.Value == 0 then
                        for i = 1, 1 do
                            remote.DialogueEvent:InvokeServer(ws.NPCs.Levi, "I want to do a quest")
                        end
                    end
                end
            end)
        else
            settings.AutoQuest = false
            save()
            autoquestloop:Disconnect()
        end
    end, {enabled = settings.AutoQuest})
    local antigrip = mainsector:Cheat("Checkbox", "Anti-Grip", function(AntiGripEnabled)
        if AntiGripEnabled then
            settings.AntiGrip = true
            save()
            if game.PlaceId == 6803256560 then
                getgenv().gripcheck = character.DescendantAdded:Connect(function(v)
                    if v.Name == "Grip" then
                        remote.ReturnToLobby:FireServer()
                    end
                end)
            end
        else
            settings.AntiGrip = false
            save()
            gripcheck:Disconnect()
        end
    end, {enabled = settings.AntiGrip})
    local antideath = mainsector:Cheat("Checkbox", "Anti-Death", function(AntiDeathEnabled)
        if AntiDeathEnabled then
            settings.AntiDeath = true
            save()
            getgenv().antideath = runs.RenderStepped:Connect(function()
                if game.PlaceId == 6803256560 then
                    if data.Dead.Value == true then
                        remote.ReturnToLobby:FireServer()
                    end
                end
            end)
        else
            settings.AntiDeath = false
            save()
            antideath:Disconnect()
        end
    end, {enabled = settings.AntiDeath})
    local fullbright = mainsector:Cheat("Checkbox", "Fullbright", function(FullBrightEnabled)
        if FullBrightEnabled then
            settings.Fullbright = true
            save()
            if game.PlaceId == 6803256560 then
                loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
            end
        else
            loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
            settings.Fullbright = false
            save()
        end
    end, {enabled = settings.Fullbright})
    local titanesp = mainsector:Cheat("Checkbox", "Titan ESP", function(TitanESPEnabled)
        if TitanESPEnabled then
            settings.TitanEsp = true
            save()
            if game.PlaceId == 6803256560 then
                if not esp then
                    esp = Instance.new("BoolValue")
                    esp.Name = "Good Nose"
                end
                esp.Parent = lplr.Data.Skills
            end
        else
            settings.TitanEsp = false
            save()
            esp.Parent = nil
        end
    end, {enabled = settings.TitanEsp})

    local removeinjuries = mainsector:Cheat("Checkbox", "Remove Injuries", function(RemoveInjuriesEnabled)
        if RemoveInjuriesEnabled then
            settings.RemoveInjuries = true
            save()
            getgenv().removeinjuries = runs.RenderStepped:Connect(function()
                if game.PlaceId == 7176980618 or game.PlaceId == 6803256560 then
                    for i, v in pairs(data:FindFirstChild("Injuries"):GetChildren()) do
                        v.Parent = nil
                    end
                end
            end)
        else
            removeinjuries:Disconnect()
            settings.RemoveInjuries = false
            save()
        end
    end, {enabled = settings.RemoveInjuries})

    mainsector:Cheat("Button", "Return to Lobby", function()
        remote.ReturnToLobby:FireServer()
    end,{text = "Return To Lobby"})

    local othersector = main:Sector("Other")
    local autoinvite = othersector:Cheat("Checkbox", "Auto Invite", function(AutoInviteEnabled)
        if AutoInviteEnabled then
            settings.AutoInvite = true
            save()
            getgenv().autoinviteloop = plrs.PlayerAdded:Connect(function(v)
                if settings.IgnoreSquads then
                    remote.Squad:FireServer("Invite", tostring(v))
                else
                    if v:WaitForChild("Data"):WaitForChild("Squad").Value == "" then
                        remote.Squad:FireServer("Invite", tostring(v))
                    end
                end
            end)
        else
            autoinviteloop:Disconnect()
            settings.AutoInvite = false
            save()
        end
    end, {enabled = settings.AutoInvite})
    local ignoresquad = othersector:Cheat("Checkbox", "Ignore Squads", function(IgnoreSquadEnabled)
        if IgnoreSquadEnabled then
            settings.IgnoreSquads = true
            save()
        else
            settings.IgnoreSquads = false
            save()
        end
    end, {enabled = settings.IgnoreSquads})
    local invite = othersector:Cheat("Button", "Invite All", function()
        for i, v in pairs(plrs:GetPlayers()) do
            if v.Name ~= lplr.Name then
                if settings.IgnoreSquads then
                    remote.Squad:FireServer("Invite", tostring(v))
                else
                    if v:WaitForChild("Data"):FindFirstChild("Squad").Value == "" then
                        remote.Squad:FireServer("Invite", tostring(v))
                    end
                end
            end
        end
    end, {text = "Invite All"})

    local setting = window:Category("Settings")
    local settingsector = setting:Sector("Settings")
    settingsector:Cheat("Label", "Your choices auto-save and will load when executed.")

    local showgui = settingsector:Cheat("Checkbox", "Hide only in-game", function(ShowGui)
        if settings.GuiDisabled then
            if ShowGui then
                settings.LobbyGuiEnabled = true
                save()
            else
                settings.LobbyGuiEnabled = false
                save()
            end
        else
            settings.LobbyGuiEnabled = false
            showgui:SetValue(false)
            save()
        end
    end, {enabled = settings.LobbyGuiEnabled})

    local hidegui = settingsector:Cheat("Checkbox", "Hide on Execute", function(GuiDisabled)
        if GuiDisabled then
            settings.GuiDisabled = true
            save()
        else
            settings.GuiDisabled = false
            settings.LobbyGuiEnabled = false
            showgui:SetValue(false)
            save()
        end
    end, {enabled = settings.GuiDisabled})

    spawn(function()
        if settings.GuiDisabled then
            hidegui:SetValue(true)
            if settings.LobbyGuiEnabled then
                if game.PlaceId == 6803256560 then
                    window:HideGui()
                end
            else
                window:HideGui()
            end
        end
    end)
end
