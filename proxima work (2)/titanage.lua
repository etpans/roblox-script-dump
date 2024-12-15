loadfile("proxima.lua")()

local ws = game:GetService("Workspace")
local plrs = game:GetService("Players")
local rpls = game:GetService("ReplicatedStorage")
local light = game:GetService("Lighting")
local http = game:GetService("HttpService")
local runs = game:GetService("RunService")
local core = game:GetService("CoreGui")
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()

local r, g, b = library.round(library.flags["Menu Accent Color"])

if game.PlaceId == 6803256560 or game.PlaceId == 7176980618 then
    character = lplr.Character or lplr.CharacterAdded:Wait()
    data = lplr:WaitForChild("Data")
    remote = rpls:WaitForChild("Remotes")
end

local MainTab = library:AddTab("Main")
local MainColumn1 = MainTab:AddColumn()
local MainColumn2 = MainTab:AddColumn()

--Auto Section
local AutoSection = MainColumn1:AddSection("Automatic")
AutoSection:AddToggle({text = "Auto Join PVE", callback = function(State)
    if State and library.flags["Auto Join PVE"] and game.PlaceId == 6737540754 then
        rpls:WaitForChild("RemoteEvent"):FireServer("PVE")
    end
end})
AutoSection:AddToggle({text = "Auto Quest", callback = function(State)
    if State and game.PlaceId == 7176980618 then
        library:AddConnection(runService.RenderStepped, "Auto Quest", function()
            if library.flags["Auto Quest"] then
                if data.Quest.QuestVal.Value == 0 and data.QuestCooldown.Value == 0 then
                    remote.DialogueEvent:InvokeServer(ws.NPCs.Levi, "I want to do a quest")
                end
            else
                library.connections["Auto Quest"]:Disconnect()
            end
        end)
    end
end})
AutoSection:AddToggle({text = "Auto Remove Injuries", callback = function(State)
    if State then
        
    end
end})
AutoSection:AddToggle({text = "Auto Reload Blades", callback = function(State)
    library.options["Low Blade Notification"].main.Visible = State
    library.options["Blades Left"].main.Visible = State
    if State and game.PlaceId == 6803256560 then
        if data.BladeDurability.Value == 0 then
            remote.ODM:FireServer({"ReloadBlades"})
        end
        library:AddConnection(data.BladeDurability.Changed, "Auto Reload Blades", function()
            if library.flags["Auto Reload Blades"] then
                while data.BladeDurability.Value == 0 do wait(.5)
                    remote.ODM:FireServer({"ReloadBlades"})
                end
            else
                library.connections["Auto Reload Blades"]:Disconnect()
            end
        end)
    end
end})
AutoSection:AddToggle({text = "Low Blade Notification", state = true, callback = function(State)
    if State and game.PlaceId == 6803256560 then
        library:AddConnection(data.BladesLeft.Changed, "Low Blade Notification", function()
            if library.flags["Low Blade Notification"] then
                if data.BladesLeft.Value == library.flags["Blades Left"] then
                    library:SendNotification(3, "You have "..data.BladesLeft.Value.." blade(s) left", 1)
                end
            else
                library.connections["Low Blade Notification"]:Disconnect()
            end
        end)
    end
end})
AutoSection:AddSlider({text = "Blades Left", min = 0, max = 3, value = 1})

