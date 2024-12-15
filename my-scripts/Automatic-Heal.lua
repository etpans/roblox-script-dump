--Confirguration:
local SriptName = "Automatic-Heal"

--Table:
if not getgenv().Settings then
    getgenv().Settings = {}
end

if getgenv().Settings then
    if not getgenv().Settings[SriptName] then
        getgenv().Settings[SriptName] = nil
    end
else
    warn("Error: Table has not been established.")
end

--Varibles:
local RS    = game:GetService("ReplicatedStorage")
local Plrs  = game:GetService("Players")

local LPlr  = Plrs.LocalPlayer
local RM = RS.Remotes
--Toggle:
if getgenv().Settings[SriptName] then
    getgenv().Settings[SriptName] = false
    print(SriptName.." Disabled\n")
else
    getgenv().Settings[SriptName] = true
    print(SriptName.." Enabled\n")
end

--Script:
local function Heal()
    RM.Use:InvokeServer(LPlr.stats.inventory.slot06)
    RM.CraftItem:InvokeServer(RS.ItemData.Bandage)
end

while getgenv().Settings[SriptName] do wait(.55)
    local Bleed = LPlr.PlayerGui.MainGui.Stats.Frame:FindFirstChild("Bleed")
    if Bleed then
        Heal()
    end
end

--[[Add check for which slot bandage is in 
Make faster by alternating between 2 slots
]]