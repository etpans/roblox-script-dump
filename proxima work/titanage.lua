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
local camera = ws.CurrentCamera

local r, g, b = library.round(library.flags["Menu Accent Color"])

if game.PlaceId == 6803256560 or game.PlaceId == 7176980618 then
    character = lplr.Character or lplr.CharacterAdded:Wait()
    data = lplr:WaitForChild("Data")
    remote = rpls:WaitForChild("Remotes")
end

local GeneralTab = library:AddTab("General")
local GeneralColumn1 = GeneralTab:AddColumn()
local GeneralColumn2 = GeneralTab:AddColumn()

local AutoSection = GeneralColumn1:AddSection("Automatic")
AutoSection:AddToggle({text = "Auto Join Enabled", callback = function(State)
    if State and library.flags["Auto Join Enabled"] and game.PlaceId == 6737540754 then
        rpls:WaitForChild("RemoteEvent"):FireServer(library.flags["Auto Join Server"])
    end
end}):AddList({text = "Auto Join Server", values = {"PVE", "PVP"}, value = "PVE"})
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
        library:AddConnection(runService.RenderStepped, "Remove Injuries", function()
            data:WaitForChild("Injuries"):Destroy()
        end)
    end
end})
AutoSection:AddList({flag = "Injuries", values = {"Everything", "Visual Only"}, value = "Everything", callback = function(injury)
end})
AutoSection:AddToggle({text = "Auto Reload Blades", callback = function(State)
    if State and game.PlaceId == 6803256560 then
        if data.BladeDurability.Value == 0 then
            remote.ODM:FireServer({"ReloadBlades"})
        end
        library:AddConnection(data.BladeDurability.Changed, "Auto Reload Blades", function()
            if library.flags["Auto Reload Blades"] then
                if data.BladeDurability.Value == 0 then
                    repeat wait()
                        remote.ODM:FireServer({"ReloadBlades"})
                    until data.BladeDurability.Value ~= 0
                end
            end
        end)
    else
        if library.connections["Auto Reload Blades"] then
            library.connections["Auto Reload Blades"]:Disconnect()
        end
    end
end})
AutoSection:AddToggle({text = "Low Blades Notification", callback = function(State)
    if State and game.PlaceId == 6803256560 then
        library:AddConnection(data.BladesLeft.Changed, "Low Blade Notification", function()
            if library.flags["Low Blades Notification"] then
                if data.BladesLeft.Value == library.flags["Blades Left"] then
                    library:SendNotification(3, "You have "..data.BladesLeft.Value.." blade(s) left", 1)
                end
            end
        end)
    else
        if library.connections["Low Blades Notification"] then
            library.connections["Low Blades Notification"]:Disconnect()
        end
    end
end}):AddSlider({text = "Blades Left", min = 0, max = 5, value = 1})
--AutoSection:AddToggle({text = "Auto Pickup Mods"})
--AutoSection:AddDivider("Private Servers")
--AutoSection:AddToggle({text = "Auto Join Private Server"}):AddList({})

--auto join pve x
    --confirmation
--auto quest x
--auto remove injuries
    --visual injuries only
--auto reload blades x
    --low notification x
    --blade amount x
--auto pickup mods (magnitute and teleport under map and back)
--auto join private server
    --dropdown
    --confirmation
--

local SquadSection = GeneralColumn1:AddSection("Squad")
SquadSection:AddToggle({text = "Auto Invite", callback = function(State)
    if State then
        library:AddConnection(plrs.PlayerAdded, "Invite Player", function(Player)
            if library.flags["Auto Invite"] then
                wait(1.5 + library.flags["Invite Delay"])
                if library.flags["Ignore Squads"] then
                    remote.Squad:FireServer("Invite", tostring(Player))
                    if library.flags["Invite Notification"] then
                        library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..tostring(Player).."</font> has been invited1", 4)
                    end
                else
                    if Player:WaitForChild("Data"):WaitForChild("Squad").Value == "" then
                        remote.Squad:FireServer("Invite", tostring(Player))
                    end
                    if library.flags["Invite Notification"] then
                        library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..tostring(Player).."</font> has been invited2", 4)
                    end
                end
            end
        end)
    else
        if library.connections["Invite Player"] then
            library.connections["Invite Player"]:Disconnect()
        end
    end
