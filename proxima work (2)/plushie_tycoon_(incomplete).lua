loadfile("proxima.lua")()

local ws = game:GetService("Workspace")
local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local humanoid = lplr.Character.HumanoidRootPart
local mouse = lplr:GetMouse()
tycoon = nil

spawn function()
    
end

--get tycoon

--first: check if unclaimed
--second: find tycoon if claim elseif wait for claimed
--third: event to check if rebirth then redo


local function GetTycooon()
    for i, v in pairs(ws.Tycoons:GetChildren()) do
        if v.ClassName == "Folder" then
            for i, v in pairs(v:GetChildren()) do
                if v.Name == "Owner" and v.Value == lplr.Name then
                    print(v.Value)
                    tycoon = v.Parent
                elseif v.Name == "Owener" and v.Value ~= lplr.Name and v.Value == "" then
                    print(v.Value)
                end
            end
        end
    end
    return tycoon
end

GetTycooon()

lplr.leaderstats.Rebirths:GetPropertyChangedSignal("Value"):Connect(function()
    GetTycooon()
end)

local MainTab = library:AddTab("Main")
local MainColumn1 = MainTab:AddColumn()
local MainColumn2 = MainTab:AddColumn()

--Auto Section
local AutoSection = MainColumn1:AddSection("Automatic")
AutoSection:AddDivider("Main")
AutoSection:AddButton({text = "Test", callback = function()
    print(tycoon)
end})
AutoSection:AddToggle({text = "Auto Clicker", callback = function(State)
    if State then
        library:AddConnection(runService.RenderStepped, "Auto Clicker", function()
            if library.flags["Auto Clicker"] then
                if tycoon.Clicker.SurfaceGui.Frame.AbsoluteSize == Vector2.new(0, 37.5) then
                    fireclickdetector(tycoon.Clicker.ClickDetector)
                    wait(library.flags["Click Delay"])
                end
            else
                library.connections["Auto Clicker"]:Disconnect()
            end
        end)
    end
end}):AddSlider({text = "Click Delay", value = 0, min = 0, max = 5})

AutoSection:AddToggle({text = "Auto Collect", callback = function(State)
    if State then
        library:AddConnection(runService.RenderStepped, "Auto Collect", function()
            if library.flags["Auto Collect"] then
                if tycoon.SellCollector.OverheadGUI.Frame.BuyName.Text ~= "$0" then
                    pcall(function()
                        firetouchinterest(humanoid, tycoon.SellCollector, 0)
                        firetouchinterest(humanoid, tycoon.SellCollector, 1)
                    end)
                    wait(library.flags["Collect Delay"])
                end
            else
                library.connections["Auto Collect"]:Disconnect()
            end
        end)
    end
end}):AddSlider({text = "Collect Delay", value = 0, min = 0, max = 10})


AutoSection:AddDivider("Other")
AutoSection:AddToggle({text = "Auto Claim Tycoon", callback = function(State)
    if State then
        library:AddConnection(runService.RenderStepped, "Auto Claim Tycoon", function()
            if library.flags["Auto Claim Tycoon"] then

            else
                library.flags["Auto Claim Tycoon"]:Disconnect()
            end
        end)
    end
end})
AutoSection:AddToggle({text = "Auto Obby"})
AutoSection:AddToggle({text = "Auto Money"})

local PlayerSection = MainColumn1:AddSection("Player")
PlayerSection:AddDivider("Main")
PlayerSection:AddToggle({text = "Anti AFK"})
PlayerSection:AddToggle({text = "Rebirth Notification"})
PlayerSection:AddDivider("Movement")
PlayerSection:AddToggle({text = "Click TP", callback = function(State)
    if State then
        library:AddConnection(inputService.InputBegan, "Click TP", function(Input)
            if library.flags["Click TP"] and Input.UserInputType.Name == "MouseButton1" and inputService:IsKeyDown(Enum.KeyCode[library.options["Click TP Key"].key]) and mouse.Target then
                print(library.options["Click TP Key"].key)
                lplr.Character:MoveTo(mouse.Hit.p)
            end
        end)
    end
end}):AddBind({flag = "Click TP Key", nomouse = true, key = "LeftControl"})

local TeleportSection = MainColumn2:AddSection("Teleports")
TeleportSection:AddDivider("Main")
TeleportSection:AddButton({text = "Claimed Tycoon", callback = function() 

end})
TeleportSection:AddButton({text = "Obby Finish", callback = function()
    humanoid.CFrame = CFrame.new(317.338501, 0.644921541, 120.250023)
end})
TeleportSection:AddList({text = "Tycoon Teleports", value = "Tycoon 1", values = {"Tycoon1", "Tycoon2", "Tycoon3", "Tycoon4", "Tycoon5", "Tycoon6"}})
TeleportSection:AddButton({text = "Teleport", callback = function()
    humanoid.CFrame = ws.Tycoons[library.flags["Tycoon Teleports"]].ClaimPad.CFrame * CFrame.new(0, 3.3, 0)
end})
TeleportSection:AddList({text = "Player Teleports", value = "", values = {"Tycoon 1", "Tycoon 2", "Tycoon 3", "Tycoon 4", "Tycoon 5", "Tycoon 6"}})
TeleportSection:AddButton({text = "Teleport"})

--Supplies ESP

library:Init()
library:selectTab(library.tabs[1])


-- [Legit Tab UI] ----------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
local LegitTab = library:AddTab("Legit"); 
local LegitColunm1 = LegitTab:AddColumn();
local LegitMain = LegitColunm1:AddSection("Aim Assist")

LegitMain:AddDivider("Main");
LegitMain:AddToggle({text = "Enabled", flag = "AimbotEnabled", callback = function(State)
    if State then
        library:AddConnection(runService.RenderStepped, "AimbotEnabled", function()
            if library.flags["AimbotEnabled"] then
                print('on')
            else
                library.connections["AimbotEnabled"]:Disconnect()
                print('off')
            end
        end)
    end
end})
LegitMain:AddButton({text = "Discord", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"])
        library:SendNotification(5, "Loaded <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..library.title.."</font> successfully")
end});]]