local PlayerSection = MainColumn1:AddSection("Player")
PlayerSection:AddToggle({text = "Anti-Reset", callback = function(State)
    if State and game.PlaceId == 6803256560 then
        local function Return()
            lplr.PlayerGui.Main.Death.Return.Visible = false
            lplr.PlayerGui.Main.Death.LastWind.Visible = false
            remote.ReturnToLobby:FireServer()
            library:SendNotification(5, "Teleporting to the lobby...")
        end

        if library.flags["Anti-Reset"] then
            if data.Dead.Value == true then
                Return()
            end
            if lplr:FindFirstChild("IsGrabbed") then
                library:SendNotification(5, "Do <i>not</i> leave the game\nfor <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>anti-reset</font> to work", 1)
            end
        end

        library:AddConnection(lplr.ChildAdded, "Grabbed Notification", function(Grabbed)
            if library.flags["Anti-Reset"] and Grabbed.Name == "IsGrabbed" then
                library:SendNotification(5, "Do <i>not</i> leave the game\nfor <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>anti-reset</font> to work", 1)
            end
        end)
        library:AddConnection(data.Dead.Changed, "Anti-Reset", function()
            if library.flags["Anti-Reset"] and data.Dead.Value == true then
                Return()
            end
        end)
    else
        if library.connections["Grabbed Notification"] then
            library.connections["Grabbed Notification"]:Disconnect()
            library.connections["Anti-Reset"]:Disconnect()
            lplr.PlayerGui.Main.Death.Return.Visible = true
            lplr.PlayerGui.Main.Death.LastWind.Visible = true
        end
    end
end})
PlayerSection:AddButton({text = "Teleport to Supplies"})
PlayerSection:AddDivider("Return")
PlayerSection:AddButton({text = "Return to Lobby", callback = function()
    if game.PlaceId == 6803256560 then
        remote.ReturnToLobby:FireServer()
        library:SendNotification(5, "Teleporting to the lobby...")
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})
PlayerSection:AddBind({text = "Return Key", callback = library.options["Return to Lobby"].callback})

local VisualSection = MainColumn2:AddSection("Visuals")
VisualSection:AddToggle({text = "Fullbright"})
VisualSection:AddDivider("ESP")
VisualSection:AddButton({text = "Unammed ESP", callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
end})
VisualSection:AddButton({text = "Titan ESP", callback = function()
    if game.PlaceId == 6803256560 then
        if esp then return end
        esp = Instance.new("BoolValue")
        esp.Name = "Good Nose"
        esp.Parent = lplr.Data.Skills
    end
end})

--[[VisualSection:AddDivider("Player ESP")
VisualSection:AddToggle({text = "Enabled"})
VisualSection:AddDivider("Titan ESP")
VisualSection:AddToggle({text = "Enabled"})
VisualSection:AddDivider("Supplies ESP")
VisualSection:AddToggle({text = "Enabled"})]]
local SquadSection = MainColumn2:AddSection("Sqaud")
SquadSection:AddToggle({text = "Auto Invite", callback = function(State)
    if State and game.PlaceId == 7176980618 then
        library:AddConnetion(plrs.PlayerAdded, "Invite Player", function(Player)
            if library.flags["Auto Invite"] then
                wait(library.flags["Invite Delay"])
                if library.flags["Ignore Squads"] then
                    remote.Squad:FireServer("Invite", tostring(Player))
                    if library.flags["Join Notification"] then
                        library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..Player.."</font> has been invited 1", 4)
                    end
                else
                    if Player:WaitForChild("Data").Squad.Value == "" then
                        remote.Squad:FireServer("Invite", tostring(Player))
                    end
                    if library.flags["Join Notification"] then
                        library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..Player.."</font> has been invited 2", 4)
                    end
                end
            else
                library.connections["Invite Player"]:Disconnect()
            end
        end)
    end
end}):AddSlider({text = "Invite Delay", min = 0, max = 5, value = 0, prefix = "s"})
SquadSection:AddToggle({text = "Ignore Squads"})
SquadSection:AddToggle({text = "Join Notification", state = true})
SquadSection:AddButton({text = "Invite All", callback = function()
    local players = 0 
    for i, v in pairs(plrs:GetPlayers()) do
        if library.flags["Ignore Squads"] then
            remote.Squad:FireServer("Invite", tostring(v))
            players = players + 1
        else
            if v.Data:WaitForChild("Squad").Value == "" then
                remote.Squad:FireServer("Invite", tostring(v))
                players = players + 1
            end
        end
    end
    if library.flags["Join Notification"] then
        if players == 0 then
            library:SendNotification(3, "Nobody has been invited", 2)
        else
            library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..players.."</font> player(s)\nhave been invited", 4)
        end
    end
end})

library:Init()
library:selectTab(library.tabs[1])