end}):AddSlider({text = "Invite Delay", suffix = "s", min = 0, max = 5, value = 0})
SquadSection:AddToggle({text = "Ignore Squads"})
SquadSection:AddToggle({text = "Invite Notification"})
SquadSection:AddButton({text = "Invite All", callback = function()
    local players = 0 
    for i, v in pairs(plrs:GetPlayers()) do
        if v.Name ~= lplr.Name then
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
    end
    if library.flags["Invite Notification"] then
        if players == 0 then
            library:SendNotification(3, "Nobody has been invited", 2)
        else
            library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..players.."</font> player(s)\nhave been invited", 4)
        end
    end
end})

--auto invite x
    --invite delay x
    --invite all on join x
    --ignore squads x
--notification x
--invite all x
--[[
local PlayerSection = GeneralColumn2:AddSection("Player")

PlayerSection:AddToggle({text = "Auto Run", callback = function(State)
    if State then
        Running = false
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://6889413515"
        local Animation2 = Instance.new("Animation")
        Animation2.AnimationId = "rbxassetid://6821636733"

        ODMRun = character.Humanoid:LoadAnimation(Animation)
        NormalRun = character.Humanoid:LoadAnimation(Animation2)

        if library.flags["Auto Run"] then
            library:AddConnection(inputService.InputBegan, "Auto Run Started", function(input)
                if input.KeyCode.Name == "W" then
                    if not character:FindFirstChild("LeftBlade") then
                        NormalRun:Play()
                    else
                        ODMRun:Play()
                    end
                    character.Humanoid.WalkSpeed = library.flags["Speed"]
                    Running = true
                end
            end)
            library:AddConnection(inputService.InputEnded, "Auto Run Ended", function(input)
                if input.KeyCode.Name == "W" then
                    NormalRun:Stop()
                    ODMRun:Stop()
                    character.Humanoid.WalkSpeed = 16
                    Running = false
                end
            end)
        end
    else
        if library.connections["Auto Run Started"] then
            library.connections["Auto Run Started"]:Disconnect()
            library.connections["Auto Run Ended"]:Disconnect()
            NormalRun:Stop()
            ODMRun:Stop()
            character.Humanoid.WalkSpeed = 16
            Running = false
        end
    end
end}):AddSlider({text = "Speed", min = 30, max = 45, value = 30, callback = function(Speed)
    if library.flags["Auto Run"] and Running then
        character.Humanoid.WalkSpeed = Speed
    end
end})
PlayerSection:AddToggle({text = "Toggle FOV", callback = function(State)
    if State then
        library:Addconnection(runService.RenderStepped, "FOV Loop", function()
            if library.flags["Toggle FOV"] then
                --library.flags["FOV Size"] + ((120 - Camera.FieldOfView) * 4)
            else
                library.connections["FOV Loop"]:Disconnect()
            end
        end)
    end
end}):AddSlider({flag = "FOV Size", min = 70, max = 100, value = 70})]]

--auto run
--toggle fov
    --field of view

local TeleportSection = GeneralColumn2:AddSection("Teleports")
TeleportSection:AddButton({text = "Return to Lobby", callback = function()
    if game.PlaceId == 6803256560 then
        remote.ReturnToLobby:FireServer()
        library:SendNotification(5, "Teleporting to the lobby...")
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})
TeleportSection:AddBind({text = "Return Key", nomouse = true, callback = library.options["Return to Lobby"].callback})

