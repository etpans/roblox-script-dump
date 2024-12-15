getgenv().autohealenabled = true

local lplr = game:GetService("Players").LocalPlayer
local rpls = game:GetService("ReplicatedStorage")
local runs = game:GetService("RunService")
local pgui = lplr.PlayerGui
local remote = rpls.Remotes
local bandage = rpls.ItemData.Bandage
local slot = lplr.stats.inventory.slot06

local function noification(message, seconds)
    local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
    properties.Name = os.time()
    properties.MessageText.Text = message
    properties.Parent = plrgui:WaitForChild("Messages").MessageFrame
    game.Debris:AddItem(properties, seconds)
end

local function craft()
    remote.CraftItem:InvokeServer(bandage)
    wait(.55)
end

if autohealenabled then
    getgenv().bleedloop = runs.RenderStepped:Connect(function()
        for i, v in pairs(bleedcheck:GetChildren()) do
            if v.Name == "Bleed" then
                remote.Use:InvokeServer(slot)
                craft()
            end
        end
    end)
    notification("Auto-Heal has been enabled!", 2)
else
    bleedloop:Disconnect()
    notification("Auto-Heal has been disabled!", 2)
end

--

getgenv().autohealenabled = true

local bleedcheck = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Stats.Frame
local remote = game:GetService("ReplicatedStorage").Remotes
local slot = game:GetService("Players").LocalPlayer.stats.inventory.slot06
local bandage = game:GetService("ReplicatedStorage").ItemData.Bandage
local plrgui = game:GetService("Players").LocalPlayer.PlayerGui

local function notification(message, seconds)
    local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
    properties.Name = os.time()
    properties.MessageText.Text = message
    properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
    game.Debris:AddItem(properties, seconds)
end

local function craft()
    remote.CraftItem:InvokeServer(bandage)
    wait(.55)
end

if autohealenabled then
    getgenv().bleedloop = game:GetService("RunService").RenderStepped:Connect(function()
        for i, v in pairs(bleedcheck:GetChildren()) do
            if v.Name == "Bleed" then
                remote.Use:InvokeServer(slot)
                craft()
            end
        end
    end)
    notification("Auto-Heal has been enabled!", 2)
else
    bleedloop:Disconnect()
    notification("Auto-Heal has been disabled!", 2)
end