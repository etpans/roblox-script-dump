--Configurables--
_G.KeyHealEnabled = true
_G.KeyHealBandage = "Bandage"
_G.KeyHealKey = "g"
local KeyHealNotification = true
local NotificationProperties = {
    Text = "{KEY-HEAL "..(_G.KeyHealEnabled and "EN" or "DIS").."ABLED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local CGui = game:GetService("CoreGui")
local RS = game:GetService("ReplicatedStorage")
local LPlr = Plrs.LocalPlayer
local Slot = LPlr.stats.inventory.slot06
local Bandage = RS.ItemData._G.KeyHealBandage

--Scripts--
LPlr:GetMouse().KeyDown:connect(function(Key)
    if Key == _G.KeyHealKey then
        RS.Remotes.Use:InvokeServer(Slot)
        RS.Remotes.CraftItem:InvokeServer(Bandage)
    end
end)

--Notifications--
if KeyHealNotification then 
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end