TeleportSection:AddButton({text = "Teleport to Supplies", callback = function()
    if game.PlaceId == 686803256560 then
        
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})
TeleportSection:AddBind({text = "Supply TP Key", nomouse = true, callback = library.options["Teleport to Supplies"].callback})

TeleportSection:AddButton({text = "Panic Teleport", tip = "Teleports you back to spawn", callback = function()
    if game.PlaceId == 686803256560 then
        
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})
TeleportSection:AddBind({text = "Panic TP Key", nomouse = true, callback = library.options["Panic Teleport"].callback})

local VisualSection = GeneralColumn2:AddSection("Visuals")
VisualSection:AddButton({text = "Fullbright", callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU"))()
end})
VisualSection:AddToggle({text = "Titan ESP", callback = function(State)
    if game.PlaceId == 6803256560 and State then
        if esp and esp.Parent ~= lplr.Data.Skills then
            esp.Parent = lplr.Data.Skills
        end
        esp = Instance.new("BoolValue")
        esp.Name = "Good Nose"
        esp.Parent = lplr.Data.Skills
    elseif not State and esp then
        esp.Parent = nil
    end
end})
local player_esp = true
VisualSection:AddButton({text = "Unammed ESP", callback = function()
    if not player_esp then return end
    player_esp = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
end})

--teleport to supplies
--panic teleport

