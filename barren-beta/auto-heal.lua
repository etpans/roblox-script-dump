if getgenv().autohealenabled == nil then
    getgenv().autohealenabled = false
elseif autohealenabled then
    getgenv().autohealenabled = false
else
    getgenv().autohealenabled = true
end

local lplr = game:GetService("Players").LocalPlayer
local plrgui = game:GetService("Players").LocalPlayer.PlayerGui
local rpls = game:GetService("ReplicatedStorage")
local runs = game:GetService("RunService")
local remote = rpls.Remotes
local bleedcheck = plrgui.MainGui.Stats.Frame
local bandage = rpls.ItemData.Bandage
local slot = lplr.stats.inventory.slot06

local function notification(message, seconds)
    pcall(function()
        local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
        properties.Name = os.time()
        properties.MessageText.Text = message
        properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
        game.Debris:AddItem(properties, seconds)
    end)
end

local function craft()
    remote.CraftItem:InvokeServer(bandage)
    wait(.55)
end

if autohealenabled then
    notification("Auto-Heal has been enabled!", 2)
    getgenv().bleedloop = runs.RenderStepped:Connect(function()
        for i, v in pairs(bleedcheck:GetChildren()) do
            if v.Name == "Bleed" then
                remote.Use:InvokeServer(slot)
                craft()
            end
        end
    end)
else
    notification("Auto-Heal has been disabled!", 2)
    bleedloop:Disconnect()
end