--local VisualTab = library:AddTab("Visuals")
--local VisualColumn1 = VisualTab:AddColumn()
--local VisualColumn2 = VisualTab:AddColumn()
--
--local EspSection = VisualColumn1:AddSection("ESP")
--EspSection:AddToggle({text = "Enabled", flag = "Esp Enabled"}):AddList({flag = "Esp Enabled For", values = {"Players", "Titans"}, multiselect = true}):AddBind({callback = function()
--    library.options["Esp Enabled"]:SetState(not library.flags["Esp Enabled"])
--end})
--EspSection:AddSlider({text = "Max Distance", textpos = 2, flag = "Esp Max Distance", value = 2500, min = 0, max = 10000})
--EspSection:AddToggle({text = "Show Whitelisted Players", flag = "Esp Show Whitelisted"})
--
--local LightingSection = VisualColumn1:AddSection("Lighting")
--LightingSection:AddToggle({text = "Remove Fog"})
--LightingSection:AddToggle({text = "Remove Shadows"})
--LightingSection:AddToggle({text = "Clock Time"}):AddSlider({flag = "Clock Time Amount", min = 0, max = 24, float = 0.1, --[[value = LightingSpoof.ClockTime]]})
--LightingSection:AddToggle({text = "Brightness"}):AddSlider({flag = "Brightness Amount", min = 0, max = 100, float = 0.1, --[[value = LightingSpoof.Brightness]]})
--LightingSection:AddToggle({text = "Ambient", flag = "Ambient Lighting"}):AddColor({flag = "Outdoor Ambient", --[[color = LightingSpoof.OutdoorAmbient]]}):AddColor({flag = "Indoor Ambient", --[[color = LightingSpoof.--Ambient]]})
--LightingSection:AddToggle({text = "Color Shift"}):AddColor({flag = "Color Shift Top", --[[color = LightingSpoof.ColorShift_Top]]})
--
--local MiscSection = VisualColumn1:AddSection("Misc")
--MiscSection:AddToggle({text = "FOV Changer", callback = function(State)
--    library.options["Dynamic Custom FOV"].main.Visible = State
--end}):AddSlider({flag = "FOV Amount", min = 0, max = 120})
--MiscSection:AddToggle({text = "Dynamic", flag = "Dynamic Custom FOV"})
--MiscSection:AddToggle({text = "Zoom", flag = "FOV Zoom Enabled"}):AddSlider({flag = "FOV Zoom Amount", min = 5, max = 50}):AddBind({flag = "FOV Zoom Key", mode = "hold"})
--
--MiscSection:AddDivider("Crosshair")
--MiscSection:AddToggle({text = "Enabled", flag = "Crosshair Enabled", callback = function(State)
--    library.options["Crosshair Position"].main.Visible = State
--    library.options["Crosshair T-Shape"].main.Visible = State
--    library.options["Crosshair Size"].main.Visible = State
--    library.options["Crosshair Gap"].main.Visible = State
--    library.options["Crosshair Thickness"].main.Visible = State--[[
--    CrosshairTop.Visible = State and not library.flags["Crosshair T-Shape"]
--    CrosshairLeft.Visible = State
--    CrosshairRight.Visible = State
--    CrosshairBottom.Visible = State]]
--end}):AddColor({callback = function(Color)--[[
--    CrosshairTop.Color = Color
--    CrosshairLeft.Color = Color
--    CrosshairRight.Color = Color
--    CrosshairBottom.Color = Color]]
--end, trans = 1, calltrans = function(Transparency)--[[
--    CrosshairTop.Transparency = Transparency
--    CrosshairLeft.Transparency = Transparency
--    CrosshairRight.Transparency = Transparency
--    CrosshairBottom.Transparency = Transparency]]
--end})
--MiscSection:AddList({flag = "Crosshair Position", values = {"Follow Mouse", "Center on Screen"}})
--MiscSection:AddToggle({text = "T-Shape", flag = "Crosshair T-Shape", callback = function(State)
--    CrosshairTop.Visible = library.flags["Crosshair Enabled"] and not State
--end})
--MiscSection:AddSlider({text = "Size", textpos = 2, flag = "Crosshair Size", min = 1, max = 500, callback = function(Value)
--    local Thickness = library.flags["Crosshair Thickness"]--[[
--    CrosshairTop.Size = Vector2.new(Thickness, -Value)
--    CrosshairLeft.Size = Vector2.new(-Value, Thickness)
--    CrosshairRight.Size = Vector2.new(Value, Thickness)
--    CrosshairBottom.Size = Vector2.new(Thickness, Value)]]
--end})
--MiscSection:AddSlider({text = "Gap", textpos = 2, flag = "Crosshair Gap", min = 0, max = 20, float = 0.5})
--MiscSection:AddSlider({text = "Thickness", textpos = 2, flag = "Crosshair Thickness", min = 1, max = 20, float = 0.5, callback = function(Value)
--    local Size = library.flags["Crosshair Size"]--[[
--    CrosshairTop.Size = Vector2.new(Value, -Size)
--    CrosshairLeft.Size = Vector2.new(-Size, Value)
--    CrosshairRight.Size = Vector2.new(Size, Value)
--    CrosshairBottom.Size = Vector2.new(Value, Size)]]
--end})
--
--local PlayerEspSection = VisualColumn2:AddSection("Players")
--PlayerEspSection:AddToggle({text = "Visible Only", flag = "Enemy Visible Only"})
--
--PlayerEspSection:AddToggle({text = "Box", flag = "Enemy Box Enabled"}):AddColor({flag = "Enemy Occluded Box Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Box Color", color = Color3.fromRGB--(240, 40, 50)})
--
--PlayerEspSection:AddToggle({text = "Info", flag = "Enemy Info"}):AddColor({flag = "Enemy Occluded Info Color", color = Color3.fromRGB(255, 140, 30)}):AddColor({flag = "Enemy Info Color", color = Color3.fromRGB--(240, 30, 40)})
--
--PlayerEspSection:AddToggle({text = "Health", flag = "Enemy Health Enabled"})
--
--PlayerEspSection:AddToggle({text = "Out Of View", flag = "Enemy OOV Arrows", callback = function(State)
--    library.options["Enemy Out Of View Scale"].main.Visible = State
--end}):AddColor({flag = "Enemy Occluded OOV Arrows Color", color = Color3.fromRGB(255, 140, 30)}):AddColor({flag = "Enemy OOV Arrows Color", color = Color3.fromRGB(240, 30, 40)})
--PlayerEspSection:AddSlider({text = "Scale", textpos = 2, flag = "Enemy Out Of View Scale", min = 100, max = 500})
--
--PlayerEspSection:AddToggle({text = "Look Direction", flag = "Enemy Look Enabled"}):AddColor({flag = "Enemy Occluded Look Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Enemy Look Color", color = --Color3.fromRGB(240, 60, 20)})
--
----PlayerEspSection:AddToggle({text = "Velocity", flag = "Enemy Direction Enabled"}):AddColor({flag = "Enemy Occluded Direction Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Enemy Direction Color", --color = Color3.fromRGB(240, 60, 20)})
--
--PlayerEspSection:AddToggle({text = "Chams", flag = "Enemy Chams Enabled"}):AddSlider({text = "Transparency", flag = "Enemy Chams Transparency", min = 0, max = 1, float = 0.1}):AddColor({flag = "Enemy Occluded Chams --Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Chams Color", color = Color3.fromRGB(240, 40, 50)})
--PlayerEspSection:AddToggle({text = "Outline", flag = "Enemy Chams Outline"}):AddColor({flag = "Enemy Occluded Chams Outline Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Chams Outline --Color", color = Color3.fromRGB(240, 40, 50)})
--
--
--
--local TitanEspSection = VisualColumn2:AddSection("Titans")
--TitanEspSection:AddToggle({text = "Visible Only", flag = "Enemy Visible Only"})
--
--TitanEspSection:AddToggle({text = "Box", flag = "Enemy Box Enabled"}):AddColor({flag = "Enemy Occluded Box Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Box Color", color = Color3.fromRGB--(240, 40, 50)})
--
--TitanEspSection:AddToggle({text = "Info", flag = "Enemy Info"}):AddColor({flag = "Enemy Occluded Info Color", color = Color3.fromRGB(255, 140, 30)}):AddColor({flag = "Enemy Info Color", color = Color3.fromRGB(240, --30, 40)})
--
--TitanEspSection:AddToggle({text = "Health", flag = "Enemy Health Enabled"})
--
--TitanEspSection:AddToggle({text = "Out Of View", flag = "Enemy OOV Arrows", callback = function(State)
--    library.options["Enemy Out Of View Scale"].main.Visible = State
--end}):AddColor({flag = "Enemy Occluded OOV Arrows Color", color = Color3.fromRGB(255, 140, 30)}):AddColor({flag = "Enemy OOV Arrows Color", color = Color3.fromRGB(240, 30, 40)})
--TitanEspSection:AddSlider({text = "Scale", textpos = 2, flag = "Enemy Out Of View Scale", min = 100, max = 500})
--
--TitanEspSection:AddToggle({text = "Look Direction", flag = "Enemy Look Enabled"}):AddColor({flag = "Enemy Occluded Look Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Enemy Look Color", color = --Color3.fromRGB(240, 60, 20)})
--
----PlayerEspSection:AddToggle({text = "Velocity", flag = "Enemy Direction Enabled"}):AddColor({flag = "Enemy Occluded Direction Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Enemy Direction Color", --color = Color3.fromRGB(240, 60, 20)})
--
--TitanEspSection:AddToggle({text = "Chams", flag = "Enemy Chams Enabled"}):AddSlider({text = "Transparency", flag = "Enemy Chams Transparency", min = 0, max = 1, float = 0.1}):AddColor({flag = "Enemy Occluded Chams --Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Chams Color", color = Color3.fromRGB(240, 40, 50)})
--TitanEspSection:AddToggle({text = "Outline", flag = "Enemy Chams Outline"}):AddColor({flag = "Enemy Occluded Chams Outline Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Chams Outline --Color", color = Color3.fromRGB(240, 40, 50)})
----local TeleportsTab = library:AddTab("Teleports")
----local MiscTab = library:AddTab("Misc")

library:Init()
library:selectTab(library.tabs[1])